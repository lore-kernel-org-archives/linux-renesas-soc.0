Return-Path: <SRS0=AhbF=PM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC72C43444
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 10:02:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D25A21872
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 10:02:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="gtypCaWE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfADKCH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Jan 2019 05:02:07 -0500
Received: from mail-eopbgr1410104.outbound.protection.outlook.com ([40.107.141.104]:56079
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726262AbfADKCH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jan 2019 05:02:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndx0Q09nx6YLtunscm50iVgrBkrLebWrHB+1u+kreho=;
 b=gtypCaWEDSVWg5U0OIed1Y5LMS+3GLmXX2vOAtMb5hMjOLjf8sqqOeFLh3S9Wz9LMA1fXYyKPLgUunCIztF/4eSIrSX+jqH5GpdXP9GGAxQdcRJiIeGls0fBMFctROp50Tsa+5ulcyeHB+WXe4c7cVIZOvTbMRGyUUboEJhGDp4=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.241.22) by
 OSBPR01MB2200.jpnprd01.prod.outlook.com (52.134.242.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.7; Fri, 4 Jan 2019 10:02:03 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::35e7:300c:a781:3ef6]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::35e7:300c:a781:3ef6%2]) with mapi id 15.20.1495.005; Fri, 4 Jan 2019
 10:02:02 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder from du
 node
Thread-Topic: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder from du
 node
Thread-Index: AQHUjHsZHX2VrqnyIEaV0xiZ3WYDo6WdvK0AgAAIVxCAATs/AIAADUhA
Date:   Fri, 4 Jan 2019 10:02:02 +0000
Message-ID: <OSBPR01MB2103D40FC38C4A75476EBC39B88E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
 <1544000815-28069-5-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdW+qVJxu0fjC+j8w-neHU8FOHmJqRbHAtp1JvKYJ+RrXQ@mail.gmail.com>
 <OSBPR01MB2103C5C4C2A5B276E80D047AB88D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190104090517.bi5et5osmyxmfrwb@verge.net.au>
In-Reply-To: <20190104090517.bi5et5osmyxmfrwb@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB2200;20:LoyXNZz7U421kGSYCl2Dn/Im5+hAsuCFXy5Tbb5qwWfU0rKK6qTp/TSvgV/ykHA5ZmHHVSrPJAccpTes71aogkb+4VIq4/CbSwCppfmD+77qlwOSmUuFMThwmvv51byl55Si1ItW56H68z+19inIXWCVvfX7RGW8D1tHFVUGv68=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 71fd5215-07ad-42b0-ef11-08d6722baca5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB2200;
x-ms-traffictypediagnostic: OSBPR01MB2200:
x-microsoft-antispam-prvs: <OSBPR01MB220087EFB9AFC6F3BEBDC9FDB88E0@OSBPR01MB2200.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93001095)(10201501046)(6055026)(6041310)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB2200;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB2200;
x-forefront-prvs: 0907F58A24
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(136003)(39860400002)(376002)(346002)(51914003)(189003)(199004)(105586002)(106356001)(25786009)(6916009)(76176011)(7696005)(26005)(6346003)(66066001)(186003)(55016002)(229853002)(74316002)(102836004)(6246003)(256004)(107886003)(5660300001)(8676002)(14444005)(53936002)(9686003)(81166006)(305945005)(7736002)(478600001)(68736007)(81156014)(3846002)(6116002)(8936002)(4326008)(44832011)(2906002)(39060400002)(11346002)(446003)(476003)(14454004)(6436002)(71190400001)(71200400001)(97736004)(316002)(54906003)(99286004)(53546011)(6506007)(33656002)(486006)(86362001)(93886005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2200;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YnQGxY6iHu+nIrrMB8aUCOl+3bI/o4jG99EkLToVXzCresoCOkPHTpSdUeca04e/yfzBHd2AMOSK1vPoSTu67EEwkbBTye0Zx0lddgkulzyIkp96d9V9uUF9E5WrtVW8hIZY769yfuwqIC3MroQMDjnn5SpQsW/NzVJhrtiXKA1iR0AWF8gJNaEc5DmXOIN6IYYrHMwAadlF9mvE1MpBq5m1GUW949IM9jOHmorTh9WsiC40lz1Jifnd2kXL0d3qVucpOuJGUJIwv8NLpIYs/rA0/g6tnX8p7skWvDmK07t9uzirUQ8sDSedLCggVg57
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fd5215-07ad-42b0-ef11-08d6722baca5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2019 10:02:02.3969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2200
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

Thanks for the feedback.

> Subject: Re: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder from
> du node
>
> On Thu, Jan 03, 2019 at 02:34:39PM +0000, Biju Das wrote:
> > Hi Geert,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder
> > > from du node
> > >
> > > Hi Biju,
> > >
> > > On Wed, Dec 5, 2018 at 10:15 AM Biju Das <biju.das@bp.renesas.com>
> > > wrote:
> > > > The internal LVDS encoder now has DT bindings separate from the DU.
> > > > So remove it from du node.
> > > >
> > > > Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to
> > > > bridge driver")
> > > >
> > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > ---
> > > > V1-->V2
> > > >         * Removed LVDS encoder definition from DU node.
> > >
> > > Shouldn't you add a new node for the LVDS encoder?
> >
> > Yes for Soc Dtsi , I will add the new node for LVDS encoder.
>
> Can I clarify that I should wait for a fresh revision of this and the fol=
lowing
> patch?

My original plan was to submit LVDS encoder patch as separate one.

But now we are agreeing for adding  LVDS encoder node as part of the fix (F=
ixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driv=
er")
So I will send V3 with this change.

Regards,
Biju
> > > > ---
> > > >  arch/arm/boot/dts/r8a7743.dtsi | 9 +++------
> > > >  1 file changed, 3 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/r8a7743.dtsi
> > > > b/arch/arm/boot/dts/r8a7743.dtsi index 3cc33f7..3ad1efc 100644
> > > > --- a/arch/arm/boot/dts/r8a7743.dtsi
> > > > +++ b/arch/arm/boot/dts/r8a7743.dtsi
> > > > @@ -1681,15 +1681,12 @@
> > > >
> > > >                 du: display@feb00000 {
> > > >                         compatible =3D "renesas,du-r8a7743";
> > > > -                       reg =3D <0 0xfeb00000 0 0x40000>,
> > > > -                             <0 0xfeb90000 0 0x1c>;
> > > > -                       reg-names =3D "du", "lvds.0";
> > > > +                       reg =3D <0 0xfeb00000 0 0x40000>;
> > > >                         interrupts =3D <GIC_SPI 256 IRQ_TYPE_LEVEL_=
HIGH>,
> > > >                                      <GIC_SPI 268 IRQ_TYPE_LEVEL_HI=
GH>;
> > > >                         clocks =3D <&cpg CPG_MOD 724>,
> > > > -                                <&cpg CPG_MOD 723>,
> > > > -                                <&cpg CPG_MOD 726>;
> > > > -                       clock-names =3D "du.0", "du.1", "lvds.0";
> > > > +                                <&cpg CPG_MOD 723>;
> > > > +                       clock-names =3D "du.0", "du.1";
> > > >                         status =3D "disabled";
> > > >
> > > >                         ports {
> > >
> > > Gr{oetje,eeting}s,
> > >
> > >                         Geert
> > >
> > > --
> > > Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
> > > geert@linux- m68k.org
> > >
> > > In personal conversations with technical people, I call myself a
> > > hacker. But when I'm talking to journalists I just say "programmer" o=
r
> something like that.
> > >                                 -- Linus Torvalds
> >
> >
> >
> > Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne
> End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under
> Registered No. 04586709.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
