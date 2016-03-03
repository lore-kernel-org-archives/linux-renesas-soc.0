Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Vinod Koul <vinod.koul@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-renesas-soc@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2] dma: rcar-dmac: clear pertinence number of channels
Date: Thu, 03 Mar 2016 12:52:43 +0200
Message-ID: <1688525.rReolS6g1X@avalon>
In-Reply-To: <874mcoarxq.wl%kuninori.morimoto.gx@renesas.com>
References: <87d1rcayon.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdV0QQG-k274on0B4D31_qyi0fH=9HGO6=V-yObxVy-_ag@mail.gmail.com> <874mcoarxq.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

Thank you for the patch.

On Thursday 03 March 2016 17:25:53 Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> DMACHCLR clears each channels, but its channel number is based on
> its SoC or IP. Current driver is using fixed 0x7fff (= for 15ch),
> it is not good match for Gen3 or Gen2 Audio DMAC. This patch fixes it
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v1 -> v2
> 
>  - 14ch -> 15ch
> 
>  drivers/dma/sh/rcar-dmac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 57a6dfc9..02b86c6 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -422,7 +422,7 @@ static int rcar_dmac_init(struct rcar_dmac *dmac)
>  	u16 dmaor;
> 
>  	/* Clear all channels and enable the DMAC globally. */
> -	rcar_dmac_write(dmac, RCAR_DMACHCLR, 0x7fff);
> +	rcar_dmac_write(dmac, RCAR_DMACHCLR, GENMASK(dmac->n_channels - 1, 0));
>  	rcar_dmac_write(dmac, RCAR_DMAOR,
>  			RCAR_DMAOR_PRI_FIXED | RCAR_DMAOR_DME);

-- 
Regards,

Laurent Pinchart
