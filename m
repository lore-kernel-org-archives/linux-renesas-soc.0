Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20A2C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 15:18:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADB1B208E4
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 15:18:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="v/ZbDCxa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfDAPSC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 11:18:02 -0400
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:5824
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726637AbfDAPSC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 11:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVbQOqlkUsg5fW4Fnc+9WOhclS1QtOPhdT7+kkBnZIo=;
 b=v/ZbDCxaiALn5y/rHkQ+63l6NxspycG6VVoeOFbIPDZYy6y6Cg3e95ERbRGVh16IUmhICmF3u+eMQZflM3ToLv3wmavx+cubF7txjMh9v90LP+FNI7EP7Adt34JWM2g+gywTWtstnCPuyhJjH6AwcShtIQs4l1G6LFoPh5Et5B0=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2200.jpnprd01.prod.outlook.com (52.134.242.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.19; Mon, 1 Apr 2019 15:17:56 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::f9a1:af9d:75cf:5fd5]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::f9a1:af9d:75cf:5fd5%5]) with mapi id 15.20.1750.021; Mon, 1 Apr 2019
 15:17:56 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jianguo Sun <sunjianguo1@huawei.com>,
        Avi Fishman <AviFishman70@gmail.com>,
        Ofer Heifetz <oferh@marvell.com>,
        Lubomir Rintel <lkundrak@v3.sk>, Ran Wang <ran.wang_1@nxp.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for
 Renesas RZ/G1C devices
Thread-Topic: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for
 Renesas RZ/G1C devices
Thread-Index: AQHU6IrkveTjmRhPkUqnbMZJThSNPKYnXCkAgAAGloA=
Date:   Mon, 1 Apr 2019 15:17:56 +0000
Message-ID: <OSBPR01MB210358B403591E8ABF4BAADFB8550@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1554123232-58942-5-git-send-email-biju.das@bp.renesas.com>
 <Pine.LNX.4.44L0.1904011023240.1506-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904011023240.1506-100000@iolanthe.rowland.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99c40a3d-2fe2-41bf-03fb-08d6b6b53801
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB2200;
x-ms-traffictypediagnostic: OSBPR01MB2200:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB2200270D351B72F91EED243CB8550@OSBPR01MB2200.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0994F5E0C5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(39860400002)(346002)(376002)(366004)(199004)(189003)(51914003)(256004)(86362001)(66066001)(68736007)(446003)(11346002)(6306002)(55016002)(305945005)(9686003)(5660300002)(6436002)(4326008)(14444005)(3846002)(74316002)(6246003)(6116002)(105586002)(33656002)(106356001)(229853002)(14454004)(7416002)(71190400001)(71200400001)(8676002)(7736002)(2906002)(54906003)(52536014)(76176011)(6506007)(81166006)(2171002)(478600001)(81156014)(8936002)(316002)(102836004)(966005)(6346003)(26005)(53936002)(4744005)(6916009)(25786009)(486006)(476003)(186003)(44832011)(97736004)(99286004)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2200;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ibWdFKPrdifT/lPbdvJPk8YHa5cmSpi79osVUPG93hk2qjDGFJq1v+ZupFNlJsLCjYLp+FV716nE5Y9AHpuwIlfqbubHgV4mNkbmvJyWIH+qtFJdcdqimlm85za8rG4IufWRndtos7/xOx76uLUQlLoWTl0/xX8p60Aq0PcqWkb2VCyKSgdWu3hcLbcmE6D4SSi5wALVSQSCwceSs2mECPV6yYUDl5+Vz2ac+2blZzqSUb2VIciQJvm7XSV6g8ohTlx52yiILyx4cjvARUMXyScjG+1VAYEp07AY9lEMK9I3AYVenvgyFGAAe8xf5yeIoEeUBB683MJTXJK4tpgzmDmAf5CoD8OX2467Yonc5iQi0UAUtxslmI+g+B2jWuqXjcG8Kae/V1PlRRiJPAlYOvqO/ARjkaIyPvCUYVBfdy4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c40a3d-2fe2-41bf-03fb-08d6b6b53801
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2019 15:17:56.2939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2200
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

Thanks for the feedback.

> Subject: Re: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for
> Renesas RZ/G1C devices
>=20
> On Mon, 1 Apr 2019, Biju Das wrote:
>=20
> > This patch adds the glue code required to ensure the on-chip EHCI
> > controller works on RZ/G1C(a.k.a R8A77470) SoC's from Renesas.
>=20
> You should explain what this new glue code does.  And why is it needed?

Glue code initializes  following  registers on the host=20

1) initializing interrupt enable
2) OVC detection timer
3) suspend/ resume timer register

Without glue code, interrupt generation is disabled.
=20
> Can't you use the existing ehci-platform driver instead?
>=20
This driver is almost similar to generic ehci-platform except that it needs=
 to do
some platform initialization as mentioned above. If  I am correct, we canno=
t do=20
any platform initialization in generic code.=20

The reason for the new driver is because of the below discussion
https://patchwork.kernel.org/patch/10655853/

regards,
Biju







