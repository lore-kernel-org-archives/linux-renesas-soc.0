Return-Path: <SRS0=NmnW=QW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F43AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 18:26:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 082602192C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 18:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="c0ZnZKKN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389313AbfBOS0Y (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Feb 2019 13:26:24 -0500
Received: from mail-eopbgr1400138.outbound.protection.outlook.com ([40.107.140.138]:48727
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388405AbfBOS0Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Feb 2019 13:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYpMYqMaTKsu5Mw0o0Y6JobChx5OXnKi/FRFzVbv490=;
 b=c0ZnZKKNeHI6YjpwluhQz46KMCQISAuedmH7OUzJu91r/S6cavtwqrm5LIMYNg+sCGnr9DzRIvPpiWYhAE4zzrNnEZM87l4i/Beu3ZUJJwfJ2jYy+neQgc80teu1ceLUJJ4Y8WTppDZCH9F0Nx/yK6Mukj3wVc0kaaeVUZcytLA=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB1561.jpnprd01.prod.outlook.com (52.133.162.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Fri, 15 Feb 2019 18:26:15 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74fc:a361:eeec:1678]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74fc:a361:eeec:1678%5]) with mapi id 15.20.1622.018; Fri, 15 Feb 2019
 18:26:15 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: what happened to /proc/vmallocinfo as of v4.15?
Thread-Topic: what happened to /proc/vmallocinfo as of v4.15?
Thread-Index: AdTFKbgFlyDruYNHRB6kXWqSadKudAALuVuAAADHS3A=
Date:   Fri, 15 Feb 2019 18:26:15 +0000
Message-ID: <TY1PR01MB1562219F3C92A58CB682051B8A600@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <TY1PR01MB1562B1C04915AB16AE53D95B8A600@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdUxW_7vgFtN+MM2cXEaDcHVabnoHBYM+OpwMODLzEyBbA@mail.gmail.com>
In-Reply-To: <CAMuHMdUxW_7vgFtN+MM2cXEaDcHVabnoHBYM+OpwMODLzEyBbA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 863a23c6-07a0-43d7-d5b5-08d693731244
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1561;
x-ms-traffictypediagnostic: TY1PR01MB1561:
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1561;20:09oNepkDdHdR9ldoqf49TJlaE4Xy+ObZa/mkrjwPyuox2T/c1IY3rEITVWyXyfWH8/mRrRZcUsWDMumaS8SVdC3dItcFZWWa1M2Z8lYhFiBo6GpZF4XIufO5d/0YSx+YvlkKCxpHo7HkMRZ/ZNKQ5soTC9yqzdOKgQLHFpyKIYo=
x-microsoft-antispam-prvs: <TY1PR01MB1561CF466361DEDF7EED7C958A600@TY1PR01MB1561.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09497C15EB
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(39860400002)(366004)(136003)(396003)(346002)(199004)(189003)(13464003)(76176011)(86362001)(97736004)(26005)(7736002)(305945005)(6436002)(74316002)(68736007)(186003)(8676002)(71190400001)(478600001)(8936002)(14454004)(256004)(71200400001)(81166006)(81156014)(72206003)(229853002)(316002)(9686003)(2906002)(55016002)(6916009)(105586002)(33656002)(25786009)(102836004)(53546011)(7696005)(11346002)(6506007)(106356001)(6116002)(66066001)(53936002)(446003)(486006)(4326008)(476003)(3846002)(6246003)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1561;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wHnAomYAVtzJviyAS4lL3ynup/ePbRobvlBeCqd9KNOFK/wuBSTLinHVENvHZm5OZprH7H6ASHoAcWP5aRWdkuwZpe92xdq3v195sTZOimo2+rpGKnlXj0cQD/ioa3ymVU7X7tOv2C0bigIUMHxlsAyDwnQvOpr+i9s0W+Y+vWS4GlK0D74SuhB37AgFb2DIjOZ/FHfcAVRWoIvxxayc0VlpZKg8OSO+eIuANYpjWayRUqtdhqNLYv4xQmtgGwHAehxtm61TUhIK8A68pEH0lJ1VnmOrur5bwsRCgcQTNjmpFkqEYLj5DGrp1o4wM60XrKXvgKbZZ9gaGlk8nwcp425y7xWG6Ycy9B5g4f7iwcemPS3xBiJOE4Gh7AcIxFcCNax1FumuEcY+cJ7xxTTj8qHL+2E6/AKyUnyc2fd7aAE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 863a23c6-07a0-43d7-d5b5-08d693731244
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2019 18:26:15.4975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1561
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

VGhhbmsgeW91IEdlZXJ0ISEhDQoNCkkgZGlkbid0IGV2ZW4gdGhpbmsgYWJvdXQgbG9va2luZyBh
dCB0aGUgcHJpbnRrIGNvZGUhDQoNCkNoZWVycw0KQ2hyaXMNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTUsIDIwMTkgMTowMiBQTQ0KPiBUbzog
Q2hyaXMgQnJhbmR0IDxDaHJpcy5CcmFuZHRAcmVuZXNhcy5jb20+DQo+IENjOiBsaW51eC1yZW5l
c2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IHdoYXQgaGFwcGVuZWQgdG8g
L3Byb2Mvdm1hbGxvY2luZm8gYXMgb2YgdjQuMTU/DQo+IA0KPiBIaSBDaHJpcywNCj4gDQo+IE9u
IEZyaSwgRmViIDE1LCAyMDE5IGF0IDU6MTQgUE0gQ2hyaXMgQnJhbmR0IDxDaHJpcy5CcmFuZHRA
cmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEkganVzdCBub3RpY2VkIHRoaXMgeWVzdGVyZGF5
IGFuZCBJIGNhbid0IHNlZW0gdG8gZmlndXJlIGl0IG91dC4NCj4gPg0KPiA+IEluIGxpbnV4LTQu
MTQsIHZtYWxsb2NpbmZvIGxvb2tlZCBsaWtlIHRoaXM6DQo+ID4NCj4gPiAkIGNhdCAvcHJvYy92
bWFsbG9jaW5mbw0KPiA+IDB4YzI4MDAwMDAtMHhjMjgwMjAwMCAgICA4MTkyIG9mX2lvbWFwKzB4
MTkvMHgyMiBwaHlzPTB4ZTgyMDEwMDAgaW9yZW1hcA0KPiA+IDB4YzI4MDIwMDAtMHhjMjgwNDAw
MCAgICA4MTkyIG9mX2lvbWFwKzB4MTkvMHgyMiBwaHlzPTB4ZTgyMDIwMDAgaW9yZW1hcA0KPiA+
IDB4YzI4MDQwMDAtMHhjMjgwNjAwMCAgICA4MTkyIGwyeDBfb2ZfaW5pdCsweDNmLzB4MTc0IHBo
eXM9MHgzZmZmZjAwMA0KPiBpb3JlbWFwDQo+ID4gMHhjMjgwNjAwMC0weGMyODA4MDAwICAgIDgx
OTIgb2ZfaW9tYXArMHgxOS8weDIyIHBoeXM9MHhmY2ZlMDAwMCBpb3JlbWFwDQo+ID4gMHhjMjgw
ODAwMC0weGMyODBhMDAwICAgIDgxOTIgdW5wdXJnZWQgdm1fYXJlYQ0KPiA+IDB4YzI4MGEwMDAt
MHhjMjgwYzAwMCAgICA4MTkyIHVucHVyZ2VkIHZtX2FyZWENCj4gPiAweGMyODBjMDAwLTB4YzI4
MGUwMDAgICAgODE5MiBvZl9pb21hcCsweDE5LzB4MjIgcGh5cz0weGZjZmUwMDAwIGlvcmVtYXAN
Cj4gPiAweGMyODBlMDAwLTB4YzI4MTAwMDAgICAgODE5MiBvZl9pb21hcCsweDE5LzB4MjIgcGh5
cz0weGZjZmUwMDAwIGlvcmVtYXANCj4gPiAweGMyODEwMDAwLTB4YzI4MTIwMDAgICAgODE5MiBv
Zl9pb21hcCsweDE5LzB4MjIgcGh5cz0weGZjZmUwMDAwIGlvcmVtYXANCj4gPg0KPiA+DQo+ID4g
SG93ZXZlciBhcyBvZiBsaW51eC00LjE1LCBpdCBub3cgbG9va3MgbGlrZSB0aGlzOg0KPiA+DQo+
ID4gJCBjYXQgL3Byb2Mvdm1hbGxvY2luZm8NCj4gPiAweDI0MjNlMWVjLTB4MWQzNDg4NTcgICAg
ODE5MiBvZl9pb21hcCsweDE5LzB4MjIgcGh5cz0weGU4MjAxMDAwIGlvcmVtYXANCj4gPiAweDFk
MzQ4ODU3LTB4NTJjMzc4NDAgICAgODE5MiBvZl9pb21hcCsweDE5LzB4MjIgcGh5cz0weGU4MjAy
MDAwIGlvcmVtYXANCj4gPiAweDUyYzM3ODQwLTB4NDAyZjNiMDggICAgODE5MiBsMngwX29mX2lu
aXQrMHgzZi8weDE3NCBwaHlzPTB4M2ZmZmYwMDANCj4gaW9yZW1hcA0KPiA+IDB4NDAyZjNiMDgt
MHgwNmQ1NTNlZiAgICA4MTkyIG9mX2lvbWFwKzB4MTkvMHgyMiBwaHlzPTB4ZmNmZTAwMDAgaW9y
ZW1hcA0KPiA+IDB4MDZkNTUzZWYtMHhmNmRmY2NlYiAgICA4MTkyIHVucHVyZ2VkIHZtX2FyZWEN
Cj4gPiAweGY2ZGZjY2ViLTB4ZDk5YjY1NzAgICAgODE5MiB1bnB1cmdlZCB2bV9hcmVhDQo+ID4g
MHhkOTliNjU3MC0weGEzMmQ4ZmFlICAgIDgxOTIgb2ZfaW9tYXArMHgxOS8weDIyIHBoeXM9MHhm
Y2ZlMDAwMCBpb3JlbWFwDQo+ID4gMHhhMzJkOGZhZS0weGZmZDE1ODU1ICAgIDgxOTIgb2ZfaW9t
YXArMHgxOS8weDIyIHBoeXM9MHhmY2ZlMDAwMCBpb3JlbWFwDQo+ID4gMHhmZmQxNTg1NS0weDlk
MmNjNmVhICAgIDgxOTIgb2ZfaW9tYXArMHgxOS8weDIyIHBoeXM9MHhmY2ZlMDAwMCBpb3JlbWFw
DQo+ID4NCj4gPg0KPiA+IFRoZSB2aXJ0dWFsIGFkZHJlc3NlcyBhcmUgYWxsIHdyb25nIQ0KPiA+
DQo+ID4gSSBjYW4ndCBzZWVtIHRvIGZpbmQgYW55IHBhdGNoZXMgb3IgY29kZSBjaGFuZ2VzIHRo
YXQgd291bGQgZXhwbGFpbiB0aGlzLg0KPiA+DQo+ID4gRG9lcyBhbnlvbmUgaGF2ZSBhbiBpZGVh
IHdoeSBpdCBub3cgbG9va3MgbGlrZSB0aGlzPw0KPiANCj4gUGxlYXNlIHNlZSBjb21taXQgYWQ2
N2I3NGQyNDY5ZDliOCAoInByaW50azogaGFzaCBhZGRyZXNzZXMgcHJpbnRlZA0KPiB3aXRoICVw
IikuDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3Rz
IG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4g
SW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBt
eXNlbGYgYSBoYWNrZXIuDQo+IEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlDQo+IHRoYXQuDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
