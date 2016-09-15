Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:35262 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755840AbcIOLru (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2016 07:47:50 -0400
Received: by mail-it0-f66.google.com with SMTP id e20so4210690itc.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Sep 2016 04:47:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160914164611.31237-6-ulrich.hecht+renesas@gmail.com>
References: <20160914164611.31237-1-ulrich.hecht+renesas@gmail.com> <20160914164611.31237-6-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Sep 2016 13:47:49 +0200
Message-ID: <CAMuHMdVv9iv8+pY8gHEDavR_Sep+=F-2PyR8eZ++hSQZsAQP4A@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: renesas: r8a7796: Enable I2C DMA
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Wed, Sep 14, 2016 at 6:46 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index a4d8b76..7c4d11c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -257,6 +257,8 @@
>                         interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cpg CPG_MOD 931>;
>                         power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +                       dmas = <&dmac1 0x91>, <&dmac1 0x90>;
> +                       dma-names = "tx", "rx";

Does the firmware on your r8a7796/salvator-x support using SYS-DMAC2?
(the one we have on r8a7795/salvator-x doesn't)
If yes, you may want to add those dmas, too.

>                         i2c-scl-internal-delay-ns = <110>;
>                         status = "disabled";
>                 };
> @@ -269,6 +271,8 @@
>                         interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cpg CPG_MOD 930>;
>                         power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +                       dmas = <&dmac1 0x93>, <&dmac1 0x92>;
> +                       dma-names = "tx", "rx";

Likewise.

>                         i2c-scl-internal-delay-ns = <6>;
>                         status = "disabled";
>                 };
> @@ -281,6 +285,8 @@
>                         interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cpg CPG_MOD 929>;
>                         power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +                       dmas = <&dmac1 0x95>, <&dmac1 0x94>;
> +                       dma-names = "tx", "rx";

Likewise.

>                         i2c-scl-internal-delay-ns = <6>;
>                         status = "disabled";
>                 };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
