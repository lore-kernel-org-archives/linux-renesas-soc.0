Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:40514 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750707AbeEDHwk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 May 2018 03:52:40 -0400
MIME-Version: 1.0
In-Reply-To: <f07c00b3-228c-e0d2-f7fe-38b8e9f25a4d@cogentembedded.com>
References: <c184f961-2f98-532f-ed02-6f3751256d9c@cogentembedded.com> <f07c00b3-228c-e0d2-f7fe-38b8e9f25a4d@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 May 2018 09:52:38 +0200
Message-ID: <CAMuHMdWFLC=kyHKVuq4KByO=KFf2eHvXu0_g2HqGoZT7gKkNDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77980: add CAN-FD support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Apr 27, 2018 at 9:12 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Define the generic R8A77980 part of the CAN-FD device node.
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
=
> @@ -170,6 +177,30 @@
>                         status = "disabled";
>                 };
>
> +               canfd: can@e66c0000 {
> +                       compatible = "renesas,r8a77980-canfd",
> +                                    "renesas,rcar-gen3-canfd";
> +                       reg = <0 0xe66c0000 0 0x8000>;
> +                       interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 914>,
> +                                <&cpg CPG_CORE R8A77980_CLK_CANFD>,
> +                                <&can_clk>;
> +                       clock-names = "fck", "canfd", "can_clk";
> +                       assigned-clocks = <&cpg CPG_CORE R8A77980_CLK_CANFD>;
> +                       assigned-clock-rates = <40000000>;
> +                       power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;

You forgot the resets property.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
