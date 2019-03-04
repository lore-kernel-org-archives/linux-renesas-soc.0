Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CD3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:10:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3374220835
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:10:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="GkhZqo2r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbfCDKKy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 05:10:54 -0500
Received: from mail-eopbgr1400123.outbound.protection.outlook.com ([40.107.140.123]:2528
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726032AbfCDKKy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 05:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IePA85/Hn7Neb00SSknfy4BU+/b8qwOcDxqONMsg4M=;
 b=GkhZqo2rr0j56q53eXjml6gar+H3dYljh6Bn4MoI8tLz0ybvsrKlYin6LYE4NlDtm+LJ4ndIF598h2rW0qiJuraG7nHKENrM9+otuuJ1uvfDIimNG6TFrSO2BW9inLi7Ag3YURaFLyYFXHEy3wBTRgf3+W4nRHKYPTBvqCIjt8c=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1707.jpnprd01.prod.outlook.com (52.133.160.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.15; Mon, 4 Mar 2019 10:10:49 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273%4]) with mapi id 15.20.1665.019; Mon, 4 Mar 2019
 10:10:49 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
Thread-Topic: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
Thread-Index: AQHU0B6IaNTCNppok0yBAcobr7zd0aX2x/uAgAR5igCAAAGLYA==
Date:   Mon, 4 Mar 2019 10:10:49 +0000
Message-ID: <TY1PR01MB1770F48284CA48C991052263C0710@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1551438256-22065-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWNqFkSRnX9kGGFOCMTEHguQtsD=JfqLaHUpB=kgETPWA@mail.gmail.com>
 <20190304095856.uqqwhw46oueb2vtf@verge.net.au>
In-Reply-To: <20190304095856.uqqwhw46oueb2vtf@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2008d08f-e800-4b8a-4977-08d6a089ad12
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1707;
x-ms-traffictypediagnostic: TY1PR01MB1707:
x-ms-exchange-purlcount: 2
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1707;20:4aBGqa+aimMBKMhFnP8ZrpjaKdRj0S4ad+dOlopFrgcuhCAKh5huwRqWlAQRg0+Gixv6vYNJ6RU/AsAGo5LFSYQs2ZiFjeQ4UrF3FXSzh2Puo+1ibYkixFQ1G5gkGmRptRgfLZE+mbHM7fcXQN4aytMS7S13jnFcVhHRR1tA+ac=
x-microsoft-antispam-prvs: <TY1PR01MB17072A1F637FB01D2B2960A3C0710@TY1PR01MB1707.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09669DB681
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(376002)(396003)(39860400002)(136003)(189003)(199004)(7736002)(6246003)(81166006)(8676002)(81156014)(486006)(55016002)(3846002)(7696005)(476003)(446003)(2906002)(99286004)(11346002)(76176011)(305945005)(105586002)(106356001)(6116002)(229853002)(52536013)(110136005)(33656002)(5660300002)(316002)(6436002)(68736007)(478600001)(54906003)(6506007)(53936002)(53546011)(966005)(86362001)(8936002)(14454004)(9686003)(6306002)(102836004)(26005)(186003)(66066001)(44832011)(107886003)(97736004)(14444005)(4326008)(71200400001)(71190400001)(256004)(25786009)(74316002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1707;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dEh5OAZ7akowqBO6W3zC1Ibu62wzE3XPodv0rQt8SeE4UbepUDWdYxbl6PuLKm8xzpal87mqlCAiUkbYhmUvf/TedD/gWc7VbbP3nHmoo6bmr6r5qQpxTtN/3YlmqKz7ZYPpagsfQUPNrOBCsckydg0tIImwIyZmwUcBHo3r8MkjM7JEN/JupnUnDu0Xd7noDFCyV6ePbRBLMGfF1pXFM1eh5h6WbY2GUpqYvjQCIW4Rdc1/cn8as3Yvjge+h7bPU3H2a70eg+ha4+ZLv0TwbOd5ZHogrGRzAEJN22lM5KPJr1+mNN2xrtAT6i46S2s3U3RydTQ6gvqE937HtUalNjWv9TxHV0MulawjZ7yuypn1P/EkTbiA9J9OvBsCssS6UryEiT69YktHMXfXTKPuFV39n8NQKCSsz9WU6pElZeI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2008d08f-e800-4b8a-4977-08d6a089ad12
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2019 10:10:49.1642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1707
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 04 March 2019 09:59
> To: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; Rob Herring <robh+d=
t@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> Magnus Damm <magnus.damm@gmail.com>; Linux-Renesas <linux-renesas-soc@vge=
r.kernel.org>; open list:OPEN FIRMWARE AND
> FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; Chris Paters=
on <Chris.Paterson2@renesas.com>; Biju Das
> <biju.das@bp.renesas.com>
> Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
>=20
> On Fri, Mar 01, 2019 at 02:38:53PM +0100, Geert Uytterhoeven wrote:
> > On Fri, Mar 1, 2019 at 12:04 PM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > The CANFD implementation on the RZ/G2E (a.k.a. r8a774c0) is
> > > identical to the one found on the r8a77990.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Thanks, applied.

The patch that adds R8A774C0_CLK_CANFD (https://patchwork.kernel.org/patch/=
10766867/)
Isn't in a release candidate just yet, therefore I was expecting this patch=
 to be deferred to
to when R8A774C0_CLK_CANFD is finally available, similarly to:
https://www.spinics.net/lists/netdev/msg547320.html

Was I wrong?

Thanks,
Fab


