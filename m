Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36424 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752746AbcH3JgU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 05:36:20 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: r8a7795: Add VSP instances
Date: Tue, 30 Aug 2016 12:36:40 +0300
Message-ID: <2036190.HIgKtNaqYm@avalon>
In-Reply-To: <CAMuHMdUZ65WiNLR-YJq46L_vP-BxpSsQRzoYEjbMECd0_MO11w@mail.gmail.com>
References: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1470745752-23738-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdUZ65WiNLR-YJq46L_vP-BxpSsQRzoYEjbMECd0_MO11w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

(CC'ing Morimoto-san)

On Monday 29 Aug 2016 18:12:07 Geert Uytterhoeven wrote:
> On Tue, Aug 9, 2016 at 2:29 PM, Laurent Pinchart wrote:
> > The r8a7795 has 9 VSP instances.
> 
> 7?
> 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 90 +++++++++++++++++++++++++++
> >  1 file changed, 90 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a7795.dtsi index
> > f8b1c421e845..d9c6653471f4 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > @@ -1323,6 +1363,16 @@
> >                         power-domains = <&sysc R8A7795_PD_A3VP>;
> >                 };
> > 
> > +               vspi2: vsp@fe9c0000 {
> > +                       compatible = "renesas,vsp2";
> > +                       reg = <0 0xfe9c0000 0 0x8000>;
> > +                       interrupts = <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 629>;
> > +                       power-domains = <&sysc R8A7795_PD_A3VP>;
> > +
> > +                       renesas,fcp = <&fcpvi2>;
> > +               };
> > +
> >                 fcpvi2: fcp@fe9cf000 {
> >                         compatible = "renesas,r8a7795-fcpv",
> >                         "renesas,fcpv";
> >                         reg = <0 0xfe9cf000 0 0x200>;
> > @@ -1351,6 +1431,16 @@
> >                         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> >                 };
> > 
> > +               vspd3: vsp@fea38000 {
> > +                       compatible = "renesas,vsp2";
> > +                       reg = <0 0xfea38000 0 0x4000>;
> > +                       interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 620>;
> > +                       power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> > +
> > +                       renesas,fcp = <&fcpvd3>;
> > +               };
> > +
> 
> Looks like vspi2 and vspd3 are no more...

What the f... The latest errata agrees with you, and if the documentation is 
indeed correct, that's a completely brain-dead design change. I have no idea 
how the DU is supposed to be used if both DU0 and DU3 are connected to the 
same VSP (VSPD0), as mentioned in the latest H3 errata. Furthermore, the 
change doesn't seem to be applicable to ES1.0, as I've successfully tested the 
VGA output on my Salvator-X board, using VSPD3.

Morimoto-san, could you please try to get more information about this ?

-- 
Regards,

Laurent Pinchart
