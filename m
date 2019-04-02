Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7578EC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 11:47:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 37FE020856
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 11:47:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="sJfoT4gs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730133AbfDBLrK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 07:47:10 -0400
Received: from mail-eopbgr1400100.outbound.protection.outlook.com ([40.107.140.100]:59868
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729568AbfDBLrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 07:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYz5SaQMvFPH3/Y53SEBDa69lAjuEsq9rMygfjpWuDE=;
 b=sJfoT4gs1Ga9idqlxZz4NVEHN9Ojzp+AzMgE45an9J8OU0ASmOcPRxAKmysgFNK4/xs4jc2Ma6ybcILwx+3CHAigvXMnpY9NO7jiADedlL3eqt9sY5jadznv64NqRd3FHmGdZnK9WPl5Qf16FwZocld9Rpzszdo1QlScmHUHlRY=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1499.jpnprd01.prod.outlook.com (52.133.161.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.20; Tue, 2 Apr 2019 11:47:04 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273%4]) with mapi id 15.20.1750.017; Tue, 2 Apr 2019
 11:47:04 +0000
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
Thread-Index: AQHU0B7eVPBQi3ZSt0SjcyDgALOUSKYoTZ8AgAB7FvCAACA7AIAAA8eg
Date:   Tue, 2 Apr 2019 11:47:04 +0000
Message-ID: <TY1PR01MB1770D9F7ED790CF98FF2C7CFC0560@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYAPR01MB427119513E310A30792924E7D8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
 <TY1PR01MB1770C3AF8E4E5386319FDCF9C0560@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <TYAPR01MB4271277BF22B6EAE0A6313D1D8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4271277BF22B6EAE0A6313D1D8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d23dfaa5-a37e-4aec-c2e8-08d6b760ed89
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TY1PR01MB1499;
x-ms-traffictypediagnostic: TY1PR01MB1499:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TY1PR01MB14992B89FDBFACA446A38387C0560@TY1PR01MB1499.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0995196AA2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(39860400002)(366004)(346002)(396003)(13464003)(43544003)(199004)(189003)(446003)(66066001)(33656002)(110136005)(8936002)(102836004)(52536014)(55016002)(71190400001)(71200400001)(2906002)(76176011)(6306002)(81166006)(81156014)(5660300002)(186003)(44832011)(11346002)(6246003)(9686003)(476003)(4326008)(97736004)(86362001)(486006)(6506007)(53546011)(7696005)(53936002)(26005)(14444005)(99286004)(74316002)(6116002)(106356001)(105586002)(478600001)(305945005)(6436002)(25786009)(256004)(8676002)(229853002)(14454004)(966005)(54906003)(68736007)(316002)(3846002)(93886005)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1499;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6coY/WYAy8dzN+fesGBRlcsnig/kyHhBfMUDADKbTP+dgKc8/rFdGjK0/uGJkRyY/s9oN8z2iPCxvGplz9d+bYhUOeLl/thouF2f/1JHAb469+vSD8SgCSWtWBhlbMdbiBkZwhpDBeYixUCzohlp5lkGPadyx3tFPTK3GcBpTL9grMvi/rX+YsJJU/ArJ/HUE2C220TXfjEUBp7tVmzFvTWs+VLI/wPweNOQywCH4eOGDAD7cnTu3Z109JyurkmOx3ER1bgp0tUO1irPzIDf4gkaM7E52VFZrNluasmdZTdtymcdLcM81yL5mSmBIQm3qLPdBmIMDUZxDuMJ1zMJefPxZesMD3U5iO1YNGecynDgeryUX/lVnEy0GKY5pNKK5htyV5MtxJ9G8uf11ATTV/MFnKDhhSCEfT8b8OBnQvI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d23dfaa5-a37e-4aec-c2e8-08d6b760ed89
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2019 11:47:04.7984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1499
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yoshihiro-san,

Thank you for your feedback.

> -----Original Message-----
> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Sent: 02 April 2019 12:10
> To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; Greg Kroah-Hartman =
<gregkh@linuxfoundation.org>; Geert Uytterhoeven
> <geert+renesas@glider.be>
> Cc: Arnd Bergmann <arnd@arndb.de>; linux-usb@vger.kernel.org; Simon Horma=
n <horms@verge.net.au>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Biju Das <biju.das@bp.renesas.com>; linux-=
renesas-soc@vger.kernel.org; stable@vger.kernel.org
> Subject: RE: [PATCH 1/4] usb: common: Consider only available nodes for d=
r_mode
>=20
> Hi Fabrizio-san,
>=20
> > From: Fabrizio Castro, Sent: Tuesday, April 2, 2019 6:22 PM
> >
> > Hi Yoshihiro-san,
> >
> > Thank you for your feedback.
> >
> > > From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > Sent: 02 April 2019 02:54
> > > Subject: RE: [PATCH 1/4] usb: common: Consider only available nodes f=
or dr_mode
> > >
> > > Hi Fabrizio-san,
> > >
> > > Thank you for the patch!
> > >
> > > > From: Fabrizio Castro, Sent: Friday, March 1, 2019 8:06 PM
> > > >
> > > > There are cases where multiple device tree nodes point to the
> > > > same phy node by means of the "phys" property, but we should
> > > > only consider those nodes that are marked as available rather
> > > > than just any node.
> > > >
> > > > Fixes: 98bfb3946695 ("usb: of: add an api to get dr_mode by the phy=
 node")
> > > > Cc: stable@vger.kernel.org # v4.4+
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > ---
> > >
> > > I'm guessing this code needs for phy-rcar-gen3-usb2.c only because
> > > the phy driver only gets the dr_mode from index 0 like below:
> > >
> > > 	channel->dr_mode =3D of_usb_get_dr_mode_by_phy(dev->of_node, 0);
> > >
> > > Yesterday, I submitted patches to get multiple indexes from controlle=
r
> > > device nodes:
> > >
> > > https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=
=3D99561
> > >
> > > So, would you check the phy patches can get the dr_mode without this =
changing common patch?
> >
> > I will go through your patch series, but I can't see why any driver wou=
ld be interested
> > in considering a disabled node for getting dr_mode, can you?
> > Do you have a use case for this?
>=20
> This is not a use case though, the commit 98bfb3946695 is made by a TI en=
gineer so that
> I checked TI's dts/dtsi file on armv7 arch (am335x-boneblue.dts) a little=
 and then
> it has one usb controller node only. So, the commit didn't take care of a=
 disabled node, I guess.
> However, as you know, on R-Car Gen3 and RZ/G2, they have multiple control=
ler nodes. So,
> one of the controller can be disabled.

The real question is, are we going to need to read dr_mode from a disabled =
node?
Because this patch gets in the way of that, but looking through the code an=
d
device trees it doesn't look like anybody needs that. I have tested this pa=
tch in isolation
on a few R-Car platforms, and it all seemed good to me back when I submitte=
d the patch,
but it would probably need thorough testing, and more testing from your sid=
e is more than
welcome. Besides this point, of_usb_get_dr_mode_by_phy returns the dr_mode =
value that
matches the argument the first, which means what you get back from it depen=
ds from
the order in which you specify the nodes within the device tree in case you=
 have multiple
nodes meeting the same requirements (from a of_usb_get_dr_mode_by_phy persp=
ective),
a.k.a. "luck".

We should make sure there is only one node that can match our requirement a=
t any one
time for this to work properly, and parsing only enabled nodes gets in that=
 direction,
therefore I still think this patch is valid, and belongs to stable versions=
 of the kernel
as well.

After reading your comment on patch:
"phy: renesas: rcar-gen3-usb2: No need to request IRQ for non-OTG"

I can now see that patch "arm64: dts: renesas: r8a77995: draak: Remove hsus=
b node" is wrong
for your case, and that we need to find a better solution for patch:
"phy: renesas: rcar-gen3-usb2: No need to request IRQ for non-OTG"

I am looking into your series now, I'll come back to you soon on the other =
patch.

Thanks,
Fab

>=20
> By the way, if we applied this patch, since the behavior will be changed =
at least,
> so all of this api user have to test whether this code doesn't break or n=
ot.
>=20
> Best regards,
> Yoshihiro Shimoda
>=20
> > Thanks,
> > Fab
> >
> > >
> > > Best regards,
> > > Yoshihiro Shimoda
> > >
> > > >  drivers/usb/common/common.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/common/common.c b/drivers/usb/common/commo=
n.c
> > > > index 48277bb..73c8e65 100644
> > > > --- a/drivers/usb/common/common.c
> > > > +++ b/drivers/usb/common/common.c
> > > > @@ -145,6 +145,8 @@ enum usb_dr_mode of_usb_get_dr_mode_by_phy(stru=
ct device_node *np, int arg0)
> > > >
> > > >  	do {
> > > >  		controller =3D of_find_node_with_property(controller, "phys");
> > > > +		if (!of_device_is_available(controller))
> > > > +			continue;
> > > >  		index =3D 0;
> > > >  		do {
> > > >  			if (arg0 =3D=3D -1) {
> > > > --
> > > > 2.7.4

