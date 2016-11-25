Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35840 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752475AbcKYJAQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Nov 2016 04:00:16 -0500
Received: by mail-wm0-f67.google.com with SMTP id m203so7114256wma.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Nov 2016 01:00:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1477933702-13423-6-git-send-email-geert+renesas@glider.be>
References: <1477933702-13423-1-git-send-email-geert+renesas@glider.be> <1477933702-13423-6-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Nov 2016 10:00:07 +0100
Message-ID: <CAMuHMdXOTqr=h0fF6AzCjX5Tv71xF8g=t-4=ZGwFuXZ75K_UyA@mail.gmail.com>
Subject: Re: [PATCH/RFC 5/5] dmaengine: rcar-dmac: Widen DMA mask to 40 bits
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 31, 2016 at 6:08 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> By default, the DMA mask covers only the low 32-bit address space, which
> causes SWIOTLB on arm64 to fall back to a bounce buffer for DMA
> transfers involving memory outside the 32-bit address space.
>
> The R-Car DMA controller hardware supports a 40-bit address space, hence
> widen the DMA mask to 40 bits to actually make use of this feature.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Any comments? Thanks!

> ---
>  drivers/dma/sh/rcar-dmac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 2e441d0ccd79a37a..93a69b992a51a7aa 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1716,6 +1716,7 @@ static int rcar_dmac_probe(struct platform_device *pdev)
>
>         dmac->dev = &pdev->dev;
>         platform_set_drvdata(pdev, dmac);
> +       dma_set_mask_and_coherent(dmac->dev, DMA_BIT_MASK(40));
>
>         ret = rcar_dmac_parse_of(&pdev->dev, dmac);
>         if (ret < 0)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
