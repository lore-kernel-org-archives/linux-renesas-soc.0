Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:13773 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752657AbdJRNWC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2017 09:22:02 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "Chris Paterson" <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH  2/2] ARM: dts: iwg20d-q7-dbcm-ca: Add HDMI video output
Date: Wed, 18 Oct 2017 13:21:56 +0000
Message-ID: <KL1PR06MB1702073B7CD3385150B5407CB84D0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1508319227-19679-1-git-send-email-biju.das@bp.renesas.com>
 <1508319227-19679-3-git-send-email-biju.das@bp.renesas.com>
 <2315907.0FoaqPrOEJ@avalon>
In-Reply-To: <2315907.0FoaqPrOEJ@avalon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

> On Wednesday, 18 October 2017 12:33:47 EEST Biju Das wrote:
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Although there is a HDMI connector on the q7 carrier board it is not
> > connected to the RZ/G1M SoC. One must use the HDMI connector on the
> > camera daughter board.
> >
> > This patch adds support for this connector.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi | 75
> > +++++++++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> > b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi index 31fab5f..45b8167
> > 100644
> > --- a/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> > +++ b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> > +&i2c5 {
> > +status =3D "okay";
> > +clock-frequency =3D <400000>;
> > +
> > +cec_clock: cec-clock {
> > +compatible =3D "fixed-clock";
> > +#clock-cells =3D <0>;
> > +clock-frequency =3D <12000000>;
> > +};
>
> I assume this describes a fixed clock generator that is not I2C-controlle=
d.
> The node should thus not be a child of the i2c5 bus node, but should be m=
oved
> to the root node of the DT.

Thanks, We will send a v2 with above changes.

> The rest looks good to me. With this fixed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> However I can't find arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi in linux-ne=
xt.
> Which tree would you like to get this series merged through ?

Currently it is in renesas devel branch (https://git.kernel.org/pub/scm/lin=
ux/kernel/git/horms/renesas.git).
It will be merged with linux-next in coming weeks.

Regards,
Biju





Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
