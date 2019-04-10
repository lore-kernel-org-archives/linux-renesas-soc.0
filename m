Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184E2C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 10:08:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD4A52133D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 10:08:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="BW6bcCnf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbfDJKIP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 06:08:15 -0400
Received: from mail-eopbgr1410108.outbound.protection.outlook.com ([40.107.141.108]:26071
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728543AbfDJKIP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 06:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyGYKT2FpfIsdBXqcPEO5Em2w18bqez1UAbi2jg7Nuk=;
 b=BW6bcCnfYKHDdIvDka4WlaGtSOJtpwbyBQLoSPmUknSaf854FbphlUVDXYqNXaC5/TCWwzLsCIHI7hyTZGyxpn17D8F8/EtJVq2JB0rEsy4Us1ebEEWXz2kVNrr/nD38GI188G+WjtSUwyUS0NTJqs+mtRBqeVTFLKyJaFRNmA8=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3639.jpnprd01.prod.outlook.com (20.178.96.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.15; Wed, 10 Apr 2019 10:08:06 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1792.009; Wed, 10 Apr 2019
 10:08:06 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
CC:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH V4 02/13] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Thread-Topic: [PATCH V4 02/13] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Thread-Index: AQHU73WInteWCitmn0GPOslu0bKW6KY1Jn2A////1VA=
Date:   Wed, 10 Apr 2019 10:08:05 +0000
Message-ID: <OSBPR01MB210385B7A35C72E6C1A37EEDB82E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
 <1554883715-41725-3-git-send-email-biju.das@bp.renesas.com>
 <TYAPR01MB427138C68589972EB9385E95D82E0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB427138C68589972EB9385E95D82E0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c3d2e16-3600-45dd-a679-08d6bd9c6d22
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3639;
x-ms-traffictypediagnostic: OSBPR01MB3639:
x-microsoft-antispam-prvs: <OSBPR01MB36392B8B697C901ECD96005CB82E0@OSBPR01MB3639.jpnprd01.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(51914003)(199004)(189003)(7736002)(6246003)(256004)(86362001)(74316002)(305945005)(11346002)(33656002)(186003)(99286004)(26005)(476003)(446003)(486006)(3846002)(66066001)(6116002)(52536014)(2906002)(9686003)(229853002)(7696005)(71190400001)(4326008)(102836004)(55016002)(71200400001)(5660300002)(6436002)(498600001)(561944003)(76176011)(6506007)(8676002)(8936002)(81166006)(81156014)(14454004)(53936002)(105586002)(54906003)(25786009)(110136005)(106356001)(44832011)(68736007)(97736004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3639;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lzMY1p4XanxX2sCrzZjtMcltTRxP89+uU9NvwpMoogOitKxc0H64GbkH8RcmP5hO8OnBViDgsDmqM5pUt2aDa94f5LyuWzw9jN8KUuB+Y+QpyzWSuZ/WUBnJo6HPnvO/PyBevkbloRm6SEMWGe4P8T8iSqmwFqCR6RnZsO1CwKfz7Jh0aUxgj+KnQejGEJeQu84KA81VR553As4oQzYn1HmdVOaAusFp77Ui947osaoHup9c0dQSUzVw2st4BcmQNePY9yRcZreKBPLm89WlxkpTnWakumeSQCvWc/FL3lyeY9Moe78Ic9oLHuBv8Ug2mKFsSbSP0IuSaV19mh9c3RbwJJB+OALgnmKoQ5FP3V4eZasgh9ErQKALC+DIn9eH2dMw4VmM+IA2s0YAC2NzydZI4ku1C1kUSyNVn+A8AYk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3d2e16-3600-45dd-a679-08d6bd9c6d22
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 10:08:05.9886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3639
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH V4 02/13] phy: renesas: phy-rcar-gen2: Add support fo=
r
> r8a77470
>=20
> Hi Biju-san,
>=20
> Thank you for the patch!
>=20
> > From: Biju Das, Sent: Wednesday, April 10, 2019 5:08 PM
> <snip>
> >  static int rcar_gen2_phy_probe(struct platform_device *pdev)  {
> >  	struct device *dev =3D &pdev->dev;
> > @@ -238,6 +313,8 @@ static int rcar_gen2_phy_probe(struct
> platform_device *pdev)
> >  	struct resource *res;
> >  	void __iomem *base;
> >  	struct clk *clk;
> > +	const struct phy_ops *gen2_phy_ops =3D &rcar_gen2_phy_ops;
> > +	const u32 (*select_value)[PHYS_PER_CHANNEL]  =3D pci_select_value;
> >  	int i =3D 0;
> >
> >  	if (!dev->of_node) {
> > @@ -266,6 +343,11 @@ static int rcar_gen2_phy_probe(struct
> platform_device *pdev)
> >  	drv->clk =3D clk;
> >  	drv->base =3D base;
> >
> > +	if (soc_device_match(soc_r8a77470)) {
>=20
> I'm not sure, but this driver also should not use the soc_device_match() =
like
> phy-rcar-gen3-usb2 driver?
> If we add a special data struct and has phy_ops and select_value members,
> we can achieve not to use the soc_device_match().

There is a difference compared to phy-rcar-gen3-usb2 driver.
Here we are using generic compatible string for RZ/G1C.=20

With the  new proposal, I need to make  following changes.

1)  Add r8a77470 compatible in phy_match table, fill the driver_data struct=
ure and remove soc_device_match
2)  Modify the SoC dtsi to remove generic compatible string.

I will send V5 based on  new proposal, if you are ok for removing generic c=
ompatibility.
Please let me know.

Regards,
Biju


=20

