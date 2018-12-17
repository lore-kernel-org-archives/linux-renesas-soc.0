Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D34C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:24:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2BA42133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:24:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Jpcc7lyQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbeLQLY5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 06:24:57 -0500
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:11392
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726738AbeLQLY5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 06:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXSzRXLMnd1kn6wQVZhoQGdhFlcxDn+OijEDWhviIC0=;
 b=Jpcc7lyQjhV2lUle00DSuZ1Y7rs1mOEwqpgpFdF1nBxQxBO4ejC30E3p84f3qyfIzChMeIeNx8GGlI2zP5CIX45w9Y7PNRe2ayHWS/imuF0qz/8OiMNrtgwKa4k2B/RTt/6ItBo4n3Qa+8he55o4pJzP40GbpVnlJuDn/qDu8iA=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1706.jpnprd01.prod.outlook.com (52.133.160.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.20; Mon, 17 Dec 2018 11:24:40 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::dcee:f270:d42b:5b48]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::dcee:f270:d42b:5b48%5]) with mapi id 15.20.1425.021; Mon, 17 Dec 2018
 11:24:39 +0000
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
Subject: RE: [PATCH 02/17] arm64: dts: renesas: r8a774c0: Add I2C and IIC-DVFS
 support
Thread-Topic: [PATCH 02/17] arm64: dts: renesas: r8a774c0: Add I2C and
 IIC-DVFS support
Thread-Index: AQHUk5Cw21PJc0Kk+kO145apBL9P1aWB0amAgAD59QA=
Date:   Mon, 17 Dec 2018 11:24:39 +0000
Message-ID: <TY1PR01MB177034D6488A48CE08DF797FC0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181216201741.qqwmc44ogqifl52e@verge.net.au>
In-Reply-To: <20181216201741.qqwmc44ogqifl52e@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1706;20:MTcg7j36eG4NyC2T63ZJM+2jknJT+jm5JsMJ/QQ8xBeVV6Eh1KSQ0cVg1aWapr9dTakMtMj6sCvvur/hbHuHj+BJ9z8PImN1U2wTukOxY7pppoEFR4bKFL634RFUSZ+I3TLxUuoYQ5mASMzh5JhYLY3m3pgqYpeHiXBDKSu6vBc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 2d781dda-d1bb-418e-a823-08d664123bff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1706;
x-ms-traffictypediagnostic: TY1PR01MB1706:
x-microsoft-antispam-prvs: <TY1PR01MB170610D4B4C52FA92564D319C0BC0@TY1PR01MB1706.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3231475)(944501520)(52105112)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:TY1PR01MB1706;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB1706;
x-forefront-prvs: 08897B549D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(105586002)(71200400001)(81156014)(86362001)(71190400001)(54906003)(6506007)(97736004)(53546011)(316002)(66066001)(186003)(8936002)(6246003)(9686003)(107886003)(44832011)(256004)(6306002)(446003)(53936002)(476003)(99286004)(14444005)(11346002)(2906002)(10126004)(3846002)(74316002)(7736002)(305945005)(7696005)(6916009)(4326008)(486006)(39060400002)(33656002)(55016002)(14454004)(345774005)(229853002)(25786009)(76176011)(478600001)(8676002)(106356001)(6436002)(6116002)(5660300001)(102836004)(68736007)(81166006)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1706;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: CNM3Lgc3u6z2BKVwBF5iLo3t7aQU+RbbcDW0hwawj2680lJAAcGPael8BWlqH7NiduXuzDmtKEdZVqpy+h0NdONQEGqZu2R4kGQCytTg3Z5+kNedmZ0LTFjcLbHwGcSXa3o2nuQPkreSAN/sPdJq/SpMW1V0dCcg/DyXHrefDLIda/EcKtv8cPP4rtrdSwcnQiicymYoIQmKtyqfezuMQg8tWVtZdNf89wA3aOhvkBTOVnye0MMwc2fvOMkiWRlsdnL4r9C9bPuMoNy1RJfdlcb+136hDWVfJdcmwTj4lGTlBR11BKBB8ivRx0MlLhMb
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d781dda-d1bb-418e-a823-08d664123bff
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2018 11:24:39.6942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1706
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

> From: Simon Horman <horms@verge.net.au>
> Sent: 16 December 2018 20:18
> Subject: Re: [PATCH 02/17] arm64: dts: renesas: r8a774c0: Add I2C and IIC=
-DVFS support
>
> On Fri, Dec 14, 2018 at 09:37:25AM +0000, Fabrizio Castro wrote:
> > Add the I2C[0-7] and IIC Bus Interface for DVFS (IIC for DVFS)
> > devices nodes to the r8a774c0 device tree.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> Thanks Fabrizo for this patch, it looks good to me with the exception of
> one minor question I have below.
>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 143 ++++++++++++++++++++++=
++++++++
> >  1 file changed, 143 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a774c0.dtsi
> > index 96a71e3..bf08aba 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > @@ -271,6 +271,149 @@
> >  resets =3D <&cpg 407>;
> >  };
> >
> > +i2c0: i2c@e6500000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a774c0",
> > +     "renesas,rcar-gen3-i2c";
> > +reg =3D <0 0xe6500000 0 0x40>;
> > +interrupts =3D <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 931>;
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 931>;
> > +dmas =3D <&dmac1 0x91>, <&dmac1 0x90>,
> > +       <&dmac2 0x91>, <&dmac2 0x90>;
> > +dma-names =3D "tx", "rx", "tx", "rx";
> > +i2c-scl-internal-delay-ns =3D <110>;
> > +status =3D "disabled";
> > +};
> > +
> > +i2c1: i2c@e6508000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a774c0",
> > +     "renesas,rcar-gen3-i2c";
> > +reg =3D <0 0xe6508000 0 0x40>;
> > +interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 930>;
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 930>;
> > +dmas =3D <&dmac1 0x93>, <&dmac1 0x92>,
> > +       <&dmac2 0x93>, <&dmac2 0x92>;
> > +dma-names =3D "tx", "rx", "tx", "rx";
> > +i2c-scl-internal-delay-ns =3D <6>;
> > +status =3D "disabled";
> > +};
> > +
> > +i2c2: i2c@e6510000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a774c0",
> > +     "renesas,rcar-gen3-i2c";
> > +reg =3D <0 0xe6510000 0 0x40>;
> > +interrupts =3D <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 929>;
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 929>;
> > +dmas =3D <&dmac1 0x95>, <&dmac1 0x94>,
> > +       <&dmac2 0x95>, <&dmac2 0x94>;
> > +dma-names =3D "tx", "rx", "tx", "rx";
> > +i2c-scl-internal-delay-ns =3D <6>;
> > +status =3D "disabled";
> > +};
> > +
> > +i2c3: i2c@e66d0000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a774c0",
> > +     "renesas,rcar-gen3-i2c";
> > +reg =3D <0 0xe66d0000 0 0x40>;
> > +interrupts =3D <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 928>;
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 928>;
> > +dmas =3D <&dmac0 0x97>, <&dmac0 0x96>;
> > +dma-names =3D "tx", "rx";
> > +i2c-scl-internal-delay-ns =3D <110>;
> > +status =3D "disabled";
> > +};
> > +
> > +i2c4: i2c@e66d8000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a774c0",
> > +     "renesas,rcar-gen3-i2c";
> > +reg =3D <0 0xe66d8000 0 0x40>;
> > +interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 927>;
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 927>;
> > +dmas =3D <&dmac0 0x99>, <&dmac0 0x98>;
> > +dma-names =3D "tx", "rx";
> > +i2c-scl-internal-delay-ns =3D <6>;
> > +status =3D "disabled";
> > +};
> > +
> > +i2c5: i2c@e66e0000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a774c0",
> > +     "renesas,rcar-gen3-i2c";
> > +reg =3D <0 0xe66e0000 0 0x40>;
> > +interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 919>;
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 919>;
> > +dmas =3D <&dmac0 0x9b>, <&dmac0 0x9a>;
> > +dma-names =3D "tx", "rx";
> > +i2c-scl-internal-delay-ns =3D <6>;
> > +status =3D "disabled";
> > +};
> > +
> > +i2c6: i2c@e66e8000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a774c0",
> > +     "renesas,rcar-gen3-i2c";
> > +reg =3D <0 0xe66e8000 0 0x40>;
> > +interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 918>;
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 918>;
> > +dmas =3D <&dmac0 0x9d>, <&dmac0 0x9c>;
> > +dma-names =3D "tx", "rx";
> > +i2c-scl-internal-delay-ns =3D <6>;
> > +status =3D "disabled";
> > +};
> > +
> > +i2c7: i2c@e6690000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a774c0",
> > +     "renesas,rcar-gen3-i2c";
> > +reg =3D <0 0xe6690000 0 0x40>;
> > +interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 1003>;
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 1003>;
> > +i2c-scl-internal-delay-ns =3D <6>;
> > +status =3D "disabled";
> > +};
> > +
> > +i2c_dvfs: i2c@e60b0000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,iic-r8a774c0";
> > +reg =3D <0 0xe60b0000 0 0x15>;
>
> My reading of the documentation is that 0x31 would be a more appropriate
> size for the register window.

Thank you for looking into this. RZ/G2 documentation about this seems a bit=
 incomplete
at the moment, and we weren't too sure about what to do here. Our expectati=
on is
that the IP should be the same as the one found in R-Car E3, and we thought=
 they
finally wanted to document some previously undocumented registers with the =
RZ/G2
User's manual. We are waiting for some answers from Japan, and since the dr=
iver
doesn't support the "new" registers we thought there was no harm in using t=
he same
memory region used for R-Car E3. I can see the following options:
* use 0x31 as you recommended
* keep 0x15 and change it later on to the right figure once the driver actu=
ally supports all
of the documented registers (and maybe updated r8a77990.dtsi as well in cas=
e the IP is the
same?)
* drop i2c_dvfs from this patch, and send it with a new patch once we get s=
ome answers
from Japan

What's best option?

Thanks,
Fab

>
> > +interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 926>;
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 926>;
> > +dmas =3D <&dmac0 0x11>, <&dmac0 0x10>;
> > +dma-names =3D "tx", "rx";
> > +status =3D "disabled";
> > +};
> > +
> >  hscif0: serial@e6540000 {
> >  compatible =3D "renesas,hscif-r8a774c0",
> >       "renesas,rcar-gen3-hscif",
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
