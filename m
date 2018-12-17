Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F63C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:37:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A2F6A2133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:37:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="jsJj4p8Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387833AbeLQQhI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:37:08 -0500
Received: from mail-eopbgr1400114.outbound.protection.outlook.com ([40.107.140.114]:16946
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727771AbeLQQhI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID3KKMoSOcuTShkb0DEGJqxY7pIp154yH55hrcHQUmw=;
 b=jsJj4p8Q7I1ERBu03KJAJi6v3jutwrrTybjx5s+LTfWBwW7/tHgy1wvdcCvwv1XguX+m6GMpI5z+alRFuKq7bOuzFMhgMgPKaxmDLVHnqGhAgcnJnTXVVO2GaiQhQ32eTZ5gsp4S7jg3/0oXtv/KZoK1s/lBMlafmpl2vyoHAHA=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1642.jpnprd01.prod.outlook.com (52.133.163.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Mon, 17 Dec 2018 16:36:59 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::dcee:f270:d42b:5b48]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::dcee:f270:d42b:5b48%5]) with mapi id 15.20.1425.023; Mon, 17 Dec 2018
 16:36:59 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 06/17] arm64: dts: renesas: r8a774c0: Add MSIOF nodes
Thread-Topic: [PATCH 06/17] arm64: dts: renesas: r8a774c0: Add MSIOF nodes
Thread-Index: AQHUk5C33jPpLiatL06I2JnGF6oZwqWDI4MAgAACEwA=
Date:   Mon, 17 Dec 2018 16:36:59 +0000
Message-ID: <TY1PR01MB17700E941C41403A2EEF3DE6C0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <f6834dd2-7a2d-5ca9-0961-2c992ce22002@cogentembedded.com>
In-Reply-To: <f6834dd2-7a2d-5ca9-0961-2c992ce22002@cogentembedded.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1642;20:WvhmiXvzhqMEP/AvhVi29cRZkMsA2XDBkGG0pV/u5RZUaUPekkKzvNlPE0PkP1YTVt0nUBJ5HzJWxL1XZtfnqrOdd3N5fXAtG+pHqXn7/bpE89YLa55agR40iMqqG2kbhJKEMsaSFhg6/fnyD2rQ5AffEB7SpmvFo1Nej2axoaw=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 505502e2-5ba8-46dc-dd4f-08d6643dddbb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1642;
x-ms-traffictypediagnostic: TY1PR01MB1642:
x-microsoft-antispam-prvs: <TY1PR01MB16421E2BA501CDA8B18E0309C0BC0@TY1PR01MB1642.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(3231475)(944501520)(52105112)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:TY1PR01MB1642;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB1642;
x-forefront-prvs: 08897B549D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39850400004)(136003)(366004)(376002)(396003)(189003)(199004)(476003)(229853002)(316002)(99286004)(11346002)(68736007)(345774005)(446003)(486006)(26005)(105586002)(44832011)(74316002)(305945005)(106356001)(76176011)(186003)(7696005)(33656002)(6436002)(5660300001)(86362001)(97736004)(71190400001)(71200400001)(102836004)(14444005)(256004)(6116002)(2906002)(3846002)(53546011)(25786009)(107886003)(6246003)(54906003)(4326008)(10126004)(6506007)(39060400002)(66066001)(14454004)(478600001)(8676002)(81166006)(6306002)(81156014)(7736002)(9686003)(8936002)(53936002)(55016002)(110136005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1642;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: i7Q0zPy8PK1TUM35OkLH6ioZVNwQPKEAQ5SxDm9tR8aZHsmJ3FW1YSGdwB9+yppZITQWfo82bqY9R4/ONbU8luSOTgkbNqQX1RS23W69MJHz4NOsvjt5fAw5dPJQl0YSJ5JiBc7TlOSJtuhs3HbAZc5dfVsIcZRTVtvj8dU9Ou3L91mI+buZaAkkBN2whTRD7nbtBF8KlfZQmsvQpOmRb8GVcEiciEZI10dfVeg5UpNzwDbs60oBlNIfRR8sxwaPkHvgnLuZw7/4nAi39u5EQEfHOg5EyXxOovXmgnxQS0gBVqheap3U7l2z3pJzWclQ
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505502e2-5ba8-46dc-dd4f-08d6643dddbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2018 16:36:59.3151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1642
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gU2VyZ2VpLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2shDQoNCj4gRnJvbTog
U2VyZ2VpIFNodHlseW92IDxzZXJnZWkuc2h0eWx5b3ZAY29nZW50ZW1iZWRkZWQuY29tPg0KPiBT
ZW50OiAxNyBEZWNlbWJlciAyMDE4IDE2OjI3DQo+IFRvOiBGYWJyaXppbyBDYXN0cm8gPGZhYnJp
emlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5v
cmc+OyBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwNi8xN10gYXJt
NjQ6IGR0czogcmVuZXNhczogcjhhNzc0YzA6IEFkZCBNU0lPRiBub2Rlcw0KPg0KPiBIZWxsbyEN
Cj4NCj4gT24gMTIvMTQvMjAxOCAxMjozNyBQTSwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPg0K
PiA+IEFkZCB0aGUgZGV2aWNlIG5vZGVzIGZvciBhbGwgTVNJT0YgU1BJIGNvbnRyb2xsZXJzIG9u
IFJaL0cyRSBTb0MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZh
YnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I4YTc3NGMwLmR0c2kgfCA2MiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGMwLmR0c2kg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YzAuZHRzaQ0KPiA+IGluZGV4IDk1
MzJkMjkuLjliZDY2YjEgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I4YTc3NGMwLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cjhhNzc0YzAuZHRzaQ0KPiA+IEBAIC04NTUsNiArODU1LDY4IEBADQo+ID4gIHN0YXR1cyA9ICJk
aXNhYmxlZCI7DQo+ID4gIH07DQo+ID4NCj4gPiArbXNpb2YwOiBzcGlAZTZlOTAwMDAgew0KPiA+
ICtjb21wYXRpYmxlID0gInJlbmVzYXMsbXNpb2YtcjhhNzc0YzAiLA0KPiA+ICsgICAgICJyZW5l
c2FzLHJjYXItZ2VuMy1tc2lvZiI7DQo+ID4gK3JlZyA9IDwwIDB4ZTZlOTAwMDAgMCAweDAwNjQ+
Ow0KPg0KPiAgICBEbyB3ZSByZWFsbHkgbmVlZCB0aGUgbGVhZGluZyB6ZXJvcyBpbiB0aGUgc2l6
ZSBjZWxscz8NCg0KV2UgZG9uJ3QsIEkganVzdCBrZXB0IGl0IGNvbnNpc3RlbnQgd2l0aCB0aGUg
c2FtZSBkZWZpbml0aW9ucyBmb3IgdGhlIG90aGVyIHBsYXRmb3Jtcy4NCkRvIHlvdSB3YW50IG1l
IHRvIHNlbmQgYSB2MiBmb3IgdGhpcz8NCg0KPg0KPiA+ICtpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
MTU2IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICtjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDIx
MT47DQo+ID4gK2RtYXMgPSA8JmRtYWMxIDB4NDE+LCA8JmRtYWMxIDB4NDA+LA0KPiA+ICsgICAg
ICAgPCZkbWFjMiAweDQxPiwgPCZkbWFjMiAweDQwPjsNCj4gPiArZG1hLW5hbWVzID0gInR4Iiwg
InJ4IiwgInR4IiwgInJ4IjsNCj4gPiArcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3NzRDMF9Q
RF9BTFdBWVNfT04+Ow0KPiA+ICtyZXNldHMgPSA8JmNwZyAyMTE+Ow0KPiA+ICsjYWRkcmVzcy1j
ZWxscyA9IDwxPjsNCj4gPiArI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gK3N0YXR1cyA9ICJkaXNh
YmxlZCI7DQo+ID4gK307DQo+IFsuLi5dDQo+DQo+ICAgIFNhbWUgcXVlc3Rpb24gZm9yIHRoZSBv
dGhlciBpbnN0YW5jZXMgb2YgTVNJT0YuDQoNClNhbWUgYW5zd2VyIGFwcGxpZXMgZm9yIHRoZSBv
dGhlciBpbnN0YW5jZXMuDQoNClRoYW5rcywNCkZhYg0KDQo+DQo+IE1CUiwgU2VyZ2VpDQoNCg0K
W2h0dHBzOi8vd3d3Mi5yZW5lc2FzLmV1L21lZGlhL2VtYWlsL3VuaWNlZi5qcGddDQoNClRoaXMg
Q2hyaXN0bWFzLCBpbnN0ZWFkIG9mIHNlbmRpbmcgb3V0IGNhcmRzLCBSZW5lc2FzIEVsZWN0cm9u
aWNzIEV1cm9wZSBoYXZlIGRlY2lkZWQgdG8gc3VwcG9ydCBVbmljZWYgd2l0aCBhIGRvbmF0aW9u
LiBGb3IgZnVydGhlciBkZXRhaWxzIGNsaWNrIGhlcmU8aHR0cHM6Ly93d3cudW5pY2VmLm9yZy8+
IHRvIGZpbmQgb3V0IGFib3V0IHRoZSB2YWx1YWJsZSB3b3JrIHRoZXkgZG8sIGhlbHBpbmcgY2hp
bGRyZW4gYWxsIG92ZXIgdGhlIHdvcmxkLg0KV2Ugd291bGQgbGlrZSB0byB0YWtlIHRoaXMgb3Bw
b3J0dW5pdHkgdG8gd2lzaCB5b3UgYSBNZXJyeSBDaHJpc3RtYXMgYW5kIGEgcHJvc3Blcm91cyBO
ZXcgWWVhci4NCg0KDQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVh
ZG93LCBNaWxsYm9hcmQgUm9hZCwgQm91cm5lIEVuZCwgQnVja2luZ2hhbXNoaXJlLCBTTDggNUZI
LCBVSy4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYgV2FsZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4g
MDQ1ODY3MDkuDQo=
