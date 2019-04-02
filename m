Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6431AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 02:11:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2777720833
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 02:11:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="dMBGlkZ3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfDBCLS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 22:11:18 -0400
Received: from mail-eopbgr1400123.outbound.protection.outlook.com ([40.107.140.123]:20016
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726269AbfDBCLS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 22:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMymHip8IFDRLuIL4kmV8i4grAtisoCExwDn+TQ0/w8=;
 b=dMBGlkZ3bIfqtUPj9BDGdt4XLwYcEA/fh/MAfK5tu/k/pSSo9CDNVy3+stSljIqIqVeEcyQS3vszVTIR7wiExLeLvmL9chTLEpZaZyJzTNSTCQuksPYRL0uElXa27ePPZGgxse+dZwQu9+1IDoE2idYVTVjE6b0cOeFuHZWCSK8=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB4176.jpnprd01.prod.outlook.com (20.178.140.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.17; Tue, 2 Apr 2019 02:11:14 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1750.017; Tue, 2 Apr 2019
 02:11:14 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH 2/4] phy: renesas: rcar-gen3-usb2: No need to request IRQ
 for non-OTG
Thread-Topic: [PATCH 2/4] phy: renesas: rcar-gen3-usb2: No need to request IRQ
 for non-OTG
Thread-Index: AQHU0B7lgu6g8VrNGU6ESGjfo8/QlaYnbACAgADkCqA=
Date:   Tue, 2 Apr 2019 02:11:14 +0000
Message-ID: <TYAPR01MB4271A67EA5A43F11656DD34AD8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <54573748-18bd-1ece-f6e1-bd7801503715@ti.com>
In-Reply-To: <54573748-18bd-1ece-f6e1-bd7801503715@ti.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: facfec8f-411f-4aed-33bd-08d6b7107bd5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TYAPR01MB4176;
x-ms-traffictypediagnostic: TYAPR01MB4176:
x-microsoft-antispam-prvs: <TYAPR01MB4176D60AC4E8D874E4ADEFA0D8560@TYAPR01MB4176.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0995196AA2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(366004)(136003)(396003)(39860400002)(199004)(189003)(486006)(53936002)(316002)(11346002)(106356001)(256004)(86362001)(229853002)(54906003)(110136005)(14454004)(8676002)(99286004)(81166006)(81156014)(76176011)(478600001)(7696005)(4326008)(25786009)(14444005)(446003)(6436002)(97736004)(53546011)(6116002)(3846002)(7736002)(305945005)(68736007)(6506007)(105586002)(186003)(102836004)(476003)(74316002)(71200400001)(2906002)(71190400001)(8936002)(26005)(55016002)(52536014)(5660300002)(33656002)(66066001)(6246003)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4176;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y+DrGca04afwKjEIzvcA+fwV0qfYPpUSWelfEMu5tKKP4MAlqbGp9ip6TmFoH7AX6dc52aoTwriv1xXwt4wvFkryqMEXsZh14tmzpKcqyR1sUzbkS276uLIgpUK/O6r87s+g4WpvhY3F/pEF8QtHB7utl4hc7B4HdnFHFYVoei+XFt6C+En0XBwfRO2v+lmgPk2h9AAWu6aZ7+W4qGVGNnOKIhRAZWnOjHklot1zip4jEKoCTOjvTEmlk5X51QU0a6SpNysGC0WOQDaL97lbIp78L4oBs7jGjT3T/j1HMpfJCz03fh+3PIZfMilPjRvVXlSAK93BrL9jDTEZDX4MqZqZKgEMx+k8/RfvC2+ht3U67J6dQKFwgRaANQXR2rRHu3ZdaVprH46lZXM1UDIlXa4r1oZq456Ih2cI7LLdLnw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facfec8f-411f-4aed-33bd-08d6b7107bd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2019 02:11:14.3512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4176
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS2lzaG9uLCBGYWJyaXppbywNCg0KPiBGcm9tOiBLaXNob24gVmlqYXkgQWJyYWhhbSBJLCBT
ZW50OiBNb25kYXksIEFwcmlsIDEsIDIwMTkgOToyNiBQTQ0KPiANCj4gT24gMDEvMDMvMTkgNDoz
NSBQTSwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+IEFzIHN0YXRlZCBpbiB0aGUgY29tbWVu
dCBmb3VuZCBvbiB0b3Agb2YgcmNhcl9nZW4zX3BoeV91c2IyX3dvcmssDQo+ID4gd2Ugc2hvdWxk
IG5vdCBiZSByZWdpc3RlcmluZyB0aGUgSVJRIGlmICFvdGdfY2hhbm5lbCB8fCAhdXNlc19vdGdf
cGlucy4NCj4gPiBPbiB0b3Agb2YgdGhhdCwgd2Ugc2hvdWxkIGFsc28gbWFrZSBzdXJlIHRoYXQg
ZXh0Y29uIGhhcyBiZWVuDQo+ID4gYWxsb2NhdGVkIGJlZm9yZSByZXF1ZXN0aW5nIHRoZSBpcnEg
YXMgcmNhcl9nZW4zX3BoeV91c2IyX3dvcmsNCj4gPiB1c2VzIGl0LCBoZW5jZSB0aGUgcGF0Y2gu
DQo+ID4NCj4gPiBGaXhlczogMmIzODU0M2M4ZGIxICgicGh5OiByY2FyLWdlbjMtdXNiMjogYWRk
IGV4dGNvbiBzdXBwb3J0IikNCj4gPiBGaXhlczogNzM4MDFiOTBhMzhmICgicGh5OiByZW5lc2Fz
OiByY2FyLWdlbjMtdXNiMjogY2hhbmdlIGEgY29uZGl0aW9uICJkcl9tb2RlIiIpDQo+ID4gU2ln
bmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5j
b20+DQo+IA0KPiBtZXJnZWQsIHRoYW5rcy4NCg0KSSdtIHZlcnkgc29ycnksIEkgZGlkbid0IG5v
dGljZSB0aGlzIHBhdGNoLi4uDQpJJ2QgbGlrZSB0byBmaXggdGhpcyBwYXRjaCBiZWNhdXNlIHRo
aXMgcGF0Y2ggYnJlYWtzIGZvciBSLUNhciBEMy4NCkluIHRoaXMgY2FzZSwgc2hvdWxkIEkgc3Vi
bWl0IGFuIGluY3JlbWVudGFsIHBhdGNoPw0KDQo+IC1LaXNob24NCj4gPiAtLS0NCj4gPiAgZHJp
dmVycy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4zLXVzYjIuYyB8IDI2ICsrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMyBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9yZW5lc2FzL3Bo
eS1yY2FyLWdlbjMtdXNiMi5jIGIvZHJpdmVycy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4zLXVz
YjIuYw0KPiA+IGluZGV4IDBhMzQ3ODIuLmJlMWEzOTIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4zLXVzYjIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGh5
L3JlbmVzYXMvcGh5LXJjYXItZ2VuMy11c2IyLmMNCj4gPiBAQCAtNDQ3LDIwICs0NDcsOCBAQCBz
dGF0aWMgaW50IHJjYXJfZ2VuM19waHlfdXNiMl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiA+ICAJaWYgKElTX0VSUihjaGFubmVsLT5iYXNlKSkNCj4gPiAgCQlyZXR1cm4g
UFRSX0VSUihjaGFubmVsLT5iYXNlKTsNCj4gPg0KPiA+IC0JLyogY2FsbCByZXF1ZXN0X2lycSBm
b3IgT1RHICovDQo+ID4gLQlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiA+IC0J
aWYgKGlycSA+PSAwKSB7DQo+ID4gLQkJSU5JVF9XT1JLKCZjaGFubmVsLT53b3JrLCByY2FyX2dl
bjNfcGh5X3VzYjJfd29yayk7DQo+ID4gLQkJaXJxID0gZGV2bV9yZXF1ZXN0X2lycShkZXYsIGly
cSwgcmNhcl9nZW4zX3BoeV91c2IyX2lycSwNCj4gPiAtCQkJCSAgICAgICBJUlFGX1NIQVJFRCwg
ZGV2X25hbWUoZGV2KSwgY2hhbm5lbCk7DQo+ID4gLQkJaWYgKGlycSA8IDApDQo+ID4gLQkJCWRl
dl9lcnIoZGV2LCAiTm8gaXJxIGhhbmRsZXIgKCVkKVxuIiwgaXJxKTsNCj4gPiAtCX0NCj4gPiAt
DQo+ID4gIAljaGFubmVsLT5kcl9tb2RlID0gb2ZfdXNiX2dldF9kcl9tb2RlX2J5X3BoeShkZXYt
Pm9mX25vZGUsIDApOw0KPiA+IC0JaWYgKGNoYW5uZWwtPmRyX21vZGUgIT0gVVNCX0RSX01PREVf
VU5LTk9XTikgew0KPiA+IC0JCWludCByZXQ7DQo+ID4gLQ0KPiA+ICsJaWYgKGNoYW5uZWwtPmRy
X21vZGUgPT0gVVNCX0RSX01PREVfT1RHKSB7DQoNClItQ2FyIEQzIChyOGE3Nzk5NS1kcmFhay5k
dHMpIGhhcyBkcl9tb2RlIHdpdGggImhvc3QiLiBTbywgdGhlIGJvYXJkIGNhbiB1c2UgaG9zdCBt
b2RlDQphcyBkZWZhdWx0IGFuZCAicm9sZSIgbW9kZSB0byBzd2l0Y2ggdGhlIHJvbGUgZm9yIHBl
cmlwaGVyYWwgbGF0ZXIuIEhvd2V2ZXIsIGFmdGVyIHdlDQphcHBsaWVkIHRoaXMgcGF0Y2gsIHRo
ZSBSLUNhciBEMyBVU0IyLjAgY2Fubm90IHN3aXRjaCB0byB0aGUgcGVyaXBoZXJhbCBtb2RlLg0K
DQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+ID4gIAkJY2hhbm5lbC0+aXNf
b3RnX2NoYW5uZWwgPSB0cnVlOw0KPiA+ICAJCWNoYW5uZWwtPnVzZXNfb3RnX3BpbnMgPSAhb2Zf
cHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9kZSwNCj4gPiAgCQkJCQkJCSJyZW5lc2FzLG5v
LW90Zy1waW5zIik7DQo+ID4gQEAgLTQ3Niw2ICs0NjQsMTggQEAgc3RhdGljIGludCByY2FyX2dl
bjNfcGh5X3VzYjJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgCQl9
DQo+ID4gIAl9DQo+ID4NCj4gPiArCWlmIChjaGFubmVsLT5pc19vdGdfY2hhbm5lbCAmJiBjaGFu
bmVsLT51c2VzX290Z19waW5zKSB7DQo+ID4gKwkJLyogY2FsbCByZXF1ZXN0X2lycSBmb3IgT1RH
ICovDQo+ID4gKwkJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCj4gPiArCQlpZiAo
aXJxID49IDApIHsNCj4gPiArCQkJSU5JVF9XT1JLKCZjaGFubmVsLT53b3JrLCByY2FyX2dlbjNf
cGh5X3VzYjJfd29yayk7DQo+ID4gKwkJCWlycSA9IGRldm1fcmVxdWVzdF9pcnEoZGV2LCBpcnEs
IHJjYXJfZ2VuM19waHlfdXNiMl9pcnEsDQo+ID4gKwkJCQkJICAgICAgIElSUUZfU0hBUkVELCBk
ZXZfbmFtZShkZXYpLCBjaGFubmVsKTsNCj4gPiArCQkJaWYgKGlycSA8IDApDQo+ID4gKwkJCQlk
ZXZfZXJyKGRldiwgIk5vIGlycSBoYW5kbGVyICglZClcbiIsIGlycSk7DQo+ID4gKwkJfQ0KPiA+
ICsJfQ0KPiA+ICsNCj4gPiAgCS8qDQo+ID4gIAkgKiBkZXZtX3BoeV9jcmVhdGUoKSB3aWxsIGNh
bGwgcG1fcnVudGltZV9lbmFibGUoJnBoeS0+ZGV2KTsNCj4gPiAgCSAqIEFuZCB0aGVuLCBwaHkt
Y29yZSB3aWxsIG1hbmFnZSBydW50aW1lIHBtIGZvciB0aGlzIGRldmljZS4NCj4gPg0K
