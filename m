Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C63BC10F13
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 05:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F6052083E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 05:08:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="LA50sAcv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbfDKFIf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 01:08:35 -0400
Received: from mail-eopbgr1410133.outbound.protection.outlook.com ([40.107.141.133]:28163
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725782AbfDKFIf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 01:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlRUMKIhVgJ6SSYXkFjakl6FKiyrd+JrkqCUeXld/o0=;
 b=LA50sAcvU5egITOV/aidYuoUY57KAuwXc+/AbZvRKUAtSCnWJLUzDULanIqHLqh66Bmn9Gu7MEv8Qj4jcZWooWQpnJ/jLqdIOo8UfA7aJWBTWzsNsVi1vTrlC/3ceHdmFc9HHd6HASkUJUyjA31PaiHlE6WKYARy2WHZ3iTRClY=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB3263.jpnprd01.prod.outlook.com (20.177.104.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Thu, 11 Apr 2019 05:08:30 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Thu, 11 Apr 2019
 05:08:30 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH V5 02/13] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Thread-Topic: [PATCH V5 02/13] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Thread-Index: AQHU761zHD63y+dm7UuUTZhCpUjhIqY2aOXg
Date:   Thu, 11 Apr 2019 05:08:29 +0000
Message-ID: <TYAPR01MB427136CDFD9D5F38AEBB95B4D82F0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
 <1554907730-14792-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554907730-14792-3-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e895bcb6-a65b-439e-b801-08d6be3bbd08
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TYAPR01MB3263;
x-ms-traffictypediagnostic: TYAPR01MB3263:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <TYAPR01MB32632FB80B1ABC70D9620A62D82F0@TYAPR01MB3263.jpnprd01.prod.outlook.com>
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(136003)(366004)(376002)(39860400002)(189003)(199004)(7696005)(102836004)(5660300002)(316002)(478600001)(305945005)(25786009)(86362001)(4326008)(6506007)(7736002)(6436002)(71200400001)(966005)(71190400001)(81156014)(14454004)(81166006)(54906003)(68736007)(74316002)(229853002)(186003)(66066001)(110136005)(99286004)(6306002)(9686003)(6116002)(8676002)(76176011)(52536014)(14444005)(256004)(53936002)(105586002)(11346002)(6246003)(26005)(476003)(106356001)(8936002)(55016002)(33656002)(486006)(446003)(3846002)(2906002)(97736004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3263;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /ifumHtEK3jO/CeBvy9cIglkH2VWCThJPdjHjq6vyYbvc/ZVEWiCTlN+Tfm53OqTlPu0B8gt6Oc5ZeiczaGGiw/tqKHS/Dyl/uIxCm7mFP5SdUhOih+TPKY+LoM8POanojjsgit6UD2OTMrfxnmbQsiPiA2ArlGM7K6+kXNYnKgF8cWwAPTWzehhZctZ0Y5WeqiPOs54Or3HKwPF5BAoxsaqK/1N1q+dknLWnXrEoT7gKZaF/Hg/i4SftSsSSij+3+fqUynpIQF5UNcXVGgiUNs7xsulhJJnmBUSBvww7KtlKoMsz0mjKhO4QR+YfreSYPQ+AilLvvqe8M4eUK7GKhJmcr36M71OLR8MnU5jvrGs0X4aS7/xJ7zO9boXKlSbpYEyNJUNbg76KK4haxbJmVrLoAYTcGWPUVSpsTT/Sj8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e895bcb6-a65b-439e-b801-08d6be3bbd08
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2019 05:08:30.1285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3263
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Wednesday, April 10, 2019 11:49 PM
>=20
> This patch adds support for RZ/G1C (r8a77470) SoC. RZ/G1C SoC has a
> PLL register shared between hsusb0 and hsusb1. Compared to other RZ/G1
> and R-Car Gen2/3, USB Host needs to deassert the pll reset.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Also, I tested this patch on r8a7790-lager and I didn't find any regression=
s.
So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


> V4-->V5
>   * Incorporated shimoda-san's review comment
>     https://patchwork.kernel.org/patch/10893383/
> V3-->V4
>   * No Change
> V2-->V3
>  * No change
> V1-->V2
>  * Incorporated shimoda-san's review comment
>  Ref: https://patchwork.kernel.org/patch/10655855/
> ---
>  drivers/phy/renesas/phy-rcar-gen2.c | 130 ++++++++++++++++++++++++++++++=
++----
>  1 file changed, 118 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/ph=
y-rcar-gen2.c
> index 72eeb06..8dc5710 100644
> --- a/drivers/phy/renesas/phy-rcar-gen2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen2.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2014 Renesas Solutions Corp.
>   * Copyright (C) 2014 Cogent Embedded, Inc.
> + * Copyright (C) 2019 Renesas Electronics Corp.
>   */
>=20
>  #include <linux/clk.h>
> @@ -15,6 +16,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/spinlock.h>
>  #include <linux/atomic.h>
> +#include <linux/of_device.h>
>=20
>  #define USBHS_LPSTS			0x02
>  #define USBHS_UGCTRL			0x80
> @@ -35,6 +37,8 @@
>  #define USBHS_UGCTRL2_USB0SEL		0x00000030
>  #define USBHS_UGCTRL2_USB0SEL_PCI	0x00000010
>  #define USBHS_UGCTRL2_USB0SEL_HS_USB	0x00000030
> +#define USBHS_UGCTRL2_USB0SEL_USB20	0x00000010
> +#define USBHS_UGCTRL2_USB0SEL_HS_USB20	0x00000020
>=20
>  /* USB General status register (UGSTS) */
>  #define USBHS_UGSTS_LOCK		0x00000100 /* From technical update */
> @@ -64,6 +68,11 @@ struct rcar_gen2_phy_driver {
>  	struct rcar_gen2_channel *channels;
>  };
>=20
> +struct rcar_gen2_phy_data {
> +	const struct phy_ops *gen2_phy_ops;
> +	const u32 (*select_value)[PHYS_PER_CHANNEL];
> +};
> +
>  static int rcar_gen2_phy_init(struct phy *p)
>  {
>  	struct rcar_gen2_phy *phy =3D phy_get_drvdata(p);
> @@ -180,6 +189,60 @@ static int rcar_gen2_phy_power_off(struct phy *p)
>  	return 0;
>  }
>=20
> +static int rz_g1c_phy_power_on(struct phy *p)
> +{
> +	struct rcar_gen2_phy *phy =3D phy_get_drvdata(p);
> +	struct rcar_gen2_phy_driver *drv =3D phy->channel->drv;
> +	void __iomem *base =3D drv->base;
> +	unsigned long flags;
> +	u32 value;
> +
> +	spin_lock_irqsave(&drv->lock, flags);
> +
> +	/* Power on USBHS PHY */
> +	value =3D readl(base + USBHS_UGCTRL);
> +	value &=3D ~USBHS_UGCTRL_PLLRESET;
> +	writel(value, base + USBHS_UGCTRL);
> +
> +	/* As per the data sheet wait 340 micro sec for power stable */
> +	udelay(340);
> +
> +	if (phy->select_value =3D=3D USBHS_UGCTRL2_USB0SEL_HS_USB20) {
> +		value =3D readw(base + USBHS_LPSTS);
> +		value |=3D USBHS_LPSTS_SUSPM;
> +		writew(value, base + USBHS_LPSTS);
> +	}
> +
> +	spin_unlock_irqrestore(&drv->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int rz_g1c_phy_power_off(struct phy *p)
> +{
> +	struct rcar_gen2_phy *phy =3D phy_get_drvdata(p);
> +	struct rcar_gen2_phy_driver *drv =3D phy->channel->drv;
> +	void __iomem *base =3D drv->base;
> +	unsigned long flags;
> +	u32 value;
> +
> +	spin_lock_irqsave(&drv->lock, flags);
> +	/* Power off USBHS PHY */
> +	if (phy->select_value =3D=3D USBHS_UGCTRL2_USB0SEL_HS_USB20) {
> +		value =3D readw(base + USBHS_LPSTS);
> +		value &=3D ~USBHS_LPSTS_SUSPM;
> +		writew(value, base + USBHS_LPSTS);
> +	}
> +
> +	value =3D readl(base + USBHS_UGCTRL);
> +	value |=3D USBHS_UGCTRL_PLLRESET;
> +	writel(value, base + USBHS_UGCTRL);
> +
> +	spin_unlock_irqrestore(&drv->lock, flags);
> +
> +	return 0;
> +}
> +
>  static const struct phy_ops rcar_gen2_phy_ops =3D {
>  	.init		=3D rcar_gen2_phy_init,
>  	.exit		=3D rcar_gen2_phy_exit,
> @@ -188,12 +251,55 @@ static const struct phy_ops rcar_gen2_phy_ops =3D {
>  	.owner		=3D THIS_MODULE,
>  };
>=20
> +static const struct phy_ops rz_g1c_phy_ops =3D {
> +	.init		=3D rcar_gen2_phy_init,
> +	.exit		=3D rcar_gen2_phy_exit,
> +	.power_on	=3D rz_g1c_phy_power_on,
> +	.power_off	=3D rz_g1c_phy_power_off,
> +	.owner		=3D THIS_MODULE,
> +};
> +
> +static const u32 pci_select_value[][PHYS_PER_CHANNEL] =3D {
> +	[0]	=3D { USBHS_UGCTRL2_USB0SEL_PCI, USBHS_UGCTRL2_USB0SEL_HS_USB },
> +	[2]	=3D { USBHS_UGCTRL2_USB2SEL_PCI, USBHS_UGCTRL2_USB2SEL_USB30 },
> +};
> +
> +static const u32 usb20_select_value[][PHYS_PER_CHANNEL] =3D {
> +	{ USBHS_UGCTRL2_USB0SEL_USB20, USBHS_UGCTRL2_USB0SEL_HS_USB20 },
> +};
> +
> +static const struct rcar_gen2_phy_data rcar_gen2_usb_phy_data =3D {
> +	.gen2_phy_ops =3D &rcar_gen2_phy_ops,
> +	.select_value =3D pci_select_value,
> +};
> +
> +static const struct rcar_gen2_phy_data rz_g1c_usb_phy_data =3D {
> +	.gen2_phy_ops =3D &rz_g1c_phy_ops,
> +	.select_value =3D usb20_select_value,
> +};
> +
>  static const struct of_device_id rcar_gen2_phy_match_table[] =3D {
> -	{ .compatible =3D "renesas,usb-phy-r8a7790" },
> -	{ .compatible =3D "renesas,usb-phy-r8a7791" },
> -	{ .compatible =3D "renesas,usb-phy-r8a7794" },
> -	{ .compatible =3D "renesas,rcar-gen2-usb-phy" },
> -	{ }
> +	{
> +		.compatible =3D "renesas,usb-phy-r8a77470",
> +		.data =3D &rz_g1c_usb_phy_data,
> +	},
> +	{
> +		.compatible =3D "renesas,usb-phy-r8a7790",
> +		.data =3D &rcar_gen2_usb_phy_data,
> +	},
> +	{
> +		.compatible =3D "renesas,usb-phy-r8a7791",
> +		.data =3D &rcar_gen2_usb_phy_data,
> +	},
> +	{
> +		.compatible =3D "renesas,usb-phy-r8a7794",
> +		.data =3D &rcar_gen2_usb_phy_data,
> +	},
> +	{
> +		.compatible =3D "renesas,rcar-gen2-usb-phy",
> +		.data =3D &rcar_gen2_usb_phy_data,
> +	},
> +	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, rcar_gen2_phy_match_table);
>=20
> @@ -224,11 +330,6 @@ static const u32 select_mask[] =3D {
>  	[2]	=3D USBHS_UGCTRL2_USB2SEL,
>  };
>=20
> -static const u32 select_value[][PHYS_PER_CHANNEL] =3D {
> -	[0]	=3D { USBHS_UGCTRL2_USB0SEL_PCI, USBHS_UGCTRL2_USB0SEL_HS_USB },
> -	[2]	=3D { USBHS_UGCTRL2_USB2SEL_PCI, USBHS_UGCTRL2_USB2SEL_USB30 },
> -};
> -
>  static int rcar_gen2_phy_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -238,6 +339,7 @@ static int rcar_gen2_phy_probe(struct platform_device=
 *pdev)
>  	struct resource *res;
>  	void __iomem *base;
>  	struct clk *clk;
> +	const struct rcar_gen2_phy_data *data;
>  	int i =3D 0;
>=20
>  	if (!dev->of_node) {
> @@ -266,6 +368,10 @@ static int rcar_gen2_phy_probe(struct platform_devic=
e *pdev)
>  	drv->clk =3D clk;
>  	drv->base =3D base;
>=20
> +	data =3D of_device_get_match_data(dev);
> +	if (!data)
> +		return -EINVAL;
> +
>  	drv->num_channels =3D of_get_child_count(dev->of_node);
>  	drv->channels =3D devm_kcalloc(dev, drv->num_channels,
>  				     sizeof(struct rcar_gen2_channel),
> @@ -294,10 +400,10 @@ static int rcar_gen2_phy_probe(struct platform_devi=
ce *pdev)
>=20
>  			phy->channel =3D channel;
>  			phy->number =3D n;
> -			phy->select_value =3D select_value[channel_num][n];
> +			phy->select_value =3D data->select_value[channel_num][n];
>=20
>  			phy->phy =3D devm_phy_create(dev, NULL,
> -						   &rcar_gen2_phy_ops);
> +						   data->gen2_phy_ops);
>  			if (IS_ERR(phy->phy)) {
>  				dev_err(dev, "Failed to create PHY\n");
>  				return PTR_ERR(phy->phy);
> --
> 2.7.4

