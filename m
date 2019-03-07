Return-Path: <SRS0=HvZV=RK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9802EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 16:02:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6852720652
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 16:02:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="gPVBkho/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbfCGQCi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Mar 2019 11:02:38 -0500
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:35040
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726214AbfCGQCi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Mar 2019 11:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pdUa5FceJP01zuATkOWlqn4q1zPgEQ1husrB1HUiaA=;
 b=gPVBkho/qo4a9GylSgG8mQII7XUO8acicGxPeff8IwoCjmp3OrR0E+s3MYlx4LxwWVTVP1Ke/wuq9wsiGJA+5Vza8mLWcWriI9veWe5PDWvWCEK1WCIpgEuzHQoCLoc7U0741pbR0jcw7XTmoUNPZCCTP1TPvLLc6na30GE3SQc=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4741.jpnprd01.prod.outlook.com (20.179.182.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.16; Thu, 7 Mar 2019 16:02:33 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5b0:ac4:6d54:6285]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5b0:ac4:6d54:6285%5]) with mapi id 15.20.1686.018; Thu, 7 Mar 2019
 16:02:33 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/9] usb: gadget: udc: renesas_usb3: use extcon framework
 to receive connect/disconnect
Thread-Topic: [PATCH 4/9] usb: gadget: udc: renesas_usb3: use extcon framework
 to receive connect/disconnect
Thread-Index: AQHU0/zd2X3Y6Y6qOEGZmqT3Ax10e6X+jEqAgAHIbdA=
Date:   Thu, 7 Mar 2019 16:02:33 +0000
Message-ID: <OSBPR01MB2103B723C07825444476A243B84C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
 <1551863246-11656-5-git-send-email-biju.das@bp.renesas.com>
 <20190306124301.GB28103@kuha.fi.intel.com>
In-Reply-To: <20190306124301.GB28103@kuha.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dcf6837-2eb8-461b-077e-08d6a3164f29
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB4741;
x-ms-traffictypediagnostic: OSBPR01MB4741:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: 1;OSBPR01MB4741;20:vW5h6uvTCmtvieNudqio3AbQg+5WEbOAtI4nlgNDhdcK565ZRwHRIW7IVBhPWNqbF/djfiZlIrezzyv2/zng+OyC4vA+HgNxYYxmk1JX4gmP4AiF5yvor7k1WP+MW+GOr/3O83Ix9AKCYVEjWQabC3Sxr4GevNOplcDds9kgHQk=
x-microsoft-antispam-prvs: <OSBPR01MB47411A8C08D8CAC9F81262D4B84C0@OSBPR01MB4741.jpnprd01.prod.outlook.com>
x-forefront-prvs: 096943F07A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(346002)(396003)(39860400002)(136003)(189003)(199004)(51914003)(106356001)(305945005)(76176011)(486006)(7696005)(6506007)(8676002)(4326008)(97736004)(102836004)(11346002)(446003)(476003)(99286004)(316002)(7736002)(86362001)(55016002)(54906003)(3846002)(74316002)(6116002)(9686003)(6246003)(53936002)(44832011)(6306002)(81156014)(81166006)(25786009)(26005)(6436002)(5660300002)(186003)(105586002)(6916009)(966005)(33656002)(66066001)(14444005)(229853002)(8936002)(256004)(478600001)(68736007)(71200400001)(14454004)(71190400001)(2906002)(52536013);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4741;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vwX4EQdFRK/iGGodjexSU94/I+LZma3Qp2fnqAe+9zrUWdBkfMiXuM0KLnay1A2KZiSYBCDp6o2gyWc66KVtvGenI+gs2SavhkXU/1UcfTlNVVDyiOnT5f/KKZATSuAH/NvZ7lGbpnhhtFieaN7o36y06vsSbzhLXuCnhpnftBe+NFxMvUmZEHg832VSq51ID4Hyw1I1FEpP1xpvZ0KGpILIbqY195xcPkxqx7yYHuspiyUMUif4SD1HNjmLf5mXWkNJyJTN1m1EwNt5H6uXJxUsqEvxz5LnHt5gfd1UPEsHvmTHepGRQYiM1pDYKkuL0iTtsyp/Wn/Mx2ErBILIdwIS/CPXNv5CnkAL0J1vKxIOqtVOktDXCQ5C8LW7y2zB3HJd9MJoeYcKBOl5YlPZ+orarPu8VN7Ui4OlLrUqiOI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcf6837-2eb8-461b-077e-08d6a3164f29
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2019 16:02:33.0629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4741
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Heikki,

Thanks for the feedback.

> Subject: Re: [PATCH 4/9] usb: gadget: udc: renesas_usb3: use extcon
> framework to receive connect/disconnect
>=20
> On Wed, Mar 06, 2019 at 09:07:21AM +0000, Biju Das wrote:
> > RZ/G2E cat874 board is capable of detecting cable connect and
> > disconnect events. Add support for renesas_usb3 to receive connect and
> > disconnect notification using extcon framework.
>=20
> I think you will need the series from Yu Chen [1], but once we have that,=
 you
> can do this with USB role class instead of relying on extcon, and that is=
 what
> you need to do.
>=20
> There is a reason why we need to use a dedicated class with the USB role
> switching instead of relying on extcon. We actually originally planned on=
 using
> extcon with the USB role switches, but the extcon maintainers refused som=
e
> the USB mux drivers. The problem from extcon perspective is that the
> consumer/supplier roles seem to be inverted in some cases. USB role switc=
h
> can simply be too many things - discrete mux, integrated mux (like in you=
r
> case) or something like a dual role capable USB controller could simply
> represent one.
>=20
> On the other hand, using a dedicated API and class now feel like a much
> better idea in general compared to a multipurpose thing like extcon.
>=20
> [1] https://lkml.org/lkml/2019/3/2/42

Ok. Will use usb role class instead of extcon .=20

Regards,
Biju
