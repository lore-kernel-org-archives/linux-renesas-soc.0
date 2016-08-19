Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51161 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753897AbcHSJFB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Aug 2016 05:05:01 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH/HACK 5/7] [HACK] ARM: shmobile: r8a7790: Link the VSP1 and DU
Date: Fri, 19 Aug 2016 12:05:16 +0300
Message-ID: <1622326.A7abvKVG5t@avalon>
In-Reply-To: <CAMuHMdUX1qM5_OTGUUUaRFDq9kkekbkmnBJG=Y4gr7E-SrjX0w@mail.gmail.com>
References: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1471536240-25082-6-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdUX1qM5_OTGUUUaRFDq9kkekbkmnBJG=Y4gr7E-SrjX0w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Friday 19 Aug 2016 09:06:57 Geert Uytterhoeven wrote:
> On Thu, Aug 18, 2016 at 6:03 PM, Laurent Pinchart wrote:
> > In order to test VSP+DU integration for Gen3 on Gen2, link the VSPD
> > instances to the DU and modify their features to match the Gen3 VSPD.
> 
> Why do you modify the feature properties? AFAIK the driver doesn't
> look at them anyway.

It was a leftover, that's not needed indeed. It will go away when I'll rebase 
the series on top of your patch that removes those properties from 
r8a7790.dtsi.

> > Remove the IOMMU properties for the DU as memory is now accessed through
> > the VSPD.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  arch/arm/boot/dts/r8a7790.dtsi | 14 +++++---------
> >  1 file changed, 5 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/r8a7790.dtsi
> > b/arch/arm/boot/dts/r8a7790.dtsi index 637cb8be363f..0ff45867e711 100644
> > --- a/arch/arm/boot/dts/r8a7790.dtsi
> > +++ b/arch/arm/boot/dts/r8a7790.dtsi
> > @@ -969,7 +969,7 @@
> >                 renesas,#wpf = <4>;
> >         };
> > 
> > -       vsp1@fe930000 {
> > +       vsp1d0: vsp1@fe930000 {
> >                 compatible = "renesas,vsp1";
> >                 reg = <0 0xfe930000 0 0x8000>;
> >                 interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> > @@ -979,13 +979,11 @@
> >                 iommus = <&ipmmu_mx 5 &ipmmu_mx 13>;
> >                 
> >                 renesas,has-lif;
> > -               renesas,has-lut;
> >                 renesas,#rpf = <4>;
> > -               renesas,#uds = <1>;
> > -               renesas,#wpf = <4>;
> > +               renesas,#wpf = <1>;
> >         };

-- 
Regards,

Laurent Pinchart
