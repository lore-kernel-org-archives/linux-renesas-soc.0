Return-Path: <SRS0=RWjW=PK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9176FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 15:11:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BCF220656
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 15:11:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="kI7P9H4E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbfABPLX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Jan 2019 10:11:23 -0500
Received: from mail-eopbgr1400139.outbound.protection.outlook.com ([40.107.140.139]:58288
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727864AbfABPLW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jan 2019 10:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rgtvavk5wTZfJtzeKKVQlb3eqoGjiDW8XZetv44Scw=;
 b=kI7P9H4EgqTQ+JL8bH8Vgl5UwDUMTjXDcJ8nNBTAIAlEE4uvrD4IMmEFdFvNbKHNTTcryJ/HDTgW0xJlgrU2UplTCynDyPlimds61t/dsfVtNADPaHVUo1Zcx/nRguiCZZJZlpW3AZBXFFaDd7QqD20P5Jw2xCxp+/lD95+YoBs=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.241.22) by
 OSBPR01MB1542.jpnprd01.prod.outlook.com (52.134.225.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1471.20; Wed, 2 Jan 2019 15:11:16 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::35e7:300c:a781:3ef6]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::35e7:300c:a781:3ef6%2]) with mapi id 15.20.1495.005; Wed, 2 Jan 2019
 15:11:14 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] soc: renesas: r8a774c0-sysc: Fix initialization order of
 3DG-{A,B}
Thread-Topic: [PATCH] soc: renesas: r8a774c0-sysc: Fix initialization order of
 3DG-{A,B}
Thread-Index: AQHUkhXU+EBeA8bYUEKdefrumcsreqV8hw4AgAHgoACAHXJmAIAAWe2g
Date:   Wed, 2 Jan 2019 15:11:13 +0000
Message-ID: <OSBPR01MB2103C55C91F968BE2CD870AEB88C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1544617031-28114-1-git-send-email-biju.das@bp.renesas.com>
 <20181213111846.qd25vzpnejbzzldg@verge.net.au>
 <20181214155900.za4xbl74sbbgc4ef@verge.net.au>
 <20190102093958.e7wjhm7eqeu367s7@verge.net.au>
In-Reply-To: <20190102093958.e7wjhm7eqeu367s7@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB1542;20:/mpbGeROQphOsqZc/9rOhbGQW/gJ8CXn7xGh4/EUNeuWH3lVGBewU3d9Q41r1sVQAAbEPF6GBYD8Xz1Q8okz01rtZqXcFE2Ooo9n+7ZInV5vaPRNm4RphZYzfRAnigtoxNHoTq5p32VKecsxqkvVZaGD2MFdB3sF2T3FlCkZEiE=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: ca4d54dc-28b1-4d9c-5c18-08d670c489aa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB1542;
x-ms-traffictypediagnostic: OSBPR01MB1542:
x-microsoft-antispam-prvs: <OSBPR01MB1542F6B2786AB5D76FF2493FB88C0@OSBPR01MB1542.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3231475)(944501520)(52105112)(10201501046)(3002001)(93006095)(93001095)(6055026)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123558120)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB1542;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB1542;
x-forefront-prvs: 0905A6B2C7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(346002)(396003)(366004)(376002)(136003)(51914003)(13464003)(189003)(199004)(6436002)(26005)(186003)(68736007)(446003)(86362001)(6306002)(44832011)(9686003)(14454004)(229853002)(6116002)(3846002)(966005)(55016002)(6506007)(478600001)(76176011)(99286004)(53546011)(102836004)(316002)(54906003)(7696005)(33656002)(39060400002)(97736004)(93886005)(71190400001)(305945005)(66066001)(71200400001)(106356001)(105586002)(8936002)(53936002)(11346002)(74316002)(5660300001)(81166006)(2906002)(4326008)(8676002)(486006)(6246003)(25786009)(107886003)(81156014)(6916009)(14444005)(476003)(256004)(7736002)(142933001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1542;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +Bq0FTsYAwlpsScS8x4PtlxoZjc5MqTUOQfH3cLh7iH8nqVkNmt6nRmEzQwfwzffWu3Jfo4mUMN9BuO6/9wo8kd1neIT5rDq6L0gvXtLPhpRktX8etDuzqT1GSpjWWPWQ1fgXCGGpdUMOQKUSpbz6aA7ilZH1088g1Nw/IIKuo50qA7NxDZHYEv/oxHDxigc7mFpQdcKEN5UBYGF2UV6mdZzw6mlEkeE75tuQKvbihpcsNHMikozD6F+9Ua/8YvvWa16gdlkAqrSJPavyCAhJ9oOk+8+O0GFwvebtw+I+SFK61QHwLCV6L/X0wI3oUMW
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4d54dc-28b1-4d9c-5c18-08d670c489aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2019 15:11:13.9735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1542
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

Thanks for the feedback.

> -----Original Message-----
> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-
> owner@vger.kernel.org> On Behalf Of Simon Horman
> Sent: 02 January 2019 09:40
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>; linux-renesas-
> soc@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>;
> Chris Paterson <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>
> Subject: Re: [PATCH] soc: renesas: r8a774c0-sysc: Fix initialization orde=
r of
> 3DG-{A,B}
>
> On Fri, Dec 14, 2018 at 04:59:00PM +0100, Simon Horman wrote:
> > On Thu, Dec 13, 2018 at 12:18:46PM +0100, Simon Horman wrote:
> > > On Wed, Dec 12, 2018 at 12:17:11PM +0000, Biju Das wrote:
> > > > The workaround for the wrong hierarchy of the 3DG-{A,B} power
> > > > domains on RZ/G2E ES1.0 corrected the parent domains. However, the
> > > > 3DG-{A,B} power domains were still initialized and powered in the
> > > > wrong order, causing 3DG operation to fail.
> > > >
> > > > Fix this by changing the order in the table at runtime, when
> > > > running on an affected SoC.
> > > >
> > > > This work is based on the work done by Geert for R-Car E3.
> > > >
> > > > Fixes: f37d211c687588328 ("soc: renesas: rcar-sysc: Add r8a774c0
> > > > support")
> > > >
> > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > >
> > > Thanks,
> > >
> > > This looks fine to me but I will wait to see if there are other
> > > reviews before applying.
> > >
> > > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> >
> > Thanks, v2 sent.
> >
>
> I don't see a v2 or any other review of this patch.
> Am I missing something?

I guess you have sent v2,

https://patchwork.kernel.org/patch/10731381/

based on

https://patchwork.kernel.org/patch/10726065/

regards,
Biju







Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
