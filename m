Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Vinod Koul <vinod.koul@intel.com>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-Kernel <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anton Volkov <avolkov@ispras.ru>,
        Alexey Khoroshilov <khoroshilov@ispras.ru>,
        ldv-project@linuxtesting.org, dmaengine@vger.kernel.org,
        geert+renesas@glider.be
Subject: Re: Possible null pointer dereference in rcar-dmac.ko
Date: Thu, 10 Aug 2017 17:59:55 +0300
Message-ID: <5183349.25vgxfYFYf@avalon>
In-Reply-To: <871sokyybc.wl%kuninori.morimoto.gx@renesas.com>
References: <0df6c6f5-c306-3e43-2b1f-013c47c51042@ispras.ru> <1966479.zaHQfZ4vb1@avalon> <871sokyybc.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

Thank you for the patch.

On Thursday 10 Aug 2017 02:09:21 Kuninori Morimoto wrote:
> Anton Volkov noticed that engine->dev is NULL before
> of_dma_controller_register() in probe.
> Thus there might be a NULL pointer dereference in
> rcar_dmac_chan_start_xfer while accessing chan->chan.device->dev which
> is equal to (&dmac->engine)->dev.
> To be more safety code, this patch initialize dmac->engine before it.
> 
> Reported-by: Anton Volkov <avolkov@ispras.ru>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> 
> > Anton, Laurent
> 
> I created this patch because noone posted it yesterday.
> Anton, you can use this patch and replace Author to you if you want.
> Thus, I used [RFC] on this patch

I don't think you have, the subject line is still "Re: Possible null pointer 
dereference in rcar-dmac.ko" :-)

>  drivers/dma/sh/rcar-dmac.c | 51 ++++++++++++++++++++-----------------------
>  1 file changed, 26 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index ffcadca..6d60628 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1818,8 +1818,32 @@ static int rcar_dmac_probe(struct platform_device
> *pdev) goto error;
>  	}
> 
> -	/* Initialize the channels. */
> -	INIT_LIST_HEAD(&dmac->engine.channels);
> +	/* Initialize engine */
> +	engine = &dmac->engine;
> +
> +	dma_cap_set(DMA_MEMCPY, engine->cap_mask);
> +	dma_cap_set(DMA_SLAVE, engine->cap_mask);
> +
> +	engine->dev		= &pdev->dev;
> +	engine->copy_align	= ilog2(RCAR_DMAC_MEMCPY_XFER_SIZE);
> +
> +	engine->src_addr_widths	= widths;
> +	engine->dst_addr_widths	= widths;
> +	engine->directions	= BIT(DMA_MEM_TO_DEV) | BIT(DMA_DEV_TO_MEM);
> +	engine->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
> +
> +	engine->device_alloc_chan_resources	= 
rcar_dmac_alloc_chan_resources;
> +	engine->device_free_chan_resources	= 
rcar_dmac_free_chan_resources;
> +	engine->device_prep_dma_memcpy		= rcar_dmac_prep_dma_memcpy;
> +	engine->device_prep_slave_sg		= rcar_dmac_prep_slave_sg;
> +	engine->device_prep_dma_cyclic		= rcar_dmac_prep_dma_cyclic;
> +	engine->device_config			= rcar_dmac_device_config;
> +	engine->device_terminate_all		= 
rcar_dmac_chan_terminate_all;
> +	engine->device_tx_status		= rcar_dmac_tx_status;
> +	engine->device_issue_pending		= rcar_dmac_issue_pending;
> +	engine->device_synchronize		= 
rcar_dmac_device_synchronize;
> +
> +	INIT_LIST_HEAD(&engine->channels);

I don't think this fully fixes the problem, as the rcar_dmac_isr_error() IRQ 
handler is still registered before all this. Furthermore, at least some of the 
initialization at the end of rcar_dmac_chan_probe() has to be moved before the 
rcar_dmac_isr_channel() IRQ handler registration.

Let's not commit a quick hack but fix the problem correctly, we should ensure 
that all the initialization needed by IRQ handlers is performed before they 
get registered.

>  	for (i = 0; i < dmac->n_channels; ++i) {
>  		ret = rcar_dmac_chan_probe(dmac, &dmac->channels[i],
> @@ -1839,29 +1863,6 @@ static int rcar_dmac_probe(struct platform_device
> *pdev) *
>  	 * Default transfer size of 32 bytes requires 32-byte alignment.
>  	 */
> -	engine = &dmac->engine;
> -	dma_cap_set(DMA_MEMCPY, engine->cap_mask);
> -	dma_cap_set(DMA_SLAVE, engine->cap_mask);
> -
> -	engine->dev = &pdev->dev;
> -	engine->copy_align = ilog2(RCAR_DMAC_MEMCPY_XFER_SIZE);
> -
> -	engine->src_addr_widths = widths;
> -	engine->dst_addr_widths = widths;
> -	engine->directions = BIT(DMA_MEM_TO_DEV) | BIT(DMA_DEV_TO_MEM);
> -	engine->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
> -
> -	engine->device_alloc_chan_resources = rcar_dmac_alloc_chan_resources;
> -	engine->device_free_chan_resources = rcar_dmac_free_chan_resources;
> -	engine->device_prep_dma_memcpy = rcar_dmac_prep_dma_memcpy;
> -	engine->device_prep_slave_sg = rcar_dmac_prep_slave_sg;
> -	engine->device_prep_dma_cyclic = rcar_dmac_prep_dma_cyclic;
> -	engine->device_config = rcar_dmac_device_config;
> -	engine->device_terminate_all = rcar_dmac_chan_terminate_all;
> -	engine->device_tx_status = rcar_dmac_tx_status;
> -	engine->device_issue_pending = rcar_dmac_issue_pending;
> -	engine->device_synchronize = rcar_dmac_device_synchronize;
> -
>  	ret = dma_async_device_register(engine);
>  	if (ret < 0)
>  		goto error;

-- 
Regards,

Laurent Pinchart
