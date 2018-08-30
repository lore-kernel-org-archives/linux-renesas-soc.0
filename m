Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40456 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728652AbeH3Sw7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 14:52:59 -0400
Date: Thu, 30 Aug 2018 16:50:23 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a774a1: Add USB2.0 phy and
 host(EHCI/OHCI) device nodes
Message-ID: <20180830145023.lkroiqsgdt33qprc@verge.net.au>
References: <1535107429-5458-1-git-send-email-biju.das@bp.renesas.com>
 <1535107429-5458-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVWE7F84BdbiqLBfKZLwb9QNg8chsUgWsKtPdikGWeXJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVWE7F84BdbiqLBfKZLwb9QNg8chsUgWsKtPdikGWeXJA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 30, 2018 at 02:29:02PM +0200, Geert Uytterhoeven wrote:
> On Fri, Aug 24, 2018 at 12:50 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Add USB2.0 phy and host (EHCI/OHCI) device nodes on RZ/G2M SoC dtsi.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 73 +++++++++++++++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > index cd204f5..a794089 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> 
> > +               ehci0: usb@ee080100 {
> > +                       compatible = "generic-ehci";
> > +                       reg = <0 0xee080100 0 0x100>;
> > +                       interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 703>;
> > +                       phys = <&usb2_phy0>;
> > +                       phy-names = "usb";
> > +                       companion= <&ohci0>;
> 
> Please insert a space before the "=".

I fixed that by adding the update to your fixup patch for many similar
problems. Let me know if pain persists after I've pushed the devel branch.

> 
> > +                       power-domains = <&sysc 32>;
> > +                       resets = <&cpg 703>;
> > +                       status = "disabled";
> > +               };
> > +
> > +               ehci1: usb@ee0a0100 {
> > +                       compatible = "generic-ehci";
> > +                       reg = <0 0xee0a0100 0 0x100>;
> > +                       interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 702>;
> > +                       phys = <&usb2_phy1>;
> > +                       phy-names = "usb";
> > +                       companion= <&ohci1>;
> 
> Likewise.
> 
> > +                       power-domains = <&sysc 32>;
> > +                       resets = <&cpg 702>;
> > +                       status = "disabled";
> > +               };
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
