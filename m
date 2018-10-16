Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:7187 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726914AbeJPJwV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 05:52:21 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
CC: "horms@verge.net.au" <horms@verge.net.au>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: add/enable USB2.0 peripheral for
 R-Car [DE]3
Date: Tue, 16 Oct 2018 02:04:19 +0000
Message-ID: <OSBPR01MB229392E7592D0DD1BE2879C8D8FE0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1539081911-9020-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TYAPR01MB228597FF192B13D50AE16FC7B7E20@TYAPR01MB2285.jpnprd01.prod.outlook.com>
 <OSBPR01MB2103D2A8BA4D556D7234D470B8E20@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103D2A8BA4D556D7234D470B8E20@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju-san,

> From: Biju Das, Sent: Friday, October 12, 2018 5:32 PM
>=20
> Hi Shimoda-San,
>=20
> Thanks for the patch.
>=20
> > -----Original Message-----
> > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-
> > owner@vger.kernel.org> On Behalf Of Yoshihiro Shimoda
> > Sent: 09 October 2018 11:45
<snip>
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > index 7278cd5..e3726307 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > @@ -357,6 +357,51 @@
> >  			resets =3D <&cpg 407>;
> >  		};
> >
> > +		hsusb: usb@e6590000 {
> > +			compatible =3D "renesas,usbhs-r8a77990",
> > +				     "renesas,rcar-gen3-usbhs";
> > +			reg =3D <0 0xe6590000 0 0x100>;
>=20
> is it not 0x200?
>=20
> Renesas_usbhs driver("drivers/usb/renesas_usbhs/common.c ")  maps the add=
ress up to 0x100 using "devm_ioremap_resource"
> function
>=20
> where as the  "drivers/usb/renesas_usbhs/rcar3"  access  addresses beyond=
 0x100 (for eg:- 0x102,0x180,0x184,0x188) using
> iowrite32/16 calls.
>=20
> This issue is present in other R-Car Gen3 variant as well(for eg:- R-Car =
H3/M3-W,..... etc).

Thank you very much for your report!
You're collect. So, I'll submit a patch to resolve it for all R-Car Gen3 So=
Cs.

Best regards,
Yoshihiro Shimoda
