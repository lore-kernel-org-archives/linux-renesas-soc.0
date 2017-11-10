Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54418 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752405AbdKJLIM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 06:08:12 -0500
Date: Fri, 10 Nov 2017 12:08:08 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>
Subject: Re: [PATCH v4 01/15] arm64: dts: renesas: r8a7795: Add IPMMU device
 nodes
Message-ID: <20171110110807.n3b5ovinfymovv3x@verge.net.au>
References: <20171101103452.7491-1-horms+renesas@verge.net.au>
 <20171101103452.7491-2-horms+renesas@verge.net.au>
 <CAMuHMdUjCM6GYocoovKbJuAay5Fg2WOk-fSpnp_HC-Po1RUVAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUjCM6GYocoovKbJuAay5Fg2WOk-fSpnp_HC-Po1RUVAQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 07, 2017 at 10:11:56AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Nov 1, 2017 at 11:34 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Add r8a7795 IPMMU nodes and keep all disabled by default.
> >
> > This includes all IPMMU devices for r8a7795 ES2.0. Those
> > not present in r8a7795 ES1.x are removed from the DT for those
> > SoCs using delete-node. A follow-up patch will add IPMMU devices
> > to ES1.x which are not also present in ES2.0.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> > @@ -86,6 +91,22 @@
> >         };
> >  };
> >
> > +&ipmmu_vi0 {
> > +       renesas,ipmmu-main = <&ipmmu_mm 11>;
> > +};
> > +
> > +&ipmmu_vp0 {
> > +       renesas,ipmmu-main = <&ipmmu_mm 12>;
> > +};
> > +
> > +&ipmmu_vc0 {
> > +       renesas,ipmmu-main = <&ipmmu_mm 12>;
> 
> Should be 9.

Thanks, it looks like I made a copy-paste error.

> 
> > +};
> 
> Missing override:
> 
>     &ipmmu_vc1 {
>             renesas,ipmmu-main = <&ipmmu_mm 10>;
>     }

Thanks, added.

> 
> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > @@ -421,6 +421,133 @@
> >                         resets = <&cpg 407>;
> >                 };
> >
> > +               ipmmu_vi0: mmu@febd0000 {
> > +                       compatible = "renesas,ipmmu-r8a7795";
> > +                       reg = <0 0xfebd0000 0 0x1000>; /* IPMMU-VI0 */
> 
> Given the label names, do we need comments like "IPMMU-VI0"?

Thanks, I will drop them.

> 
> > +               ipmmu_vp0: mmu@fe990000 {
> > +                       compatible = "renesas,ipmmu-r8a7795";
> > +                       reg = <0 0xfe990000 0 0x1000>; /* IPMMU-VP0 */
> > +                       renesas,ipmmu-main = <&ipmmu_mm 16>;
> > +                       #iommu-cells = <1>;
> 
> According to Table 16.2, some IPMMU instances (e.g VP0) are part of a power
> domain.  While I doubt the kernel code handles that correctly, it should be
> described in DT nevertheless.

Thanks, will do.
