Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CEDC10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 09:59:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72BB72089F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 09:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="rBQbNLUo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfDXJ7W (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 05:59:22 -0400
Received: from mail-eopbgr1410094.outbound.protection.outlook.com ([40.107.141.94]:10687
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726167AbfDXJ7W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 05:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9uV4qUxVvtjbDYnug7dcIUGVj8YRu6kQSv/QOxghVs=;
 b=rBQbNLUogFe0fvE6jdmQXgeUZGW7PjAyLLYYCP7eveZ8v4/mj6+PK6YYO52s8rdUQlMta9RX1RoOhPELlGVdnCNhUsSpEr9qepWenIjK2ksYsjCMhF/T2cIWEzY5wc/z2w09v4+E6v264PUM37MqejOkKsfIovfafYF/2EjGGpE=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1721.jpnprd01.prod.outlook.com (52.133.164.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Wed, 24 Apr 2019 09:59:15 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::60bb:89e4:1a58:e901]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::60bb:89e4:1a58:e901%2]) with mapi id 15.20.1813.017; Wed, 24 Apr 2019
 09:59:15 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add HDMI video
 suport
Thread-Topic: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add HDMI video
 suport
Thread-Index: AQHU9C/yC1+n+fgH+kS75YF+sNIhKqZLHL8AgAADdlA=
Date:   Wed, 24 Apr 2019 09:59:14 +0000
Message-ID: <TY1PR01MB17707DBD69B60B47CB1954D7C03C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1555403977-7188-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190424094616.5e7d5u4t2h6pxcdb@verge.net.au>
In-Reply-To: <20190424094616.5e7d5u4t2h6pxcdb@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60ce6506-5597-4fb9-fb3a-08d6c89b824f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TY1PR01MB1721;
x-ms-traffictypediagnostic: TY1PR01MB1721:
x-microsoft-antispam-prvs: <TY1PR01MB1721E8619070D16FDC9184DCC03C0@TY1PR01MB1721.jpnprd01.prod.outlook.com>
x-forefront-prvs: 00179089FD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(136003)(39860400002)(346002)(396003)(199004)(189003)(76116006)(53936002)(66066001)(71190400001)(3846002)(8676002)(71200400001)(478600001)(186003)(81166006)(55016002)(68736007)(6246003)(9686003)(102836004)(7736002)(4744005)(229853002)(305945005)(81156014)(5660300002)(99286004)(97736004)(26005)(6116002)(8936002)(14454004)(256004)(54906003)(66476007)(316002)(86362001)(6436002)(64756008)(66556008)(74316002)(25786009)(76176011)(52536014)(53546011)(486006)(73956011)(6506007)(4326008)(11346002)(66946007)(44832011)(446003)(66446008)(476003)(33656002)(6916009)(2906002)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1721;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TDicgf+PSes4uRTRZM8ApK+S+3vVWvCTfPiEES0OoNeOd1HQ886Wgi+CNA/zNT0aiGARmpMlpKC/DnbjFnZlwWfSsNcYGFhPyEQOZ5k8IxbPljqvcVH7xP8O0FxBNCIIOde0ijHwXibA+vYTcnMJ8MA81NFywORttr6VSaPmmruQwNTev5a34De2WbJJzVeLodxGTfH71eDWZWovHnR+H8UBKo7+1OrsDPv+gU4mtn13nB7DNWluMfN9CZWk2nfy+h14ewasV/Y83oOM0cMw749XsnUZsDsUGb4pf+9N+X8vVv1/QvjSc5TQGqWAVoEczg7v5WodcL3ZppXjBRJJ3cERqcqQ+epCKUnfYw/cPivUFklpnt5ijNH884kG3uP5Kvzax4QboboRUpwmvhWnNLMoP9vck1m6yK140fCKlrY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ce6506-5597-4fb9-fb3a-08d6c89b824f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2019 09:59:14.9548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1721
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

> From: Simon Horman <horms@verge.net.au>
> Sent: 24 April 2019 10:46
> Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add HDMI video=
 suport
>=20
> On Tue, Apr 16, 2019 at 09:39:37AM +0100, Fabrizio Castro wrote:
> > The CAT874 board comes with a HDMI connector, managed by
> > a TDA19988BET chip, connected to the RZ/G2E SoC via DPAD.
> > This patch adds the necessary support to the board DT.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>=20
> Thanks Fabrizio,
>=20
> applied for inclusion in v5.3 with the spelling of support corrected.

Thank you for fixing.

Fab
