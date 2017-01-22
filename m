Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:35338 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750770AbdAVJkR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Jan 2017 04:40:17 -0500
MIME-Version: 1.0
In-Reply-To: <20170120212055.4157-3-chris.brandt@renesas.com>
References: <20170120212055.4157-1-chris.brandt@renesas.com> <20170120212055.4157-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 22 Jan 2017 10:40:15 +0100
Message-ID: <CAMuHMdXQCqs4bCR8o+BC5ak0rE64bQOEz65udFntcQSRkU6+cw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: r7s72100: add ostm to device tree
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 20, 2017 at 10:20 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
> * wrap clock lines to avoid 80 char max
> * split into 2 separate channel nodes
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index d5946df..47b2165 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -505,4 +505,20 @@
>                 cap-sdio-irq;
>                 status = "disabled";
>         };
> +
> +       ostm0: ostm@fcfec000 {
> +               compatible = "renesas,r7s72100-ostm", "renesas,ostm";
> +               reg = <0xfcfec000 0x30>;
> +               interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
> +               clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;

Missing power-domains property:

        power-domains = <&cpg_clocks>;

> +               status = "disabled";
> +       };
> +
> +       ostm1: ostm@fcfec400 {
> +               compatible = "renesas,r7s72100-ostm", "renesas,ostm";
> +               reg = <0xfcfec400 0x30>;
> +               interrupts = <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>;
> +               clocks = <&mstp5_clks R7S72100_CLK_OSTM1>;

Likewise.

BTW, they're also missing for the last added device nodes (MMC and SDHI).

> +               status = "disabled";
> +       };
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
