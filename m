Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46990C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 11:35:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BA4A2083E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 11:35:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="mASWpCk6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729192AbfDJLfg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 07:35:36 -0400
Received: from mail-eopbgr1400113.outbound.protection.outlook.com ([40.107.140.113]:12032
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727206AbfDJLfg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 07:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7t+SETQwjjh+iWJxwbiJ8qLjca3MgD5wvOpVCHM1uY=;
 b=mASWpCk6j/rDyppaosUMaeiZoph1EaqVjZWG6XzRleh68ZOnXzZAzlBGI2OU91byv+NlUtOEHGsT/k0NVKE+QhZuGrxnyOeruQKPwe1JxDgmyB8xpar4/8ClJjOjAkN70hp/4gMCWnSZHB9W1JFprKGdQChnCLw1dFH2srkGISc=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB5245.jpnprd01.prod.outlook.com (20.179.187.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Wed, 10 Apr 2019 11:35:31 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Wed, 10 Apr 2019
 11:35:31 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: RE: [PATCH V4 02/13] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Thread-Topic: [PATCH V4 02/13] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Thread-Index: AQHU73WIcHT6sD/wdkO+01ODIzrH7aY1JUGAgAAGZ4CAABcYAA==
Date:   Wed, 10 Apr 2019 11:35:31 +0000
Message-ID: <TYAPR01MB42710FA9D71F17FEAA3829C2D82E0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
 <1554883715-41725-3-git-send-email-biju.das@bp.renesas.com>
 <TYAPR01MB427138C68589972EB9385E95D82E0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
 <OSBPR01MB210385B7A35C72E6C1A37EEDB82E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB210385B7A35C72E6C1A37EEDB82E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1bc00c5-1a6d-4561-101f-08d6bda8a37e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB5245;
x-ms-traffictypediagnostic: TYAPR01MB5245:
x-microsoft-antispam-prvs: <TYAPR01MB52452B7B8AB598FC8567177CD82E0@TYAPR01MB5245.jpnprd01.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(39860400002)(346002)(396003)(366004)(136003)(376002)(189003)(199004)(51914003)(97736004)(7736002)(102836004)(66066001)(6436002)(8936002)(9686003)(53936002)(25786009)(6246003)(7696005)(93886005)(6506007)(86362001)(76176011)(3846002)(256004)(99286004)(74316002)(11346002)(186003)(26005)(229853002)(446003)(2906002)(316002)(476003)(305945005)(55016002)(6116002)(4326008)(71190400001)(105586002)(5660300002)(110136005)(71200400001)(54906003)(561944003)(106356001)(81156014)(81166006)(14454004)(8676002)(68736007)(33656002)(486006)(52536014)(478600001)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5245;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d4Cwrm+N5r9USQn/uz/71P03AxRUTdAPZ5NW+lFO1DDJdD5Pac0qtGgSfHWDc5yKT81VZnV0KlVRQrETvnBb6KjcQxXJXrSiaV/5N4YNvlYxGm6BK34lo367WLOuPjQaNk8QNGBM08GIEgcGSCkk0ojPlsuHlntsdRo+cZ/1qSQ+68kUjuVPINBoQ2jJq2hpwigNtv9WfN0Y8BrKXbgBDUBfjZGqjriLwE7LK5PTv7AeksSx8nlAPPAeOS46dGYxHQiIZsCp8cQ4tNaJmTNkgdgaZuB+2zvsOkvX7Zx/IDirQNqqOKhnEOxC/AFTEgc98ESxB2X3lHaR3rLwKcFzsm+g0rNaNOJ+JUsk3hA5uXi9BMYNEqcbps2tvQGSoaSQo5/tVkzD5qMhReRLmHvK0oQfjT01MRW9T8rumnbK1RM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bc00c5-1a6d-4561-101f-08d6bda8a37e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 11:35:31.2505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5245
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Wednesday, April 10, 2019 7:08 PM
>=20
> Hi Shimoda-San,
>=20
> Thanks for the feedback.
>=20
> > Subject: RE: [PATCH V4 02/13] phy: renesas: phy-rcar-gen2: Add support =
for
> > r8a77470
> >
> > Hi Biju-san,
> >
> > Thank you for the patch!
> >
> > > From: Biju Das, Sent: Wednesday, April 10, 2019 5:08 PM
> > <snip>
> > >  static int rcar_gen2_phy_probe(struct platform_device *pdev)  {
> > >  	struct device *dev =3D &pdev->dev;
> > > @@ -238,6 +313,8 @@ static int rcar_gen2_phy_probe(struct
> > platform_device *pdev)
> > >  	struct resource *res;
> > >  	void __iomem *base;
> > >  	struct clk *clk;
> > > +	const struct phy_ops *gen2_phy_ops =3D &rcar_gen2_phy_ops;
> > > +	const u32 (*select_value)[PHYS_PER_CHANNEL]  =3D pci_select_value;
> > >  	int i =3D 0;
> > >
> > >  	if (!dev->of_node) {
> > > @@ -266,6 +343,11 @@ static int rcar_gen2_phy_probe(struct
> > platform_device *pdev)
> > >  	drv->clk =3D clk;
> > >  	drv->base =3D base;
> > >
> > > +	if (soc_device_match(soc_r8a77470)) {
> >
> > I'm not sure, but this driver also should not use the soc_device_match(=
) like
> > phy-rcar-gen3-usb2 driver?
> > If we add a special data struct and has phy_ops and select_value member=
s,
> > we can achieve not to use the soc_device_match().
>=20
> There is a difference compared to phy-rcar-gen3-usb2 driver.
> Here we are using generic compatible string for RZ/G1C.
>=20
> With the  new proposal, I need to make  following changes.
>=20
> 1)  Add r8a77470 compatible in phy_match table, fill the driver_data stru=
cture and remove soc_device_match

I think so.

> 2)  Modify the SoC dtsi to remove generic compatible string.

I don't think so. For example, r8a77990.dtsi has compatible with both "rene=
sas,usbhs-r8a77990" and "renesas,rcar-gen3-usbhs",
and then the renesas_usbhs driver has .data for renesas,usbhs-r8a77990, but=
 it is not compatible
with .data of "renesas,rcar-gen3-usbhs".

Simon-san, what do you think?

Best regards,
Yoshihiro Shimoda

> I will send V5 based on  new proposal, if you are ok for removing generic=
 compatibility.
> Please let me know.
>=20
> Regards,
> Biju
>=20
>=20
>=20

