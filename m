Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2799BC169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 15:26:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D338A20855
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 15:26:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="iuv3GjWo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbfBHP0y (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 10:26:54 -0500
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:15328
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726813AbfBHP0y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 10:26:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F10PqaUW9EyNWKLsy/pVHU5bzaqQlP2i9nIATVSBEuk=;
 b=iuv3GjWoh2K4IQIOFO+w/YQ+8NbuaGpQ9c21R2FF0MciO2Zr34j5tLHBQ6wbnYm/EIx8qzjLs1N/sflaCSPlDr2Z0s7Z/mNUanKvzsgsHbSp95wjnjvy5YUS0sL3DHtX9UTzYzL7EzOl2c6EZ4m1Dq1YObo9tNcshwucXEZ0Uro=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1641.jpnprd01.prod.outlook.com (52.133.162.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.17; Fri, 8 Feb 2019 15:26:50 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1601.016; Fri, 8 Feb 2019
 15:26:50 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 08/12] arm64: dts: renesas: r8a774c0: Add OPPs table for
 cpu devices
Thread-Topic: [PATCH 08/12] arm64: dts: renesas: r8a774c0: Add OPPs table for
 cpu devices
Thread-Index: AQHUv59UWIs1mWv1SE6wnM13RZEGXaXV2xMAgAAqdKA=
Date:   Fri, 8 Feb 2019 15:26:49 +0000
Message-ID: <TY1PR01MB1770FAE6E7C26615134B8E0AC0690@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <cover.1549623801.git.horms+renesas@verge.net.au>
 <231d8908a66fa98f09553d31ad8cd5f382b29959.1549623801.git.horms+renesas@verge.net.au>
 <7d60ebf5-c245-f48d-47db-ce63f4f3690b@cogentembedded.com>
In-Reply-To: <7d60ebf5-c245-f48d-47db-ce63f4f3690b@cogentembedded.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1641;20:Pvb5gFIm1XuSH5eVyYwc4Z6atwSxYwzUjYnH0RFMIEqJj+GXehFxj61QlqoypRp3HXSwoFVQ6PmB8JQeVPTjzaZxPBja2bTcI1B4C93YaVI15E7ZxzO/L6bavX0ynyUCFlASs1yHkWHuDPfPs1sUGmY85RixE4ZsSArkTC7pPj0=
x-ms-office365-filtering-correlation-id: 2dc76061-923f-434d-d42c-08d68dd9d8ac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1641;
x-ms-traffictypediagnostic: TY1PR01MB1641:
x-microsoft-antispam-prvs: <TY1PR01MB1641330E6DF856C066022B30C0690@TY1PR01MB1641.jpnprd01.prod.outlook.com>
x-forefront-prvs: 094213BFEA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(39860400002)(366004)(396003)(136003)(346002)(13464003)(199004)(189003)(25786009)(6116002)(3846002)(4326008)(7736002)(6506007)(99286004)(53546011)(53936002)(66066001)(6246003)(33656002)(54906003)(110136005)(316002)(74316002)(305945005)(14454004)(478600001)(106356001)(105586002)(8676002)(81156014)(81166006)(8936002)(97736004)(55016002)(68736007)(2906002)(256004)(71200400001)(76176011)(71190400001)(186003)(229853002)(6436002)(26005)(102836004)(486006)(476003)(86362001)(9686003)(7696005)(44832011)(446003)(11346002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1641;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HeVvPlyJlaY8ZcFhHiuP1W+4sAPJ3lpNmEhNvJPUz65DOyovu2MQDzoLt53S2z3Np13hQzDlxGZeVTu4eLaHyE252zIMVMtqSehNNKIW6kus93FKPJkoN7UeSVfaZIhooMn8b/Bs12/MDOa/84tU1K95nPZmzAPYnaCcdaL2GZpSkZenh4mrAPkoIMpr3DaYvNAsTo1BHsPBdmlAg0LPt6HHRsK/JLnymjvjeYqslJPamzWLPyoMzjFlAdGlx6j1XSJTwkdY1BUK+h5ZIE5EAxrsU4P7juqjZueSR4xBDeXdnQvc50rMiTQJuzvv0v/08WTatbUz3DbLItVtPB8sye23OyZzp78GE+zk2g/GZf5I9WD8Rdq2JhdQ5Rw9WAyyzlUJOJJkMJu0tZiR7KTTTE3oizNY6Z2QV+SNj9Vr/04=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc76061-923f-434d-d42c-08d68dd9d8ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2019 15:26:49.9326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1641
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gU2VyZ2VpLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2shDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2VyZ2VpIFNodHlseW92IDxzZXJnZWkuc2h0
eWx5b3ZAY29nZW50ZW1iZWRkZWQuY29tPg0KPiBTZW50OiAwOCBGZWJydWFyeSAyMDE5IDEyOjUz
DQo+IFRvOiBTaW1vbiBIb3JtYW4gPGhvcm1zK3JlbmVzYXNAdmVyZ2UubmV0LmF1PjsgbGludXgt
cmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7IE1hZ251cyBEYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBGYWJy
aXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCAwOC8xMl0gYXJtNjQ6IGR0czogcmVuZXNhczogcjhhNzc0YzA6IEFkZCBP
UFBzIHRhYmxlIGZvciBjcHUgZGV2aWNlcw0KPg0KPiBIZWxsbyENCj4NCj4gT24gMDIvMDgvMjAx
OSAwMjoxMyBQTSwgU2ltb24gSG9ybWFuIHdyb3RlOg0KPg0KPiA+IEZyb206IEZhYnJpemlvIENh
c3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gVGhpcyBwYXRj
aCBkZWZpbmVzIE9PUCB0YWJsZXMgZm9yIGFsbCBDUFVzLCBzaW1pbGFybHkgdG8NCj4gPiB3aGF0
IGRvbmUgYnkgVGFrZXNoaSBLaWhhcmEgYW5kIFlvc2hpaGlybyBLYW5la28gZm9yIHRoZQ0KPiA+
IFI4QTc3OTkwLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJy
aXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2ltb24gSG9y
bWFuIDxob3JtcytyZW5lc2FzQHZlcmdlLm5ldC5hdT4NCj4gWy4uLl0NCj4gPiBAQCAtNTUsNiAr
NzYsOCBAQA0KPiA+ICBwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3NEMwX1BEX0NBNTNfQ1BV
MD47DQo+ID4gIG5leHQtbGV2ZWwtY2FjaGUgPSA8JkwyX0NBNTM+Ow0KPiA+ICBlbmFibGUtbWV0
aG9kID0gInBzY2kiOw0KPiA+ICtjbG9ja3MgPTwmY3BnIENQR19DT1JFIFI4QTc3NEMwX0NMS19a
Mj47DQo+DQo+ICAgIE5lZWQgc3BhY2UgYWZ0ZXIgPS4uLg0KDQpEb2ghIFNpbW9uLCBkbyB5b3Ug
d2FudCBtZSB0byBzZW5kIGFub3RoZXIgdmVyc2lvbiB0byBmaXggYm90aCBzcGFjaW5nIGlzc3Vl
cz8NCg0KVGhhbmtzLA0KRmFiDQoNCj4NCj4gPiArb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmY2x1
c3RlcjFfb3BwPjsNCj4gPiAgfTsNCj4gPg0KPiA+ICBhNTNfMTogY3B1QDEgew0KPiA+IEBAIC02
NCw2ICs4Nyw4IEBADQo+ID4gIHBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc0QzBfUERfQ0E1
M19DUFUxPjsNCj4gPiAgbmV4dC1sZXZlbC1jYWNoZSA9IDwmTDJfQ0E1Mz47DQo+ID4gIGVuYWJs
ZS1tZXRob2QgPSAicHNjaSI7DQo+ID4gK2Nsb2NrcyA9PCZjcGcgQ1BHX0NPUkUgUjhBNzc0QzBf
Q0xLX1oyPjsNCj4NCj4NCj4gICAgSGVyZSBhcyB3ZWxsLi4uDQo+DQo+ID4gK29wZXJhdGluZy1w
b2ludHMtdjIgPSA8JmNsdXN0ZXIxX29wcD47DQo+ID4gIH07DQo+ID4NCj4gPiAgTDJfQ0E1Mzog
Y2FjaGUtY29udHJvbGxlci0wIHsNCj4NCj4gTUJSLCBTZXJnZWkNCg0KDQpSZW5lc2FzIEVsZWN0
cm9uaWNzIEV1cm9wZSBHbWJILEdlc2NoYWVmdHNmdWVocmVyL1ByZXNpZGVudCA6IE1pY2hhZWwg
SGFubmF3YWxkLCBTaXR6IGRlciBHZXNlbGxzY2hhZnQvUmVnaXN0ZXJlZCBvZmZpY2U6IER1ZXNz
ZWxkb3JmLCBBcmNhZGlhc3RyYXNzZSAxMCwgNDA0NzIgRHVlc3NlbGRvcmYsIEdlcm1hbnksSGFu
ZGVsc3JlZ2lzdGVyL0NvbW1lcmNpYWwgUmVnaXN0ZXI6IER1ZXNzZWxkb3JmLCBIUkIgMzcwOCBV
U3QtSUROci4vVGF4IGlkZW50aWZpY2F0aW9uIG5vLjogREUgMTE5MzUzNDA2IFdFRUUtUmVnLi1O
ci4vV0VFRSByZWcuIG5vLjogREUgMTQ5Nzg2NDcNCg==
