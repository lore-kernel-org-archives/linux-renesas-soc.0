Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF53AC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 09:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 674BD20856
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 09:22:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="K1bBtMj2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730069AbfDBJWW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 05:22:22 -0400
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:53280
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726496AbfDBJWV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 05:22:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6p6Ly0yYEWDY/NpBmsVVwu100LMwgl6nrQO24c0NUs4=;
 b=K1bBtMj2Ak3lieTYnDmsTVODznCdmMuNKxFIkE1uoAPvysqTvexFeNK/sSyd8AQ2HoZEyWgVeG1D5sI6gpqr1/UsFXQR9Q/61bnFO13EvucA8ejqic5ueL57IKZ06dr1CKDHzZFAYa9WuDtE05OoSfrsgUoFXxYpn2sb9Wnrvqo=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1515.jpnprd01.prod.outlook.com (52.133.161.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.17; Tue, 2 Apr 2019 09:22:16 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273%4]) with mapi id 15.20.1750.017; Tue, 2 Apr 2019
 09:22:16 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
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
Thread-Index: AQHU0B7eVPBQi3ZSt0SjcyDgALOUSKYoTZ8AgAB7FvA=
Date:   Tue, 2 Apr 2019 09:22:16 +0000
Message-ID: <TY1PR01MB1770C3AF8E4E5386319FDCF9C0560@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYAPR01MB427119513E310A30792924E7D8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB427119513E310A30792924E7D8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 891134b8-95c6-4860-bb8f-08d6b74cb2fe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TY1PR01MB1515;
x-ms-traffictypediagnostic: TY1PR01MB1515:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TY1PR01MB1515CA4F84FEB1055C822709C0560@TY1PR01MB1515.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0995196AA2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(376002)(39860400002)(346002)(136003)(189003)(199004)(446003)(316002)(106356001)(14444005)(71200400001)(54906003)(256004)(476003)(110136005)(71190400001)(99286004)(74316002)(97736004)(66066001)(7736002)(76176011)(102836004)(186003)(7696005)(6506007)(26005)(6436002)(486006)(44832011)(966005)(8936002)(33656002)(81166006)(14454004)(305945005)(11346002)(9686003)(229853002)(55016002)(8676002)(6246003)(53936002)(53546011)(478600001)(4326008)(25786009)(105586002)(81156014)(86362001)(6116002)(3846002)(2906002)(68736007)(5660300002)(6306002)(52536014);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1515;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sZCpYz08VxhSNefKIdy9B3b8cm0heCYEUC1lh71fNFTFz57hZEng4DPvodArHbWzmfNazCPP70v7sACDu7qORlD6k0wWnse65QSe7Swu8u5GCdyUqCQUzrNGf7CXA/iPXbXmSgZahUtNBQ/D54WchKnd13HAYE23INgGVkIjoXmIthipkubPErijR4cTt/bcXo7Y/UdqdBv9fso/cf1PIUbudlSC47aXHomGqsPgqYkvWXUnUsBaixCMlIDr64wvHc/nR+542A5aW5XHwT+hqTsrs3XoKnDph0WRCS8XODurqoEDVNC+yeqbDYUL+nPDupWNIYjX2vPgGl/Fquei1nKbxAwa0UVOAfh9AcubXey8JfbINqpZJyLURI2pcLVIW3ZXZKFUk7Ieg43tg7KnIw9tZsi0bMt640ggW7aeSao=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 891134b8-95c6-4860-bb8f-08d6b74cb2fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2019 09:22:16.7219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1515
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yoshihiro-san,

Thank you for your feedback.

> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Sent: 02 April 2019 02:54
> Subject: RE: [PATCH 1/4] usb: common: Consider only available nodes for d=
r_mode
>=20
> Hi Fabrizio-san,
>=20
> Thank you for the patch!
>=20
> > From: Fabrizio Castro, Sent: Friday, March 1, 2019 8:06 PM
> >
> > There are cases where multiple device tree nodes point to the
> > same phy node by means of the "phys" property, but we should
> > only consider those nodes that are marked as available rather
> > than just any node.
> >
> > Fixes: 98bfb3946695 ("usb: of: add an api to get dr_mode by the phy nod=
e")
> > Cc: stable@vger.kernel.org # v4.4+
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
>=20
> I'm guessing this code needs for phy-rcar-gen3-usb2.c only because
> the phy driver only gets the dr_mode from index 0 like below:
>=20
> 	channel->dr_mode =3D of_usb_get_dr_mode_by_phy(dev->of_node, 0);
>=20
> Yesterday, I submitted patches to get multiple indexes from controller
> device nodes:
>=20
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D995=
61
>=20
> So, would you check the phy patches can get the dr_mode without this chan=
ging common patch?

I will go through your patch series, but I can't see why any driver would b=
e interested
in considering a disabled node for getting dr_mode, can you?
Do you have a use case for this?

Thanks,
Fab

>=20
> Best regards,
> Yoshihiro Shimoda
>=20
> >  drivers/usb/common/common.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> > index 48277bb..73c8e65 100644
> > --- a/drivers/usb/common/common.c
> > +++ b/drivers/usb/common/common.c
> > @@ -145,6 +145,8 @@ enum usb_dr_mode of_usb_get_dr_mode_by_phy(struct d=
evice_node *np, int arg0)
> >
> >  	do {
> >  		controller =3D of_find_node_with_property(controller, "phys");
> > +		if (!of_device_is_available(controller))
> > +			continue;
> >  		index =3D 0;
> >  		do {
> >  			if (arg0 =3D=3D -1) {
> > --
> > 2.7.4

