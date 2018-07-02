Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:34358 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751349AbeGBGhU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 02:37:20 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Vinod <vkoul@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: rcar-dmac: clear channel register when error
Date: Mon, 02 Jul 2018 09:37:28 +0300
Message-ID: <2150046.r5M1qlqddB@avalon>
In-Reply-To: <87wouefnsq.wl-kuninori.morimoto.gx@renesas.com>
References: <87wouefnsq.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

Thank you for the patch.

On Monday, 2 July 2018 04:07:17 EEST Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We need to clear channel register in error case as recovery.
> The channel is already stopped in such case, thus we don't need to call
> rcar_dmac_chan_halt() before clearing.
> 
> rcar_dmac_chan_halt() will clear register and confirm DE bit.
> But it will be failed because channel is already stopped in error case.
> In other words, we shouldn't call it then.
> 
> // This patch started to use C++ style comment out
> // because it is recent Linus request

I fear this will generate lots of frustration :-/ While I strongly prefer the 
traditional C style, I'm fine leaving the choice to driver authors. However, I 
think that mixing different styles in the same file only hinders readability. 
Would you like to convert the whole file ? ;-)

> Reported-by: Hiroki Negishi <hiroki.negishi.bx@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Hiroki Negishi <hiroki.negishi.bx@renesas.com>
> ---
>  drivers/dma/sh/rcar-dmac.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 279c930..35d7a16 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1525,7 +1525,13 @@ static irqreturn_t rcar_dmac_isr_channel(int irq,
> void *dev)
> 
>  	chcr = rcar_dmac_chan_read(chan, RCAR_DMACHCR);
>  	if (chcr & RCAR_DMACHCR_CAE) {
> -		rcar_dmac_chan_halt(chan);
> +		struct rcar_dmac *dmac = dev_get_drvdata(chan->chan.device->dev);

This could be simplified with

		struct rcar_dmac *dmac = to_rcar_dmac(chan->chan.device);

> +
> +		// We don't need to call rcar_dmac_chan_halt()
> +		// because channel is already stopped in error case.
> +		// We need to clear register and check DE bit as recovery.

Is it also a request from Linus to wrap text much before the 80 characters 
limit ? :-)

> +		rcar_dmac_write(dmac, RCAR_DMACHCLR, 1 << chan->index);
> +		rcar_dmac_chcr_de_barrier(chan);
>  		reinit = true;
>  		goto spin_lock_end;
>  	}

-- 
Regards,

Laurent Pinchart
