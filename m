Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A3BC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 11:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE59E208E4
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 11:33:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="e/TSqyGl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730560AbfDBLdk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 07:33:40 -0400
Received: from mail-eopbgr1410108.outbound.protection.outlook.com ([40.107.141.108]:6076
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726930AbfDBLdk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 07:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvJy9J6YTUdwcAuVpzlnqkn/uFGxb/KffK8+Meb6WHI=;
 b=e/TSqyGlkiYIxEbf8muLqccFkf9vqPqVauUHv7Yrp8vLi4DMW4AcWSzhpBoKAkkhSFPl3eabEdPBOnR3ncmcjKccjKLFonDyVSisvFG9YWtwn2x2tNxD9zu7En1LiUqjfY22eXg9/ApAI5DaE8CYV4i7FzD1Hf3xq/tjwDxhFaI=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4823.jpnprd01.prod.outlook.com (20.179.182.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.22; Tue, 2 Apr 2019 11:33:36 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::f9a1:af9d:75cf:5fd5]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::f9a1:af9d:75cf:5fd5%5]) with mapi id 15.20.1750.021; Tue, 2 Apr 2019
 11:33:36 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jianguo Sun <sunjianguo1@huawei.com>,
        Avi Fishman <AviFishman70@gmail.com>,
        Ofer Heifetz <oferh@marvell.com>,
        Lubomir Rintel <lkundrak@v3.sk>, Ran Wang <ran.wang_1@nxp.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for
 Renesas RZ/G1C devices
Thread-Topic: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for
 Renesas RZ/G1C devices
Thread-Index: AQHU6IrkveTjmRhPkUqnbMZJThSNPKYoRhcAgABtysA=
Date:   Tue, 2 Apr 2019 11:33:35 +0000
Message-ID: <OSBPR01MB21031E90ABBFD7F91C9BC86DB8560@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
 <1554123232-58942-5-git-send-email-biju.das@bp.renesas.com>
 <TYAPR01MB4271F314B7706AA24131EBB1D8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4271F314B7706AA24131EBB1D8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c073a993-8b8e-4781-4d8a-08d6b75f0b73
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4823;
x-ms-traffictypediagnostic: OSBPR01MB4823:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <OSBPR01MB48235930B7316D834E6B4E85B8560@OSBPR01MB4823.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0995196AA2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(346002)(396003)(366004)(136003)(51914003)(189003)(199004)(6306002)(86362001)(25786009)(7696005)(9686003)(11346002)(476003)(446003)(53936002)(105586002)(106356001)(316002)(81156014)(5660300002)(7736002)(54906003)(52536014)(81166006)(55016002)(44832011)(74316002)(486006)(305945005)(99286004)(8936002)(7416002)(6246003)(110136005)(4326008)(8676002)(186003)(26005)(76176011)(6506007)(102836004)(2171002)(68736007)(2906002)(966005)(97736004)(66066001)(14444005)(256004)(33656002)(478600001)(71190400001)(71200400001)(6116002)(6436002)(3846002)(229853002)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4823;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AWVAJqjHterkgnuc6Ht9fq29TQHU1R3cb7Ww6McJtLnWpgi2/uktwFnttuczi7TrmWx2PIK1qvKZLnR574GsZ5i5EKcGFKHhnzKn5mbKnNcRPBuapZuj67b9b0fDt4e+/SxRcaLsMqhTKaJ81z6iHW2sHv7GhhVpMurB5wVoXto0QWkfmx5+f5Qx/LKVSVooXqQVeJ0M7R5YsDOHM9KefeQCpPnWkOGHIuQr3donnOQsp9cSV4P+rqfHafKBe7d9uiCdXNnFpZYGqG5Al03rYdIRlgpJZNXc9SgrEDuesbyblS+QLWfHYjjXBh1l4n6pUqspEs/aVx4u+u1gnqeSXT+1l5aEEqUdlYBcDuXVxOGc4b5fM+GjAbLySy7Cmt3LkNdKOIcUXn5VCo9tuqiNnvpJfmL+xiNxWxTG/epnuHs=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c073a993-8b8e-4781-4d8a-08d6b75f0b73
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2019 11:33:35.9894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4823
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for
> Renesas RZ/G1C devices
>=20
> Hi Biju-san,
>=20
> Thank you for the patch!
>=20
> > From: Biju Das, Sent: Monday, April 1, 2019 9:54 PM
> <snip>
> > +/******* USB2.0 Host registers (original offset is +0x100) *******/
> > +#define USB2_INT_ENABLE			0x100
> > +#define USB2_SPD_RSM_TIMSET		0x20c
> > +#define USB2_OC_TIMSET			0x210
> > +
> > +#define USB2_INT_ENABLE_USBH_INTB_EN	BIT(2)
> > +#define USB2_INT_ENABLE_USBH_INTA_EN	BIT(1)
> > +#define USB2_INT_ENABLE_INIT
> 	(USB2_INT_ENABLE_USBH_INTB_EN | \
> > +					 USB2_INT_ENABLE_USBH_INTA_EN)
> > +
> > +#define USB2_SPD_RSM_TIMSET_INIT	0x014e029b
> > +#define USB2_OC_TIMSET_INIT		0x000209ab
>=20
> I should have notice this codes at the previous patch though, I'm thinkin=
g we
> can reuse the R-Car Gen3 codes because these values are similar with the
> phy-rcar-gen3-usb2.c like below:
> ----------------------------------------------------------------------
> /* INT_ENABLE */
> #define USB2_INT_ENABLE_UCOM_INTEN	BIT(3)
> #define USB2_INT_ENABLE_USBH_INTB_EN	BIT(2)
> #define USB2_INT_ENABLE_USBH_INTA_EN	BIT(1)
> #define USB2_INT_ENABLE_INIT
> 	(USB2_INT_ENABLE_UCOM_INTEN | \
> 					 USB2_INT_ENABLE_USBH_INTB_EN
> | \
> 					 USB2_INT_ENABLE_USBH_INTA_EN)
> <snip>
> /* SPD_RSM_TIMSET */
> #define USB2_SPD_RSM_TIMSET_INIT	0x014e029b
>=20
> /* OC_TIMSET */
> #define USB2_OC_TIMSET_INIT		0x000209ab
> ----------------------------------------------------------------------
>=20
> If so, we can use ehci-platform.c and ohci-platform.c as-is. In this case=
, the
> "phy: renesas: phy-rcar-gen2: Add support for r8a77470" driver should be
> initialized at first to release PLLRESET. And then, the phy-rcar-gen3-usb=
2
> driver would be initialized as second step. I think we can set these resi=
sters at
> phy_init timing because the following patch did so:
>=20
>   https://patchwork.kernel.org/patch/10655855/
>=20
> What do you think?

Good catch. This solution will avoid overlapping regions as mentioned by Ro=
b in the below patch and  also will avoid modifying ehci-platform.c  as sug=
gested by Alen.=20
https://patchwork.kernel.org/patch/10655853/

I will send V3 based on this solution. Please let me know, if you think oth=
erwise.

Regards,
Biju


