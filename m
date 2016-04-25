Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37353 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965020AbcDYVbw (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 17:31:52 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a7795: Add DU device to DT
Date: Tue, 26 Apr 2016 00:32:14 +0300
Message-ID: <5124789.NoFdmsztzH@avalon>
In-Reply-To: <CAMuHMdXKSm4-qu0z1H5arkLu6RMwQZYL8WPzydve_VoLSgvKtA@mail.gmail.com>
References: <1461458095-12212-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1461458095-12212-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdXKSm4-qu0z1H5arkLu6RMwQZYL8WPzydve_VoLSgvKtA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday 25 Apr 2016 10:34:38 Geert Uytterhoeven wrote:
> On Sun, Apr 24, 2016 at 2:34 AM, Laurent Pinchart wrote:
> > Add the DU device to r8a7795.dtsi in a disabled state.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 46 +++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a7795.dtsi index
> > ad25330e7827..b64366c541ed 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > @@ -1379,5 +1379,51 @@
> >                         clocks = <&cpg CPG_MOD 600>;
> >                         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> >                 };
> > +
> > +               du: display@feb00000 {
> > +                       compatible = "renesas,du-r8a7795";
> > +                       reg = <0 0xfeb00000 0 0x80000>,
> > +                             <0 0xfeb90000 0 0x14>;
> > +                       reg-names = "du", "lvds.0";
> > +                       interrupts = <0 256 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <0 268 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <0 269 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <0 270 IRQ_TYPE_LEVEL_HIGH>;
> 
> GIC_SPI (4x)

I'll fix that.

> > +                       clocks = <&cpg CPG_MOD 724>,
> > +                                <&cpg CPG_MOD 723>,
> > +                                <&cpg CPG_MOD 722>,
> > +                                <&cpg CPG_MOD 721>,
> > +                                <&cpg CPG_MOD 727>;
> > +                       clock-names = "du.0", "du.1", "du.2", "du.3",
> > "lvds.0";
>
> BTW, now you have your "always-on" PM Domain, it would be nice to revamp the
> DU bindings to have one device node per DU instance, so there can be a
> one-to-one mapping of device nodes, DU instances, and DU module clocks...

I wish it could be that easy. The DU instances are not independent, they share 
resources that are controlled by one DU in particular. It might be possible to 
split LVDS support out, but for the DU channels it would be way more complex.

-- 
Regards,

Laurent Pinchart
