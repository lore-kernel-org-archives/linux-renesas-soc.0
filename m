Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D370A25B098;
	Tue,  4 Aug 2026 08:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832476; cv=fail; b=Jir0ZYlVsvCeHb7qoou7jS0Ym+2gnbkrA0YRhV472wWcAnJsSQkK2jd1LoOTBPRgIBdIYOz7OVu10y1r51MpkHdlcCTnoKaVBBHWNKfl6K7Rbg3/aPI3hm92kC9FLRBfMl2jbtLZA+InoEfThRpiaEc9HEovTb36KSiHOWWKXAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832476; c=relaxed/simple;
	bh=Je/TL3o1FF91Sp5Hcyu0oOVQdu4szl89hItMw3/PNig=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=az3Xku0GfSkOkZ/gH9hWB7EaoFv6nxVLTjlzQDwxq4bH4y2MDNk2IrdiGFFcJEegH0BqXDYCuLp6uxNrZajZyzjX48Iqk5j4S5ylo8nYGKg0CG26D8JCD5XIukHPVmd/tkqUvFXJ7Ro5fpfQ9IgJ4PBk5wkrEgSfGHdNLlSzsbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=J1otlYk7; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="J1otlYk7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PncKcZ5CM6Z2LDC872Km5RdoKfN+XExOhVA+ADCwWzo6Etr4P7s7E80gw/C5BRJ73AuMXALD45okDH3Ttr/BXDwazDjhk+GfgV4a2dfnLDs3QYcVHoE2jNQAevE2mjOAW+QPlXKTAjKheBHcYhgZihP/9abwiwL3ASY07chv9jrzUmkPOlY3WAiAVoXjYTFENCBYVVcgvadpbGNC9Gz0HP2z5tjQSNSTGVimEtI6LzzrCQPy3GxYrz9sZtYeLZgvqTuViJGqFzcyJII29tDDbQG7F/x6kUwCzBG/yETvnIQtO9ySmyKAx/g9Wyh9K7iQ1vJltl/s6j3MQSdqwkv6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bBKQpdGvZfLSbBL2S/bJ4eo/OI/+/3fJVaA8uNWf6I=;
 b=Tb7+wQLrgg4bk7kWa0sA0uRpfYIJsR9yhtCsJc7XJJ/BxwBxtZwN12K3n9RQaGZ+HVP4pYDOy5H91sLypw0ZBAAk6YMuy7BbsqShhJEfxiUIzLnWmuA7g1fwHxIqYbks+tyNYX4zKC2tXbWkaBu8oL8KsG4NjjC6NDIPrIsiF4rgU9i8jDilEssRfZk9PXCeKUpaYOZ6scRiGE07Hdj3BoQ5EZeaXvsFvlctgTwpMBFH5JljuMVgzaoQ/HjiFSL1ao5qqueT1DQ7XKMUVHKHIjX3u53k+7XHJprbtxTiOBbOy1zqogOwNJPgyXWvuHH+XGqMpB4YpwKQ15kycy0j4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bBKQpdGvZfLSbBL2S/bJ4eo/OI/+/3fJVaA8uNWf6I=;
 b=J1otlYk7KV0om+KQ8/8W3QFlXp8hARGqve0OjfKLHhEQ8LQk/MnEXIDjIzty9FDZrx4/1nsGXACImK46aJCFBMuiXBgJbItisc8Lilgh/e7Ks0066IvYf8yDgqC3PDO1WtYnYLVwGpNLQBS+B9hkjVLDjEC20Q6Ni/jgd7mbKbU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9277.jpnprd01.prod.outlook.com (2603:1096:400:1a1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 08:34:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 08:34:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Pei Xiao <xiaopei01@kylinos.cn>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm"
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] phy: renesas: rcar-gen3-usb2: Fix use-after-free in
 rcar_gen3_phy_usb2_remove due to race condition
Thread-Topic: [PATCH] phy: renesas: rcar-gen3-usb2: Fix use-after-free in
 rcar_gen3_phy_usb2_remove due to race condition
Thread-Index: AQHdI+lxQiWI1zsUOEayjIBpj7lTFraNj3zA
Date: Tue, 4 Aug 2026 08:34:18 +0000
Message-ID:
 <TY3PR01MB1134664317D6A75D8230DB51B86D42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <d265021fb7fe432e32eedbe9e075fb041c15cbe6.1785830417.git.xiaopei01@kylinos.cn>
In-Reply-To:
 <d265021fb7fe432e32eedbe9e075fb041c15cbe6.1785830417.git.xiaopei01@kylinos.cn>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9277:EE_
x-ms-office365-filtering-correlation-id: 4b19665f-a99b-4fb5-328a-08def2032d1c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|11063799006|56012099006|18002099003|22082099003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 3WPiadx2mnzGyvAHaY0V85DDzDml9GTP9F/1j5hlGayZ1Z74yn8d3oaZPM115R9fhfjOY2btOMCoNgxWwo4PFSjVCOmbd4sLYQAX2Moj8xHwD3CYKjgyao9GP+TAj51CrMpIypL5TncU/+lAdd/Q7Or4mtC20Z8dU3CK4lGyiAm5T3m5ypQlBQ/msTWOKPK4BO/t7p4ks9NA/CseoAb5/li8/7KCm2G+iJyV9DHsHU7T4zDiSDss+wd0ReZ1vvuQlOXAVhsnDanB3zLTH+8b3fMgZLLzKPtISQOOBWhzTUqnui3aMnnKwB8M3cXu5Hghgt9QfD2P4QVyf/wipLXkpwXKP5elDDnKDE063xIN/m6T7Gk4meuJd7WOdA0vYaKjwYif21OUMAtWg4IpUF3i0uvu9/NibzgZ6nvEyQNGWsex6HTv79T8j8zu5N/5F1yhtuNTNaFHlReXHpxppDbYYrVHSOWa2jSfAHDvUhM94s76Msvdwjo2hO4HmLOyfUTJzXW9tjs9u6Qxw+oxt1Uker2PEsqMhlMHG7iS7g3zTXnHW0d/S6wh+OYEXpB6bX3AjrKaf9LcBIKku82wpNtEbX2pN1PY46Flvk+70F3ISZkmm941r9kJMZAnKmG+U1oTu+VMcMdQR8wXHuT7zs/2TrRXVdWB19KMvFiC8P9t75dOdKEh9v2U+FcwsYTp1c+wQKKkibizzWNZa8ZhNfZzhP3z4c/4l2aJLyL6AqFrlOg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?N7nBQ5KZGbUjJkPjdB1UkjFTXM/+mgQEg5AmVmWmjYI2Sv9U/OE9qbwMcO29?=
 =?us-ascii?Q?jegEnII68eqCTgyBUB0dYTee67wj6HsMkCFpt9YJ8MPf8r+FDyjOqvrYjP60?=
 =?us-ascii?Q?lTPYQlBvpl2YPSo/M57aFVX697OJleEO0JkJSrUO2wYlorO7pZvWlAuvjNby?=
 =?us-ascii?Q?7xM2VEr98uCtSklVy/zteOzeIeIrT17nYGE1tmrBIsQwc4dwrfKBC/E2jHyT?=
 =?us-ascii?Q?cGh7l8YvZElGRZXk20e8lKDGrPdLHjWR7KlgujXXZ11lZjtg3L05R+Iz4pnM?=
 =?us-ascii?Q?2rpIONWiCuP+lrzcTmkddSJvgcKeLFruifLyME97xvhLbRzfR8xzbIGGKq2c?=
 =?us-ascii?Q?Qn1Uw7ASq78m3nwhkgDI884eKgnzDEWRFRHZqNWUJRT4vHS+6ZdfqBMT/Pi6?=
 =?us-ascii?Q?AMf7sbsjqVyrdbORrhSgv0Z0h6ivV4KsN2Ky86jOZsi3kMHku9TgsNBpp1+I?=
 =?us-ascii?Q?F+TSY6vA9NbGFNpPnHnXh9XwTTL7kgR3v53jDv7Vz9bX9ZUvUXOxYoYUGg9f?=
 =?us-ascii?Q?YI2eeGixketyZSSi8PGP8f6pkyZd+J81cMjcqFNEtRY/xwBiw4DC0VjW2b8n?=
 =?us-ascii?Q?JnNqyjoJX6AmSsqiG+06aDgm/RuLBZ0V54iJKv9hSpwjv7Oxg11iBCNOXYeQ?=
 =?us-ascii?Q?9jbUM//IiMqWUtrWRabwU9eZfiBNGojLm8JR4snP1ztiY/0m8m6Xuzj8CKbE?=
 =?us-ascii?Q?avopK+vgX+NALvDtTALMBERwSoXtZmyK2Q9gC/WxFD3jFLPVaYkX9KiBU6s3?=
 =?us-ascii?Q?t7980/7xQHy4bfNuv2Dx7mif5eGBM34LhuPU7dmErespYgufmyqXGYwzAQBF?=
 =?us-ascii?Q?gSnHY7ExPgjeBm9aG3MwKo9gx9sSIX7yVH8+ZVLyGBLsZdioDyR99p3c6cfA?=
 =?us-ascii?Q?akVYHAcLN0xac4NWRYUYFPegGG0oDx8YhCGH52njhkq2BM4/YnspymeohGcl?=
 =?us-ascii?Q?hXFYBVVpMN6+/epmlNrmntYZ/VN4XRhAfJN2Z2GKF6OdoywgJZ9rd5A8vinJ?=
 =?us-ascii?Q?4Kpl435czRi/Zft3xJq5FfRwsohBprdKFOEcrDrWCFRv+X+wQ7rruXi9czue?=
 =?us-ascii?Q?cM+Q3yY0X/isF253lq1yBp0pc58osO6/Q0qa6jkRZt1we1Y1MV7WweMY4Oj2?=
 =?us-ascii?Q?l68p4wIfHYJPu3n2FhQjfk+qK21C/H2I2fUJmmRIsMQ88m5sBIyjiaJzA/Bi?=
 =?us-ascii?Q?wCThPGInyeycSyZ2f07Dhau0nh/aCY2lw2Zu1ii5qnAnTM189ENpU94Cz1Hm?=
 =?us-ascii?Q?jw4NIeQ/ELaAdXi0vK5qUWFz2dGO4mCF+DS4LehRriK1D5Oh6dlW+oibdzMG?=
 =?us-ascii?Q?/KatBYvj+80eDCZCTAgOrEXFyN3kQGAWbQgcEqSQGIxdPielh5HIKQnWY/b6?=
 =?us-ascii?Q?b2wz395tgS3l/vB9tw2raX6Js3hU4y9fwaK4ZFDSWZwxRwR5yFTQHIiatGFX?=
 =?us-ascii?Q?OgBalTfjKBbdf6NBqf4YZXLiSlZQdDvAGbHuRIre05P5NhtZ5ORobllA7cOt?=
 =?us-ascii?Q?WdyinuEPK+s2Qln9+YRfB/Hy8XNjFEYjSmf1vbb4x2AyRos7NqfEfLKET+ii?=
 =?us-ascii?Q?1e7+yK2rjxu05zwlvvicq5Epu8dqpP12khsQqRCgY+d7816YYWotc3xlvbe/?=
 =?us-ascii?Q?Q8EuPNFj+MGUgpbpOX2m7FaggeAy0BixWDbvGZSZ1HxlIfB16fGL3teRF6Yh?=
 =?us-ascii?Q?pxdzw6KZM6rPEvffWYl6j7r6GOymTgNOVi+z0pMIyDv37TKSGrnwhRSyX0Gy?=
 =?us-ascii?Q?Ua1fwXZPZA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b19665f-a99b-4fb5-328a-08def2032d1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 08:34:18.8255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xgW4hNqShqM2drZ/yZBmk43L91n7FdisC9wvA15/5swPSwyZr1SqFwj2M/Vc//1XbiU6eCdoxhzxxg1aTo6vVzp2ZXwXD+1sKeDHmHW1ew8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9277

Hi Pei Xiao,

Thanks for the patch.

> -----Original Message-----
> From: Pei Xiao <xiaopei01@kylinos.cn>
> Sent: 04 August 2026 09:02
> Subject: [PATCH] phy: renesas: rcar-gen3-usb2: Fix use-after-free in rcar=
_gen3_phy_usb2_remove due to
> race condition
>=20
> In rcar_gen3_phy_usb2_probe, &channel->work is bound with rcar_gen3_phy_u=
sb2_work. rcar_gen3_phy_usb2_irq
> can schedule this work on system_wq via rcar_gen3_device_recognition(), a=
nd the role sysfs store can also
> schedule it via rcar_gen3_init_for_host() / rcar_gen3_init_for_peri().
>=20
> If we remove the device, rcar_gen3_phy_usb2_remove makes cleanup and the =
memory allocated for channel
> with devm_kzalloc() is released by the devm cleanup after the remove call=
back returns, while the work
> mentioned above may still be pending or running. The sequence of operatio=
ns that may lead to a UAF bug is
> as follows:
>=20
> CPU0                                      CPU1
>=20
>                                           | rcar_gen3_phy_usb2_irq
>                                           | rcar_gen3_device_recognition
>                                           | rcar_gen3_init_for_host
>                                           | schedule_work(&ch->work)
> rcar_gen3_phy_usb2_remove                 |
> device_remove_file(&pdev->dev,            |
>                    &dev_attr_role)        |
> // remove returns                         |
> // devm cleanup: free_irq,                |
> // kfree(channel)                         |
>                                           | rcar_gen3_phy_usb2_work
>                                           | // use ch (use-after-free)
>=20
> Fix it by disabling the OTG interrupts, so the IRQ handler cannot schedul=
e new work, and canceling the
> work before the remaining cleanup in rcar_gen3_phy_usb2_remove and the de=
vm release of channel.
>=20
> Fixes: c14f8a4032ef ("phy: rcar-gen3-usb2: fix mutex_lock calling in inte=
rrupt")
> Assisted-by: Codex:deepseek-v4-flash
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 9a45d840efeb..fa0e680a4b91 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -1067,8 +1067,16 @@ static void rcar_gen3_phy_usb2_remove(struct platf=
orm_device *pdev)  {
>  	struct rcar_gen3_chan *channel =3D platform_get_drvdata(pdev);
>=20
> -	if (channel->is_otg_channel)
> +	if (channel->is_otg_channel) {
> +		/* Disable OTG interrupts so the IRQ handler cannot
> +		 * schedule new work.
> +		 */
> +		rcar_gen3_control_otg_irq(channel, 0);
> +
>  		device_remove_file(&pdev->dev, &dev_attr_role);
> +
> +		cancel_work_sync(&channel->work);

What about pending wq that is still about execute after
"device_remove_file(&pdev->dev, &dev_attr_role);" ?

Cheers,
Biju

> +	}
>  }
>=20
>  static int rcar_gen3_phy_usb2_suspend(struct device *dev)
> --
> 2.25.1
>=20

