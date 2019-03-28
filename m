Return-Path: <SRS0=Kbds=R7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E20C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 13:04:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E91FE206BA
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 13:04:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="ZthFUs5B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbfC1NEP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Mar 2019 09:04:15 -0400
Received: from mail-eopbgr1410104.outbound.protection.outlook.com ([40.107.141.104]:1568
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725779AbfC1NEP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Mar 2019 09:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dz0mSNHD2YFrjC4Ll+M0q7u1lcG+n13MvhTDZvCHW74=;
 b=ZthFUs5Bz9R35aEtDkFGE8qy14OnnksdZucLMWmEsa/rGXLRBHMV8fFRt8Y66gT/sn1cwp6b9l+yTNI+4UyAhAY1DeDj5qFrHC6iakasYACQ7d5MPZIz9meSbfDGU0PBbRxIc71XN1i/isBoTQdkMiAym3pFwROLvdn/09dpjB0=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4630.jpnprd01.prod.outlook.com (20.179.182.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.16; Thu, 28 Mar 2019 13:04:07 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9c06:60ec:8c9a:2888]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9c06:60ec:8c9a:2888%4]) with mapi id 15.20.1750.014; Thu, 28 Mar 2019
 13:04:07 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/9] dt-bindings: usb: renesas_usb3: add extcon support
Thread-Topic: [PATCH 2/9] dt-bindings: usb: renesas_usb3: add extcon support
Thread-Index: AQHU0/zZ6gf28HwQbk24vS3imN8dmKYgQXcAgADdedA=
Date:   Thu, 28 Mar 2019 13:04:06 +0000
Message-ID: <OSBPR01MB2103A7BB0AF6B9B97B30D684B8590@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
 <1551863246-11656-3-git-send-email-biju.das@bp.renesas.com>
 <20190327232802.GA28701@bogus>
In-Reply-To: <20190327232802.GA28701@bogus>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2071c705-9bd2-4755-e96a-08d6b37ddc77
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB4630;
x-ms-traffictypediagnostic: OSBPR01MB4630:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <OSBPR01MB4630727A1310D77238ACED25B8590@OSBPR01MB4630.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0990C54589
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(396003)(39860400002)(376002)(366004)(51914003)(199004)(189003)(305945005)(102836004)(71200400001)(74316002)(55016002)(71190400001)(66066001)(7416002)(26005)(7696005)(7736002)(5660300002)(105586002)(106356001)(6506007)(52536014)(229853002)(6436002)(76176011)(966005)(8676002)(478600001)(8936002)(86362001)(68736007)(81166006)(81156014)(14454004)(25786009)(3846002)(486006)(4326008)(11346002)(33656002)(476003)(186003)(44832011)(6306002)(6116002)(99286004)(2906002)(316002)(6246003)(53936002)(14444005)(6916009)(97736004)(9686003)(446003)(54906003)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4630;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q4JuqU8/6xMHTfg//LNmKf9EOek7FlLh9vO8Lcy+u5fvjCRrJtYwZTqJPYPkWXhBSk1fXTamMz82S/AlTQbo10IyK02Fm3pBdAU2uAsSYSQ+gNhYPUCbpaz2fuejhyvwyBiJH1lW3dQXCXzEATB5BBU/kmkFP1h/uRaoO7kTbtBBdMynPWD1hz0WPtC8zY9s/+yAuQwa+lpB06M7SDzLwvN5eHT+I4SX9w6PPl67BTecraZIfb9ob0DsRikeJaOqZdYOTtkthJA6VIoXKW0UBgkefVrLPH91uWus0+OtumYFVZvKyQI/X+aLmL9kRUtmMHlryO251jbO28A6NCY+MLb6uKBZ1zTVJz7m5ZSlXGVsecDOWlh+CFT2hd4q9IJXUmkuLDps5Fj0yusSEmLg47y+dX6zSmWNE+iD4g2A1oc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2071c705-9bd2-4755-e96a-08d6b37ddc77
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2019 13:04:06.9012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4630
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH 2/9] dt-bindings: usb: renesas_usb3: add extcon suppo=
rt
>=20
> On Wed, Mar 06, 2019 at 09:07:19AM +0000, Biju Das wrote:
> > Add support for renesas_usb3 to receive connect and disconnect
> > notification using extcon framework.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/usb/renesas_usb3.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > index d366555..ae35674 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > @@ -21,6 +21,8 @@ Required properties:
> >  Optional properties:
> >    - phys: phandle + phy specifier pair
> >    - phy-names: must be "usb"
> > +  - extcon: phandle for the extcon device renesas usb3 uses to detect
> > +	    connect/disconnect events.
>=20
> Please don't use extcon and use usb-connector binding instead.

I have switched to usb role switch framework  instead of extcon and sent V2=
 based on the below feedback.
https://patchwork.kernel.org/patch/10840659/

On V2, I have sent  a patch series which uses " usb-connector " binding [1]=
   and "usb-role-switch" property[2]
[1] https://patchwork.kernel.org/patch/10852495/
[2] https://patchwork.kernel.org/patch/10852497/

Support for  "usb-role-switch" compatible can be  found in the below patch =
set
https://patchwork.kernel.org/project/linux-usb/list/?series=3D97707

Please can you comment, is this approach is acceptable or not?

Regards,
Biju=20











