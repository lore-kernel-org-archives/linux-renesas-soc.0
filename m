Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B5CC10F03
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 10:50:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAF0B20811
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 10:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="uUigSQU3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729267AbfDYKuL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 06:50:11 -0400
Received: from mail-eopbgr140135.outbound.protection.outlook.com ([40.107.14.135]:59456
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728944AbfDYKuK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 06:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMvNghCICiNyuO32gah74lKk2eJUaNCdme9FJw33CQQ=;
 b=uUigSQU31BH41gjQqcX8H1VtvFuS59G3pFWyVx44+ZhfIQ7Hno3IcaTebnUJ2KKNDOI4aD/uXzRS6e3XlKTV9YJjZVawf2AklkU0vXeEQ0gtBvsG+wUgAirchpxl7+Qzt+xxkbNlvqmVy8fkjATyqIB7wcWnDUzSezrXGWI7rCQ=
Received: from VI1PR02MB4542.eurprd02.prod.outlook.com (20.178.12.74) by
 VI1PR02MB4495.eurprd02.prod.outlook.com (20.178.12.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.16; Thu, 25 Apr 2019 10:49:22 +0000
Received: from VI1PR02MB4542.eurprd02.prod.outlook.com
 ([fe80::2891:d814:7bff:fbc7]) by VI1PR02MB4542.eurprd02.prod.outlook.com
 ([fe80::2891:d814:7bff:fbc7%4]) with mapi id 15.20.1813.017; Thu, 25 Apr 2019
 10:49:22 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Hans de Goede <hdegoede@redhat.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] i2c: core: ratelimit 'transfer when suspended' errors
Thread-Topic: [PATCH] i2c: core: ratelimit 'transfer when suspended' errors
Thread-Index: AQHU+0AljLNnRmfkd0OZJNR1l1oIp6ZMso8A
Date:   Thu, 25 Apr 2019 10:49:21 +0000
Message-ID: <52b22d2a-d6b5-8443-a4d9-08c8c5381deb@axentia.se>
References: <20190425082310.17109-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190425082310.17109-1-wsa+renesas@sang-engineering.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:7:66::11) To VI1PR02MB4542.eurprd02.prod.outlook.com
 (2603:10a6:803:b1::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 785863c9-8d28-4f40-fc25-08d6c96bac58
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:VI1PR02MB4495;
x-ms-traffictypediagnostic: VI1PR02MB4495:
x-microsoft-antispam-prvs: <VI1PR02MB4495E297DD16915C7D411CC5BC3D0@VI1PR02MB4495.eurprd02.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(136003)(376002)(396003)(39830400003)(199004)(189003)(86362001)(71190400001)(102836004)(8936002)(31696002)(81156014)(26005)(14444005)(2501003)(76176011)(74482002)(6512007)(31686004)(386003)(6506007)(6246003)(53936002)(68736007)(53546011)(256004)(508600001)(71200400001)(186003)(64126003)(65826007)(446003)(58126008)(97736004)(66066001)(7736002)(15650500001)(65956001)(2906002)(81166006)(54906003)(110136005)(6116002)(25786009)(229853002)(66446008)(66946007)(11346002)(316002)(14454004)(65806001)(6486002)(99286004)(476003)(3846002)(486006)(2616005)(36756003)(8676002)(66556008)(52116002)(5660300002)(305945005)(6436002)(64756008)(4326008)(66476007)(73956011);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR02MB4495;H:VI1PR02MB4542.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VXq5GJOLjB8uIkvA2dOmE3o1SJuIi23Zi7n6xOIDUQ4enkYYVF0Z2iRSBxe4BxuZ/P0VyLKMzxnZq2mSkZ5JWEnQ6l+/vfdolUTUbSA5WVvNGIEYcR3uaK2TwlXc/egzMYIRkh+Vli0lXT7Ie/MplZ+MunyBS+HXfoZ2vDqpBJdUCMQWRQn5+AII1i0iRj5KJHWNrnJhtcn7dJCIunQ4NXl3oqPscXGLHCWG75ItYCP7cmp2JJ20hxqzMI+1OgF75nLJbjvjX5+p+JZK9BvYVRKUUAPpHlbK4k1anTZP/yrtco3KuIVh+JlskR0qWI+1vtxiIg9x3dYZyJgA7UUEU8jYx/ESfvBX5HQCtJ5eXrVu3DFWF1AuvzqsB/IEv7XGmOM1dLOvO0Bphz8L7x+oHx9ty6CNtePFXycJoeqP954=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19D205BDD6C2AA4C9A71E9D857B6B845@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 785863c9-8d28-4f40-fc25-08d6c96bac58
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 10:49:22.4730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB4495
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gMjAxOS0wNC0yNSAxMDoyMywgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBUaGVyZSBhcmUgdHdv
IHByb2JsZW1zIHdpdGggV0FSTl9PTigpIGhlcmUuIE9uZTogSXQgaXMgbm90IHJhdGVsaW1pdGVk
Lg0KPiBUd286IFdlIGRvbid0IHNlZSB3aGljaCBhZGFwdGVyIHdhcyB1c2VkIHdoZW4gdHJ5aW5n
IHRvIHRyYW5zZmVyDQo+IHNvbWV0aGluZyB3aGVuIGFscmVhZHkgc3VzcGVuZGVkLiBJbXBsZW1l
bnQgYSBjdXN0b20gcmF0ZWxpbWl0IG9uY2UgcGVyDQo+IGFkYXB0ZXIgYW5kIHVzZSBkZXZfV0FS
TiB0aGVyZS4gVGhpcyBmaXhlcyBib3RoIGlzc3Vlcy4gRHJhd2JhY2sgaXMgdGhhdA0KPiB3ZSBk
b24ndCBzZWUgaWYgbXVsdGlwbGUgZHJpdmVycyBhcmUgdHJ5aW5nIHRvIHRyYW5zZmVyIHdpdGgg
dGhlIHNhbWUNCj4gYWRhcHRlciB3aGlsZSBzdXNwZW5kZWQuIFRoZXkgbmVlZCB0byBiZSBkaXNj
b3ZlcmVkIG9uZSBhZnRlciB0aGUgb3RoZXINCj4gbm93LiBUaGlzIGlzIGJldHRlciB0aGFuIGEg
aGlnaCBDUFUgbG9hZCBiZWNhdXNlIGEgcmVhbGx5IGJyb2tlbiBkcml2ZXINCj4gbWlnaHQgdHJ5
IHRvIHJlc2VuZCBlbmRsZXNzbHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcg
PHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPg0KPiAtLS0NCj4gDQo+IFNvLCBTaW1v
biBoYWQgYSBwb2ludCB3aXRoIGhpcyByZXZpZXcgY29tbWVudCBiYWNrIHRoZW4sIGFuZCBJIHRo
aW5rIHdlIG5vdw0KPiBmb3VuZCBhIHByb3Blcmx5IGJhbGFuY2VkIHdheS4gVGVzdGVkIHdpdGgg
YSBSZW5lc2FzIExhZ2VyIGJvYXJkIChSLUNhciBIMikuIEkNCj4gZGVjaWRlZCBhZ2FpbnN0IGRl
dl9XQVJOX09OQ0UgYmVjYXVzZSB0aGF0IHNlZW1zIHRvbyBjb2Fyc2UgZ3JhaW5lZCBmb3IgbXkN
Cj4gdGFzdGUgKG9uY2UgcGVyIHN5c3RlbSkgYW5kIHRoZSBjdXN0b20gaW1wbGVtZW50YXRpb24g
aXMgc21hbGwuDQo+IA0KPiAgZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jIHwgNSArKysrLQ0K
PiAgaW5jbHVkZS9saW51eC9pMmMuaCAgICAgICAgIHwgMyArKy0NCg0KUGVyaGFwcyB1bnJlbGF0
ZWQgdG8gdGhpcyBwYXRjaCwgYnV0IEkgZXhwZWN0ZWQgYSBzaW1pbGFyIGNoYW5nZSBpbg0KaTJj
LWNvcmUtc21idXMuYzpfX2kyY19zbWJ1c194ZmVyKCksIGJ1dCBpdCBoYXMgbm8gc3VzcGVuZGVk
IGNoZWNrIGF0DQphbGwuIEF0IGZpcnN0IEkgdGhvdWdodCB0aGF0IHBlcmhhcHMgbm8gZHJpdmVy
IHRoYXQgYWN0dWFsbHkgZGlkDQpzdXNwZW5kIGhhZCBhbiAuc21idXNfeGZlciBpbXBsZW1lbnRh
dGlvbiwgYnV0IHVwb24gdmVyaWZ5aW5nIHRoYXQsDQpJIGZvdW5kIHRoYXQgaTJjLXp4Mjk2Ny5j
IGRvZXMuDQoNCkFtIEkgbWlzc2luZyBzb21ldGhpbmcsIG9yIGRvIHdlIG5lZWQgdG8gYWRkIGFu
IC1FU0hVVERPV04gdGVzdA0KdG8gaTJjLWNvcmUtc21idXMuYzpfX2kyY19zbWJ1c194ZmVyKCk/
DQoNCkNoZWVycywNClBldGVyDQoNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2kyYy1jb3Jl
LWJhc2UuYyBiL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KPiBpbmRleCA0ZTYzMDBkYzJj
NGUuLmY4ZTg1OTgzY2IwNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFz
ZS5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KPiBAQCAtMTg2Nyw4ICsx
ODY3LDExIEBAIGludCBfX2kyY190cmFuc2ZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsIHN0
cnVjdCBpMmNfbXNnICptc2dzLCBpbnQgbnVtKQ0KPiAgDQo+ICAJaWYgKFdBUk5fT04oIW1zZ3Mg
fHwgbnVtIDwgMSkpDQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiAtCWlmIChXQVJOX09OKHRlc3Rf
Yml0KEkyQ19BTEZfSVNfU1VTUEVOREVELCAmYWRhcC0+bG9ja2VkX2ZsYWdzKSkpDQo+ICsJaWYg
KHRlc3RfYml0KEkyQ19BTEZfSVNfU1VTUEVOREVELCAmYWRhcC0+bG9ja2VkX2ZsYWdzKSkgew0K
PiArCQlpZiAoIXRlc3RfYW5kX3NldF9iaXQoSTJDX0FMRl9TVVNQRU5EX1JFUE9SVEVELCAmYWRh
cC0+bG9ja2VkX2ZsYWdzKSkNCj4gKwkJCWRldl9XQVJOKCZhZGFwLT5kZXYsICJUcmFuc2ZlciB3
aGlsZSBzdXNwZW5kZWRcbiIpOw0KPiAgCQlyZXR1cm4gLUVTSFVURE9XTjsNCj4gKwl9DQo+ICAN
Cj4gIAlpZiAoYWRhcC0+cXVpcmtzICYmIGkyY19jaGVja19mb3JfcXVpcmtzKGFkYXAsIG1zZ3Ms
IG51bSkpDQo+ICAJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvaTJjLmggYi9pbmNsdWRlL2xpbnV4L2kyYy5oDQo+IGluZGV4IDAzNzU1ZDRjOTIyOS4u
YmUyNzA2MmY4ZWQxIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2kyYy5oDQo+ICsrKyBi
L2luY2x1ZGUvbGludXgvaTJjLmgNCj4gQEAgLTY5NCw3ICs2OTQsOCBAQCBzdHJ1Y3QgaTJjX2Fk
YXB0ZXIgew0KPiAgCWludCByZXRyaWVzOw0KPiAgCXN0cnVjdCBkZXZpY2UgZGV2OwkJLyogdGhl
IGFkYXB0ZXIgZGV2aWNlICovDQo+ICAJdW5zaWduZWQgbG9uZyBsb2NrZWRfZmxhZ3M7CS8qIG93
bmVkIGJ5IHRoZSBJMkMgY29yZSAqLw0KPiAtI2RlZmluZSBJMkNfQUxGX0lTX1NVU1BFTkRFRAkw
DQo+ICsjZGVmaW5lIEkyQ19BTEZfSVNfU1VTUEVOREVECQkwDQo+ICsjZGVmaW5lIEkyQ19BTEZf
U1VTUEVORF9SRVBPUlRFRAkxDQo+ICANCj4gIAlpbnQgbnI7DQo+ICAJY2hhciBuYW1lWzQ4XTsN
Cj4gDQoNCg==
