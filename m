Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A183C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 11:09:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BB1620857
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 11:09:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="CeGARJFl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbfDBLJz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 07:09:55 -0400
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:8480
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725922AbfDBLJz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 07:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MySjBtDtXDacp+7u9m5DD3hBTI3+hUtwqb2+2rHPPDE=;
 b=CeGARJFlgM97XOmp4qTexzABlHmINPWPup7V4k5JZP3MQ8YiROf/fxS/i7VQ8zrghWSTN6RwNo4RmmB7FUtqq4oO2lL1DgGzlaa8RdY9rc77DEBYaHEyAN4ZKDvX5iYF9E5iSXYNZGWVkLMT5x4NR/sOerw6zF++ySgu/+Golns=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB4333.jpnprd01.prod.outlook.com (20.179.173.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.17; Tue, 2 Apr 2019 11:09:50 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1750.017; Tue, 2 Apr 2019
 11:09:50 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Arnd Bergmann <arnd@arndb.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 1/4] usb: common: Consider only available nodes for
 dr_mode
Thread-Topic: [PATCH 1/4] usb: common: Consider only available nodes for
 dr_mode
Thread-Index: AQHU0B7eErGhE/vMCk28vL9eutYCg6YoS1aggAB/jACAABbzYA==
Date:   Tue, 2 Apr 2019 11:09:50 +0000
Message-ID: <TYAPR01MB4271277BF22B6EAE0A6313D1D8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYAPR01MB427119513E310A30792924E7D8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
 <TY1PR01MB1770C3AF8E4E5386319FDCF9C0560@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770C3AF8E4E5386319FDCF9C0560@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff97b05a-70fb-42e9-1e7a-08d6b75bb9b3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TYAPR01MB4333;
x-ms-traffictypediagnostic: TYAPR01MB4333:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB43334B1B884365766EA16FC4D8560@TYAPR01MB4333.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0995196AA2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(346002)(376002)(396003)(366004)(136003)(199004)(189003)(43544003)(256004)(478600001)(68736007)(74316002)(6116002)(93886005)(55016002)(305945005)(54906003)(446003)(8676002)(14454004)(966005)(2906002)(11346002)(7736002)(186003)(81156014)(486006)(66066001)(8936002)(3846002)(97736004)(106356001)(6436002)(6246003)(26005)(9686003)(6306002)(71190400001)(71200400001)(86362001)(53546011)(229853002)(5660300002)(14444005)(4326008)(81166006)(33656002)(105586002)(99286004)(110136005)(25786009)(6506007)(52536014)(76176011)(316002)(476003)(7696005)(53936002)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4333;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yq0jYxDqW4xrzm0eqL/hzrARquzpFSY/lAMhD5S8ZbBiGRWW/ZqYxqcKrEa+tUbi4L7WDFmA/6J1Xu3fMOw6CTr5UN5I32BUPP3k//kPaDrMdKTPcNOCDZfFWRrx80HcZWOYEYwB1I6x+DXTYdZ/c/HhEEVBlIdyOj6RpufxZMWOxg4WgC53O4bQVg0SDXsHGmis0tT3QC37kPV4+xvTb+mD2DFI7kYhdqdlmhwadozlhKjdJd1HfFqv0OJaWhNMnfoM5DJ6ZKXtyCJcAWh0e4JtGPprMKC0PF3sV+T4WpIhNBdS2SKfqKtBolA7Pnzf7pVsrxw37vC9K14SzkHEoj+LDmxi2Q1e4I5bkpXc+7+EwTa1QtPhjfmUKAu4JiwaE1NnAu9EVjRbhpPR3fbz4pkWbMHVKuhRJ1/cH7eDc2k=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff97b05a-70fb-42e9-1e7a-08d6b75bb9b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2019 11:09:50.2272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4333
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio-san,

> From: Fabrizio Castro, Sent: Tuesday, April 2, 2019 6:22 PM
>=20
> Hi Yoshihiro-san,
>=20
> Thank you for your feedback.
>=20
> > From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Sent: 02 April 2019 02:54
> > Subject: RE: [PATCH 1/4] usb: common: Consider only available nodes for=
 dr_mode
> >
> > Hi Fabrizio-san,
> >
> > Thank you for the patch!
> >
> > > From: Fabrizio Castro, Sent: Friday, March 1, 2019 8:06 PM
> > >
> > > There are cases where multiple device tree nodes point to the
> > > same phy node by means of the "phys" property, but we should
> > > only consider those nodes that are marked as available rather
> > > than just any node.
> > >
> > > Fixes: 98bfb3946695 ("usb: of: add an api to get dr_mode by the phy n=
ode")
> > > Cc: stable@vger.kernel.org # v4.4+
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > ---
> >
> > I'm guessing this code needs for phy-rcar-gen3-usb2.c only because
> > the phy driver only gets the dr_mode from index 0 like below:
> >
> > 	channel->dr_mode =3D of_usb_get_dr_mode_by_phy(dev->of_node, 0);
> >
> > Yesterday, I submitted patches to get multiple indexes from controller
> > device nodes:
> >
> > https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D9=
9561
> >
> > So, would you check the phy patches can get the dr_mode without this ch=
anging common patch?
>=20
> I will go through your patch series, but I can't see why any driver would=
 be interested
> in considering a disabled node for getting dr_mode, can you?
> Do you have a use case for this?

This is not a use case though, the commit 98bfb3946695 is made by a TI engi=
neer so that
I checked TI's dts/dtsi file on armv7 arch (am335x-boneblue.dts) a little a=
nd then
it has one usb controller node only. So, the commit didn't take care of a d=
isabled node, I guess.
However, as you know, on R-Car Gen3 and RZ/G2, they have multiple controlle=
r nodes. So,
one of the controller can be disabled.

By the way, if we applied this patch, since the behavior will be changed at=
 least,
so all of this api user have to test whether this code doesn't break or not=
.

Best regards,
Yoshihiro Shimoda

> Thanks,
> Fab
>=20
> >
> > Best regards,
> > Yoshihiro Shimoda
> >
> > >  drivers/usb/common/common.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.=
c
> > > index 48277bb..73c8e65 100644
> > > --- a/drivers/usb/common/common.c
> > > +++ b/drivers/usb/common/common.c
> > > @@ -145,6 +145,8 @@ enum usb_dr_mode of_usb_get_dr_mode_by_phy(struct=
 device_node *np, int arg0)
> > >
> > >  	do {
> > >  		controller =3D of_find_node_with_property(controller, "phys");
> > > +		if (!of_device_is_available(controller))
> > > +			continue;
> > >  		index =3D 0;
> > >  		do {
> > >  			if (arg0 =3D=3D -1) {
> > > --
> > > 2.7.4

