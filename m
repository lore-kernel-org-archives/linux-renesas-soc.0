Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9569DC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:37:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 657EA21019
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DwcV7RlS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbfCDKhk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 05:37:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35398 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbfCDKhk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 05:37:40 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EAED322;
        Mon,  4 Mar 2019 11:37:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551695857;
        bh=O3zqWrnAmDYOCl80b7GVUP0H2B3jmPPNWjQT7CWu9c0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DwcV7RlSbEEFj0LZAouK+w9RZ0eTafltwUAimxrEmYuLeN2nUp/fXis3TPDJ//qUz
         rnnM8ms9jP2Y4VGIpxJdTCZ8m0WfaB/ddGsQyeeszpNyuMqyHupbl+SFCa6NTkmc4M
         X86BemTFUlvRa3b940XEWk3INrbjf4Qa1DN3FZSI=
Date:   Mon, 4 Mar 2019 12:37:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dirk Behme <dirk.behme@de.bosch.com>
Cc:     linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        vkoul@kernel.org, geert+renesas@glider.be,
        niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart+renesas@ideasonboard.com,
        Achim.Dahlhoff@de.bosch.com, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] dmaengine: sh: rcar-dmac: Fix glitch in
 dmaengine_tx_status
Message-ID: <20190304103732.GB5342@pendragon.ideasonboard.com>
References: <20190304075610.10810-1-dirk.behme@de.bosch.com>
 <20190304075610.10810-2-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190304075610.10810-2-dirk.behme@de.bosch.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dirk,

Thank you for the patch.

On Mon, Mar 04, 2019 at 08:56:10AM +0100, Dirk Behme wrote:
> From: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>
> 
> The tx_status poll in the rcar_dmac driver reads the status register
> which indicates which chunk is busy (DMACHCRB). Afterwards the point
> inside the chunk is read from DMATCRB. It is possible that the chunk
> has changed between the two reads. The result is a non-monotonous
> increase of the residue. Fix this by introducing a 'safe read' logic.
> 
> Fixes: 73a47bd0da66 ("dmaengine: rcar-dmac: use TCRB instead of TCR for residue")
> Signed-off-by: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> Cc: <stable@vger.kernel.org> # v4.16+
> ---
> Note: Patch done against mainline v5.0
> 
>  drivers/dma/sh/rcar-dmac.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 2ea59229d7f5..b8afd7f4e07c 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1273,6 +1273,13 @@ static int rcar_dmac_chan_terminate_all(struct dma_chan *chan)
>  	return 0;
>  }
>  
> +static inline
> +unsigned int rcar_dmac_read_chcrb_mask(struct rcar_dmac_chan *chan)
> +{
> +	return rcar_dmac_chan_read(chan, RCAR_DMACHCRB) &
> +				   RCAR_DMACHCRB_DPTR_MASK;
> +}
> +
>  static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
>  					       dma_cookie_t cookie)
>  {
> @@ -1282,6 +1289,7 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
>  	enum dma_status status;
>  	unsigned int residue = 0;
>  	unsigned int dptr = 0;
> +	unsigned int tcrb, chcrb;

We tend to use one variable per line in the rcar-dmac driver.

>  
>  	if (!desc)
>  		return 0;
> @@ -1329,6 +1337,17 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
>  		return 0;
>  	}
>  
> +	/*
> +	 * We need to read two registers.
> +	 * Make sure the control register does not skip to next chunk
> +	 * while reading the counter.
> +	 */
> + retry:
> +	chcrb = rcar_dmac_read_chcrb_mask(chan);
> +	tcrb = rcar_dmac_chan_read(chan, RCAR_DMATCRB);
> +	if (chcrb != rcar_dmac_read_chcrb_mask(chan)) /* Still the same? */
> +		goto retry;

How about a loop instead of a goto ?

	unsigned int chcrb = ~0;
	...

	while (1) {
		chcrb = rcar_dmac_chan_read(chan, RCAR_DMACHCRB)
		      & RCAR_DMACHCRB_DPTR_MASK;
		if (chcrb == prev_chcrb)
			break;

		tcrb = rcar_dmac_chan_read(chan, RCAR_DMATCRB);
		prev_chcrb = chcrb;
	}

I would even turn this into a for loop to cap the maximum number of
iterations, just in case.

> +
>  	/*
>  	 * In descriptor mode the descriptor running pointer is not maintained
>  	 * by the interrupt handler, find the running descriptor from the
> @@ -1336,8 +1355,7 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
>  	 * mode just use the running descriptor pointer.
>  	 */
>  	if (desc->hwdescs.use) {
> -		dptr = (rcar_dmac_chan_read(chan, RCAR_DMACHCRB) &
> -			RCAR_DMACHCRB_DPTR_MASK) >> RCAR_DMACHCRB_DPTR_SHIFT;
> +		dptr = chcrb >> RCAR_DMACHCRB_DPTR_SHIFT;
>  		if (dptr == 0)
>  			dptr = desc->nchunks;
>  		dptr--;
> @@ -1355,7 +1373,7 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
>  	}
>  
>  	/* Add the residue for the current chunk. */
> -	residue += rcar_dmac_chan_read(chan, RCAR_DMATCRB) << desc->xfer_shift;
> +	residue += tcrb << desc->xfer_shift;
>  
>  	return residue;
>  }

-- 
Regards,

Laurent Pinchart
