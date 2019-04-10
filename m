Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B586CC10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:42:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67A1720830
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:42:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="ExsNhOIR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728782AbfDJJme (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 05:42:34 -0400
Received: from mail-eopbgr1400120.outbound.protection.outlook.com ([40.107.140.120]:51664
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726699AbfDJJmd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 05:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QhrQZhnzdOJt6n9cMBjc1qGIsGzKjMXl1v8sIw+6Ys=;
 b=ExsNhOIRAnek5dp4M6F33pTvZkDTLr8kfnfKkSx77Dx/nAo9e/3v9VwHGCNx4+uFs/JXaDxsQId56du5vNHc8CLv46pfW1xpyhdadcvZLTuyzeTRXWCP+MH8SXOcTw7rJiVk87lW9eKfy4A5SstxhaOvYo2nmS/7nJ0MmKBjwsc=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB4925.jpnprd01.prod.outlook.com (20.179.186.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.21; Wed, 10 Apr 2019 09:42:30 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Wed, 10 Apr 2019
 09:42:30 +0000
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
Subject: RE: [PATCH V4 04/13] phy: rcar-gen3-usb2: Add support for r8a77470
Thread-Topic: [PATCH V4 04/13] phy: rcar-gen3-usb2: Add support for r8a77470
Thread-Index: AQHU73WLzThk6q+TI0WORZfdoAY2VqY1IhvQ
Date:   Wed, 10 Apr 2019 09:42:30 +0000
Message-ID: <TYAPR01MB4271CFF13C46EB75EB19A3EED82E0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
 <1554883715-41725-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554883715-41725-5-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ace8e15-cbee-491b-258e-08d6bd98d9b6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4925;
x-ms-traffictypediagnostic: TYAPR01MB4925:
x-microsoft-antispam-prvs: <TYAPR01MB4925FF7385726BC0F93E9272D82E0@TYAPR01MB4925.jpnprd01.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(52536014)(478600001)(6246003)(25786009)(6436002)(2171002)(14454004)(4326008)(7696005)(33656002)(99286004)(9686003)(106356001)(54906003)(53936002)(110136005)(97736004)(105586002)(446003)(486006)(71190400001)(71200400001)(316002)(55016002)(11346002)(476003)(229853002)(102836004)(68736007)(186003)(86362001)(6116002)(26005)(2906002)(256004)(81166006)(74316002)(3846002)(76176011)(8936002)(305945005)(5660300002)(8676002)(7736002)(6506007)(81156014)(66066001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4925;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1OgFNMRbSApsKmV3DGFrHyJpwma+7p8+a3t64BMAE3EmNfKFQlga40VaPsIoxFHrp10YxizdHImri6P75/SdStlSya2KK5E2Gw+/M1N5A668BFODwNNwxTDssGC7LaaxETjXQysup+36ye+ZA3GyLrXhI3OwHVcCCJ3TISP4DOlH6bIOrmHrePtMyBZJyzyeUkYpgkoFGOxOTNV6asjUk2raQORm9FI8wlt+RjNcQqYIEw19+G+ZtBATaA8rrUl+CadY0qVvZ2csIIkDKXJvtnoTVyID9nPvJZGDB2etLUs0TNuTizItkav60lBkpL4idn+Y0X3Xeoejr0Jt2W/6tnosH+l9T8zJcot4lUY05jhfXNQl0lWJb1CoME32qD39xxtIHWRzxNzRJake0i/+JPEBCQYDI6PjT3kGUdfatUE=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ace8e15-cbee-491b-258e-08d6bd98d9b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 09:42:30.2934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4925
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

Thank you for the patch!

> From: Biju Das, Sent: Wednesday, April 10, 2019 5:08 PM
>=20
> This patch adds support for r8a77470 (RZ/G1C). We can reuse this driver f=
or
> initializing timing/interrupt generation registers.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
<snip>
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 0a34782..5a8e673 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -22,6 +22,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/usb/of.h>
>  #include <linux/workqueue.h>
> +#include <linux/sys_soc.h>

We don't need it.

>  /******* USB2.0 Host registers (original offset is +0x200) *******/
>  #define USB2_INT_ENABLE		0x000
> @@ -393,6 +394,12 @@ static const struct phy_ops rcar_gen3_phy_usb2_ops =
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
> @@ -411,11 +418,27 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, =
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
> @@ -431,6 +454,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>  	struct rcar_gen3_chan *channel;
>  	struct phy_provider *provider;
>  	struct resource *res;
> +	const struct phy_ops *phy_usb2_ops;
>  	int irq, ret =3D 0;
>=20
>  	if (!dev->of_node) {
> @@ -481,7 +505,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>  	 * And then, phy-core will manage runtime pm for this device.
>  	 */
>  	pm_runtime_enable(dev);
> -	channel->phy =3D devm_phy_create(dev, NULL, &rcar_gen3_phy_usb2_ops);
> +	phy_usb2_ops =3D (const struct phy_ops *) of_device_get_match_data(dev)=
;

We don't need the cast. Also, I think we have to check the phy_usb2_ops is =
not NULL.

After they are fixed:

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> +	channel->phy =3D devm_phy_create(dev, NULL, phy_usb2_ops);
>  	if (IS_ERR(channel->phy)) {
>  		dev_err(dev, "Failed to create USB2 PHY\n");
>  		ret =3D PTR_ERR(channel->phy);
> --
> 2.7.4

