Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289C7C10F05
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 12:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDB6520896
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 12:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="fpfPEs2l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfDAMrv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 08:47:51 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:55200 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfDAMrv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 08:47:51 -0400
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
        by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 44XsZC14VRz1XLG6q;
        Mon,  1 Apr 2019 14:47:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1554122867;
        bh=9YKSWRBvFCIlOnUMDi7DUszAMDQfiRNj6JWqaE4WyWs=; l=10;
        h=From:From:Reply-To:Sender;
        b=fpfPEs2lm5gaoPd9FiW2nJHIT+jfxMDxgLnHhBYJ1K2WKcVVy+RyVP1MJv5uYsET+
         7+B4CbNFxwVJNkl3el1hmTwnDSg4tTuzOahyMRMv5yfVokrHMR+yWNIReF2fb5YGgg
         DI6mSjTkcyunkyi6qKXaqIXMMAddJSzMSzB7R4FY=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 44XsZC06Cjz1bw;
        Mon,  1 Apr 2019 14:47:47 +0200 (CEST)
X-AuditID: 0a3aad15-c59ff70000001b94-3d-5ca20872bbeb
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id CF.F1.07060.27802AC5; Mon,  1 Apr 2019 14:47:46 +0200 (CEST)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
        by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 44XsZB53cnzR6b;
        Mon,  1 Apr 2019 14:47:46 +0200 (CEST)
Received: from [10.34.221.161] (10.34.221.161) by SI-HUB2000.de.bosch.com
 (10.4.103.108) with Microsoft SMTP Server id 15.1.1713.5; Mon, 1 Apr 2019
 14:47:46 +0200
Subject: Re: [PATCH v2 2/2] dmaengine: sh: rcar-dmac: Fix glitch in
 dmaengine_tx_status
To:     <linux-renesas-soc@vger.kernel.org>
CC:     <dmaengine@vger.kernel.org>, <vkoul@kernel.org>,
        <geert+renesas@glider.be>, <niklas.soderlund+renesas@ragnatech.se>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <Achim.Dahlhoff@de.bosch.com>, <stable@vger.kernel.org>
References: <20190305055628.11826-1-dirk.behme@de.bosch.com>
 <20190305055628.11826-2-dirk.behme@de.bosch.com>
From:   Dirk Behme <dirk.behme@de.bosch.com>
Organization: Robert Bosch Car Multimedia GmbH
Message-ID: <2c8e48cf-5030-b1b7-79da-c7a17d0e3f11@de.bosch.com>
Date:   Mon, 1 Apr 2019 14:47:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190305055628.11826-2-dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.221.161]
X-Brightmail-Tracker: H4sIAAAAAAAAA22SbUxbVRzGOfe25bb2wuG2hb8tL/PGxQQZ0onSbL5syUwav2jcB6M2mZdx
        oc1oS3oLDjSG4KYVRNlMM9qOwsimbmY6y8aATGYqc7CsQwcRGCCRoWNkL0qdOFmZvS2s/eC3
        5zzP+Z1/znMORTLvUVrKYnPyDhtXycoUEsWm4zkbHFSnqahz79OGL90RqaHNtx8Z9jVMSQyn
        rt8iDNNDBYaOb2aRoXdqkNySatwX2mD0uTxSY+DYhzLjtZElmTEcyH1Z+rrimTK+0lLDO554
        7k2F2eP7QVbVpt39q2eArEcD6kZEUYCLoXle2YgUFINbCWg4MSqLL84gWFwZR/HFZwjalq8Q
        jUhOqfBrMHDz25hW48cgMn2ZFDeR+CqCUFtEKgYMtkP3v6OxTTKcD70trlRRp+NC6OgPScXR
        NH4ewmdjtgQ/CoHxJSRqDTbBoPtkzKdxBgx55iSiluNn4ernrpgmsQE87cMorrPgylw7Edd5
        cPrmQVLUgB8B92STpAWpvElHeZNwbxLuTcI7kOQY0pTzRTVWfUmxvtBRygt1RfrCnXZrAMVf
        SNOD/rheHkSYQqyS/nPxkImRcjVCrTWInqIIVkP/HohaaaX2slozJ5h3OKoreYHV0tk/vmhi
        VA9sobrUahEEi90WRECRrJq++EmHiaHLuNo63mGPY0GkoyRsFl1BvWRicAXn5HfxfBXvWEs3
        UxQLNJJ1mpgMB1/B7y63VDrXYjaHRikpKUxmcpI8lqDkQfQkpYzOLhCPoIUqzipYKlbxh+M4
        s+Ym0AuoRJtFr4gMFlNzte3BVG02nfKb38RokoIEuYAmULQ3Fb1ZhJXRz5+YB7ROrChj1UxA
        G49EGXxcCYebZxH4e+4gmDl1g4C9Yy0ScB/1SeHCnuZUuNznTYW7fh8FE/7bFMz/MiyHs6ER
        OXT1Nz0EF7tCNNxxraTBfH9DOszcvYXh/vvuDPCvNDAwe/snFXznP6MG79dHNND71V8auDQW
        yoSp8KgWwkNTWpgMfq+DwRtDOvhnMaKDhfvncmC062AufBE5nwf+vnPsQrRMIlqmobpdLNPJ
        Of+nzFU3cTttPbINTGyqU6kKgtt3TJ+8Z17WnOhGO8eExm37u3ctC+uLiW3qjeSe9paPMrNb
        A5Npky/MvNNzYGvf8Fs/56a/8WrZutbc7deO2nK4RemWNPfIgUD4Fe/6kizpOu7TEDdXn3+a
        7dZvdRnHH1ccXrpHv33og3dLuODM3+jSx25h/HxTXhcrEcycPp90CNx/3utdOJYEAAA=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Renesas SoC team,

On 05.03.2019 06:56, Dirk Behme wrote:
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
> Changes in v2: Switch goto/retry to for loop


Any status update on this and the first fix

[PATCH v2 1/2] dmaengine: sh: rcar-dmac: With cyclic DMA residue 0 is valid

?

I still think they are required to fix the rcar-dmac driver.

Best regards

Dirk


>   drivers/dma/sh/rcar-dmac.c | 26 +++++++++++++++++++++++---
>   1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 2ea59229d7f5..cceddc7099b0 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1282,6 +1282,9 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
>   	enum dma_status status;
>   	unsigned int residue = 0;
>   	unsigned int dptr = 0;
> +	unsigned int chcrb;
> +	unsigned int tcrb;
> +	unsigned int i;
>   
>   	if (!desc)
>   		return 0;
> @@ -1329,6 +1332,24 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
>   		return 0;
>   	}
>   
> +	/*
> +	 * We need to read two registers.
> +	 * Make sure the control register does not skip to next chunk
> +	 * while reading the counter.
> +	 * Trying it 3 times should be enough: Initial read, retry, retry
> +	 * for the paranoid.
> +	 */
> +	for (i = 0; i < 3; i++) {
> +		chcrb = rcar_dmac_chan_read(chan, RCAR_DMACHCRB) &
> +					    RCAR_DMACHCRB_DPTR_MASK;
> +		tcrb = rcar_dmac_chan_read(chan, RCAR_DMATCRB);
> +		/* Still the same? */
> +		if (chcrb == (rcar_dmac_chan_read(chan, RCAR_DMACHCRB) &
> +			      RCAR_DMACHCRB_DPTR_MASK))
> +			break;
> +	}
> +	WARN_ONCE(i >= 3, "residue might be not continuous!");
> +
>   	/*
>   	 * In descriptor mode the descriptor running pointer is not maintained
>   	 * by the interrupt handler, find the running descriptor from the
> @@ -1336,8 +1357,7 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
>   	 * mode just use the running descriptor pointer.
>   	 */
>   	if (desc->hwdescs.use) {
> -		dptr = (rcar_dmac_chan_read(chan, RCAR_DMACHCRB) &
> -			RCAR_DMACHCRB_DPTR_MASK) >> RCAR_DMACHCRB_DPTR_SHIFT;
> +		dptr = chcrb >> RCAR_DMACHCRB_DPTR_SHIFT;
>   		if (dptr == 0)
>   			dptr = desc->nchunks;
>   		dptr--;
> @@ -1355,7 +1375,7 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
>   	}
>   
>   	/* Add the residue for the current chunk. */
> -	residue += rcar_dmac_chan_read(chan, RCAR_DMATCRB) << desc->xfer_shift;
> +	residue += tcrb << desc->xfer_shift;
>   
>   	return residue;
>   }
