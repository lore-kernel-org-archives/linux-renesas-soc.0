Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFC7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 09:08:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8BFC218AC
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 09:08:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="iIMFWVj3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbfCOJI0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 05:08:26 -0400
Received: from mail-eopbgr1400093.outbound.protection.outlook.com ([40.107.140.93]:34114
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728569AbfCOJI0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 05:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVpXGCgdBMFWie0bQan6AjwlJKG7+pW/LQ5aeOLvzq8=;
 b=iIMFWVj30VKLAGiyrL7m2aQlLlpSKH1WayA9DmQxszyjCkADFRaTIcxC/yzZJNMT9gDfrWQ2UrJLQFGmS7S6vMUHQjaTqKkZ+eualyYBzEK4eTNaY5VKVXiZ/fmDz3EDLBUJBejciuWB+ZWRvdJn+T7+66pZGFMtitcwAwyPQq0=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 TY1SPR01MB1.jpnprd01.prod.outlook.com (52.133.164.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Fri, 15 Mar 2019 09:08:19 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9c06:60ec:8c9a:2888]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9c06:60ec:8c9a:2888%3]) with mapi id 15.20.1709.011; Fri, 15 Mar 2019
 09:08:19 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add
 usb-role-switch property
Thread-Topic: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add
 usb-role-switch property
Thread-Index: AQHU2kJR8if/PuLc00mcHJXM7PQH56YK2MEAgAAGcKCAABSwgIABaRHQ
Date:   Fri, 15 Mar 2019 09:08:19 +0000
Message-ID: <OSBPR01MB2103DDDD7A426E79259723FEB8440@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
 <1552552775-51667-3-git-send-email-biju.das@bp.renesas.com>
 <TY2PR01MB4812BACA4673786E867C253FD84B0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
 <OSBPR01MB21039B4241097B8EE8C73A85B84B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190314105347.GC7752@kuha.fi.intel.com>
In-Reply-To: <20190314105347.GC7752@kuha.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aeac9cd7-0559-4a85-81e5-08d6a925c49e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1SPR01MB1;
x-ms-traffictypediagnostic: TY1SPR01MB1:
x-microsoft-antispam-prvs: <TY1SPR01MB1C4BE7411C6EA68A8011CB8440@TY1SPR01MB1.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09778E995A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(39860400002)(396003)(346002)(366004)(189003)(51914003)(199004)(2906002)(229853002)(86362001)(9686003)(68736007)(5660300002)(99286004)(8676002)(55016002)(25786009)(93886005)(7416002)(33656002)(6916009)(52536014)(186003)(71200400001)(26005)(8936002)(71190400001)(102836004)(14454004)(6506007)(105586002)(76176011)(6116002)(486006)(3846002)(478600001)(7696005)(6436002)(476003)(446003)(7736002)(106356001)(54906003)(14444005)(11346002)(316002)(44832011)(305945005)(74316002)(81166006)(81156014)(53936002)(4326008)(256004)(66066001)(6246003)(97736004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1SPR01MB1;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SzrlU2EQnlALipEATFC58T3ZXjtC9iUb0QMIgRSJppuReQrT6MrYkk/vhjCUI8axczE1phovGLEI0PTWSAXXBAO12/JWC/NZElMXLGNj5c8wiC7Q9lsPaSotAznSXblTKrUQKq4fJKaWdpPHhG6MLQp3KZZQNk+CBW0s4aqXZS0ZY5Up7sNxY1Ikr7wvDoEXwcU6vz2kND43FPuap75t0+FOXmXJLYLtVtM+apNu0KJLSGEoXMRTFTg1kGI98yaiv3YjrHuiovkX27o2z0r5SqHluC/0Kv2qVmVIeoIWNFxsX1dVaRiWkC8Uh3X/ncraIz9HEHWHGdBzoKUXZpNLsX5eaOhJQKjk2ZqsXxpS8uUGWVgNaZnt0lOIJKle2iMCdhXuLs1rf2ASR3Z4hJw02SQLddjNicJaCkSLydmD6Hk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeac9cd7-0559-4a85-81e5-08d6a925c49e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2019 09:08:19.5018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1SPR01MB1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Heikki,

Thanks for the feedback.

> Subject: Re: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add usb-role-
> switch property
>=20
> On Thu, Mar 14, 2019 at 10:14:12AM +0000, Biju Das wrote:
> > Hi Shimoda-San,
> >
> > Thanks for the feedback.
> >
> > > Subject: RE: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add
> > > usb-role- switch property
> > >
> > > Hi Biju-san,
> > >
> > > > From: Biju Das, Sent: Thursday, March 14, 2019 5:40 PM
> > > >
> > > > Add support for renesas_usb3 to support dual role switch using usb
> > > > role switch class framework.
> > > >
> > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > > ---
> > > >  V1-->V2
> > > >   * Added usb-role-switch-property
> > > >   * Updated the example with usb-role-switch property.
> > > > ---
> > > >  .../devicetree/bindings/usb/renesas_usb3.txt       | 22
> > > ++++++++++++++++++++++
> > > >  1 file changed, 22 insertions(+)
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > > b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > > index 35039e7..eecaf4c 100644
> > > > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > > @@ -22,6 +22,7 @@ Required properties:
> > > >  Optional properties:
> > > >    - phys: phandle + phy specifier pair
> > > >    - phy-names: must be "usb"
> > > > +  - usb-role-switch: use USB role switch to support dual-role
> > > > + switch
> > >
> > > I don't think we can add such a property. At least, we have to add
> "renesas,"
> > > prefix.
> >
> > usb_role_switch_get   api uses  "usb-role-switch"  property to get role
> switch linked with the device.
> >
> > HD3SS3220 port controller driver gets role switch handle linked with th=
e
> device using usb_role_switch_get  api.
> > That is the reason, I have added " usb-role-switch" property here.
> >
> > Do you have any other suggestion to get usb role switch handle?
>=20
> We can still change the API. Can we use the compatible for this?

Do you mean usb_role_switch_get  API needs  to handle compatible "usb-x-con=
nector"  wherex=3D a,b ,c ?
Then it uses the graphs api to get the device linked with it and return the=
 usb role switch handle.
In that case, no need to add  generic "usb-role-switch"  property here.

Can you please confirm my understanding is correct?

Regards,
Biju



