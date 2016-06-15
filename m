Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49570 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752739AbcFOW37 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 18:29:59 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	vinod.koul@intel.com, geert+renesas@glider.be,
	laurent.pinchart+renesas@ideasonboard.com, mfarooq@visteon.com
Subject: Re: [PATCH 3/4] dma: rcar-dma: Fixed active descriptor initializing
Date: Thu, 16 Jun 2016 01:30:08 +0300
Message-ID: <1847659.tdlhlPx5Jh@avalon>
In-Reply-To: <20160615111308.28739-4-niklas.soderlund+renesas@ragnatech.se>
References: <20160615111308.28739-1-niklas.soderlund+renesas@ragnatech.se> <20160615111308.28739-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

Thank you for the patch.

On Wednesday 15 Jun 2016 13:13:07 Niklas S�derlund wrote:
> From: Muhammad Hamza Farooq <mfarooq@visteon.com>
> 
> Running descriptor pointer is set to NULL upon freeing resources. Other-
> wise, rcar_dmac_issue_pending might not start new transfers
> 
> Signed-off-by: Muhammad Hamza Farooq <mfarooq@visteon.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/dma/sh/rcar-dmac.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 7f26576..59951fb 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -990,6 +990,8 @@ static void rcar_dmac_free_chan_resources(struct
> dma_chan *chan) list_splice_init(&rchan->desc.done, &list);
>  	list_splice_init(&rchan->desc.wait, &list);
> 
> +	rchan->desc.running = NULL;
> +
>  	list_for_each_entry(desc, &list, node)
>  		rcar_dmac_realloc_hwdesc(rchan, desc, 0);

-- 
Regards,

Laurent Pinchart
