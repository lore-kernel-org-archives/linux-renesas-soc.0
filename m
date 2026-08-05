Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF423E5EFE;
	Wed,  5 Aug 2026 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925602; cv=fail; b=LMlsEej+THq/ane1SecoOl8suMuLUtTciWDevzX04WcyTzuLbdvl3bZco7KkTOHG2Q/2RyoGXFCEAoCqscu1JsUEwztz4wCdBwTMS1Q3lpXaRpLuOXHn/EbuErE5aU4W67iaEn9BTub7MYxSrr093sSNam91aphJayNl2pW0pvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925602; c=relaxed/simple;
	bh=qaFfo8+PrO7r173kWp5I9BF9ARoYlD+59PBjHQWG6LU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rKyUROEZxjyd7sIc2RnXpHwBI4kG4DKjXjQUArvXVuFddbskfUxgi00lC30U0YwTwja55207jWKJOQNfgnfIPtzebPfC02LcdhPqQUxd+M/qXcBCFZqv5KOO3gmc64lV1FH76B0hRGNNGDBlZH/I+iQ0liVV9en9pTpXxeRZmRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=o4AXs/8x; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="o4AXs/8x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7zO6eiVUzkyiEXrDAHtK8PqNdf/gq3gVylX7mCNQgT5a8FW8xFbUKxYkf9149EPv6rdw7ZuXMLMdyW0WQzgynpsZcRFbUwggKosbhWz5+ngYB4bDHUOk728/G9S5vRjnafkxgGDtQV5BHsC614V79UTmbx1XGaoa3Tv22veddzUN0xoa1f19pba3a2bdWuVuAkMcgk3kzGcQCCxSqX8INqG3FQl1RBdgSBdkmG2Duw9AFd77zNaP8HkcCKJuBO6RClPS3Zdc1Lrmvto8I5CEGjyYuJ/LVa16xsakkF5WShg6nxEoOhaS2g2gnQDXMv1gErtYXPpWIsjxopK15GIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqxaVCmbl8uzNl67/GBk4WC9V6RX5LkwkZD8vmWB2s8=;
 b=LqRDf4042ontW3ZjUKZpDfRjAh6wm0EivRYgnNHOswhmLVzUM5OvHrFDZvF60tLn+3qthHi0sgyKkLMkv7WCj+WyAMQzNjP7BxGlM9VOsn9sfuY70Tj/6/mZrQVIOVAA0ytlo+5jqhLcmS7b9DJvJCnapBjkdZzJy/Kj/PZ6ndoQBLCc/dHfIU3PdqBgzDXK/G6up/d42d4mNZfI8o1R6tBTP1EiFt2m76naZDuSpy9VwbqJGytBQXWlA+mLCgr2NpE31ClHfnBVtuT8Lt52Wc3YWXPCh0p0NobnX3YwPvgHv965I+pSYZ24/KWQgloYvN5tiVP0vOn/+FPj3fghJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqxaVCmbl8uzNl67/GBk4WC9V6RX5LkwkZD8vmWB2s8=;
 b=o4AXs/8xVDDRVEAtwDjy8Tn8o02IvbCInTYgNCaardZqrLZ+IWV0S4VuPEkfO8ly+D2LzC0yt+GdNz6/4mcVqTsTuOldHzKU6eqJfQevZaLqo/12cmB2euZMih/lAB0DiRQMvajYHmxwAt7gwVBKPqrRu2U5ELEH2VTnIC9zDcc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB14049.jpnprd01.prod.outlook.com (2603:1096:405:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 10:26:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 10:26:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "biju.das.au" <biju.das.au@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark
 Brown <broonie@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>
Subject: RE: [PATCH v4 3/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Thread-Topic: [PATCH v4 3/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Thread-Index: AQHdD31S9FH1h8kHdk+L8ggzHtk4aLaPYc9g
Date: Wed, 5 Aug 2026 10:26:24 +0000
Message-ID:
 <TY3PR01MB11346A7ED25E81534A144B22F86D32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
 <20260709083108.108370-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260709083108.108370-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB14049:EE_
x-ms-office365-filtering-correlation-id: 6a4822a7-0dd2-493b-566c-08def2dc0056
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 C5LSlCVDh1ZQgOVglWU4+eLDaN98dllhwqE9GpcvK8k094zw66IPEa6ZYv6VkZqyYINJ+jnjrMiKcLns06jKVD6mNZQjm7LGLs9ZBaZ4uhZYL+JBI6SwSr+2cxyCit0rAoycujCEV1FNao3faD2Wunjvv0D06vWFfOI9/B8693vTbpGy0tfyXOMVDTwCzvG+pV8F7/L2bHiTZLmn8/YHxjFKRNAV0QdMKe9yUbEWC1PV3/i/ReCz9A+tdGuCvvVQbnm/aCdjP+grjzHahSP8clMAHqJ3Cq0HW+hoR0T58KnU2uKP/eHaIm4O9ZYZpjWb1FNWjA55EiBLk2m3ixkXCTROzogMChDr6Cpm/1AwWInssJJB6PJdBPlsOLUZn1ZOQEdBmGt50W6sLaEMluq6UA1mMy6yKQeyiPdKa2c+pzcRMAQJ/jYGNn+ApqNcSKamtSVVhzWkfc9CI4/Bv3eEdqcF4X5rhKZ9Tw1HU+n1tzVWt3YIyBOOgNSEyEC74DoZeHqpaRcBw17SN976IhnC4QYiU2lKxJsZV3eNEGHItxP+Bk7MC6NgO054SDsRXDaJ2iLmgPlF7+CT0moOc/6pnihnT9MniFvBX5FtTFLR87rDjKUukN4i72YD6AI/YBPkYYIyNcXLiNKIFgUOh/r4ouP0sGKvj00axt4wTVS3Qtw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?duW5AKH5mC8K2pD8yi7eo9zKo4SXqwHEfVd/gJuUClT1xVbnBIcl1RQlY8XA?=
 =?us-ascii?Q?uwyT4CeABOcWFYH9D8T0qaTBJ5iWSV5kaWkuc51FHS2ukKub9mRBzCKWL5BW?=
 =?us-ascii?Q?sEC9efUfNwgp8RUT6/HNdDC+jaGMaKhjiyL6wDoHXn+NtF7ak0jITlO5a584?=
 =?us-ascii?Q?qccvdBdf6jQb/sucQyyricb3kUv6NYHxEveg7b2ihHF2Koj8FZUSvqDJFIie?=
 =?us-ascii?Q?+xKHlFO5h6PaoxtqO6FADIdPUrPDxYrTt9mahW469TQZ2c/kaNeSW1U75DwQ?=
 =?us-ascii?Q?WoPKdjvrO0kKNPfJyQ636qdSemXAq/qEJ7hYKSqdlY/2/XmsjxB3GKVG3Mos?=
 =?us-ascii?Q?3IH0oRq4EOAqMK3G5xO54SuDUZT1C/C8A0KQgZjFReahMlIXIWDztax3fOMX?=
 =?us-ascii?Q?M40kt8MI13Y444wDvFXhWRj6Q0NOpl/DKJo19+8xZIZOMuF78pcTPmJsx8PZ?=
 =?us-ascii?Q?P7lhw7ar+8I3oYb1L3O7WWEWJD+MPYOzVyWLWhaFcRqd6mlAM+C8R/YE3XBQ?=
 =?us-ascii?Q?TRsje+M9GIRbCJuCg/WVYHBTRSa2VOJoEh+TDiqBhAZtnYIAZhr8eTW4upt+?=
 =?us-ascii?Q?gFY/gRdPaiQL0ng9dOJ5LzmxHgU7KvNjqjjFPFRFTh7MD94RjqnA5DF3clKg?=
 =?us-ascii?Q?7OkTznJ+Q5o9Th+d6tnU6uzRfcjptAbPR20kniTWm7A3C52z23BFuLAkGGV+?=
 =?us-ascii?Q?9xlopddd5jk4ZQ8AtshKTpN5ZglgAtdrizjnLvhvdjCSykPlJMTU/oIeN6qJ?=
 =?us-ascii?Q?KBM1KNlXMO/XRmqnodDgDrGY4r8vYCnpVfpNVywDs0az+R1VVbnkVxNuomAm?=
 =?us-ascii?Q?4hDiVgKRHIGZMP+0hK3MhX1gImZNWyRVBUX+4Yv0MNTQUVOym9h2oxWje/Q9?=
 =?us-ascii?Q?tNN87O7NeyMnVaK7oJEaKVCOIyDh6O/JUo4lAtgwz9/bbnmySuh7CspsmcVK?=
 =?us-ascii?Q?04TYvPOKGYBfSdxb5CL8b2lR37rRgpDDmB/PFJlrV6yo9Kqlfe5gZup0l7sw?=
 =?us-ascii?Q?WqyoVwyQcOLymfW6Q2auk2P9zLtqQfDoFvtyjBQ3J/l5uc7vZvZ+dZbg3XmP?=
 =?us-ascii?Q?Tf5BcMiFuA4Y1v8CULYJGYDZ2LyvfvoDXKzl/J8Y5NWOTLZJTgzznagBX/mS?=
 =?us-ascii?Q?1WOgJyT9gumdRsMrOLfbTcQWOzbDlwm3w2IouPWL73un8Qrv9N5x/4smW67X?=
 =?us-ascii?Q?4plY/JkqBZmELZRU/pstldyYLlkWbM2vd4JkOIMB3RmXZruJeyQ0uqIoKcTd?=
 =?us-ascii?Q?CaxL8fygTYaNVpk0VtuvQqJFWhkLVmRykSSTBakuRk5Zg5mkV5Dtxpf7R7Ia?=
 =?us-ascii?Q?LmdpirDc6jnPrdV7CrtzxE/1aJHN5fC9jO+ccUtlx8UMxB4NQd/GRzaQU/ma?=
 =?us-ascii?Q?b+5L5NtPs+d1hKPuq+gR4W6g/CN3oqdPKttbz+IyWdG9nF73wdB2cTKLs5Jv?=
 =?us-ascii?Q?t4GWr7CkHd2L/PHdCaIjf570pVJDClYt3p8uI+It9+lXDKOYKIMiTrc5EOmW?=
 =?us-ascii?Q?CEiFg8WYyYmWgqb5SBuNp2vj556DvFZV1pdKME+f66P3drbcD6RrD9UenkwR?=
 =?us-ascii?Q?pEJHJZInYFpl17oDImlJv4S0k3c383McVvlD4hydosUsdEy/Qb7iPG9A9fAc?=
 =?us-ascii?Q?QzbtufBLrWPIDC9FQdu8PdqKMoUQA7JZSxYbGF6Rl0wG9ZoOsHZrJkhe3VPx?=
 =?us-ascii?Q?0kVQMl9u5hzlu+txXVlDWE5OEnjURrvel3Ed6QbDmGaj4PCb3Jg01KxM7QqW?=
 =?us-ascii?Q?jdXTzr3WiA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4822a7-0dd2-493b-566c-08def2dc0056
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 10:26:24.4548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FWeMSiyAoTkP3OeyRuLFY+ieP8GwHFjCJg6cgPpk4ZmI6fo8iAfC3MeUsTfiVHhMGxHgTZJu0TEvOLvTuZiIzSD43pTGljiTv6rq7H84m6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14049

Hi Philipp Zabel,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 09 July 2026 09:31
> Subject: [PATCH v4 3/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
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
regulator_driver_name field is
> used as the platform device name passed to platform_device_alloc(), and m=
ust exactly match the name the
> corresponding regulator driver registers via its id_table for platform bu=
s matching to succeed.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Updated the commit description.
>  * Migrated to id_table match using driver_name and reduced the length
>    < 24.
> v2->v3:
>  * No change.
> v1->v2:
>  * No change.
> ---
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/rese=
t-rzg2l-usbphy-ctrl.c
> index 84e745e49240..0803195080bd 100644
> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> @@ -42,6 +42,7 @@ struct rzg2l_usbphy_ctrl_priv {  };
>=20
>  struct rzg2l_usbphy_ctrl_info {
> +	const char *regulator_driver_name;
>  	bool pwrrdy;
>  };
>=20
> @@ -110,15 +111,24 @@ static void rzg2l_usbphy_ctrl_init(struct rzg2l_usb=
phy_ctrl_priv *priv)
>  	spin_unlock_irqrestore(&priv->lock, flags);  }
>=20
> -static const struct rzg2l_usbphy_ctrl_info rzg2l_info =3D {};
> +static const struct rzg2l_usbphy_ctrl_info rzg2l_info =3D {
> +	.regulator_driver_name =3D "rzg2l-vbus-regulator", };
>=20
>  static const struct rzg2l_usbphy_ctrl_info rzg3s_info =3D {
> +	.regulator_driver_name =3D "rzg2l-vbus-regulator",
> +	.pwrrdy =3D true,
> +};
> +
> +static const struct rzg2l_usbphy_ctrl_info rzg3l_info =3D {
> +	.regulator_driver_name =3D "rzg3l-vbus-regulator",
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
>  MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table); @@ -245,7 +255,7=
 @@ static int
> rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
>  	if (error)
>  		goto err_pm_runtime_put;
>=20
> -	vdev =3D platform_device_alloc("rzg2l-usb-vbus-regulator", pdev->id);
> +	vdev =3D platform_device_alloc(info->regulator_driver_name, pdev->id);

Please let me know, should I send a patch to increase the length from 24->3=
2 [1]
So that there won't be any backward compatibility issues.

[1] https://elixir.bootlin.com/linux/v7.1.2/source/include/linux/mod_device=
table.h#L604

[2] https://elixir.bootlin.com/linux/v7.1.2/source/drivers/base/platform.c#=
L1138

Cheers,
Biju
>  	if (!vdev) {
>  		error =3D -ENOMEM;
>  		goto err_pm_runtime_put;
> --
> 2.43.0

