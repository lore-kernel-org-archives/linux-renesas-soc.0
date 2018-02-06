Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:45980 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752903AbeBFL6L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 06:58:11 -0500
MIME-Version: 1.0
In-Reply-To: <169ed4ac-1b8b-cf8c-45c4-957ebbdf3f5e@cogentembedded.com>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com> <169ed4ac-1b8b-cf8c-45c4-957ebbdf3f5e@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Feb 2018 12:58:09 +0100
Message-ID: <CAMuHMdWXc=1s5rMU5Tc_=tH4jrH+5P6z52J3ihiyYfseTpQ-kw@mail.gmail.com>
Subject: Re: [PATCH 07/11] arm64: dts: renesas: r8a77980: add [H]SCIF support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Feb 2, 2018 at 7:39 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe [H]SCIF ports in the R8A77980 device tree.
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi

> @@ -85,6 +92,150 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               hscif0: serial@e6540000 {
> +                       compatible = "renesas,hscif-r8a77980",
> +                                    "renesas,rcar-gen3-hscif",
> +                                    "renesas,hscif";
> +                       reg = <0 0xe6540000 0 0x60>;
> +                       interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 520>,
> +                                <&cpg CPG_CORE 16>,

Shouldn't this be 19 (S3D1) instead of 16 (S2D1)?

With that fixed (for all (H)SCIF ports);
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
