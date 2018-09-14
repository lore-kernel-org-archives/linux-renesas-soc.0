Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:45301 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728029AbeINR2N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 13:28:13 -0400
MIME-Version: 1.0
References: <20180913145256.12261-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180913145256.12261-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Sep 2018 14:13:46 +0200
Message-ID: <CAMuHMdWDKapncucL2t_hGDop_XfgJrLmEUOwC5zxZOBKD7PQtQ@mail.gmail.com>
Subject: Re: [RFC PATCH] dmaengine: rcar-dmac: set scatter/gather max segment size
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Sep 13, 2018 at 4:53 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Fix warning when running with CONFIG_DMA_API_DEBUG_SG=y by allocating a
> device_dma_parameters structure and filling in the max segment size.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> According to this discussion [1], this is the intended way of setting
> dma_parms. I am not 100% sure about the value, though. I took the maximum value
> of the DMA Transfer Count Registers which is 16M. I'd think the real maximum
> needs to be multiplied with the data length which is varying, though? Geert,
> what do you think?
>
> [1] https://www.spinics.net/lists/iommu/msg29861.html
>
>  drivers/dma/sh/rcar-dmac.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 48ee35e2bce6..bb3631f6c41c 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -198,6 +198,7 @@ struct rcar_dmac {
>         struct dma_device engine;
>         struct device *dev;
>         void __iomem *iomem;
> +       struct device_dma_parameters parms;
>
>         unsigned int n_channels;
>         struct rcar_dmac_chan *channels;
> @@ -1792,6 +1793,8 @@ static int rcar_dmac_probe(struct platform_device *pdev)
>
>         dmac->dev = &pdev->dev;
>         platform_set_drvdata(pdev, dmac);
> +       dmac->dev->dma_parms = &dmac->parms;
> +       dma_set_max_seg_size(dmac->dev, 0x01000000);

That is one too much, cfr.

    drivers/dma/sh/rcar-dmac.c:#define RCAR_DMATCR_MASK             0x00ffffff

And commit d716d9b702bb759d ("dmaengine: rcar-dmac: fix max_chunk_size for
R-Car Gen3"), which did:

-       max_chunk_size = (RCAR_DMATCR_MASK + 1) << desc->xfer_shift;
+       max_chunk_size = RCAR_DMATCR_MASK << desc->xfer_shift;

And yes, this depends on the data length, which is not known at probe time.
Of course, dma_set_max_seg_size(dmac->dev, RCAR_DMATCR_MASK)
should be safe, albeit (slightly) suboptimal.
But I doubt anyone is really doing such large transfers (up to
(16 Mi - 1) * 64 bytes!).

>         dma_set_mask_and_coherent(dmac->dev, DMA_BIT_MASK(40));
>
>         ret = rcar_dmac_parse_of(&pdev->dev, dmac);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
