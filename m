Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E035C10F0B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 10:14:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D10642064A
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 10:14:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="imCV8zCZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfCNKOS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 06:14:18 -0400
Received: from mail-eopbgr1400128.outbound.protection.outlook.com ([40.107.140.128]:10240
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726539AbfCNKOR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 06:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUC90VyBLFNPbtUhsowXDX80XLlWEVfNQNFk8qmC8I8=;
 b=imCV8zCZ9sda6vhKVDl64MlzshRK0vYF1yV4zCCCUKtEInCqoiodHNtMtaIjgYnva3s5cSxpVlnyjVHb4w0Qc6vB8ZdU25nOhuIpMwZNWABBIZKK+r8paY3lfg39pwqHovfKT4FBCJMGyLlQXmmWQR91ATHNZgBk9LshKXZmseQ=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4632.jpnprd01.prod.outlook.com (20.179.184.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.21; Thu, 14 Mar 2019 10:14:13 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9c06:60ec:8c9a:2888]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9c06:60ec:8c9a:2888%3]) with mapi id 15.20.1709.011; Thu, 14 Mar 2019
 10:14:13 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
Thread-Index: AQHU2kJR8if/PuLc00mcHJXM7PQH56YK2MEAgAAGcKA=
Date:   Thu, 14 Mar 2019 10:14:12 +0000
Message-ID: <OSBPR01MB21039B4241097B8EE8C73A85B84B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
 <1552552775-51667-3-git-send-email-biju.das@bp.renesas.com>
 <TY2PR01MB4812BACA4673786E867C253FD84B0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB4812BACA4673786E867C253FD84B0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf92f894-656c-424d-4479-08d6a865ceb6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB4632;
x-ms-traffictypediagnostic: OSBPR01MB4632:
x-microsoft-exchange-diagnostics: 1;OSBPR01MB4632;20:VsbEjlhIO92NfEaKOpHSfbbdr0mJdYQVTTc/9VIA2VYpRY30bpfcAJ7ghYBAmGPy63jGsGMVc/PrQLgqP2xdGNhjtw7HpNpg72dquEEuQRDN21n1p5X9fNP9XOEGu8siZbdqbM/mbesP/9CgetR1Zxvgu99qBM/qCT9Xlj25M8t5TMRvy7JncdTVb3kQndcaUrjUbt4KSAHWuEAVtr3SpA5U3FUH2M6wkwc4Lb4f4kCmpKTAZk9cmnrb1Ffhu3ph
x-microsoft-antispam-prvs: <OSBPR01MB4632C17ED1C7C2BD856126D9B84B0@OSBPR01MB4632.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09760A0505
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(136003)(39860400002)(346002)(376002)(51914003)(189003)(199004)(99286004)(76176011)(7736002)(305945005)(26005)(54906003)(256004)(4326008)(478600001)(74316002)(6436002)(476003)(9686003)(7696005)(52536014)(8936002)(66066001)(55016002)(6246003)(25786009)(53936002)(6116002)(97736004)(68736007)(33656002)(8676002)(3846002)(81166006)(71190400001)(71200400001)(81156014)(186003)(110136005)(86362001)(316002)(44832011)(105586002)(6506007)(102836004)(446003)(7416002)(229853002)(11346002)(486006)(5660300002)(2906002)(106356001)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4632;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kBu31+LuPrgUT5lvKL0RZpppfuvsbM4KiL58LBGIkNLwV+AIOUTszlZDdi0k0Psyx42FD0GVnC4ITWfdNE33Wzu3+V/U2Ve3AfHWxlTvWct9hf+uBxjhKe/Cqni33IZIU8fbAqXfebdBZVNta1clPZK4l7FM0VHty7zlsgmgTggGPnj8bmxsPd+tbbgqSnxoJ4lSJHf2aUGh0y4A2pEIgZdXkC1Snjus3IzkH65heBGUk4bsP5xtcjG1SvjCTSCUoEisSaQDniFWUkKhkEM1ItOv3X0E1/646Ecb9Easxz39N1UsHNOZiGZx+hu6uGTcFWc+zYS7ouCaOUmA+vbCY+FF6BD2XtQSfAR56FbPlepSalDj4V3yak9lLTI57W7qKnzqchvH34Jdu7y+oywB1M+aoeOOShpHp2D3mIp1OiU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf92f894-656c-424d-4479-08d6a865ceb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2019 10:14:12.3222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4632
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add usb-role-
> switch property
>=20
> Hi Biju-san,
>=20
> > From: Biju Das, Sent: Thursday, March 14, 2019 5:40 PM
> >
> > Add support for renesas_usb3 to support dual role switch using usb
> > role switch class framework.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  V1-->V2
> >   * Added usb-role-switch-property
> >   * Updated the example with usb-role-switch property.
> > ---
> >  .../devicetree/bindings/usb/renesas_usb3.txt       | 22
> ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > index 35039e7..eecaf4c 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > @@ -22,6 +22,7 @@ Required properties:
> >  Optional properties:
> >    - phys: phandle + phy specifier pair
> >    - phy-names: must be "usb"
> > +  - usb-role-switch: use USB role switch to support dual-role switch
>=20
> I don't think we can add such a property. At least, we have to add "renes=
as,"
> prefix.

usb_role_switch_get   api uses  "usb-role-switch"  property to get role swi=
tch linked with the device.

HD3SS3220 port controller driver gets role switch handle linked with the de=
vice using usb_role_switch_get  api. =20
That is the reason, I have added " usb-role-switch" property here.

Do you have any other suggestion to get usb role switch handle?

Please correct me if I am wrong.=20
=20
> >  Example of R-Car H3 ES1.x:
> >  	usb3_peri0: usb@ee020000 {
> > @@ -39,3 +40,24 @@ Example of R-Car H3 ES1.x:
> >  		interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> >  		clocks =3D <&cpg CPG_MOD 327>;
> >  	};
> > +
> > +Example of RZ/G2E:
> > +	usb3_peri0: usb@ee020000 {
> > +		compatible =3D "renesas,r8a774c0-usb3-peri",
> > +			     "renesas,rcar-gen3-usb3-peri";
> > +		reg =3D <0 0xee020000 0 0x400>;
> > +		interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks =3D <&cpg CPG_MOD 328>;
> > +		companion =3D <&xhci0>;
> > +		usb-role-switch;
> > +
> > +		port {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +
> > +			usb3peri_role_switch: endpoint@0 {
> > +				reg =3D <0>;
> > +				remote-endpoint =3D <&hd3ss3220_ep>;
> > +			};
> > +		};
> > +	};
> > --
> > 2.7.4

Regards,
Biju

