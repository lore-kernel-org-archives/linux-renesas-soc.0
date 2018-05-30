Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:8958 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S964979AbeE3IfO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 May 2018 04:35:14 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: RE: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
Date: Wed, 30 May 2018 08:35:09 +0000
Message-ID: <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
References: <20180529105847.15663-1-wsa+renesas@sang-engineering.com>
 <20180529105847.15663-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180529105847.15663-2-wsa+renesas@sang-engineering.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Tuesday, May 29, 2018 7:59 PM
> Subject: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3

If possible, I'd like to replace "bug" with "specification" or other words =
:)

<snip>
> @@ -743,6 +753,16 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *=
adap,
>=20
>  	pm_runtime_get_sync(dev);
>=20
> +	/* Gen3 has a HW bug which needs a reset before allowing RX DMA once */
> +	if (priv->devtype =3D=3D I2C_RCAR_GEN3) {
> +		priv->flags |=3D ID_P_NO_RXDMA;
> +		if (!IS_ERR(priv->rstc)) {
> +			ret =3D reset_control_reset(priv->rstc);

According to the datasheet Rev.1.00 page 57-69, we should do:
	reset_control_assert();
	udelay(1);
	reset_control_deassert();
	while (reset_control_status())
		;
instead of reset_control_reset(), I think.

Best regards,
Yoshihiro Shimoda
