Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:45964 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729182AbeJAUd5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Oct 2018 16:33:57 -0400
Received: by mail-vs1-f65.google.com with SMTP id g201so1191183vsd.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Oct 2018 06:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20180928113756.17572-1-geert+renesas@glider.be> <20181001133623.t3t3xvcxcldjxqgm@verge.net.au>
In-Reply-To: <20181001133623.t3t3xvcxcldjxqgm@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Oct 2018 15:55:48 +0200
Message-ID: <CAMuHMdWtBY-kEAJe910Y1cwkEv7bmRop5e0Gu9nk1o-_yGGS8Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Add INTC-EX device node
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Oct 1, 2018 at 3:36 PM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Sep 28, 2018 at 01:37:56PM +0200, Geert Uytterhoeven wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > This patch adds a device node for the Interrupt Controller for External
> > Devices (INTC-EX) on R-Car E3, which serves external IRQ pins IRQ[0-5].
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Tested on Ebisu using IRQ1 and IRQ2 on CP49 and EXIO E.
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > index 5c1d6321a5d22a18..a175b5dd04ce3475 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > @@ -341,6 +341,22 @@
> >                       #power-domain-cells = <1>;
> >               };
> >
> > +             intc_ex: interrupt-controller@e61c0000 {
> > +                     compatible = "renesas,intc-ex-r8a77990", "renesas,irqc";
> > +                     #interrupt-cells = <2>;
> > +                     interrupt-controller;
> > +                     reg = <0 0xe61c0000 0 0x200>;
> > +                     interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
> > +                                   GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
> > +                                   GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
> > +                                   GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
> > +                                   GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
> > +                                   GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&cpg CPG_MOD 407>;
>
> I am struggling to locate the documentation for this clock,
> although I do see it is consistent with (at least) the dtsi for H3.

Unfortunately the INTC-* clocks were removed from the R-Car Gen3
documentation, making it harder for DT to describe the hardware.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
