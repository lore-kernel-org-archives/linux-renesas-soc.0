Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:37698 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750858AbeEPRnb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 13:43:31 -0400
MIME-Version: 1.0
In-Reply-To: <1526475916-13705-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1526475916-13705-1-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 May 2018 19:43:29 +0200
Message-ID: <CAMuHMdWFZ2XL1E58-2_PdVWS3gHjw3AUB0JCCkaJUzLxWvwczA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a77995: Add MSIOF device nodes
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-spi <linux-spi@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Wed, May 16, 2018 at 3:05 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>
> This patch adds MSIOF device nodes for the R8A77995 SoC.
>
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [uli: remove unimplemented ref clock]

I think you should remove the clock-names properties, too.

> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 66 +++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 2506f46..2f712ac 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -783,6 +783,72 @@
>                         compatible = "renesas,prr";
>                         reg = <0 0xfff00044 0 4>;
>                 };
> +
> +               msiof0: spi@e6e90000 {
> +                       compatible = "renesas,msiof-r8a77995",
> +                                    "renesas,rcar-gen3-msiof";
> +                       reg = <0 0xe6e90000 0 0x0064>;
> +                       interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 211>;
> +                       clock-names = "msiof_clk";
> +                       dmas = <&dmac1 0x41>, <&dmac1 0x40>,
> +                              <&dmac2 0x41>, <&dmac2 0x40>;
> +                       dma-names = "tx", "rx", "tx", "rx";
> +                       power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +                       resets = <&cpg 211>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
