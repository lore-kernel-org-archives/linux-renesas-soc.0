Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEBCC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 11:16:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C901520828
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 11:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="RLJKCrQW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbfCSLQk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 07:16:40 -0400
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:50442
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725862AbfCSLQk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 07:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hx/j7Pz/Moq4ylJ4qC94cKR4CeaWBmWCtkI/sijJurc=;
 b=RLJKCrQWP+b/de0tPZ1wcGtVo6ppB9EJVQ/WWKH4N63W3osu0bd9UgiR2yN0oC5AFBV05LTMpp+0/frJ/BbBqB7Q4uzwC3wOTEopSDq8NvZnd3A5tTWofXF0ukKBtP43em2fKriPayVttNWKAqs5mv1gdhLNkMyCikYl79c/AZQ=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1545.jpnprd01.prod.outlook.com (52.133.162.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Tue, 19 Mar 2019 11:16:36 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273%4]) with mapi id 15.20.1709.015; Tue, 19 Mar 2019
 11:16:36 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
Thread-Topic: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
Thread-Index: AQHU0B6IaNTCNppok0yBAcobr7zd0aX2x/uAgAR5igCAAAGLYIADVAkAgBRS03A=
Date:   Tue, 19 Mar 2019 11:16:36 +0000
Message-ID: <TY1PR01MB17701F90AC74BA91D68B1ABDC0400@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1551438256-22065-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWNqFkSRnX9kGGFOCMTEHguQtsD=JfqLaHUpB=kgETPWA@mail.gmail.com>
 <20190304095856.uqqwhw46oueb2vtf@verge.net.au>
 <TY1PR01MB1770F48284CA48C991052263C0710@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190306125359.xqtuq35ccwfbbk5q@verge.net.au>
In-Reply-To: <20190306125359.xqtuq35ccwfbbk5q@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2aa2eab-c2fe-4fc8-3afa-08d6ac5c5a16
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1545;
x-ms-traffictypediagnostic: TY1PR01MB1545:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <TY1PR01MB154584AA74DB789962C25499C0400@TY1PR01MB1545.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(346002)(396003)(39860400002)(366004)(199004)(189003)(71200400001)(316002)(186003)(6246003)(52536014)(81166006)(54906003)(102836004)(44832011)(486006)(11346002)(478600001)(53546011)(8676002)(6506007)(966005)(26005)(6916009)(68736007)(107886003)(25786009)(81156014)(8936002)(66066001)(86362001)(229853002)(3846002)(71190400001)(93886005)(53936002)(6306002)(106356001)(9686003)(5660300002)(105586002)(4326008)(6116002)(97736004)(2906002)(256004)(33656002)(99286004)(76176011)(305945005)(74316002)(476003)(446003)(7696005)(14454004)(55016002)(7736002)(14444005)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1545;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 101GEvPPKO+9ZXCD31edVsVgo1S+NQcD8lE0cjvDJF7GIkRpLYHGZHyDd0PF9EnZHnYuhgObwZck4sqb2poA3dFJFH69j76Lu2RVgPqWowsEwE+RK2F0pofprO2MR2RZCnqgICzGRkVA4/gOI8zPr21o6thYamKhBLnCeXKIIA6EBVeIXEIGwoEVIH9EJjy/nXjzq+fCP04ZrGdEXAwsGs405D+bW5TEpO3w+vFpoKAwWTm4BeHRApa9vPBrZMD1meAzWX8J1x/HkX7KrNOLVAcfv4loz0QZ6QzMxvJWJpeLSDh2HbfNRFLm6oWshP/KZbTPC/SWdioH9OBff0hHIU6aNmIsYBzuqNv0QL+9ZSxPgxvyj7h0zdyvmiwi4Rornct2FLns/0nD20A40Gb0sZjgvUiIYtyQPRKA63RaMCQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2aa2eab-c2fe-4fc8-3afa-08d6ac5c5a16
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 11:16:36.5907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1545
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

> From: Simon Horman <horms@verge.net.au>
> Sent: 06 March 2019 12:54
> Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
>=20
> On Mon, Mar 04, 2019 at 10:10:49AM +0000, Fabrizio Castro wrote:
> > Hello Simon,
> >
> > Thank you for your feedback!
> >
> > > From: Simon Horman <horms@verge.net.au>
> > > Sent: 04 March 2019 09:59
> > > To: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; Rob Herring <ro=
bh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>;
> > > Magnus Damm <magnus.damm@gmail.com>; Linux-Renesas <linux-renesas-soc=
@vger.kernel.org>; open list:OPEN FIRMWARE
> AND
> > > FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; Chris Pa=
terson <Chris.Paterson2@renesas.com>; Biju Das
> > > <biju.das@bp.renesas.com>
> > > Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
> > >
> > > On Fri, Mar 01, 2019 at 02:38:53PM +0100, Geert Uytterhoeven wrote:
> > > > On Fri, Mar 1, 2019 at 12:04 PM Fabrizio Castro
> > > > <fabrizio.castro@bp.renesas.com> wrote:
> > > > > The CANFD implementation on the RZ/G2E (a.k.a. r8a774c0) is
> > > > > identical to the one found on the r8a77990.
> > > > >
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > >
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Thanks, applied.
> >
> > The patch that adds R8A774C0_CLK_CANFD (https://patchwork.kernel.org/pa=
tch/10766867/)
> > Isn't in a release candidate just yet, therefore I was expecting this p=
atch to be deferred to
> > to when R8A774C0_CLK_CANFD is finally available, similarly to:
> > https://www.spinics.net/lists/netdev/msg547320.html
> >
> > Was I wrong?
>=20
> No, I was wrong in sending out the email above.
>=20
> The patch is still deferred.

My understanding is that this patch can be taken now, and it still applies =
neatly.

Thanks,
Fab
