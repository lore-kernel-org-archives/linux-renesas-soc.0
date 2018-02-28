Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:38390 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752395AbeB1K43 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Feb 2018 05:56:29 -0500
MIME-Version: 1.0
In-Reply-To: <e309d9cd-69c6-7db2-96a4-73bc788b7cfc@cogentembedded.com>
References: <3aaa4464-fc85-3fb4-2026-5d9df357bdff@cogentembedded.com> <e309d9cd-69c6-7db2-96a4-73bc788b7cfc@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Feb 2018 11:56:27 +0100
Message-ID: <CAMuHMdWcwx8=KKf0RajtSXnJY9duaupFmUUKEka=uAmJjTdvoQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a77970: add I2C support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 26, 2018 at 9:54 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Define the generic R8A77970 parts of the I2C[0-4] device node.
>
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> Changes in version 2:
> - made  use of  the SYSC power domain #define's;
> - moved the I2C nodes before HSCIF nodes.

auto-repeat below...

>  arch/arm64/boot/dts/renesas/r8a77970.dtsi |   88 ++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -19,6 +19,14 @@
>         #address-cells = <2>;
>         #size-cells = <2>;
>
> +       aliases {
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +       };
> +
>         psci {
>                 compatible = "arm,psci-1.0", "arm,psci-0.2";
>                 method = "smc";
> @@ -338,6 +346,86 @@
>                                <&ipmmu_ds1 22>, <&ipmmu_ds1 23>;
>                 };
>
> +               i2c0: i2c@e6500000 {
> +                       compatible = "renesas,i2c-r8a77970",
> +                                    "renesas,rcar-gen3-i2c";
> +                       reg = <0 0xe6500000 0 0x40>;
> +                       interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 931>;
> +                       power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +                       resets = <&cpg 931>;
> +                       dmas = <&dmac1 0x91>, <&dmac1 0x90>;

Can't all five i2c interfaces be used with both dmac1 and dmac2?

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
