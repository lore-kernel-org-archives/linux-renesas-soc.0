Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36824 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751593AbcKBKMN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 06:12:13 -0400
MIME-Version: 1.0
In-Reply-To: <2366203.iKt2DUneo7@wasted.cogentembedded.com>
References: <4121805.SRTmqJtRfv@wasted.cogentembedded.com> <2366203.iKt2DUneo7@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Nov 2016 11:12:11 +0100
Message-ID: <CAMuHMdUZULyFwAoteXf+g=RWP=gBs0jDMVGpNUT_A=kPdDwSYQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] ARM: dts: r8a7745: add [H]SCIF{A|B} support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Oct 29, 2016 at 12:19 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe [H]SCIF{|A|B} ports in the R8A7745 device tree.
>
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

After you've fixed the family-specific compatible values:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  arch/arm/boot/dts/r8a7745.dtsi |  261 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 261 insertions(+)
>
> Index: renesas/arch/arm/boot/dts/r8a7745.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7745.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7745.dtsi
> @@ -157,6 +157,267 @@
>                         #dma-cells = <1>;
>                         dma-channels = <15>;
>                 };
> +
> +               scifa0: serial@e6c40000 {
> +                       compatible = "renesas,scifa-r8a7745",
> +                                    "renesas,rzg-scifa", "renesas,scifa";

s/renesas,rzg-/renesas,rcar-gen2-/g

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
