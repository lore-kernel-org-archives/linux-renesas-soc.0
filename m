Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4F6C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 13:09:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 686082084F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 13:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="DINFHOrW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfDINJJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 09:09:09 -0400
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:6172
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726112AbfDINJJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 09:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGzMyZ1KXBm4/6/wbtkYn9TAWv5Imqxtulmo0t3r0+U=;
 b=DINFHOrWnYHcbaG3XCQEKWzNcPs8xMN6TN2sJJNV3umqiEQaWV5gW0wbJOZPAhCLubkhVh1buxL5RTtfJ5ixr9iWd3eP0szgKdvEOAjshNR9QQViIMLq/sGzBsO/QaiE7uaxDtsUiXEOaRa1NcniP1N9XHyFU/jieV/wVQ7Uepw=
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com (52.133.176.147) by
 TYAPR01MB2591.jpnprd01.prod.outlook.com (20.177.102.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.18; Tue, 9 Apr 2019 13:09:02 +0000
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::149e:7303:9d5c:9f41]) by TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::149e:7303:9d5c:9f41%2]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 13:09:02 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
CC:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: [PATCH V3 04/13] phy: rcar-gen3-usb2: Add support for r8a77470
Thread-Topic: [PATCH V3 04/13] phy: rcar-gen3-usb2: Add support for r8a77470
Thread-Index: AQHU6gjyqdd4KsYgRU6jaEiK9Ns87qYzrEKAgAAXrCA=
Date:   Tue, 9 Apr 2019 13:09:02 +0000
Message-ID: <TYAPR01MB211169ABE7310F4DE70077B5B82D0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-5-git-send-email-biju.das@bp.renesas.com>
 <TYAPR01MB42715DF4B56F97FA83AB68AED82D0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB42715DF4B56F97FA83AB68AED82D0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a4033a4-2660-4acc-e8c6-08d6bcec897f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB2591;
x-ms-traffictypediagnostic: TYAPR01MB2591:
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <TYAPR01MB259148E6677D330BE67BBDF2B82D0@TYAPR01MB2591.jpnprd01.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(346002)(376002)(136003)(39860400002)(51914003)(189003)(199004)(53936002)(74316002)(6306002)(14454004)(6246003)(102836004)(478600001)(6116002)(9686003)(55016002)(3846002)(99286004)(97736004)(966005)(6506007)(305945005)(54906003)(110136005)(256004)(4326008)(7736002)(186003)(316002)(25786009)(26005)(33656002)(229853002)(446003)(11346002)(66066001)(105586002)(5660300002)(486006)(476003)(2906002)(106356001)(52536014)(44832011)(68736007)(71200400001)(81166006)(8936002)(81156014)(86362001)(76176011)(7696005)(71190400001)(8676002)(6436002)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2591;H:TYAPR01MB2111.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fBKBzWmhibjbEjrGtJ8QCffJdrU12FcqXhwPaNqJkWoL56asCHobs71Ia+j1dbX8Ux3DhAJKvT7UQzB5X8KHo1xovrAFy1vaUqIVvCH7oaNXgp/Iv8PHKIgfKlv+mhY5+8RFvjpzlcVAxW+pWLPuGpCPPBqgBFctabBCOucH/RAKiA1sq3LPnBLjKJj5i3d6PFssJC9CNvpCS+A8dmwzA/SNz+0BN17rugv39hm6yW4DdCvC7/dtvq1XlfAv0fi2+DhznXFdY9B7dTsRMRnW1fMyY+VKuPGuKxiiB8zWkyBLrmw9nhGiK2S4h9Umkd0Py+zWiGGyVuEc+IDbQ9xaRLlCL79L+jOr1YcRNgP8aTBnD4Tywnf6yegBD/qx2WHP3l612cFDD5wikwOb2dl+fJbhsmgt7JuU6MvYrk3enmI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4033a4-2660-4acc-e8c6-08d6bcec897f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 13:09:02.3227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2591
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH V3 04/13] phy: rcar-gen3-usb2: Add support for r8a774=
70
>=20
> Hi Biju-san,
>=20
> Thank you for the patch!
>=20
> > From: Biju Das, Sent: Wednesday, April 3, 2019 7:29 PM
> >
> > This patch adds support for r8a77470 (RZ/G1C). We can reuse this
> > driver for initializing timing/interrupt generation registers.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
>=20
> It seems good to me. However, since Fabrizio-san and I have submitted
> patch(es) for the driver around the same time, I'm confusing how to handl=
e
> this patch.
>=20
> < At March 1, 2019, 11:05 a.m. UTC >
> https://patchwork.kernel.org/patch/10834975/
>=20
> - Kishon-san said "merged" at April 1, but I mentioned this patch breaks =
R-Car
> D3.
> - I checked today's his repo, but it doesn't seem to merge it.
> - I don't get any feedback.
>=20
> < At April 1, 2019, 12:01 p.m. UTC >
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D995=
61
>=20
> - Got Simon-san and Fabrizio-san's review.
>=20
> and then,
>=20
> < At April 3, 2019, 10:28 a.m. UTC >
> https://patchwork.kernel.org/patch/10883265/
>=20
> > V1-->V2
> >  * Incorporated shimoda-san's review comment
> >  Ref: https://patchwork.kernel.org/patch/10655855/
> > ---
> >  drivers/phy/renesas/Kconfig              |  2 +-
> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 19 ++++++++++++++++++-
> >  2 files changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
> > index e340a92..961ccb1 100644
> > --- a/drivers/phy/renesas/Kconfig
> > +++ b/drivers/phy/renesas/Kconfig
> > @@ -19,7 +19,7 @@ config PHY_RCAR_GEN3_PCIE  config
> PHY_RCAR_GEN3_USB2
> >  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
> >  	depends on ARCH_RENESAS
> > -	depends on EXTCON
> > +	depends on EXTCON || ARCH_R8A77470
>=20
> If EXTCON=3Dm, build error might happen like below.
> https://marc.info/?l=3Dlinux-renesas-soc&m=3D154220057305761&w=3D2
>=20
> Is it enough about "depends on EXTCON || !EXTCON" for your environment?

Yes, it is fine. I will send V4 with this change along with kishon's review=
 comment.

Regards,
Biju
