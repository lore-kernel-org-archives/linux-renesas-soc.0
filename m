Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F601C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 05:10:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31D42206DF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 05:10:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="o1qFjeaQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbfDKFKI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 01:10:08 -0400
Received: from mail-eopbgr1400122.outbound.protection.outlook.com ([40.107.140.122]:43744
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725783AbfDKFKI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 01:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGWD1dsD1rYnHgGFByoO1S9Gp9Qg20ybZQN7wFiwOVs=;
 b=o1qFjeaQmTd5BbvDSKywE5dZrIXBLIzWB7bPdJG4g9+p1Z/js9KyD9sVbHRuDOPozi2dQgO2dumzGojTBsMwveqPpyaMQfOVWwuGtTlt0/Yma+QugdEdkejI+qbYeCHe9nX/GbxzCzPKA7BCUsVDcLrQgjHbPDwYxp1aUsgQcsE=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB3263.jpnprd01.prod.outlook.com (20.177.104.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Thu, 11 Apr 2019 05:10:04 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Thu, 11 Apr 2019
 05:10:04 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH V5 04/13] phy: rcar-gen3-usb2: Add support for r8a77470
Thread-Topic: [PATCH V5 04/13] phy: rcar-gen3-usb2: Add support for r8a77470
Thread-Index: AQHU7613coY4FIfXyU6Gx7PJmAvISqY2afNw
Date:   Thu, 11 Apr 2019 05:10:04 +0000
Message-ID: <TYAPR01MB42710C4444EE893A1031B5F8D82F0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
 <1554907730-14792-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554907730-14792-5-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fdf4b6e-0170-4aef-8d2d-08d6be3bf55d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TYAPR01MB3263;
x-ms-traffictypediagnostic: TYAPR01MB3263:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <TYAPR01MB3263CE0C71CCEED7C273BCF7D82F0@TYAPR01MB3263.jpnprd01.prod.outlook.com>
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(136003)(366004)(376002)(39860400002)(189003)(199004)(7696005)(102836004)(5660300002)(316002)(478600001)(305945005)(25786009)(86362001)(4326008)(6506007)(7736002)(6436002)(71200400001)(966005)(71190400001)(81156014)(14454004)(81166006)(54906003)(68736007)(74316002)(229853002)(186003)(66066001)(110136005)(99286004)(6306002)(9686003)(6116002)(8676002)(2171002)(76176011)(52536014)(256004)(53936002)(105586002)(11346002)(6246003)(26005)(476003)(106356001)(8936002)(55016002)(33656002)(486006)(446003)(3846002)(2906002)(97736004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3263;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0U/S8AqroQHUEJh6MeO750RYdqRsxfzbjE8+mEY0Ze5fhcC598Ji03YRZn2c/Rvcp42P0HeqDmu435iREgqyYXhSQkUOYmTumiyESBeOfuf0xcx9byLKtRmAdTi/3/gpdnINRnnW1qwJez7G6sbM7gcxYbrvdUM1hXJyo1TEkt+VevoVhW8c6be5hdjTzrOvWax0REcBVPSI91R17pqWviIbyjp4XHmV/wgVEis+smu2Qat9Ead/ed3EoSegZgYH8bB0P6Jc3+4e1K0WPE4g9/wIJQ8357sO2BQvR6iukToEQYPLzf5EDXOidmBtxOsLO6XSaWZZ34mPksWXNXNlHUZdpXvhNvqs+K7TEOsjOmIQ+lUi0IWbQ8uMvWmrm5/yO4Ip2as+n8rgV6ciaAw2MRaeafGJdFAS61WaCZvdAgo=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fdf4b6e-0170-4aef-8d2d-08d6be3bf55d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2019 05:10:04.6429
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
> This patch adds support for r8a77470 (RZ/G1C). We can reuse this driver f=
or
> initializing timing/interrupt generation registers.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---

Thank you for the patch! I tested this patch on r8a77965-salvator-xs
and I didn't find any regressions. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> V4-->V5
>  * Incorporated Kishan and Shimoda-san's review comment
>   https://patchwork.kernel.org/patch/10893387/
> V3-->V4
>  * Incorporated Kishan and Shimoda-san's review comment
>   https://patchwork.kernel.org/patch/10883265/
> V2-->V3
>  * Incorporated shimoda-san's review comment
>  Ref: https://patchwork.kernel.org/patch/10655855/
> ---
>  drivers/phy/renesas/Kconfig              |  2 +-
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 39 ++++++++++++++++++++++++++=
+-----
>  2 files changed, 34 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
> index e340a92..111bdca 100644
> --- a/drivers/phy/renesas/Kconfig
> +++ b/drivers/phy/renesas/Kconfig
> @@ -19,7 +19,7 @@ config PHY_RCAR_GEN3_PCIE
>  config PHY_RCAR_GEN3_USB2
>  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
>  	depends on ARCH_RENESAS
> -	depends on EXTCON
> +	depends on EXTCON || !EXTCON # if EXTCON=3Dm, this cannot be built-in
>  	depends on USB_SUPPORT
>  	select GENERIC_PHY
>  	select USB_COMMON
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 0a34782..e3a88b9 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -393,6 +393,12 @@ static const struct phy_ops rcar_gen3_phy_usb2_ops =
=3D {
>  	.owner		=3D THIS_MODULE,
>  };
>=20
> +static const struct phy_ops rz_g1c_phy_usb2_ops =3D {
> +	.init		=3D rcar_gen3_phy_usb2_init,
> +	.exit		=3D rcar_gen3_phy_usb2_exit,
> +	.owner		=3D THIS_MODULE,
> +};
> +
>  static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
>  {
>  	struct rcar_gen3_chan *ch =3D _ch;
> @@ -411,11 +417,27 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, =
void *_ch)
>  }
>=20
>  static const struct of_device_id rcar_gen3_phy_usb2_match_table[] =3D {
> -	{ .compatible =3D "renesas,usb2-phy-r8a7795" },
> -	{ .compatible =3D "renesas,usb2-phy-r8a7796" },
> -	{ .compatible =3D "renesas,usb2-phy-r8a77965" },
> -	{ .compatible =3D "renesas,rcar-gen3-usb2-phy" },
> -	{ }
> +	{
> +		.compatible =3D "renesas,usb2-phy-r8a77470",
> +		.data =3D &rz_g1c_phy_usb2_ops,
> +	},
> +	{
> +		.compatible =3D "renesas,usb2-phy-r8a7795",
> +		.data =3D &rcar_gen3_phy_usb2_ops,
> +	},
> +	{
> +		.compatible =3D "renesas,usb2-phy-r8a7796",
> +		.data =3D &rcar_gen3_phy_usb2_ops,
> +	},
> +	{
> +		.compatible =3D "renesas,usb2-phy-r8a77965",
> +		.data =3D &rcar_gen3_phy_usb2_ops,
> +	},
> +	{
> +		.compatible =3D "renesas,rcar-gen3-usb2-phy",
> +		.data =3D &rcar_gen3_phy_usb2_ops,
> +	},
> +	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, rcar_gen3_phy_usb2_match_table);
>=20
> @@ -431,6 +453,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>  	struct rcar_gen3_chan *channel;
>  	struct phy_provider *provider;
>  	struct resource *res;
> +	const struct phy_ops *phy_usb2_ops;
>  	int irq, ret =3D 0;
>=20
>  	if (!dev->of_node) {
> @@ -481,7 +504,11 @@ static int rcar_gen3_phy_usb2_probe(struct platform_=
device *pdev)
>  	 * And then, phy-core will manage runtime pm for this device.
>  	 */
>  	pm_runtime_enable(dev);
> -	channel->phy =3D devm_phy_create(dev, NULL, &rcar_gen3_phy_usb2_ops);
> +	phy_usb2_ops =3D of_device_get_match_data(dev);
> +	if (!phy_usb2_ops)
> +		return -EINVAL;
> +
> +	channel->phy =3D devm_phy_create(dev, NULL, phy_usb2_ops);
>  	if (IS_ERR(channel->phy)) {
>  		dev_err(dev, "Failed to create USB2 PHY\n");
>  		ret =3D PTR_ERR(channel->phy);
> --
> 2.7.4

