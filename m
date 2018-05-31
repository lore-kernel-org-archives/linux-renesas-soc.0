Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:59432 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754272AbeEaJWM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 May 2018 05:22:12 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: RE: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
Date: Thu, 31 May 2018 09:22:02 +0000
Message-ID: <OSBPR01MB22932FB39AA6D91DC42E7971D8630@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20180529105847.15663-1-wsa+renesas@sang-engineering.com>
 <20180529105847.15663-2-wsa+renesas@sang-engineering.com>
 <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <20180531083129.qtcxoiupqeh6xzg3@ninjato>
In-Reply-To: <20180531083129.qtcxoiupqeh6xzg3@ninjato>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, May 31, 2018 5:31 PM
>=20
> Hello Shimoda-san,
>=20
> > > Subject: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
> >
> > If possible, I'd like to replace "bug" with "specification" or other wo=
rds :)
>=20
> "behaviour" maybe is a better word?

It sounds good to me.

> > > +	/* Gen3 has a HW bug which needs a reset before allowing RX DMA onc=
e */
> > > +	if (priv->devtype =3D=3D I2C_RCAR_GEN3) {
> > > +		priv->flags |=3D ID_P_NO_RXDMA;
> > > +		if (!IS_ERR(priv->rstc)) {
> > > +			ret =3D reset_control_reset(priv->rstc);
> >
> > According to the datasheet Rev.1.00 page 57-69, we should do:
> > 	reset_control_assert();
> > 	udelay(1);
> > 	reset_control_deassert();
> > 	while (reset_control_status())
> > 		;
> > instead of reset_control_reset(), I think.
>=20
> I was following Geert's suggestion here from the mail thread '[periperi] =
About
> BSP patch "i2c: rcar: Fix I2C DMA reception by adding reset':
>=20
> =3D=3D=3D
>=20
> >> reset_control_assert() + reset_control_deassert() can be replaced by
> >> reset_control_assert().
> >
> > Do you mean 'reset_control_reset' maybe? I am not sure, I don't know
> > this API very well... but two time *_assert looks suspicious.
>=20
> Of course. Silly c&p.
>=20
> >> In addition, that will make sure the delay of one cycle of the RCLK cl=
ock
> >> is taken into account, which is not the case with the current code.
> >
> > I guess this is why there is now this patch in the BSP which Shimoda-sa=
n
> > mentioned in a later mail:
> >
> > f0cd22525f73 ("i2c: rcar: Fix module reset function for hardware specif=
ication")
>=20
> Exactly.
>=20
> =3D=3D=3D
>=20
> As far as I understood it takes care of the proper reset mechanism with t=
he delay?

I missed this email... As I replied to Geert-san on other email thread,
I'll ask HW team about this topic.

Best regards,
Yoshihiro Shimoda

> Kind regards,
>=20
>    Wolfram
