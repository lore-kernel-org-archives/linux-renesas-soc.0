Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC50C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:38:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5207B204FD
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:38:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="nQ+Ssm3A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732157AbeLQLiO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 06:38:14 -0500
Received: from mail-eopbgr1410131.outbound.protection.outlook.com ([40.107.141.131]:5043
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726965AbeLQLiO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 06:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipg4VX+B8JfAUiX5q9KbMM69jOVwRTwLh1W69onGqaE=;
 b=nQ+Ssm3Ar1Brigvux2XUrxqOUB/5xoBgMObn/vGa96i9X4KawB2hFA6lAyPTgbXdtldkyLKG1qAq8IOxSeEIefB83jdbUqQjZ7mmyJ2qFHJfqB3Zp1k3nqqO9362Z30963+H5JywSl/3FwgFtbbbc1gls5Ghk1CJ8zgfu1aiBG0=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1497.jpnprd01.prod.outlook.com (52.133.161.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.20; Mon, 17 Dec 2018 11:38:07 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::dcee:f270:d42b:5b48]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::dcee:f270:d42b:5b48%5]) with mapi id 15.20.1425.021; Mon, 17 Dec 2018
 11:38:07 +0000
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
Subject: RE: [PATCH 07/17] arm64: dts: renesas: r8a774c0: Add audio support
Thread-Topic: [PATCH 07/17] arm64: dts: renesas: r8a774c0: Add audio support
Thread-Index: AQHUk5C4Cdqm/6/L9Uqg9pRxbNwqKKWCvWyAgAAUaKA=
Date:   Mon, 17 Dec 2018 11:38:07 +0000
Message-ID: <TY1PR01MB17704252F657769F8FB8A341C0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-8-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181217102127.x5wn4hhvv3sr3pvt@verge.net.au>
In-Reply-To: <20181217102127.x5wn4hhvv3sr3pvt@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1497;20:5kBYB7rVHal8HHZJWaOnQnjHiFO2od9/aqfF5v+FV2HVrRGcvHIZ0zYcDhpabF1jp0S0FRTbcyRhLSCAvv7FCJYtCpXkhO6uRqZnL0dzsYxCQWnpcNvUUESuzL+tehS/bjn1g8zmEWG9LLp9ibA12dxuk4/xsa1na/JQeuZpdWc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 938d107a-0011-41b5-198c-08d664141d6e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1497;
x-ms-traffictypediagnostic: TY1PR01MB1497:
x-microsoft-antispam-prvs: <TY1PR01MB1497320BEEA01C74FCED7A1AC0BC0@TY1PR01MB1497.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231475)(944501520)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:TY1PR01MB1497;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB1497;
x-forefront-prvs: 08897B549D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(396003)(346002)(136003)(366004)(189003)(199004)(8936002)(76176011)(68736007)(7696005)(6506007)(6116002)(3846002)(478600001)(7736002)(74316002)(97736004)(305945005)(71190400001)(71200400001)(256004)(5660300001)(14444005)(14454004)(53546011)(102836004)(2906002)(39060400002)(33656002)(4326008)(6436002)(8676002)(106356001)(81156014)(186003)(105586002)(6306002)(55016002)(345774005)(54906003)(10126004)(53936002)(99286004)(11346002)(26005)(107886003)(486006)(81166006)(446003)(6916009)(476003)(6246003)(86362001)(575784001)(25786009)(66066001)(316002)(229853002)(9686003)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1497;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: BJ4lQwfdkrV6FkhifZ8s/zmpDVj2KvLHt4ntSCdiaPXFZXuEGDIZ3+zomTKGmHOHSx0hCiuKBXIwFdThUztbIlVUS+9zPbL3zXrs9pwu5tin19DaJ9Bk5I6spYV6ucnV9wNJJu4O8johUKZGVV7dOxMSmslkRDXH0RY+bstiG0aPifCMDr1SjLXn/evCvPh0fcdWT/rGDm3yQQhDcaEI+PpETcqM6z/r54jkkAgKyzbRTzEkk2BowWoAg03oA0ncg+1SuDRWFLVajYJ3uF/lvOTn7T4FO28uJAWiULrb3MKOatwYN0Kc5iG7C1l0t1Lz
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 938d107a-0011-41b5-198c-08d664141d6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2018 11:38:07.3610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1497
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 17 December 2018 10:22
> To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Subject: Re: [PATCH 07/17] arm64: dts: renesas: r8a774c0: Add audio suppo=
rt
>
> On Fri, Dec 14, 2018 at 09:37:30AM +0000, Fabrizio Castro wrote:
> > Add sound support for the RZ/G2E SoC (a.k.a. R8A774C0).
> >
> > This work is based on similar work done on the R8A77990 SoC
> > by Yoshihiro Kaneko <ykaneko0929@gmail.com>.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 241 ++++++++++++++++++++++=
++++++++
> >  1 file changed, 241 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a774c0.dtsi
> > index 9bd66b1..35b27b8 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > @@ -917,6 +917,247 @@
> >  status =3D "disabled";
> >  };
> >
> > +rcar_sound: sound@ec500000 {
> > +/*
> > + * #sound-dai-cells is required
> > + *
> > + * Single DAI : #sound-dai-cells =3D <0>;<&rcar_sound>;
> > + * Multi  DAI : #sound-dai-cells =3D <1>;<&rcar_sound N>;
> > + */
> > +/*
> > + * #clock-cells is required for audio_clkout0/1/2/3
> > + *
> > + * clkout: #clock-cells =3D <0>;<&rcar_sound>;
> > + * clkout0/1/2/3: #clock-cells =3D <1>;<&rcar_sound N>;
> > + */
> > +compatible =3D "renesas,rcar_sound-r8a774c0",
> > +     "renesas,rcar_sound-gen3";
> > +reg =3D<0 0xec500000 0 0x1000>, /* SCU */
> > +<0 0xec5a0000 0 0x100>,  /* ADG */
> > +<0 0xec540000 0 0x1000>, /* SSIU */
> > +<0 0xec541000 0 0x280>,  /* SSI */
> > +<0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
> > +reg-names =3D "scu", "adg", "ssiu", "ssi", "audmapp";
> > +
> > +clocks =3D <&cpg CPG_MOD 1005>,
> > + <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
> > + <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
> > + <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
> > + <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
> > + <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
> > + <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>,
> > + <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>,
> > + <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
> > + <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
> > + <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
> > + <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
> > + <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
> > + <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
> > + <&audio_clk_a>, <&audio_clk_b>,
> > + <&audio_clk_c>,
> > + <&cpg CPG_CORE R8A774C0_CLK_ZA2>;
> > +clock-names =3D "ssi-all",
> > +      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
> > +      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
> > +      "ssi.1", "ssi.0",
> > +      "src.9", "src.8", "src.7", "src.6",
> > +      "src.5", "src.4", "src.3", "src.2",
> > +      "src.1", "src.0",
> > +      "mix.1", "mix.0",
> > +      "ctu.1", "ctu.0",
> > +      "dvc.0", "dvc.1",
> > +      "clk_a", "clk_b", "clk_c", "clk_i";
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 1005>,
> > + <&cpg 1006>, <&cpg 1007>,
> > + <&cpg 1008>, <&cpg 1009>,
> > + <&cpg 1010>, <&cpg 1011>,
> > + <&cpg 1012>, <&cpg 1013>,
> > + <&cpg 1014>, <&cpg 1015>;
> > +reset-names =3D "ssi-all",
> > +      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
> > +      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
> > +      "ssi.1", "ssi.0";
> > +status =3D "disabled";
> > +
> > +rcar_sound,dvc {
> > +dvc0: dvc-0 {
> > +dmas =3D <&audma0 0xbc>;
> > +dma-names =3D "tx";
> > +};
> > +dvc1: dvc-1 {
> > +dmas =3D <&audma0 0xbe>;
> > +dma-names =3D "tx";
> > +};
> > +};
> > +
> > +rcar_sound,mix {
> > +mix0: mix-0 { };
> > +mix1: mix-1 { };
> > +};
> > +
> > +rcar_sound,ctu {
> > +ctu00: ctu-0 { };
> > +ctu01: ctu-1 { };
> > +ctu02: ctu-2 { };
> > +ctu03: ctu-3 { };
> > +ctu10: ctu-4 { };
> > +ctu11: ctu-5 { };
> > +ctu12: ctu-6 { };
> > +ctu13: ctu-7 { };
> > +};
> > +
> > +rcar_sound,src {
> > +src0: src-0 {
> > +interrupts =3D <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x85>, <&audma0 0x9a>;
> > +dma-names =3D "rx", "tx";
> > +};
>
> I am a little confused here as the table i48.4 of User's Manual: Hardware
> v0.61 lists DMAR 0x85 and 0x9a as being unavailable on RZ/G2E. Likewise f=
or
> other DMARs used below. And likewise for the R-Car E3 but in that case th=
e
> documentation is corrected by an Errata dated 24th Aug 2018.  Is it safe =
to
> assume that the RZ/G2E documentation is in error in this regards?

Yeah, the current version of chapter 48 was based on top of R-Car Gen 3 man=
ual, version 1.00.
The new version will be based on version 1.50 of the R-Car Gen3 manual, and=
 therefore they
should rectify this.

Thanks,
Fab

>
> Other than the above this patch looks good to me.
>
> > +src1: src-1 {
> > +interrupts =3D <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x87>, <&audma0 0x9c>;
> > +dma-names =3D "rx", "tx";
> > +};
> > +src2: src-2 {
> > +interrupts =3D <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x89>, <&audma0 0x9e>;
> > +dma-names =3D "rx", "tx";
> > +};
> > +src3: src-3 {
> > +interrupts =3D <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x8b>, <&audma0 0xa0>;
> > +dma-names =3D "rx", "tx";
> > +};
> > +src4: src-4 {
> > +interrupts =3D <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x8d>, <&audma0 0xb0>;
> > +dma-names =3D "rx", "tx";
> > +};
> > +src5: src-5 {
> > +interrupts =3D <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x8f>, <&audma0 0xb2>;
> > +dma-names =3D "rx", "tx";
> > +};
> > +src6: src-6 {
> > +interrupts =3D <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x91>, <&audma0 0xb4>;
> > +dma-names =3D "rx", "tx";
> > +};
> > +src7: src-7 {
> > +interrupts =3D <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x93>, <&audma0 0xb6>;
> > +dma-names =3D "rx", "tx";
> > +};
> > +src8: src-8 {
> > +interrupts =3D <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x95>, <&audma0 0xb8>;
> > +dma-names =3D "rx", "tx";
> > +};
> > +src9: src-9 {
> > +interrupts =3D <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x97>, <&audma0 0xba>;
> > +dma-names =3D "rx", "tx";
> > +};
> > +};
> > +
> > +rcar_sound,ssi {
> > +ssi0: ssi-0 {
> > +interrupts =3D <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x01>, <&audma0 0x02>,
> > +       <&audma0 0x15>, <&audma0 0x16>;
> > +dma-names =3D "rx", "tx", "rxu", "txu";
> > +};
> > +ssi1: ssi-1 {
> > +interrupts =3D <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x03>, <&audma0 0x04>,
> > +       <&audma0 0x49>, <&audma0 0x4a>;
> > +dma-names =3D "rx", "tx", "rxu", "txu";
> > +};
> > +ssi2: ssi-2 {
> > +interrupts =3D <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x05>, <&audma0 0x06>,
> > +       <&audma0 0x63>, <&audma0 0x64>;
> > +dma-names =3D "rx", "tx", "rxu", "txu";
> > +};
> > +ssi3: ssi-3 {
> > +interrupts =3D <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x07>, <&audma0 0x08>,
> > +       <&audma0 0x6f>, <&audma0 0x70>;
> > +dma-names =3D "rx", "tx", "rxu", "txu";
> > +};
> > +ssi4: ssi-4 {
> > +interrupts =3D <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x09>, <&audma0 0x0a>,
> > +       <&audma0 0x71>, <&audma0 0x72>;
> > +dma-names =3D "rx", "tx", "rxu", "txu";
> > +};
> > +ssi5: ssi-5 {
> > +interrupts =3D <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x0b>, <&audma0 0x0c>,
> > +       <&audma0 0x73>, <&audma0 0x74>;
> > +dma-names =3D "rx", "tx", "rxu", "txu";
> > +};
> > +ssi6: ssi-6 {
> > +interrupts =3D <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x0d>, <&audma0 0x0e>,
> > +       <&audma0 0x75>, <&audma0 0x76>;
> > +dma-names =3D "rx", "tx", "rxu", "txu";
> > +};
> > +ssi7: ssi-7 {
> > +interrupts =3D <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x0f>, <&audma0 0x10>,
> > +       <&audma0 0x79>, <&audma0 0x7a>;
> > +dma-names =3D "rx", "tx", "rxu", "txu";
> > +};
> > +ssi8: ssi-8 {
> > +interrupts =3D <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x11>, <&audma0 0x12>,
> > +       <&audma0 0x7b>, <&audma0 0x7c>;
> > +dma-names =3D "rx", "tx", "rxu", "txu";
> > +};
> > +ssi9: ssi-9 {
> > +interrupts =3D <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> > +dmas =3D <&audma0 0x13>, <&audma0 0x14>,
> > +       <&audma0 0x7d>, <&audma0 0x7e>;
> > +dma-names =3D "rx", "tx", "rxu", "txu";
> > +};
> > +};
> > +};
> > +
> > +audma0: dma-controller@ec700000 {
> > +compatible =3D "renesas,dmac-r8a774c0",
> > +     "renesas,rcar-dmac";
> > +reg =3D <0 0xec700000 0 0x10000>;
> > +interrupts =3D <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
> > +interrupt-names =3D "error",
> > +"ch0", "ch1", "ch2", "ch3",
> > +"ch4", "ch5", "ch6", "ch7",
> > +"ch8", "ch9", "ch10", "ch11",
> > +"ch12", "ch13", "ch14", "ch15";
> > +clocks =3D <&cpg CPG_MOD 502>;
> > +clock-names =3D "fck";
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 502>;
> > +#dma-cells =3D <1>;
> > +dma-channels =3D <16>;
> > +};
> > +
> >  sdhi0: sd@ee100000 {
> >  compatible =3D "renesas,sdhi-r8a774c0",
> >       "renesas,rcar-gen3-sdhi";
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
