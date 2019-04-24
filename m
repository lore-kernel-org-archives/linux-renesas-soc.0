Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD52AC282E1
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 11:12:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1918218B0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 11:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="P8pJWswp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfDXLMe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 07:12:34 -0400
Received: from mail-eopbgr1400125.outbound.protection.outlook.com ([40.107.140.125]:50622
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726441AbfDXLMe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 07:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fC0JgnQ10HrmhoCeRURVsgYrlUquiolTRTohuYsQ8o=;
 b=P8pJWswpBPLmijIVjbzkpRTtSd+mSbjLwkFNj+b1sIs0kVmLEx0IClZbBUeg+CIR4WDNB1jXXiOzFpgAMHPUUp8rIOVd87Z23lPGb5NxOVqcxU9vWdOTi7lRC1SvIbx2nYV7LvdnR50MWiJ8ld/uz5iRMBB2evTnKl6tvutPdSA=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4135.jpnprd01.prod.outlook.com (20.178.99.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Wed, 24 Apr 2019 11:11:43 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1813.017; Wed, 24 Apr 2019
 11:11:43 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig
Thread-Topic: [PATCH] ARM: shmobile: Remove GENERIC_PHY from
 shmobile_defconfig
Thread-Index: AQHU+ddL3t53bMGTbU+yfoQdpsVeB6ZK5lsAgAAncoCAAAIFQIAAGDKA////4SA=
Date:   Wed, 24 Apr 2019 11:11:43 +0000
Message-ID: <OSBPR01MB2103E36FDF7A5A38F93D37B9B83C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1556025203-59961-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVzMt0Bq6Nyky2sSRKn8pB7srG1BTeweERFNJtrTUj+ow@mail.gmail.com>
 <20190424093315.6jg7muf56d2toxl5@verge.net.au>
 <OSBPR01MB210316C686F7DFABE8013357B83C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190424110700.4q7ymsj6y62pvbji@verge.net.au>
In-Reply-To: <20190424110700.4q7ymsj6y62pvbji@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 132e38b8-3233-4647-1ac0-08d6c8a5a262
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4135;
x-ms-traffictypediagnostic: OSBPR01MB4135:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB413550F2166A0BA5A0C8471AB83C0@OSBPR01MB4135.jpnprd01.prod.outlook.com>
x-forefront-prvs: 00179089FD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(376002)(39860400002)(346002)(366004)(13464003)(199004)(189003)(51914003)(81166006)(99286004)(5660300002)(74316002)(97736004)(81156014)(53936002)(7696005)(7736002)(54906003)(6246003)(305945005)(6916009)(107886003)(316002)(86362001)(68736007)(229853002)(9686003)(4326008)(186003)(44832011)(93886005)(52536014)(66066001)(55016002)(6306002)(33656002)(486006)(8936002)(256004)(476003)(6436002)(11346002)(446003)(71190400001)(71200400001)(14454004)(76176011)(25786009)(966005)(2906002)(6506007)(53546011)(26005)(3846002)(64756008)(102836004)(66946007)(76116006)(73956011)(6116002)(66446008)(66556008)(66476007)(478600001)(8676002)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4135;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PoEwX0xPsvBR1zmjwt0k3XlKqOYCexKcs5Z6eZc1snUPir3UySrJq7aCxl8JyA3a94FdzQfFWi3bu3qvQRb9EvPdsSVsxMkqMd8DSqgjxlhhqPFUgwgx3DIjgMLQtV7buA87Dy/AOzFHNnCSWk+JV5IdkqXTmdccsccJQi9ts7qtyytYGtNu5es4WS/sA3o2X2gafRyspnpemQYkmrRXNtzS0INJ5Z5livLNb5s/KmkwIVu1CSrCnl29c6rqaYjojbCJO7APnsPe8gGQ7sWlN5vfTxeC1VtFRmrLFAyrBi0kGqrAFpIYPWRWbRGNw1nZYEnqi5qouSzQLLHGF5im2XoLbDnJ/lcJJc3WnPGlP5RlsbJGv2aGc9F0IA7w83sRJL0U+KUtNa8zqZOGzFi7K3HXm7s7O/2HYYsU+Eq2a+w=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132e38b8-3233-4647-1ac0-08d6c8a5a262
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2019 11:11:43.6309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4135
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

Thanks for the feedback.

> Subject: Re: [PATCH] ARM: shmobile: Remove GENERIC_PHY from
> shmobile_defconfig
>=20
> On Wed, Apr 24, 2019 at 09:44:11AM +0000, Biju Das wrote:
> > Hi Simon,
> >
> > Thanks for the feedback.
> >
> > I missed to add the dependency for this patch.
> >
> > This patch has dependency on
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/co
> > mmit/?h=3Dnext-20190424&id=3D5d8042e95fd471d0e342cf14f127194f1a867a01
>=20
> Thanks, but I see the same result with this patch applied on top of
>=20
> 5d8042e95fd4 phy: rcar-gen3-usb2: Add support for r8a77470

That is strange.  Have you ran make shmobile_defconfig after applying the p=
atch?

I get the following result with renesas- devel-20190423-v5.1-rc5.

CONFIG_GENERIC_PHY=3Dy                                                     =
                                                                           =
                                                                           =
                                   =20
# CONFIG_BCM_KONA_USB2_PHY is not set                                      =
     =20
# CONFIG_PHY_CADENCE_DP is not set                                         =
     =20
# CONFIG_PHY_CADENCE_DPHY is not set                                       =
     =20
# CONFIG_PHY_CADENCE_SIERRA is not set                                     =
     =20
# CONFIG_PHY_FSL_IMX8MQ_USB is not set                                     =
     =20
# CONFIG_PHY_PXA_28NM_HSIC is not set                                      =
     =20
# CONFIG_PHY_PXA_28NM_USB2 is not set                                      =
     =20
# CONFIG_PHY_CPCAP_USB is not set                                          =
     =20
# CONFIG_PHY_MAPPHONE_MDM6600 is not set                                   =
     =20
CONFIG_PHY_RCAR_GEN2=3Dy                                                   =
       =20
# CONFIG_PHY_RCAR_GEN3_PCIE is not set                                     =
     =20
CONFIG_PHY_RCAR_GEN3_USB2=3Dy  =20

Regards,
Biju

> > > -----Original Message-----
> > > From: Simon Horman <horms@verge.net.au>
> > > Sent: 24 April 2019 10:33
> > > To: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Cc: Biju Das <biju.das@bp.renesas.com>; Magnus Damm
> > > <magnus.damm@gmail.com>; Russell King <linux@armlinux.org.uk>;
> > > Linux- Renesas <linux-renesas-soc@vger.kernel.org>; Linux ARM
> > > <linux-arm- kernel@lists.infradead.org>; Geert Uytterhoeven
> > > <geert+renesas@glider.be>; Chris Paterson
> > > <Chris.Paterson2@renesas.com>; Fabrizio Castro
> > > <fabrizio.castro@bp.renesas.com>
> > > Subject: Re: [PATCH] ARM: shmobile: Remove GENERIC_PHY from
> > > shmobile_defconfig
> > >
> > > On Wed, Apr 24, 2019 at 09:12:04AM +0200, Geert Uytterhoeven wrote:
> > > > On Tue, Apr 23, 2019 at 3:20 PM Biju Das <biju.das@bp.renesas.com>
> > > wrote:
> > > > > Remove the GENERIC_PHY config option from shmobile_defconfig, as
> > > > > it is selected by PHY_RCAR_GEN3_USB2.
> > > > >
> > > > > PHY_RCAR_GEN3_USB2 is enabled by the commit
> > > > > 0cd4f4f10245d1d9616e00245
> > > > > ("ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in
> > > shmobile_defconfig").
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > >
> > > > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > This does not seem to work as expected when applied on top of
> > > renesas- devel-20190423-v5.1-rc5.
> > >
> > > Without this patch I see both CONFIG_GENERIC_PHY and
> > > CONFIG_PHY_RCAR_GEN selected. With this patch I see neither
> > > selected, I expected both.
> > >
> > > --- .config.old	2019-04-24 11:31:12.480520934 +0200
> > > +++ .config	2019-04-24 11:31:34.732852122 +0200
> > > @@ -4272,7 +4272,7 @@
> > >  #
> > >  # PHY Subsystem
> > >  #
> > > -CONFIG_GENERIC_PHY=3Dy
> > > +# CONFIG_GENERIC_PHY is not set
> > >  # CONFIG_BCM_KONA_USB2_PHY is not set  #
> CONFIG_PHY_CADENCE_DP is
> > > not set  # CONFIG_PHY_CADENCE_DPHY is not set @@ -4282,7 +4282,6
> @@
> > > # CONFIG_PHY_PXA_28NM_USB2 is not set  # CONFIG_PHY_CPCAP_USB
> is not
> > > set  # CONFIG_PHY_MAPPHONE_MDM6600 is not set -
> > > CONFIG_PHY_RCAR_GEN2=3Dy  # CONFIG_PHY_RCAR_GEN3_PCIE is not
> set  #
> > > CONFIG_PHY_RCAR_GEN3_USB3 is not set  # CONFIG_POWERCAP is not
> set
> >
