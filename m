Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C04EC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:17:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3443D20645
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Gy/gIym/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbeLQMR7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 07:17:59 -0500
Received: from mail-eopbgr1400113.outbound.protection.outlook.com ([40.107.140.113]:12055
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726767AbeLQMR6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 07:17:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WURY+7Airsw86qAGfIun2BRAzxl7qfVO1bZ0tIXgeW0=;
 b=Gy/gIym/j9dZDO71Dfr+jPW21hrBDlC9ZRvb6DdHkGUKZAaldNYkpmxDxyAitQq4YXsmqPBXf7e8Auq01WcMuVCMtyjkgda2Mbi5f9wWhFWuZizJznqYd1ATuLa369dj3YGBBA1q4dPuwrijYIiCYnnF0w4rN+aXFSjwKuQXI4M=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1786.jpnprd01.prod.outlook.com (52.133.163.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Mon, 17 Dec 2018 12:17:12 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::dcee:f270:d42b:5b48]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::dcee:f270:d42b:5b48%5]) with mapi id 15.20.1425.021; Mon, 17 Dec 2018
 12:17:12 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 11/17] arm64: dts: renesas: r8a774c0: Add USB-DMAC and
 HSUSB device nodes
Thread-Topic: [PATCH 11/17] arm64: dts: renesas: r8a774c0: Add USB-DMAC and
 HSUSB device nodes
Thread-Index: AQHUk5C/Ad9MkKM4rkqNmjxo141I+aWCxqyAgAAWJvA=
Date:   Mon, 17 Dec 2018 12:17:12 +0000
Message-ID: <TY1PR01MB1770B4A08F1C04979B88C0FBC0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-12-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181217105437.u2lgri7iuomjn7wq@verge.net.au>
In-Reply-To: <20181217105437.u2lgri7iuomjn7wq@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1786;20:a6WS6ifVd/HD+UHm66xnXuPAW6AeFqP7nADSaQJJB/KjHMm2sXF4z6QLmtUrq1WgiqedMOwvX1vf8XiYxY3jYYqWImKdl04QF1SYLPh2SvvMf7lsanj48GfahQ56+/ZvZVY4r3Dmaj6LUxGU/cyZXENSSDFR+gh6/vfya8bWEiM=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 76728056-061a-4cb3-4f87-08d664199326
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1786;
x-ms-traffictypediagnostic: TY1PR01MB1786:
x-microsoft-antispam-prvs: <TY1PR01MB178676C1473D1EE7E6B91B5CC0BC0@TY1PR01MB1786.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(5005020)(6040522)(2401047)(8121501046)(10201501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:TY1PR01MB1786;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB1786;
x-forefront-prvs: 08897B549D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(366004)(376002)(136003)(39860400002)(189003)(199004)(66066001)(55016002)(53546011)(102836004)(6116002)(26005)(7696005)(6506007)(99286004)(3846002)(316002)(97736004)(76176011)(71190400001)(71200400001)(229853002)(6916009)(6436002)(186003)(478600001)(54906003)(7736002)(81156014)(10126004)(106356001)(8936002)(25786009)(39060400002)(107886003)(81166006)(6306002)(74316002)(446003)(6246003)(305945005)(486006)(2906002)(86362001)(476003)(14454004)(11346002)(4326008)(44832011)(105586002)(345774005)(5660300001)(8676002)(68736007)(53936002)(33656002)(9686003)(14444005)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1786;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: fnJX7GtD0lAjIZhRRM8+JVZ8FvT//IJuCE4R29rYHJ7DCSpkUwW6jTyMRKYex7r7l+WhkpRsYIynuZ+53aEBb1KCV6br5YEWxwKBj2frgB7vRWLutaO0Ol4A8Gq8ZBQQqJ1Er8D/VqNj3wJHJAEMJH5iVQAybnjvAVnNTi7EogLDFTg9uQeMz6zbZp5x2h1Bysrqnp9WwHMqBecrOLDBY5aEQTJjPN8FyFfjz1VMbf5zIr28jfT+4NJjHwZjolZv6ZNx8HoIO1Yp9xFLQMtvqgVCnP5Ggthb203lArzfK6wUW7gfsL6AWVyOSXu7UUmS
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76728056-061a-4cb3-4f87-08d664199326
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2018 12:17:12.2803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1786
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 17 December 2018 10:55
> To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Subject: Re: [PATCH 11/17] arm64: dts: renesas: r8a774c0: Add USB-DMAC an=
d HSUSB device nodes
>
> On Fri, Dec 14, 2018 at 09:37:34AM +0000, Fabrizio Castro wrote:
> > Add usb dmac and hsusb device nodes on RZ/G2E SoC dtsi.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 45 +++++++++++++++++++++++=
++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a774c0.dtsi
> > index 0ab3aa6..79cdaac 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > @@ -514,6 +514,51 @@
> >  status =3D "disabled";
> >  };
> >
> > +hsusb: usb@e6590000 {
> > +compatible =3D "renesas,usbhs-r8a774c0",
> > +     "renesas,rcar-gen3-usbhs";
> > +reg =3D <0 0xe6590000 0 0x200>;
>
> The above looks good but while reviewing this patch I noticed
> that the size of the hsusb register range on in the DT for r8a774a1
> is 0x100, Is that correct?

That is a good catch! No, I don't think it's correct, I'll send a patch to =
fix that.

Thanks,
Fab

>
> As for this patch, it looks good to me but I will wait to see if there ar=
e
> other reviews before applying.
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>
> > +interrupts =3D <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
> > +dmas =3D <&usb_dmac0 0>, <&usb_dmac0 1>,
> > +       <&usb_dmac1 0>, <&usb_dmac1 1>;
> > +dma-names =3D "ch0", "ch1", "ch2", "ch3";
> > +renesas,buswait =3D <11>;
> > +phys =3D <&usb2_phy0>;
> > +phy-names =3D "usb";
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 704>, <&cpg 703>;
> > +status =3D "disabled";
> > +};
> > +
> > +usb_dmac0: dma-controller@e65a0000 {
> > +compatible =3D "renesas,r8a774c0-usb-dmac",
> > +     "renesas,usb-dmac";
> > +reg =3D <0 0xe65a0000 0 0x100>;
> > +interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> > +interrupt-names =3D "ch0", "ch1";
> > +clocks =3D <&cpg CPG_MOD 330>;
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 330>;
> > +#dma-cells =3D <1>;
> > +dma-channels =3D <2>;
> > +};
> > +
> > +usb_dmac1: dma-controller@e65b0000 {
> > +compatible =3D "renesas,r8a774c0-usb-dmac",
> > +     "renesas,usb-dmac";
> > +reg =3D <0 0xe65b0000 0 0x100>;
> > +interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> > +interrupt-names =3D "ch0", "ch1";
> > +clocks =3D <&cpg CPG_MOD 331>;
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 331>;
> > +#dma-cells =3D <1>;
> > +dma-channels =3D <2>;
> > +};
> > +
> >  dmac0: dma-controller@e6700000 {
> >  compatible =3D "renesas,dmac-r8a774c0",
> >       "renesas,rcar-dmac";
> > --
> > 2.7.4
> >


[https://www2.renesas.eu/media/email/unicef.jpg]

This Christmas, instead of sending out cards, Renesas Electronics Europe ha=
ve decided to support Unicef with a donation. For further details click her=
e<https://www.unicef.org/> to find out about the valuable work they do, hel=
ping children all over the world.
We would like to take this opportunity to wish you a Merry Christmas and a =
prosperous New Year.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
