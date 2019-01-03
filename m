Return-Path: <SRS0=Tt7D=PL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940EDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 14:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E2D7208E3
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 14:36:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Vtx8LduA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729819AbfACOgF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 3 Jan 2019 09:36:05 -0500
Received: from mail-eopbgr1400110.outbound.protection.outlook.com ([40.107.140.110]:26263
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727436AbfACOgE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jan 2019 09:36:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfaIPM2OOYRIM2obpejD0SHJwkm+1HlukVhTXJaCYYY=;
 b=Vtx8LduAW6l/ox7kg8uaotxGbz7t990JIsLWC0sFY82sgFtXmZt7NtzoJHLQE0HuDyUWfeUgu4yn2/mVIOE35ra34l9qI5CMFjFS0V8e3QEA9mtrvtt7s0IXGz5a0o3erAa2vtDCiicRYoatrRGbov0ORytOMd01s+bDQlSzwpc=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.241.22) by
 OSBPR01MB1462.jpnprd01.prod.outlook.com (52.134.224.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1471.20; Thu, 3 Jan 2019 14:35:55 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::35e7:300c:a781:3ef6]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::35e7:300c:a781:3ef6%2]) with mapi id 15.20.1495.005; Thu, 3 Jan 2019
 14:35:55 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v2 3/5] ARM: dts: r8a7744: Add DU support
Thread-Topic: [PATCH v2 3/5] ARM: dts: r8a7744: Add DU support
Thread-Index: AQHUjHsYTM/NAdtZu0awX58O5Km1N6WdvNmAgAAMOnA=
Date:   Thu, 3 Jan 2019 14:35:55 +0000
Message-ID: <OSBPR01MB21031F848EB4F6D911000361B88D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
 <1544000815-28069-4-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdX-haM7YwUXRo7JtEZ4dt6MxbHv5VeTGTAgP-2+4iN8mA@mail.gmail.com>
In-Reply-To: <CAMuHMdX-haM7YwUXRo7JtEZ4dt6MxbHv5VeTGTAgP-2+4iN8mA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB1462;20:zR3Ohs5FAFF5BOuHAvt7BJQFA3kvrE9UVYmfOW0TkZ4RszWiDtSzQ++NiladrDixl4BYI13q26R3nJaoV2HTU1rm/TlHWgSMfF8wO2T0Dew7395fQZkUo1MTe50zI/xeGNcmVSrq9s732z0wRItNTGQnRtbCZhEtCCxnjM+Cz4Q=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 02f66345-efab-4c69-c438-08d67188c52a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600109)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB1462;
x-ms-traffictypediagnostic: OSBPR01MB1462:
x-microsoft-antispam-prvs: <OSBPR01MB146224EA9BFB94EF2C158F70B88D0@OSBPR01MB1462.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3231475)(944501520)(52105112)(93006095)(93001095)(3002001)(10201501046)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB1462;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB1462;
x-forefront-prvs: 0906E83A25
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(376002)(346002)(39860400002)(366004)(51914003)(189003)(199004)(71200400001)(6506007)(6916009)(53546011)(71190400001)(446003)(107886003)(7736002)(81166006)(186003)(54906003)(478600001)(2906002)(106356001)(7696005)(68736007)(86362001)(74316002)(8936002)(81156014)(26005)(316002)(76176011)(256004)(102836004)(8676002)(4326008)(25786009)(99286004)(39060400002)(305945005)(476003)(6246003)(229853002)(6436002)(11346002)(14454004)(486006)(33656002)(9686003)(53936002)(105586002)(97736004)(3846002)(6116002)(55016002)(5660300001)(44832011)(66066001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1462;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uIJ5enG100u6Z6Nnc90rF3O3imPuLBVrSYPCu6YL9d37ZxXhCgIMBqwhJbdT+59MMNO2xMwx8HYUGOlkU67Zx6dgDqtXJ9nsRPbdW/NjQ8cla3gNed6Q3M8qAlhwliZg2hus5/JqdqWlhIsexE7MgFLPlMM6HESv9xHKpGuf85xfFTOjsJ1g72Qqd8pHf8MqpbGLZTy6kLffX7jEVLrhJGmj5x0jLRfG0anrHvrSjIz/b/UnnbPURBGdIrTnzF8EWKDWCGDacvRDjJI/4e3GS8RuWX8zyL1B9NvyxIcKarabXej6c6MTipa4pakcOO2i
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f66345-efab-4c69-c438-08d67188c52a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2019 14:35:55.5971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1462
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMy81XSBBUk06IGR0czogcjhhNzc0NDogQWRkIERVIHN1cHBvcnQNCj4NCj4gSGkg
QmlqdSwNCj4NCj4gT24gV2VkLCBEZWMgNSwgMjAxOCBhdCAxMDoxNSBBTSBCaWp1IERhcyA8Ymlq
dS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEFkZCBkdSBub2RlIHRvIHI4YTc3
NDQgU29DIERULiBCb2FyZHMgdGhhdCB3YW50IHRvIGVuYWJsZSB0aGUgRFUgbmVlZA0KPiA+IHRv
IHNwZWNpZnkgdGhlIG91dHB1dCB0b3BvbG9neS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4NCj4gVGhhbmtzIGZvciB5b3VyIHBh
dGNoIQ0KPg0KPiA+IC0tLQ0KPiA+IFYxLS0+VjINCj4gPiAgICAgICAgICogUmVtb3ZlZCBMVkRT
IGVuY29kZXIgZGVmaW5pdGlvbiBmcm9tIERVIG5vZGUuDQo+DQo+IFNob3VsZG4ndCB5b3UgYWRk
IGEgbmV3IG5vZGUgZm9yIHRoZSBMVkRTIGVuY29kZXI/DQoNClllcywgSSB3aWxsIGFkZCB0aGUg
bmV3IG5vZGUgZm9yIExWRFMgZW5jb2RlciBmb3IgU29DIGR0c2kuDQoNClJlZ2FyZHMsDQpCaWp1
DQoNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBMdGQsIER1a2VzIE1lYWRvdywgTWls
bGJvYXJkIFJvYWQsIEJvdXJuZSBFbmQsIEJ1Y2tpbmdoYW1zaGlyZSwgU0w4IDVGSCwgVUsuIFJl
Z2lzdGVyZWQgaW4gRW5nbGFuZCAmIFdhbGVzIHVuZGVyIFJlZ2lzdGVyZWQgTm8uIDA0NTg2NzA5
Lg0K
