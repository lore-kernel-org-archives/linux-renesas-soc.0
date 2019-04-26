Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3112C4321A
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 10:14:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 937B52077B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 10:14:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Th6D72fA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbfDZKOe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 06:14:34 -0400
Received: from mail-eopbgr1400097.outbound.protection.outlook.com ([40.107.140.97]:3616
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725935AbfDZKOe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 06:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75X/My3mQZ+dsP4o5t9e12eCt2qXj7Y2R3+tFgW879I=;
 b=Th6D72fAvRgLXBAHU8Pbs2pPzvtmhnKtbuJdASCt3TOSQNxes/cyfccCjc4wVhbpF3PDY5s3QuCUzyko6B48C8wl859ogpuyjPczg7SN7R2ti8BSRKHs01lvy8D+/tV6P5rI6+XVvXJPZvjbZ4GNGHBvZitwnsOp5UE89Hlkrw8=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3190.jpnprd01.prod.outlook.com (52.134.255.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Fri, 26 Apr 2019 10:14:26 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1813.017; Fri, 26 Apr 2019
 10:14:26 +0000
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
Thread-Index: AQHU+ddL3t53bMGTbU+yfoQdpsVeB6ZK5lsAgAAncoCAAAIFQIAAGDKA////4SCAAxWUgP///9GQ
Date:   Fri, 26 Apr 2019 10:14:26 +0000
Message-ID: <OSBPR01MB21030095151CBAD62DF6F7F7B83E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1556025203-59961-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVzMt0Bq6Nyky2sSRKn8pB7srG1BTeweERFNJtrTUj+ow@mail.gmail.com>
 <20190424093315.6jg7muf56d2toxl5@verge.net.au>
 <OSBPR01MB210316C686F7DFABE8013357B83C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190424110700.4q7ymsj6y62pvbji@verge.net.au>
 <OSBPR01MB2103E36FDF7A5A38F93D37B9B83C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190426101239.syq534l5awlinzb2@verge.net.au>
In-Reply-To: <20190426101239.syq534l5awlinzb2@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04966da3-3540-42e3-7411-08d6ca2ff69b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3190;
x-ms-traffictypediagnostic: OSBPR01MB3190:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB31905DED8180AB142FA8BD2CB83E0@OSBPR01MB3190.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 001968DD50
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(136003)(346002)(366004)(376002)(396003)(51914003)(189003)(199004)(5660300002)(7736002)(6116002)(6916009)(102836004)(305945005)(6506007)(54906003)(26005)(2906002)(52536014)(86362001)(66946007)(55016002)(66066001)(14454004)(71200400001)(66446008)(107886003)(64756008)(6306002)(3846002)(9686003)(73956011)(186003)(66476007)(53936002)(71190400001)(76116006)(4326008)(6436002)(66556008)(6246003)(25786009)(316002)(81166006)(8936002)(33656002)(966005)(97736004)(446003)(8676002)(229853002)(11346002)(93886005)(476003)(81156014)(256004)(99286004)(74316002)(7696005)(486006)(44832011)(68736007)(478600001)(76176011)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3190;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zyPgyFm5S3B9lK40U+NU0gB5t+QNnP4FS44+5mtdwUki/HyOTg+2QxzmNeUNGoTiHskypFW3bpYGjeYn4LdPhS1B0vXool4IlUCP5StiQ9GU9flW//j0YomcyKAVWfKVmKicqAuhiDr86H0HjbsRkHvZ3dihbJDNHQ4XivMTSZEGuIsKUyco6CitMWGyEiWZHVj0Vajs2fcPJ6nOqrDSyMVEZuNiZpqVdjonA3iVGhtI5MLplvnHh82ceGmMDz+dHYXb4Ra94N1crQzuuSAi2H0UwqoP3F5OyfeMJOf8Tw6xh/JcMp8SDlMEHD/F8vFprOO8ZMizX23itsKc/43/yf8UqKeLv/4IgmydbqAMWCSCrMJriFBBKoXZ8yrJ7krAE7uxFczc5IRMAZhq2vo4O0oKcqciu7QDc8FsUQ0ZJBM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04966da3-3540-42e3-7411-08d6ca2ff69b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2019 10:14:26.7339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3190
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> Subject: Re: [PATCH] ARM: shmobile: Remove GENERIC_PHY from
> shmobile_defconfig
>=20
> On Wed, Apr 24, 2019 at 11:11:43AM +0000, Biju Das wrote:
> > Hi Simon,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH] ARM: shmobile: Remove GENERIC_PHY from
> > > shmobile_defconfig
> > >
> > > On Wed, Apr 24, 2019 at 09:44:11AM +0000, Biju Das wrote:
> > > > Hi Simon,
> > > >
> > > > Thanks for the feedback.
> > > >
> > > > I missed to add the dependency for this patch.
> > > >
> > > > This patch has dependency on
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi
> > > > t/co
> > > > mmit/?h=3Dnext-
> 20190424&id=3D5d8042e95fd471d0e342cf14f127194f1a867a01
> > >
> > > Thanks, but I see the same result with this patch applied on top of
> > >
> > > 5d8042e95fd4 phy: rcar-gen3-usb2: Add support for r8a77470
> >
> > That is strange.  Have you ran make shmobile_defconfig after applying t=
he
> patch?
> >
> > I get the following result with renesas- devel-20190423-v5.1-rc5.
>=20
> Thanks, I also see things working fine with both
> * [PATCH] ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig
> * 5d8042e95fd4 phy: rcar-gen3-usb2: Add support for r8a77470 applied on
> top of renesas-devel-20190423-v5.1-rc5
>=20
> I think I can go ahead and apply
> [PATCH] ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig
> once I rebase my branches on v5.2-rc1, agter it has been release and
> assuming it includes
> 5d8042e95fd4 phy: rcar-gen3-usb2: Add support for r8a77470

Thanks Simon.

Regards,
Biju
