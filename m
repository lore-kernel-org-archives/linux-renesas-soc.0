Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34626 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754279AbdHYHKD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2017 03:10:03 -0400
MIME-Version: 1.0
In-Reply-To: <20170824195616.327888699@cogentembedded.com>
References: <20170824195616.327888699@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Aug 2017 09:10:02 +0200
Message-ID: <CAMuHMdUAF7Th+B0=wAvhcAj+qBzUyZmKS-OTZxEiMhH7D0-11w@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: rcar-dmac: document R8A7797 bindings
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Vinod Koul <vinod.koul@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 24, 2017 at 9:56 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Renesas  R-Car V3M (R8A7797) SoC also has the R-Car gen2/3 compatible DMA
> controllers, so document the SoC specific binding.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> The patch is against the 'next' branch of Vinod Koul's 'slave-dma.git' repo.
>
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt |    1 +
>  1 file changed, 1 insertion(+)
>
> Index: slave-dma/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> ===================================================================
> --- slave-dma.orig/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> +++ slave-dma/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> @@ -25,6 +25,7 @@ Required Properties:
>                 - "renesas,dmac-r8a7794" (R-Car E2)
>                 - "renesas,dmac-r8a7795" (R-Car H3)
>                 - "renesas,dmac-r8a7796" (R-Car M3-W)
> +               - "renesas,dmac-r8a7797" (R-Car V3M)

Please use "renesas,dmac-r8a77970" instead, to follow the new 5-digit
scheme started with r8a77995.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
