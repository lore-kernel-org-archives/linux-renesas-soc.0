Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307A8C10F14
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 10:30:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA39820830
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 10:30:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="DqGh2ov2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbfDJKaP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 06:30:15 -0400
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:30976
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729696AbfDJKaP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 06:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Og2mxXWmjuPGnG44WTQXMOwrPnJpve7kJwbfJ1GZjSs=;
 b=DqGh2ov2msl+Jv33lBWdCvFurZEANG7rz+o8SvyQGIYyffFDLb60c3CXL4qimDd5FlznN7isCkeeJT9xbjGMPvo7eeIbbrDu3k7N0/aVCyM/Kg0MkewKzj/sSi02Kx1DUSlyVP/sL//gAdgzYZ4+sdO5+m4d/iZNSKoDmYvFOu4=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3272.jpnprd01.prod.outlook.com (52.134.255.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.14; Wed, 10 Apr 2019 10:29:47 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1792.009; Wed, 10 Apr 2019
 10:29:47 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Simon Horman <horms+renesas@verge.net.au>,
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
Thread-Index: AQHU73WLS4anPF2L4U2G2CGStJGYuaY1JIIAgAAHOmA=
Date:   Wed, 10 Apr 2019 10:29:47 +0000
Message-ID: <OSBPR01MB2103ED639533E2AA91AFF461B82E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
 <1554883715-41725-5-git-send-email-biju.das@bp.renesas.com>
 <TYAPR01MB4271CFF13C46EB75EB19A3EED82E0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4271CFF13C46EB75EB19A3EED82E0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7cc17ef-210c-4fd3-de09-08d6bd9f74c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3272;
x-ms-traffictypediagnostic: OSBPR01MB3272:
x-microsoft-antispam-prvs: <OSBPR01MB327207E1943BAC754BF0DC78B82E0@OSBPR01MB3272.jpnprd01.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(376002)(366004)(39860400002)(396003)(51914003)(199004)(189003)(305945005)(7736002)(6506007)(14454004)(86362001)(11346002)(446003)(66066001)(68736007)(52536014)(74316002)(44832011)(5660300002)(476003)(478600001)(102836004)(97736004)(486006)(2906002)(105586002)(8676002)(81156014)(81166006)(76176011)(55016002)(8936002)(99286004)(316002)(110136005)(71190400001)(71200400001)(6116002)(3846002)(4326008)(6246003)(9686003)(53936002)(256004)(25786009)(2171002)(54906003)(229853002)(186003)(6436002)(26005)(33656002)(7696005)(106356001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3272;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1v14hru2BrKOU7npe+SNlzLAbLq/o5/af8Rumd+SXhIF1wi1p78HPvd3slwx05fsCL2gvkmP1lgwSCL0+eHDqCSJ0PlxcaldPAwlGC6R+Me3i3ievq/sjylZtXOe+DgpAZRR6uIEzSs9owW0ZmGG3q45BUQWm9n5UcL2kMqRLdSoMf5FlRa6F3veX6Sukc0ihqiAdRODcvCdNbogK0UnCMiRzzAnnRzy/h220E5PSZRJEMtsRmtL88KGMSCSJWEm2yDIruOBdYPrNl/K9taXxUAATqzP7opmZXHloiZ0gHUP8Ga6uYd6qsck5f9qDmyPNypRWhAumTiC2RPdzk3kTsqtiICkaRjFXDv/COgDOn0gt/IaDtks5IP2fGAYEBNwHayRh2soy/HKtGS2ONGQc6K2svjWtoR127nGnxIZICs=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7cc17ef-210c-4fd3-de09-08d6bd9f74c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 10:29:47.3368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3272
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH V4 04/13] phy: rcar-gen3-usb2: Add support for r8a774=
70
>=20
> Hi Biju-san,
>=20
> Thank you for the patch!
>=20
> > From: Biju Das, Sent: Wednesday, April 10, 2019 5:08 PM
> >
> > This patch adds support for r8a77470 (RZ/G1C). We can reuse this
> > driver for initializing timing/interrupt generation registers.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> <snip>
> > diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > index 0a34782..5a8e673 100644
> > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/regulator/consumer.h>  #include <linux/usb/of.h>
> > #include <linux/workqueue.h>
> > +#include <linux/sys_soc.h>
>=20
> We don't need it.

OK . will take this out.

> >  /******* USB2.0 Host registers (original offset is +0x200) *******/
> >  #define USB2_INT_ENABLE		0x000
> > @@ -393,6 +394,12 @@ static const struct phy_ops
> rcar_gen3_phy_usb2_ops =3D {
> >  	.owner		=3D THIS_MODULE,
> >  };
> >
> > +static const struct phy_ops rz_g1c_phy_usb2_ops =3D {
> > +	.init		=3D rcar_gen3_phy_usb2_init,
> > +	.exit		=3D rcar_gen3_phy_usb2_exit,
> > +	.owner		=3D THIS_MODULE,
> > +};
> > +
> >  static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
> >  {
> >  	struct rcar_gen3_chan *ch =3D _ch;
> > @@ -411,11 +418,27 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq=
,
> void *_ch)
> >  }
> >
> >  static const struct of_device_id rcar_gen3_phy_usb2_match_table[] =3D =
{
> > -	{ .compatible =3D "renesas,usb2-phy-r8a7795" },
> > -	{ .compatible =3D "renesas,usb2-phy-r8a7796" },
> > -	{ .compatible =3D "renesas,usb2-phy-r8a77965" },
> > -	{ .compatible =3D "renesas,rcar-gen3-usb2-phy" },
> > -	{ }
> > +	{
> > +		.compatible =3D "renesas,usb2-phy-r8a77470",
> > +		.data =3D &rz_g1c_phy_usb2_ops,
> > +	},
> > +	{
> > +		.compatible =3D "renesas,usb2-phy-r8a7795",
> > +		.data =3D &rcar_gen3_phy_usb2_ops,
> > +	},
> > +	{
> > +		.compatible =3D "renesas,usb2-phy-r8a7796",
> > +		.data =3D &rcar_gen3_phy_usb2_ops,
> > +	},
> > +	{
> > +		.compatible =3D "renesas,usb2-phy-r8a77965",
> > +		.data =3D &rcar_gen3_phy_usb2_ops,
> > +	},
> > +	{
> > +		.compatible =3D "renesas,rcar-gen3-usb2-phy",
> > +		.data =3D &rcar_gen3_phy_usb2_ops,
> > +	},
> > +	{ /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, rcar_gen3_phy_usb2_match_table);
> >
> > @@ -431,6 +454,7 @@ static int rcar_gen3_phy_usb2_probe(struct
> platform_device *pdev)
> >  	struct rcar_gen3_chan *channel;
> >  	struct phy_provider *provider;
> >  	struct resource *res;
> > +	const struct phy_ops *phy_usb2_ops;
> >  	int irq, ret =3D 0;
> >
> >  	if (!dev->of_node) {
> > @@ -481,7 +505,9 @@ static int rcar_gen3_phy_usb2_probe(struct
> platform_device *pdev)
> >  	 * And then, phy-core will manage runtime pm for this device.
> >  	 */
> >  	pm_runtime_enable(dev);
> > -	channel->phy =3D devm_phy_create(dev, NULL,
> &rcar_gen3_phy_usb2_ops);
> > +	phy_usb2_ops =3D (const struct phy_ops *)
> of_device_get_match_data(dev);
>=20
> We don't need the cast. Also, I think we have to check the phy_usb2_ops i=
s
> not NULL.

OK. I have checked other rcar drivers and came to the conclusion that there=
 is need for Null check(for eg:- renesas-cpg-mssr.c, gpio-rcar.c)
Any way there is no harm in adding  this check, since the api can return nu=
ll value.

I will send V5 As you suggested.  ie, will remove the cast and will add che=
ck for not  NULL.
if (!phy_usb2_ops)
	return -EINVAL;

> After they are fixed:
>=20
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> Best regards,
> Yoshihiro Shimoda
>=20
> > +	channel->phy =3D devm_phy_create(dev, NULL, phy_usb2_ops);
> >  	if (IS_ERR(channel->phy)) {
> >  		dev_err(dev, "Failed to create USB2 PHY\n");
> >  		ret =3D PTR_ERR(channel->phy);
> > --
Regards,
Biju

