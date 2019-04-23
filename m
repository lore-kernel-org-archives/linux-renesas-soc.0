Return-Path: <SRS0=hHdZ=SZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F3AC282E1
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 10:38:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 175C72177B
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 10:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="JLOsVWqU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfDWKie (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Apr 2019 06:38:34 -0400
Received: from mail-eopbgr1400131.outbound.protection.outlook.com ([40.107.140.131]:24928
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726934AbfDWKib (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Apr 2019 06:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bw89U6PR30eXkeuPH7pb7Y62KmL3wdfQ01jn1km0x9s=;
 b=JLOsVWqUC897Bv82vScijYJ8rEdyQhcTKpqVlxuA3UQZK0QD0TlYgwKoGavrgH0H+lQFy4so+uEi73SuI5afTOKKMndr9cDJiaFh9cTxsnB49IjTuh+3bJSftHFYP/tczFUVcIpWXIXcqLpCxbwXO2QLe8PDb3BPewuBNNGFsY8=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3895.jpnprd01.prod.outlook.com (20.178.98.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Tue, 23 Apr 2019 10:38:27 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1813.017; Tue, 23 Apr 2019
 10:38:27 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 4/5] ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in
 shmobile_defconfig
Thread-Topic: [PATCH 4/5] ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in
 shmobile_defconfig
Thread-Index: AQHU9rz9FuofFE88mEGRIB/Ak5dpWaZJfjqAgAAFG9CAAA3XgP///76A
Date:   Tue, 23 Apr 2019 10:38:27 +0000
Message-ID: <OSBPR01MB2103F550C5882E1AFBB76B7EB8230@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <cover.1555654474.git.horms+renesas@verge.net.au>
 <0cd4f4f10245d1d9616e00245093f46acd198141.1555654474.git.horms+renesas@verge.net.au>
 <CAMuHMdVQZbVCGhc==bvV6N-R4NuBwnwUShvL1S9xaHcSJY5B7w@mail.gmail.com>
 <OSBPR01MB2103BC726501AF1339531D0DB8230@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190423102843.tncosz5cd3jaco6a@verge.net.au>
In-Reply-To: <20190423102843.tncosz5cd3jaco6a@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bff73130-3b03-4926-5a4f-08d6c7d7d216
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3895;
x-ms-traffictypediagnostic: OSBPR01MB3895:
x-microsoft-antispam-prvs: <OSBPR01MB3895111639DD3FF9681B2454B8230@OSBPR01MB3895.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0016DEFF96
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(136003)(366004)(396003)(376002)(51914003)(189003)(199004)(51444003)(26005)(76176011)(7696005)(316002)(93886005)(73956011)(71190400001)(66066001)(76116006)(7736002)(99286004)(8936002)(66556008)(4744005)(66476007)(66946007)(97736004)(86362001)(2906002)(66446008)(64756008)(71200400001)(6506007)(81166006)(446003)(74316002)(53936002)(6916009)(6246003)(305945005)(33656002)(68736007)(14454004)(186003)(44832011)(8676002)(25786009)(229853002)(6436002)(478600001)(54906003)(4326008)(9686003)(3846002)(11346002)(6116002)(486006)(102836004)(55016002)(52536014)(476003)(5660300002)(81156014)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3895;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QJyvD21iXo1N8kM57Mibybqv2gDj//IVV1wUKOZ8J1tYOHftySG2IAUr57V+CRvJBwxdTzaSx8HjorD9xt/dQRI9/VfkI+ugwbMnA2KZ5MpNMGMNLrFXy9RWM55/Xgz9ID5F63uLFSjgA5ERTkxD6ffmWZISscJ9oZVZln41DvPp1o8Jqi0PjVhzTZjMTMRC6F68PbUKZOsvqJ7L17lID8C24ftSDPCdxxItCtyOze2m47H5ocHjxqhoVE8YUixa1vbeP2JuIbZJ+Y8FIXFvUjydyB8IVtJVny8oU6JGYFllkCUAWVi6psdZTRC4G8o2RDQq8l43PRYndE/yjl/mgoSWIpCkdd6zTB+GOMxx+N599XWG2oovdScY0So658/RTTOKTtmFy+z4nP82Ah5h3qeyy3NWdBpvlzSApRVZjPg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff73130-3b03-4926-5a4f-08d6c7d7d216
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2019 10:38:27.4359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3895
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

Thanks for the feedback.

> Subject: Re: [PATCH 4/5] ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in
> shmobile_defconfig
>=20
> On Tue, Apr 23, 2019 at 09:45:18AM +0000, Biju Das wrote:
> > Hi Geert,
> >
> > Thanks for the feedback.
> >
> > Simon,
> >
> > How do you want to address this? A new patch for  taking out
> "CONFIG_GENERIC_PHY=3Dy"
> > from shmobile_defconfig  ?? Please let us know.
>=20
> Hi Biju,
>=20
> yes, I think that an incremental patch would be best.

Ok. Will send an incremental patch to take out " CONFIG_GENERIC_PHY=3Dy" fr=
om shmobile_defconfig .

Regards,
Biju
