Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48831 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750807AbdGMHtY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 03:49:24 -0400
Date: Thu, 13 Jul 2017 09:49:21 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 3/7] arm64: dts: renesas: r8a7796: Add VSP instances
Message-ID: <20170713074920.GE5580@verge.net.au>
References: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170621093133.5677-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdV93D9GVEEuOnHp08NyFKy=BZqHC_FXWNMf6hHcGXCMGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV93D9GVEEuOnHp08NyFKy=BZqHC_FXWNMf6hHcGXCMGg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 12, 2017 at 09:24:22AM +0200, Geert Uytterhoeven wrote:
> Hi Laurent, Simon,
> 
> On Wed, Jun 21, 2017 at 11:31 AM, Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > The r8a7796 has 5 VSP instances.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Ah, the pitfalls of reposting patches 8 months later...
> 
> > ---
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 50 ++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > index 28b0e2127021..ad9cd1c3199f 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -1447,6 +1447,16 @@
> >                         power-domains = <&sysc R8A7796_PD_A3VC>;
> >                 };
> >
> > +               vspb: vsp@fe960000 {
> > +                       compatible = "renesas,vsp2";
> > +                       reg = <0 0xfe960000 0 0x8000>;
> > +                       interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 626>;
> > +                       power-domains = <&sysc R8A7796_PD_A3VC>;
> 
> ... missing resets properties.

Sorry for letting that slip through.
Laurent, please send an incremental patch.
