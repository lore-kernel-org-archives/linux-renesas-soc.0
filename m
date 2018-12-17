Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EBFC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:19:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC03320645
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="R0C7ckrI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732042AbeLQMTX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 07:19:23 -0500
Received: from mail-eopbgr1400092.outbound.protection.outlook.com ([40.107.140.92]:45952
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727096AbeLQMTW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 07:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLHEoh1M57Cjn5IqlnCGd/dfieUewHQkv4vkw7jEJeQ=;
 b=R0C7ckrIUyiY2glvtEDh9pHeqQcg+URnYUrryAHXakWYFfryo8+jPW1DehpsE3+LMv6rUrwya82z6zhcoUgB/tcy/M6RG+oQZ8ToOpEo7QDce5sQl8iCsicMQUhaYCJJWJz/r6qoIyn3clbYuDOT83SsnInG7X6fUeQtm68gPBs=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1786.jpnprd01.prod.outlook.com (52.133.163.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Mon, 17 Dec 2018 12:19:16 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::dcee:f270:d42b:5b48]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::dcee:f270:d42b:5b48%5]) with mapi id 15.20.1425.021; Mon, 17 Dec 2018
 12:19:16 +0000
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
Thread-Index: AQHUk5Cw21PJc0Kk+kO145apBL9P1aWB0amAgAD59QCAAAqkAIAAB9uQ
Date:   Mon, 17 Dec 2018 12:19:16 +0000
Message-ID: <TY1PR01MB1770E768408113F4C9F57B64C0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181216201741.qqwmc44ogqifl52e@verge.net.au>
 <TY1PR01MB177034D6488A48CE08DF797FC0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20181217115024.lhaeaw4b55dgpgx2@verge.net.au>
In-Reply-To: <20181217115024.lhaeaw4b55dgpgx2@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1786;20:ub+2VI/HvOUOUqEhc7kOERltaoWMAuxquSu5LF/M6xRn/5ZdOt9Ea1PKCMOhY7Mre+xFFgEMOunyku7Lu2Xe68tPH1Ecm3nF7uYLvwsQIt7OIF3UvPqxc2ML4KzJ3i1eupj919WZyaIFoWOKLq9Gw7HSn9/J3uNGM/Mlup3aYzo=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 7e4ce8fa-463f-4406-ef9b-08d66419dd20
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1786;
x-ms-traffictypediagnostic: TY1PR01MB1786:
x-microsoft-antispam-prvs: <TY1PR01MB178651D1E75F1592A15B3EC0C0BC0@TY1PR01MB1786.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(5005020)(6040522)(2401047)(8121501046)(10201501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:TY1PR01MB1786;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB1786;
x-forefront-prvs: 08897B549D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(366004)(376002)(136003)(39860400002)(189003)(199004)(66066001)(55016002)(53546011)(102836004)(6116002)(26005)(7696005)(6506007)(99286004)(3846002)(316002)(97736004)(76176011)(71190400001)(71200400001)(229853002)(6916009)(6436002)(186003)(478600001)(54906003)(7736002)(81156014)(10126004)(106356001)(8936002)(25786009)(39060400002)(107886003)(81166006)(6306002)(74316002)(446003)(6246003)(305945005)(486006)(2906002)(86362001)(476003)(14454004)(11346002)(4326008)(44832011)(105586002)(345774005)(5660300001)(8676002)(68736007)(93886005)(53936002)(33656002)(9686003)(14444005)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1786;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: NdG3G6egJJ9MVjWbJkbAdtJjR4DTrdgCToMCMkjzTpPG87j8JFw09n3e8uNNDGmOlkzzH1HylA+Jp0CJl9HViUN0kYIxpQs+IkuztIOB1HcnJmtAICt5AG/I2XsTvA39xWIMsNfwPQL3Pigo08V+rjH6VTD2n93rAu5raP6fh6kFtWcZCQ7ATm7XZ6NG78i3CC/9aFQMBxA5GPozFtrZm3B2Be9su583DTxc76BgHhtsKmv8TmqaZdr2Lo+O03ZrnFqpPNqETsQE9YMnmQfUTrH39MUbBpFOYzP/m6jk10EbMShCeWfVR7q/1JJ7gKNP
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4ce8fa-463f-4406-ef9b-08d66419dd20
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2018 12:19:16.4856
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
> Sent: 17 December 2018 11:50
> To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Subject: Re: [PATCH 02/17] arm64: dts: renesas: r8a774c0: Add I2C and IIC=
-DVFS support
>
> On Mon, Dec 17, 2018 at 11:24:39AM +0000, Fabrizio Castro wrote:
> > Hello Simon,
> >
> > > From: Simon Horman <horms@verge.net.au>
> > > Sent: 16 December 2018 20:18
> > > Subject: Re: [PATCH 02/17] arm64: dts: renesas: r8a774c0: Add I2C and=
 IIC-DVFS support
> > >
> > > On Fri, Dec 14, 2018 at 09:37:25AM +0000, Fabrizio Castro wrote:
> > > > Add the I2C[0-7] and IIC Bus Interface for DVFS (IIC for DVFS)
> > > > devices nodes to the r8a774c0 device tree.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > Thanks Fabrizo for this patch, it looks good to me with the exception=
 of
> > > one minor question I have below.
> > >
> > > > ---
> > > >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 143 ++++++++++++++++++=
++++++++++++
> > > >  1 file changed, 143 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64=
/boot/dts/renesas/r8a774c0.dtsi
> > > > index 96a71e3..bf08aba 100644
> > > > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > > @@ -271,6 +271,149 @@
> > > >  resets =3D <&cpg 407>;
> > > >  };
> > > >
> > > > +i2c0: i2c@e6500000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe6500000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 931>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 931>;
> > > > +dmas =3D <&dmac1 0x91>, <&dmac1 0x90>,
> > > > +       <&dmac2 0x91>, <&dmac2 0x90>;
> > > > +dma-names =3D "tx", "rx", "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <110>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c1: i2c@e6508000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe6508000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 930>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 930>;
> > > > +dmas =3D <&dmac1 0x93>, <&dmac1 0x92>,
> > > > +       <&dmac2 0x93>, <&dmac2 0x92>;
> > > > +dma-names =3D "tx", "rx", "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <6>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c2: i2c@e6510000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe6510000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 929>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 929>;
> > > > +dmas =3D <&dmac1 0x95>, <&dmac1 0x94>,
> > > > +       <&dmac2 0x95>, <&dmac2 0x94>;
> > > > +dma-names =3D "tx", "rx", "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <6>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c3: i2c@e66d0000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe66d0000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 928>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 928>;
> > > > +dmas =3D <&dmac0 0x97>, <&dmac0 0x96>;
> > > > +dma-names =3D "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <110>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c4: i2c@e66d8000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe66d8000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 927>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 927>;
> > > > +dmas =3D <&dmac0 0x99>, <&dmac0 0x98>;
> > > > +dma-names =3D "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <6>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c5: i2c@e66e0000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe66e0000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 919>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 919>;
> > > > +dmas =3D <&dmac0 0x9b>, <&dmac0 0x9a>;
> > > > +dma-names =3D "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <6>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c6: i2c@e66e8000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe66e8000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 918>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 918>;
> > > > +dmas =3D <&dmac0 0x9d>, <&dmac0 0x9c>;
> > > > +dma-names =3D "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <6>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c7: i2c@e6690000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe6690000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 1003>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 1003>;
> > > > +i2c-scl-internal-delay-ns =3D <6>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c_dvfs: i2c@e60b0000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,iic-r8a774c0";
> > > > +reg =3D <0 0xe60b0000 0 0x15>;
> > >
> > > My reading of the documentation is that 0x31 would be a more appropri=
ate
> > > size for the register window.
> >
> > Thank you for looking into this. RZ/G2 documentation about this seems a=
 bit incomplete
> > at the moment, and we weren't too sure about what to do here. Our expec=
tation is
> > that the IP should be the same as the one found in R-Car E3, and we tho=
ught they
> > finally wanted to document some previously undocumented registers with =
the RZ/G2
> > User's manual. We are waiting for some answers from Japan, and since th=
e driver
> > doesn't support the "new" registers we thought there was no harm in usi=
ng the same
> > memory region used for R-Car E3. I can see the following options:
> > * use 0x31 as you recommended
> > * keep 0x15 and change it later on to the right figure once the driver =
actually supports all
> > of the documented registers (and maybe updated r8a77990.dtsi as well in=
 case the IP is the
> > same?)
> > * drop i2c_dvfs from this patch, and send it with a new patch once we g=
et some answers
> > from Japan
> >
> > What's best option?
>
> If you think 0x15 is correct then lets just use that and follow-up
> with a fix if necessary.

Thank you for this.

Cheers,
Fab

>
> I'm now happy with this patch but would like to give others a chance to
> review it.
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>
> > Thanks,
> > Fab
> >
> > >
> > > > +interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 926>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 926>;
> > > > +dmas =3D <&dmac0 0x11>, <&dmac0 0x10>;
> > > > +dma-names =3D "tx", "rx";
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > >  hscif0: serial@e6540000 {
> > > >  compatible =3D "renesas,hscif-r8a774c0",
> > > >       "renesas,rcar-gen3-hscif",
> > > > --
> > > > 2.7.4
> > > >
> >
> >
> > [https://www2.renesas.eu/media/email/unicef.jpg]
> >
> > This Christmas, instead of sending out cards, Renesas Electronics Europ=
e have decided to support Unicef with a donation. For further
> details click here<https://www.unicef.org/> to find out about the valuabl=
e work they do, helping children all over the world.
> > We would like to take this opportunity to wish you a Merry Christmas an=
d a prosperous New Year.
> >
> >
> >
> > Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne En=
d, Buckinghamshire, SL8 5FH, UK. Registered in England
> & Wales under Registered No. 04586709.
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
