Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC1B3B9952;
	Wed, 26 Aug 2026 10:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739819; cv=fail; b=hPOzX9SbnCaXDRPHP8QOSGwWUZWjV4XfGmKiKrcgeu1e8Z3Fnd0jkpNXI5pCFivuDrTAmkApPV11q5WyB7weM0TlIBwbP/XW36Ci5tdQkDH6uHagAcY8zC3go2U8qpLLZrIe5HIZ3ncW0q3nkNDW2ezKCVVuQp+IyhizmWavLIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739819; c=relaxed/simple;
	bh=SOp4bCJpF8TCN9s08SJ3rkWqSeQ2rUW63Ig6t/nIQ3I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u9thibU2TdK1sTshWFVumcB+94/hm73jm9XwTyr+Wk3tiXX4GoYCG92asHcBYsTi2JycMTUuGn/C+PloCyZ9pmNt17K2PvWHlNx/3ydA2+tze31m4Yns8PJv0pKUhp4sPERuM/MSSY6xLEP4N88EApGDvMb0oL7rf65fzHIuJLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VuUVSJWt; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VuUVSJWt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJqCR1tfC1VHUTid7rRlWxnBP3UIZwUv0wG0/9jPAnD9hIJRb7ZkERE8QI0p2mvm2f04MwzpQQATVLvb+Co4hDoeCcKcgmaP7AzuL+HMrnQOWsoj+XB6DSdYRD8vyZYbTnAzGmTMDejhX4DLqQu88IESTmZC3pEsXgYMksJkkTm6mjvQp1PBdMwJlsNWUD4IX1GivuVYp+TG49GQcu6oKjED7rUPxg3Fctpyp7SwfGET1Z03kvbTquSfUD5ydsZrHKs+TA0CDYt9Gt12191FhQey3w/bdQpGOILBPvSsPlbDviclm4ThIPKhqmoJQRqqFFwRR2mIRPJl27mJM79PUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIDAjyiBwO8MbGejh5TNpNqimrVzPxUVU5rQ/qSNiCA=;
 b=EEQ5b+PqIMoFmCiwd/7emWI+Revihg811jAlNPykGl2JR+zgw8sYSwl6F1HAaPwIo6v2L8N/q6tMPBDFnNGPt7rkWmvYJLGqXZwqXtqPCQ3+VjnAX+JVsErDC24CbgU2RmI/j6EIBgBUwPwK8uY4RKwQoPG5VUwqzka5ce2TLZ2tpIWwStr+ofL2yzhuBtfeXFyAQ/q7Y5KI27WmRX++TYo8fb+wnP7BgrCOzsidIqtwv0XgVJhFCrrdoa6Wk/ASAD1WLQdY9fNA/3wpFPqXtVvYY6vnXVpjx3REn0lERistlvuXIQgG5lFOkjwNalf0F/NdjWr6RL7p3IyyKWoi8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIDAjyiBwO8MbGejh5TNpNqimrVzPxUVU5rQ/qSNiCA=;
 b=VuUVSJWtLwqVuwsVlDAyCvbkwkyuEOPPgEHukbR3qguQRiMut/7eLgeZ8/r+GEwynxXkJePT5XIS9VVjK7SEd9PJfVX66t7f5rgwE+3jO1v5QzUzQOiR24NqrbRzZsTKETR8wEFyLza5jFSV82aqJhYz/hABX4H3OwAbedr7pJA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB15629.jpnprd01.prod.outlook.com (2603:1096:604:3b6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 10:23:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 10:23:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "biju.das.au" <biju.das.au@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark
 Brown <broonie@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>
Subject: RE: [PATCH v8 4/5] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Thread-Topic: [PATCH v8 4/5] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Thread-Index: AQHdMIn3wMRtnFiyUUKiiCTuE9H5a7awKDqw
Date: Wed, 26 Aug 2026 10:23:19 +0000
Message-ID:
 <TY3PR01MB113467462106CCF64C395F3FE86AE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260820095448.20930-1-biju.das.jz@bp.renesas.com>
 <20260820095448.20930-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260820095448.20930-5-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB15629:EE_
x-ms-office365-filtering-correlation-id: d673a7b9-4822-4847-e80b-08df035c0c88
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 WKnePrk7uOtztkji9OA8W0sW1fl+rHAGD+0FT/74G6xn7exXi83XRoc52y5C1dTKaWIHyolzQl1gzVOeBr9Ot4X/3LMvuZybA7SvmSXQXr9SgObVOhnVibhYhk8Jpb+6JxM1md3ZmQzANctSwgmVG4cUC5i0p183uH/05qwGbzceyVLduohp7CYZHi8qXPv0OX88q/nTHiT3QJbuMNPEGn1xIqHu0j26aAO/WQL5nBie1KqCCIQiGPve5oQvGki8Y1ZBXURMCpFMJh41XojyGNP0+z7mA/LCCAtjkU+q8iMBvX1a4c6cxuF/FWOGUbL/s471mOnPuaRaWDaCmMQmozpJOvjC40Le7mCK7wxssp+CEd3BsT1+nweXmGXXI28k7gUJyw+FL84oqBS+0ATlibk60GNG2lvivoP0s7AaIJHDGXieXYj97zzxNJOZBETxgF1DENj0NKZ4gyNJApyiyVK1ZH1hiCVzhbi2/56smXO/QH6wd4GaNOI67m/Fx4x/V+49IKOlmTJNucuFX1eT7n5Md1n0SxwnYhVkSfafIpmkJW0mI9glRHRwVsBmjFbi1Rs9EV/Z0Ht8Ilh9vpH/r5sGgbaM6cj0Zc4LqsBbF1Kj0KORbMaKBTdE6kGNrcUy4tUeyjPI6uYPoXHPU2zY5rx3PGSSzQZvbZe+2kMPO8iExri8Nl81AmB0kXuZvFxZHdyls378EY8zdPbS5bJh/YlhZ1orZUQDfQmoTu4gTF8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?snhAhgtqfqd1DSdeBAhaM1ipMH8DCxjU63x7a2uXOS0Pi+Wd7JmRFTpVDGBa?=
 =?us-ascii?Q?EggJbgA0qUN7xNklTQrvXkL2tn3HsC5VSBbu4szDTvfX+4P+M1qhLq2arFQs?=
 =?us-ascii?Q?NTOgKlkHxVu+vyS2AcY+DhIMy6wT0y1Th/fvmPMmOBsL/Xp+2571jqIzIE67?=
 =?us-ascii?Q?3mTXaltQUjubnMsVo6b6DSwgHG9cjAOKrSuJH5Azl9py709p4SJvdFxMwoTI?=
 =?us-ascii?Q?tvRH31jQD21//O4YBmWyG9KuAhv4G12nIeBk/sKIFq++Lz7pGrB5U9tpJKdI?=
 =?us-ascii?Q?F6UYEu+qpVIGuSGIJHFXqnKc85THTOq1+EVZddo+Nc41ZqZPFuoEupjePO3O?=
 =?us-ascii?Q?LswF6k+MeVg8GKtbspUYdzf4ismV8+KUbygYCU5T+uEa5b9MekVJjfZSNedr?=
 =?us-ascii?Q?+0NFt+ErFk7noFimkXt0++RTzmH2jzEejhSrV/2nXvhBXdwxmfqeR9UsjEeA?=
 =?us-ascii?Q?o3+dEfHTMZ8SZHBUjwdHQPcA7JiAjaajPvhql4xDD5fb2Y7RD45rsa6SLpjl?=
 =?us-ascii?Q?wKm+sXFkq3YtqusHT55yLjPO/R6DmWgxybPJpJVHI5W1HCEXS4zoI2WzEHaj?=
 =?us-ascii?Q?J611ZZHBsxtPBhW8ZxO+Mc1vgNEKJzC8qliTBdRDybK6FJ0UeWs471Ms66ZQ?=
 =?us-ascii?Q?xOKJf6MxAY7WaiRq1JJqlZtCwYOIwGGFktW/HIRsSOMKKWPVDvWQjoNBe6AG?=
 =?us-ascii?Q?vwKwx0y3YZ22rQ7wmtNE/DY8ib8bG6TF7jPz2AMSAP7Z7M48ZF72/LbXgdDo?=
 =?us-ascii?Q?T750olPXFx5nhBPj1lDZT04/7gKhSA5g/K9VI1FNHxNbffEhAz4f68kbsHv1?=
 =?us-ascii?Q?8xgqzY386ylm37/d52KLKI2uegqncFN06jxGp2KeUtB1plCcb2eiKKlER37K?=
 =?us-ascii?Q?X/YwAU7Q7mgdFhqGBc3kBdkgyk0BMUG5VZbgZM6fv9Lgt+BpmXxq8XpvvfPz?=
 =?us-ascii?Q?uYaidVpsjwuQluAr3gbz4M1KFmG26lAoNmJIzKoqumGzug0NGy42VzxMwmla?=
 =?us-ascii?Q?XSVRXQl5+FlJ9BPk05vGluDzK+IKilNHW/NcchxYEsKMjta/G4S2+NS82iW4?=
 =?us-ascii?Q?mozuuWnC12+Gj9EBfi9OrNNy3STaw6hbKMc6F3hQ1qq4N6oSsSimr9QZZ4sz?=
 =?us-ascii?Q?22u5gQh9DaH8uEAPRZB4BFlMeoHLtmdHNNimYm3lz/6KnXpUIHbOyA8G3lN6?=
 =?us-ascii?Q?SOc3hUz9Yl1Mgb31FdzqSIRAk38Ms1gL3GZdK4TYQX3kcpztcp31qiB4YBfW?=
 =?us-ascii?Q?DV53UPQqCoOXLsTJ13JFncf68JZtGx0d1EvUDMI4KE9YnIBfhpjglteMblp4?=
 =?us-ascii?Q?KHixgEBdEZwhR6LiYEnq5h+aRBTmiTxaF4ClVT+phvvhbVQJNnjvWzaxu2G1?=
 =?us-ascii?Q?XJNYBZWI2cghL3dnroP1rFONe8iThNXFY228/KLjjPukad7nGwclxM2DjHVy?=
 =?us-ascii?Q?a/QHjaTLUaidMMUb9YWWQEcTHIxmGeFLyJNZ88hnf0RCsZbz6W5dFL3fuAzQ?=
 =?us-ascii?Q?vmcK3LodvJdR4L28a1QSIbsEHzsB96IzW38TDb2GOjsr0a1+q8yPpr1hvnOq?=
 =?us-ascii?Q?RM9mKhxFrkguZprAmXNJMIqZfa2dTj4fy+R67cWe+B14QLa1fVmZRLZXXG1n?=
 =?us-ascii?Q?iB/OXh8x/WLbGoGfVq5BlWRhBJrAmkhxsDidPehSsbZb++xES80uqBqdOXoJ?=
 =?us-ascii?Q?dDZUvwSXSBW3zTQ2oXcgGFqmYfFu/P6YFabLD/9wXIbG3E97Fu1LK75feuV4?=
 =?us-ascii?Q?FtJXlaV2ng=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d673a7b9-4822-4847-e80b-08df035c0c88
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 10:23:19.1771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y7AJlWQyp8+7aXKfu0WEZ7p3TK97fcbTbxnpq+MqeLKI/l+CBvSKB+WFcLrWtDySzAQdbsmniddLV0gsgTnrVV5nPCIWPBV7mXBlKNG+8x0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15629

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 20 August 2026 10:55
> Subject: [PATCH v8 4/5] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
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
> v7->v8:
>  * Avoided code duplication by moving devm_add_action_or_reset() to
>    rzg2l_usbphy_ctrl_pwrrdy_init().
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
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 75 ++++++++++++++++++++++---
>  1 file changed, 67 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/rese=
t-rzg2l-usbphy-ctrl.c
> index 79503f6f4b23..da98776da648 100644
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
>  MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table); @@ -150,16 +162,=
20 @@ static int
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
>  	u32 args[2];
> -	int ret;
>=20
>  	regmap =3D syscon_regmap_lookup_by_phandle_args(dev->of_node,
>  						      "renesas,sysc-pwrrdy",
> @@ -179,11 +195,40 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct dev=
ice *dev,
>  	if (IS_ERR(priv->pwrrdy))
>  		return PTR_ERR(priv->pwrrdy);
>=20
> -	ret =3D rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
> +	return rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true); }
> +
> +static int rzg2l_usbphy_ctrl_pwrrdy_powerseq_init(struct device *dev,
> +						  struct rzg2l_usbphy_ctrl_priv *priv) {
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
> +	return pwrseq_power_on(priv->pwrseq);
> +}
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
>  	if (ret)
>  		return ret;
>=20
> -	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv=
->pwrrdy);
> +	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off,
> +priv);
>  }
>=20
>  static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev) @@ -245=
,7 +290,7 @@ static int
> rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
>  	if (error)
>  		goto err_pm_runtime_put;
>=20
> -	vdev =3D platform_device_alloc("rzg2l-vbus-regulator", pdev->id);
> +	vdev =3D platform_device_alloc(info->regulator_name, pdev->id);
>  	if (!vdev) {
>  		error =3D -ENOMEM;
>  		goto err_pm_runtime_put;
> @@ -300,6 +345,12 @@ static int rzg2l_usbphy_ctrl_suspend(struct device *=
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
> @@ -314,6 +365,12 @@ static int rzg2l_usbphy_ctrl_resume(struct device *d=
ev)
>  	struct rzg2l_usbphy_ctrl_priv *priv =3D dev_get_drvdata(dev);
>  	int ret;
>=20
> +	if (priv->pwrseq) {
> +		ret =3D pwrseq_power_on(priv->pwrseq);

There is an API change, I will send V9 fixing this.

https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=
=3Dd51fc9d4cd6eb18ac82913d83ecf7bd8c85f71ee

Cheers,
Biju

> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret =3D rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
>  	if (ret)
>  		return ret;
> @@ -334,6 +391,8 @@ static int rzg2l_usbphy_ctrl_resume(struct device *de=
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

