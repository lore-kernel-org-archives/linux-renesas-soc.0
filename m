Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E53D9DAD;
	Thu, 20 Aug 2026 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214910; cv=fail; b=lCW01pwTgM77vl4YP+rvfXd4PC73KL48WRhJCWe98DlEIqTO5Xk6KhX0FfPaaiHjHHgD9U3yUd4Fn1Gc+Yex50/RjMwGerfHXH8uQ9ZZqZpSXuMiRTYo7nZrLGQWECH3g6TnPxhSD/y8W0lQdHZXbZCgdqgNkzYra0tUyeB1pD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214910; c=relaxed/simple;
	bh=M0Uy8HeoOQsAzBgep4zQwJvhgFeNqfEkYxPK/CJ3LdI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cRH+hoU6f4UcWy6nJgfLoWUIueitcDqppAIfc9aJPKAiixoSThbnhp4kOlySivw1AEjUKnwsBQsA827xMuhnjWy/OCbHrlq76WI3FCcIQWnbr6j79KfnENg8tPhr4rmm7tVdFwJG9HxqCABIkNHOViFzbOTCTvr76pETzcv/dkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=iYvfJzCY; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="iYvfJzCY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxYYrtkUJFvwWYi5+xL1qMAkLAE26L1/BT2hm2AqcMcw7vfAenunHEZLgmRBE0oPK9hwSABS82wG45KfCfmNPYFo9D1dh7VRz7PCtzJO0YBn74U4wZS47Z8EQWPDK7+uwrus3VgBJuvwEG5rBpSshVTuINXnYIcZ5sJQzVsj6IHEHJkiuTdWFfqqpKKvuJNopXNsucHdVF4ly/ake6QeK9tmuhE1Uus2zfvrNKjh0rk5XPjqmHXcjx0PBHjDAFEDRu9vUy6QTqM1+MTCi6qqBmHHXbRdGXlPO1YazRaDfSwwfXp8MX3Z14SzgFa8iOlFOmaaWvm3JWSR5rvUu0UPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhd2J3yxqzZPdPcBOOUGRmcEMkVJW3kcuyZVzDAE3MA=;
 b=v4raQsatqB9JjLcGurA3ssu4+HZ8A3fgMrfI9MDAZU+kA3SEiV6sqjlvHcvMJ9030ZRacDbVpGZK2tqSrqq3Vx4ThFNO9n6kElq2n/B+i9+ndShm5uw7gnCpq5tj0RhzjeP66RvUo0usTUMqUvdgQXR6hbWrlRQMJ7cKXgCigFOmNEDqIYtMGWMHQ/QEP+UiAinGQ4OpG9Kyg58OgGZTnGg/vD++BndxyKHA0uAJwymk/zaYzzcUjNXILyTVF/XB+6b+ZAAYCU/a5Rh2FZ7oXQjt5UDtSe6kmPtmgCFuMc/sM/Ay/uf7LV7BSKeNpdw66dF8wyRkWNYk/xmpI4PgeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhd2J3yxqzZPdPcBOOUGRmcEMkVJW3kcuyZVzDAE3MA=;
 b=iYvfJzCYORKLHBPFH0gKa1AzFGAPdiBdq5fRhXsZZ8k3ari61C05MwVBwZ0+tVIC45DpT+piw/94mLKCCPneryAPiiroDn5aXVJ6T4PJ7AnQGtuJtT7GHSA88HwiSd3CDJ1yF39q1piVDel7NuaB07BafIcEM4J2SJE1i0aj83o=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14997.jpnprd01.prod.outlook.com (2603:1096:604:3a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 08:35:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 08:35:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "biju.das.au" <biju.das.au@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark
 Brown <broonie@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>
Subject: RE: [PATCH v7 4/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Thread-Topic: [PATCH v7 4/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Thread-Index: AQHdKmWmYbFsfA/ePESDpDXUqV9kTrampKdg
Date: Thu, 20 Aug 2026 08:35:04 +0000
Message-ID:
 <TY3PR01MB1134615C4D2DBDFAE6407C6FC86A42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
 <20260812141940.246223-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260812141940.246223-5-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14997:EE_
x-ms-office365-filtering-correlation-id: 19da411a-9af1-4e27-5e18-08defe95ef32
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|56012099006|38070700021|4143699003|10067099003|11063799006;
x-microsoft-antispam-message-info:
 jDf8fBZFkEZBQmuITLuORZUvmfg/jFg0wfqY+WNwUsoCEyV4pRLk7j6sLzBUE6uIvG8OTOsGSJWNxW+0/r2h/08fgwHfYLr6zA1zEkpX1+s/fkhzNiv6Wk62F6G6vDgugSNOkypY64uXXV0/lQ30HPCyvJpPPGr9nHOPeBNyih1VdRbQpa3nxm4xWxQx+cUhKc7BP0vMj5sBQGt1maC3kj733yRGvGr627D788FlFUc6aMCCRhW9FcDnD7lvNF3reoBbum7dcGVwMT/+eiFja1H/BDnkk3Q9vEPJvkG0ZGwyoTIXYbuR0yRpJoBG33VPcLpZLPzwYA5+BWaFZ4VtYzp+c+Jq5qucIU5uNSW9pbndsvhM97RfRe00TpizUaWR4cE4Egf+r9Tl5YE2dFXWs/h06HEzPjqiwUu3ra6oehzgkoccgzpU8b/P0E6J64/LXHr8RtWgu6mvta1S9FT2z6VZ0Ytgc19iWAbsdJKJQ5Qyq9ZxjfjkPJ6BMEZuwQtfJlQ5sOUbfu9W9M1key8avJvCmeinzEVOXpeOUVEFZqXUW/SJFKnGurpvO3gRo16yeLLvFsbZXf+YolEUWZxlKq4gRTH0k1Or0fajwIoxmAiLHdBs8+7raLyfgyOGoFtRfZwqVYNmnQWFJAnwSFae39+M880EFFEpyoHSbevgeemqkWNef2M9tVRlB3tAQW/+38PLTHPvEnB8hODEEGPuEkiLzXgPeaiUSTKorgOkuXQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(38070700021)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IrSQ6QCoo2+uaVnilefFnKIN4AUex4+a8mGHCtQz8Gv1Qgo4QUu3rpsNrNNf?=
 =?us-ascii?Q?JZWZfgIW26xccvjpTo+DCDjFszS8k33pWYtQCHo4yb1gl50+5CuRc0nKrUxK?=
 =?us-ascii?Q?eA+uAURJRqetqkW/HqSzBLB0lRZHDp1zZT2+BKz18OZMMC9HubaeaAQ4mMHv?=
 =?us-ascii?Q?l4eba03CxJJTCMOowBX9DjWORPqPhSFmwTH0+kCoelTi7c+SV5L7eX1CQwaA?=
 =?us-ascii?Q?Wx6APrhS/MDkmMKcN+cCq/CcXJKUvZPTn/Y2q0Ic7rAOn9M7p+6l9u8DTDwr?=
 =?us-ascii?Q?Gol0HqBcWwOIwlOd1krs73/1u7iFOmNOfacyTfy9dP3chDq/nTnC7COA/Ig2?=
 =?us-ascii?Q?mK2jsiUFMStBzfRqEgNQRaF4+2pvD4IslctI968CCaWBR2UFHe6tFTKQQJD7?=
 =?us-ascii?Q?j4QF0CCK98w7W+s7jhz3rqTeG7jdhOwUFLsCtKl9kYu36m/XHg17HQIsqvwY?=
 =?us-ascii?Q?OJZizyQhCzie35CB7iKEaL9b5aDXnovrMAu1gvAmRYFArGM6uoDPEEaXGIPf?=
 =?us-ascii?Q?49Jf6hE3XOUV4RgQzuc5haHXtlp15XTGldxARIGrNegEpobcJnIGxIvjfVUw?=
 =?us-ascii?Q?RsLfg6kDD1XnI10PODvy9bU/ribpD57kwJOlWDLMuWb8S19/niYrHWlZSZmI?=
 =?us-ascii?Q?TD+GaYw/vHh4A3lU0MkroF4PT2cv76QmrRI1y4EVf2c2GdLV/ms287rqvokc?=
 =?us-ascii?Q?XdmBc9YcWukar54IPBCiOstkX0aZWGIK8YhvjaY72keK2hfphnA+OZWz3eC6?=
 =?us-ascii?Q?XOh4CNjIaMER7neRmsYLIG4bujI6XnoFyMPZtc0UoJmGDBWab9nKuhfnFBHu?=
 =?us-ascii?Q?NYe6Vqzi86xIL0iRDpct6uIcJSn/gUyAkpbe2SlPdIJ/EQwdq3vbhJ2fEX2N?=
 =?us-ascii?Q?Yk2e4O4kbX39M/zpVrUO68NuNBnMvi01HfYiIaI6GLLFF2jm+9Tc269TUeAB?=
 =?us-ascii?Q?DNzbYqzxSVJgUxqsEOPSEYXqQ10uroveHS94mCX077VTT0Nge4cRE8TOWLn7?=
 =?us-ascii?Q?jl10oexFuaHA7aYjnILDYgmPGxbTXUQMxy+/MKVPWCD/O371+lNxRcDXnSv2?=
 =?us-ascii?Q?O7QMzeM0LJSMD9VZE6wUCqu9QY2zRB1i11J6hs5sKvWyaqzPycpYvLa2SRIt?=
 =?us-ascii?Q?66YsTYGj+LKsofsOviCfIg/fFlyDFCYOagi8rswIRMx2JtYR7Sm8hsqI8yys?=
 =?us-ascii?Q?XWSbCNXY37Hcu6KoYqsZ6lESM6EkF92NqvGWQDiuGHsEw7OYuDQTWzG9cdRw?=
 =?us-ascii?Q?6txHaFrj+kKyQsG0q7gjO3HJAeTL3OC9OvLWADsLre0pc++/fRQO+UzoT2eB?=
 =?us-ascii?Q?1106wQD6XQUqoY2wxN22F/AvUoTEfIKkpHOEdZhNoHEmQxUHFP3lC8SMLgN+?=
 =?us-ascii?Q?pcDkBKjwUTp9tSmI8+mhjipi7cH+IN7DU0hO4vYNvduLc1d8nWskPYi1ayLk?=
 =?us-ascii?Q?xExW3tvU6bWnXBjXOw/9gQz4vReckmXD3eSFL8vw0ukTob1PWjGdReNWzpMa?=
 =?us-ascii?Q?UzgVY85X1fmH2sPhUaH2x3e8/ciMy1aFaYV0x1zrGHwxaS/tVzjLC05Rcfil?=
 =?us-ascii?Q?d8KMMsm8yM6YuucENoTm91E9ypEQxWNn1F7/IRs0rrVQHKn/cSJVGI7T2qeB?=
 =?us-ascii?Q?a8i3eJZ6AlF8TInibIcEGSR5MdWouRKb2MikPCoYKSgalYHFOOQR5QKPdv+1?=
 =?us-ascii?Q?2TT8vViZLjCy38kBZ7zXM42+nCrvU8Y586kNFhJcJJaYnULfBQ2vK+6P/Lo9?=
 =?us-ascii?Q?CxsOwjqF6Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19da411a-9af1-4e27-5e18-08defe95ef32
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 08:35:04.9442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sxgBumrv/p/rvJ9TMA96b8a9wfmxjNPCasL0asjgsMdftUMhne4AK0BLqCb9xW7d5fG3AFRsgvAP5UNfYhu0rXuOZvYSoqj5IRIOhjAryLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 12 August 2026 15:19
> Subject: [PATCH v7 4/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add the renesas,r9a08g046-usbphy-ctrl compatible string to the OF match t=
able for the RZ/G3L (r9a08g046)
> SoC, using a dedicated rzg3l_info struct with pwrrdy set, similar to RZ/G=
3S.
>=20
> The RZ/G3L SoC has 2 OTG controllers compared to one on RZ/G3S, so it use=
s a separate rzg3l-vbus-
> regulator driver to handle the additional VBUSEN control for port 2. The =
regulator_name field is used as
> the platform device name passed to platform_device_alloc(), and must exac=
tly match the name the
> corresponding regulator driver registers via its id_table for platform bu=
s matching to succeed.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v6->v7:
>  * No change.
> v5->v6:
>  * No change.
> v4->v5:
>  * Replaced the variable regulator_driver_name->regulator_name in struct
>    rzg2l_usbphy_ctrl_info
>  * Switched to power sequence consumer for controlling pwrrdy signal.
>  * Updated commit description.
> v3->v4:
>  * Updated the commit description.
>  * Migrated to id_table match using driver_name and reduced the length
>    < 24.
> v2->v3:
>  * No change.
> v1->v2:
>  * No change.
> ---
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 79 +++++++++++++++++++++++--
>  1 file changed, 73 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/rese=
t-rzg2l-usbphy-ctrl.c
> index 79503f6f4b23..f332ef9ef3e5 100644
> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> @@ -10,6 +10,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/reset-controller.h>
> @@ -37,11 +38,13 @@ struct rzg2l_usbphy_ctrl_priv {
>  	void __iomem *base;
>  	struct platform_device *vdev;
>  	struct regmap_field *pwrrdy;
> +	struct pwrseq_desc *pwrseq;
>=20
>  	spinlock_t lock;
>  };
>=20
>  struct rzg2l_usbphy_ctrl_info {
> +	const char *regulator_name;
>  	bool pwrrdy;
>  };
>=20
> @@ -110,15 +113,24 @@ static void rzg2l_usbphy_ctrl_init(struct rzg2l_usb=
phy_ctrl_priv *priv)
>  	spin_unlock_irqrestore(&priv->lock, flags);  }
>=20
> -static const struct rzg2l_usbphy_ctrl_info rzg2l_info =3D {};
> +static const struct rzg2l_usbphy_ctrl_info rzg2l_info =3D {
> +	.regulator_name =3D "rzg2l-vbus-regulator", };
>=20
>  static const struct rzg2l_usbphy_ctrl_info rzg3s_info =3D {
> +	.regulator_name =3D "rzg2l-vbus-regulator",
> +	.pwrrdy =3D true,
> +};
> +
> +static const struct rzg2l_usbphy_ctrl_info rzg3l_info =3D {
> +	.regulator_name =3D "rzg3l-vbus-regulator",
>  	.pwrrdy =3D true,
>  };
>=20
>  static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] =3D {
>  	{ .compatible =3D "renesas,rzg2l-usbphy-ctrl", .data =3D &rzg2l_info },
>  	{ .compatible =3D "renesas,r9a08g045-usbphy-ctrl", .data =3D &rzg3s_inf=
o },
> +	{ .compatible =3D "renesas,r9a08g046-usbphy-ctrl", .data =3D &rzg3l_inf=
o
> +},
>  	{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table); @@ -150,11 +162,=
16 @@ static int
> rzg2l_usbphy_ctrl_set_pwrrdy(struct regmap_field *pwrrdy,
>=20
>  static void rzg2l_usbphy_ctrl_pwrrdy_off(void *data)  {
> -	rzg2l_usbphy_ctrl_set_pwrrdy(data, false);
> +	struct rzg2l_usbphy_ctrl_priv *priv =3D data;
> +
> +	if (priv->pwrrdy)
> +		rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, false);
> +	else
> +		pwrseq_power_off(priv->pwrseq);
>  }
>=20
> -static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
> -					 struct rzg2l_usbphy_ctrl_priv *priv)
> +static int rzg2l_usbphy_ctrl_pwrrdy_syscon_init(struct device *dev,
> +						struct rzg2l_usbphy_ctrl_priv *priv)
>  {
>  	struct reg_field field;
>  	struct regmap *regmap;
> @@ -183,7 +200,43 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct devi=
ce *dev,
>  	if (ret)
>  		return ret;
>=20
> -	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv=
->pwrrdy);
> +	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off,
> +priv);
 }

This call is getting duplicated, can be moved to rzg2l_usbphy_ctrl_pwrrdy_i=
nit()
to avoid code duplication.

I will send v8 with this change.

Cheers,
Biju

> +
> +static int rzg2l_usbphy_ctrl_pwrrdy_powerseq_init(struct device *dev,
> +						  struct rzg2l_usbphy_ctrl_priv *priv) {
> +	int ret;
> +
> +	priv->pwrseq =3D devm_pwrseq_get(dev, "usb-pwrrdy");
> +	if (IS_ERR(priv->pwrseq)) {
> +		/*
> +		 * This platform requires a sequencer. If we can't get it, we
> +		 * must return the error (including -EPROBE_DEFER to wait for
> +		 * the provider to appear)
> +		 */
> +		return dev_err_probe(dev, PTR_ERR(priv->pwrseq),
> +				     "Failed to get required power sequencer\n");
> +	}
> +
> +	ret =3D pwrseq_power_on(priv->pwrseq);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off,
> +priv); }
> +
> +static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
> +					 struct rzg2l_usbphy_ctrl_priv *priv) {
> +	int ret;
> +
> +	if (of_property_present(dev->of_node, "renesas,sysc-pwrrdy"))
> +		ret =3D rzg2l_usbphy_ctrl_pwrrdy_syscon_init(dev, priv);
> +	else
> +		ret =3D rzg2l_usbphy_ctrl_pwrrdy_powerseq_init(dev, priv);
> +
> +	return ret;
>  }
>=20
>  static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev) @@ -245=
,7 +298,7 @@ static int
> rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
>  	if (error)
>  		goto err_pm_runtime_put;
>=20
> -	vdev =3D platform_device_alloc("rzg2l-vbus-regulator", pdev->id);
> +	vdev =3D platform_device_alloc(info->regulator_name, pdev->id);
>  	if (!vdev) {
>  		error =3D -ENOMEM;
>  		goto err_pm_runtime_put;
> @@ -300,6 +353,12 @@ static int rzg2l_usbphy_ctrl_suspend(struct device *=
dev)
>  	if (ret)
>  		goto reset_deassert;
>=20
> +	if (priv->pwrseq) {
> +		ret =3D pwrseq_power_off(priv->pwrseq);
> +		if (ret)
> +			goto reset_deassert;
> +	}
> +
>  	return 0;
>=20
>  reset_deassert:
> @@ -314,6 +373,12 @@ static int rzg2l_usbphy_ctrl_resume(struct device *d=
ev)
>  	struct rzg2l_usbphy_ctrl_priv *priv =3D dev_get_drvdata(dev);
>  	int ret;
>=20
> +	if (priv->pwrseq) {
> +		ret =3D pwrseq_power_on(priv->pwrseq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret =3D rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
>  	if (ret)
>  		return ret;
> @@ -334,6 +399,8 @@ static int rzg2l_usbphy_ctrl_resume(struct device *de=
v)
>  	reset_control_assert(priv->rstc);
>  pwrrdy_off:
>  	rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, false);
> +	if (priv->pwrseq)
> +		pwrseq_power_off(priv->pwrseq);
>  	return ret;
>  }
>=20
> --
> 2.43.0

