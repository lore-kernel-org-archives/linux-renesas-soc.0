Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:25558 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751268AbdJWLEd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2017 07:04:33 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 2/4] ARM: dts: iwg22d: Add /dev/ttySC5 support
Date: Mon, 23 Oct 2017 11:04:28 +0000
Message-ID: <TY1PR06MB0895C595BCA5DA90999959D5C0460@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1507899796-7941-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1507899796-7941-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20171017075747.hftrfirrzu3ihesp@verge.net.au>
In-Reply-To: <20171017075747.hftrfirrzu3ihesp@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Simon,

>
> Please include some text in the changelog, ideally describing the
> motivation (why not what) for this patch.

Sure, I'll a description for v2. Thank you for the feedback.

Thanks,
Fab

>
>
> On Fri, Oct 13, 2017 at 02:03:14PM +0100, Fabrizio Castro wrote:
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> > ---
> >  arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boo=
t/dts/r8a7745-iwg22d-sodimm.dts
> > index edda4f1..5d5bb2f 100644
> > --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> > +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> > @@ -17,6 +17,7 @@
> >
> >  aliases {
> >  serial3 =3D &scif4;
> > +serial5 =3D &hscif1;
> >  ethernet0 =3D &avb;
> >  };
> >
> > @@ -39,7 +40,20 @@
> >  };
> >  };
> >
> > +&hscif1 {
> > +pinctrl-0 =3D <&hscif1_pins>;
> > +pinctrl-names =3D "default";
> > +
> > +uart-has-rtscts;
> > +status =3D "okay";
> > +};
> > +
> >  &pfc {
> > +hscif1_pins: hscif1 {
> > +groups =3D "hscif1_data", "hscif1_ctrl";
> > +function =3D "hscif1";
> > +};
> > +
> >  scif4_pins: scif4 {
> >  groups =3D "scif4_data_b";
> >  function =3D "scif4";
> > --
> > 2.7.4
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
