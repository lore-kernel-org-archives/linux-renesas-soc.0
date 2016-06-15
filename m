Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49550 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753105AbcFOWTU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 18:19:20 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	vinod.koul@intel.com, geert+renesas@glider.be,
	laurent.pinchart+renesas@ideasonboard.com, mfarooq@visteon.com
Subject: Re: [PATCH 1/4] dma: rcar-dma: use result of updated get_residue in tx_status
Date: Thu, 16 Jun 2016 01:19:26 +0300
Message-ID: <2277618.qmNLfjQA5Y@avalon>
In-Reply-To: <20160615111308.28739-2-niklas.soderlund+renesas@ragnatech.se>
References: <20160615111308.28739-1-niklas.soderlund+renesas@ragnatech.se> <20160615111308.28739-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

Thank you for the patch.

On Wednesday 15 Jun 2016 13:13:05 Niklas S�derlund wrote:
> From: Muhammad Hamza Farooq <mfarooq@visteon.com>
> 
> The hardware might have complete the transfer but the interrupt handler
> might not have had a chance to run. If rcar_dmac_chan_get_residue()
> which reads HW registers finds that there is no residue return
> DMA_COMPLETE.
> 
> Signed-off-by: Muhammad Hamza Farooq <mfarooq@visteon.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> [Niklas: add explanation in commit message]
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/dma/sh/rcar-dmac.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index dfb1792..791a064 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1202,6 +1202,10 @@ static enum dma_status rcar_dmac_tx_status(struct
> dma_chan *chan, residue = rcar_dmac_chan_get_residue(rchan, cookie);
>  	spin_unlock_irqrestore(&rchan->lock, flags);
> 
> +	/* if there's no residue, the cookie is complete */
> +	if (!residue)
> +		return DMA_COMPLETE;
> +
>  	dma_set_residue(txstate, residue);
> 
>  	return status;

-- 
Regards,

Laurent Pinchart
