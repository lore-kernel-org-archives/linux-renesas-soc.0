Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49555 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753105AbcFOWUd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 18:20:33 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	vinod.koul@intel.com, geert+renesas@glider.be,
	laurent.pinchart+renesas@ideasonboard.com, mfarooq@visteon.com
Subject: Re: [PATCH 2/4] dmaengine: rcar-dmac: warn if transfer cannot start as TE = 1
Date: Thu, 16 Jun 2016 01:20:42 +0300
Message-ID: <3355322.55GAMUJcXu@avalon>
In-Reply-To: <20160615111308.28739-3-niklas.soderlund+renesas@ragnatech.se>
References: <20160615111308.28739-1-niklas.soderlund+renesas@ragnatech.se> <20160615111308.28739-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

Thank you for the patch.

On Wednesday 15 Jun 2016 13:13:06 Niklas S�derlund wrote:
> The documentation states one should make sure both DE and TE are cleared
> before starting a transaction. This patch extends the current warning to
> look at both DE and TE.
> 
> Based on previous work from Muhammad Hamza Farooq.
> 
> Suggested-by: Muhammad Hamza Farooq <mfarooq@visteon.com>
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/dma/sh/rcar-dmac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 791a064..7f26576 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -311,7 +311,7 @@ static bool rcar_dmac_chan_is_busy(struct rcar_dmac_chan
> *chan) {
>  	u32 chcr = rcar_dmac_chan_read(chan, RCAR_DMACHCR);
> 
> -	return (chcr & (RCAR_DMACHCR_DE | RCAR_DMACHCR_TE)) == RCAR_DMACHCR_DE;
> +	return !!(chcr & (RCAR_DMACHCR_DE | RCAR_DMACHCR_TE));
>  }
> 
>  static void rcar_dmac_chan_start_xfer(struct rcar_dmac_chan *chan)

-- 
Regards,

Laurent Pinchart
