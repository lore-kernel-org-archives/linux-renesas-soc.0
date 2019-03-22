Return-Path: <SRS0=lsYt=RZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0121CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 10:53:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C29B1218D4
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 10:53:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="J41xBqtu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbfCVKxX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Mar 2019 06:53:23 -0400
Received: from mail-eopbgr1400108.outbound.protection.outlook.com ([40.107.140.108]:21856
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726667AbfCVKxX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Mar 2019 06:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+H/873rtff/ZGjuOUUpkp+enyDC3I3ROSpQ66QQYTE=;
 b=J41xBqtudv1tKwFDWSgiaLq+309VkWGOE04aAbIMe9FQITaUQPz9Tle2UMFyez9n2oTSZzo189e9iik2uj0HQDAALblqwC6qKxN3y2YP39gCeDr7+Z5MwFppLDJ7RY3+tHe7/XO3jLopESkQhhry2EhVBUmwlDzIez2EmWPrJZY=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1641.jpnprd01.prod.outlook.com (52.133.162.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Fri, 22 Mar 2019 10:53:16 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273%4]) with mapi id 15.20.1730.013; Fri, 22 Mar 2019
 10:53:16 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 1/2] ARM: dts: r8a77470: Add DU support
Thread-Topic: [PATCH 1/2] ARM: dts: r8a77470: Add DU support
Thread-Index: AQHU3k5fKKc931Nk/UGFPbCjliUvdqYXfHSAgAABLUA=
Date:   Fri, 22 Mar 2019 10:53:16 +0000
Message-ID: <TY1PR01MB17703031AFD18BE75E5E554DC0430@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1552998099-22972-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1552998099-22972-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190322104641.hywslvn6mt4pjqbr@verge.net.au>
In-Reply-To: <20190322104641.hywslvn6mt4pjqbr@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72235558-73f2-4d0b-8f14-08d6aeb49697
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1641;
x-ms-traffictypediagnostic: TY1PR01MB1641:
x-microsoft-antispam-prvs: <TY1PR01MB1641D2C8B7280FB3350523CFC0430@TY1PR01MB1641.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09840A4839
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(39860400002)(366004)(396003)(136003)(199004)(189003)(71190400001)(76176011)(9686003)(97736004)(81156014)(316002)(71200400001)(99286004)(107886003)(8676002)(74316002)(81166006)(7696005)(229853002)(6246003)(6116002)(68736007)(3846002)(4326008)(486006)(256004)(11346002)(33656002)(44832011)(54906003)(8936002)(26005)(446003)(476003)(53936002)(305945005)(14444005)(6916009)(105586002)(186003)(25786009)(52536014)(66066001)(478600001)(6436002)(55016002)(7736002)(2906002)(6506007)(53546011)(86362001)(14454004)(106356001)(5660300002)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1641;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XK+zM4zxYqz83txr5Ifs09zBWiuHFM8eZpjQ0k3e/c2i5j+vIoVatv90b1g0uamskjWeDcyxBhAs6BwJe+6mo69A9kWAT/0Y5RlZszzgfYX4wdhVBudh3+Ma28eUYHAAawtYu6yzFcW6M5ijVmxEPMNwg92b5u7lBZnzB4JuMA4K7N3GBPZpxDGO5Hoi2g+z2Bz33VBo8ytmRSxJJXnbQMqP5jkW89vJYUkFz208/PX4hJVid/7KM8O20w/vOinLgKZlr/doZNL6QmoRly+QMA2G1AY2NTGlodUHQq3SI33/G7CabBMrv+r6QTx1oMMgnvJPia+MiNZoYB/zeZv0TdYwsUEp5oqFqeWnQO9teN1uoyGC2WZr1r9mZ21c689e2Rm7bw9TatL+2Q65S6myjxVaHzEjx5DVos4kj0N4bR8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72235558-73f2-4d0b-8f14-08d6aeb49697
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2019 10:53:16.1673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1641
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 22 March 2019 10:47
> Subject: Re: [PATCH 1/2] ARM: dts: r8a77470: Add DU support
>=20
> On Tue, Mar 19, 2019 at 12:21:38PM +0000, Fabrizio Castro wrote:
> > This commit adds DU support to the RZ/G1C (a.k.a. r8a77470)
> > specific device tree.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  arch/arm/boot/dts/r8a77470.dtsi | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a774=
70.dtsi
> > index f4e232b..493cf2b 100644
> > --- a/arch/arm/boot/dts/r8a77470.dtsi
> > +++ b/arch/arm/boot/dts/r8a77470.dtsi
> > @@ -643,6 +643,38 @@
> >  			resets =3D <&cpg 408>;
> >  		};
> >
> > +		du: display@feb00000 {
> > +			compatible =3D "renesas,du-r8a77470";
> > +			reg =3D <0 0xfeb00000 0 0x40000>;
> > +			interrupts =3D <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cpg CPG_MOD 724>,
> > +				 <&cpg CPG_MOD 723>;
>=20
> I do not see MSTP 7 bit 23 documented as used by DU
> in the User's Manual: Hardware v1.00 Oct 13, 2017.
>=20
> Do you have more recent documentation or some insight in this area?

I have the same document, and I can see the bit defined in page 7A-16.
Perhaps you checked the Software Reset Register?

Thanks,
Fab

>=20
> > +			clock-names =3D "du.0", "du.1";
> > +			status =3D "disabled";
> > +
> > +			ports {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				port@0 {
> > +					reg =3D <0>;
> > +					du_out_rgb0: endpoint {
> > +					};
> > +				};
> > +				port@1 {
> > +					reg =3D <1>;
> > +					du_out_rgb1: endpoint {
> > +					};
> > +				};
> > +				port@2 {
> > +					reg =3D <2>;
> > +					du_out_lvds0: endpoint {
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> >  		prr: chipid@ff000044 {
> >  			compatible =3D "renesas,prr";
> >  			reg =3D <0 0xff000044 0 4>;
> > --
> > 2.7.4
> >
