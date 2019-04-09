Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051A0C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD3272084B
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:20:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="RJWmH+4V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbfDILUG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 07:20:06 -0400
Received: from mail-eopbgr1400100.outbound.protection.outlook.com ([40.107.140.100]:8997
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726062AbfDILUG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 07:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esySp0Z6aZzSRvItyKadOHjSxiBSFRmmXSDmfR+DiNE=;
 b=RJWmH+4V8DDhIzXjvroFjhffJ3giiJh1+Kh6sHpH6Qo+GpxkMOm4/PvCLENN6ZBQSizRAU91O6OIRc4QExqx3FRzFuzfBFbQxay1vUcR3SZdYwfS8xguXQTzf3aI4eJkpsvE0w8KbxOxhUxTV7JPuPjMsh6CJUZzZLjFg2WUOPo=
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com (52.133.176.147) by
 TYAPR01MB2447.jpnprd01.prod.outlook.com (20.177.103.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.18; Tue, 9 Apr 2019 11:20:01 +0000
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::149e:7303:9d5c:9f41]) by TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::149e:7303:9d5c:9f41%2]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 11:20:01 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH V3 04/13] phy: rcar-gen3-usb2: Add support for r8a77470
Thread-Topic: [PATCH V3 04/13] phy: rcar-gen3-usb2: Add support for r8a77470
Thread-Index: AQHU6gjyqdd4KsYgRU6jaEiK9Ns87qYzqdmAgAAIy/A=
Date:   Tue, 9 Apr 2019 11:20:01 +0000
Message-ID: <TYAPR01MB2111193B54726C0ACDDFAB7FB82D0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-5-git-send-email-biju.das@bp.renesas.com>
 <acaa3754-0fb0-c50b-4fc3-3f15a0612d4e@ti.com>
In-Reply-To: <acaa3754-0fb0-c50b-4fc3-3f15a0612d4e@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c653fe98-1a36-4e05-cae0-08d6bcdd4ef8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB2447;
x-ms-traffictypediagnostic: TYAPR01MB2447:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB2447C1CB8B6C18B573F0A3F2B82D0@TYAPR01MB2447.jpnprd01.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(136003)(346002)(396003)(39860400002)(376002)(366004)(43544003)(51914003)(199004)(189003)(2906002)(7696005)(99286004)(76176011)(446003)(110136005)(316002)(54906003)(44832011)(11346002)(486006)(86362001)(476003)(66066001)(3846002)(6116002)(97736004)(229853002)(71190400001)(68736007)(71200400001)(4326008)(33656002)(5660300002)(14454004)(6246003)(478600001)(2171002)(25786009)(52536014)(256004)(6436002)(74316002)(105586002)(186003)(53546011)(9686003)(55016002)(26005)(102836004)(6506007)(6306002)(53936002)(966005)(81156014)(8676002)(8936002)(81166006)(7736002)(305945005)(106356001)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2447;H:TYAPR01MB2111.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vhtxEEaaO009UEm/rjGRefv5dAOf2gcA5hBRnEqVDUOMo0Jd5mdnC8+0fvdMWP6m7YVMsqBsi1GCZkCRRIRyathgQ/NbCd4KKWQog9TYW1bZdUHRtcyXIC3MSdN3VTxtKyQS1YYlrhcZUR6eTRf4J+h4r5bIMmOlsgsY/3/WjJCc+T7f9jNTAW+7EI1fYIVm8XImxiLDNnTS4Pp3skZOVrB+Aq7mk+ZezreCAmdlTgCUAGaHp8pzcNvdWw6wb6xIy8o0bcUrIsMNL4y3vTMxrKcGSOdlANLplfU2E8hAnIhYGXhccIZhkueXk4vsh21Nralldy8eieXyRHrvHEOHhHwPFCahq7m5Mu7ge6RXauVlrhQIXyTS7Z8/r8P6rgeYoH9j6Uu1U1SOnfVhUunXDA5hG752j4UuytcxwJd9tew=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c653fe98-1a36-4e05-cae0-08d6bcdd4ef8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 11:20:01.7485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2447
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS2lzaG9uLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIFYzIDA0LzEzXSBwaHk6IHJjYXItZ2VuMy11c2IyOiBBZGQgc3VwcG9ydCBmb3Igcjhh
Nzc0NzANCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiAwMy8wNC8xOSAzOjU4IFBNLCBCaWp1IERh
cyB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgcjhhNzc0NzAgKFJaL0cx
QykuIFdlIGNhbiByZXVzZSB0aGlzDQo+ID4gZHJpdmVyIGZvciBpbml0aWFsaXppbmcgdGltaW5n
L2ludGVycnVwdCBnZW5lcmF0aW9uIHJlZ2lzdGVycy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiBWMS0tPlYy
DQo+ID4gICogSW5jb3Jwb3JhdGVkIHNoaW1vZGEtc2FuJ3MgcmV2aWV3IGNvbW1lbnQNCj4gPiAg
UmVmOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNjU1ODU1Lw0KPiA+IC0t
LQ0KPiA+ICBkcml2ZXJzL3BoeS9yZW5lc2FzL0tjb25maWcgICAgICAgICAgICAgIHwgIDIgKy0N
Cj4gPiAgZHJpdmVycy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4zLXVzYjIuYyB8IDE5ICsrKysr
KysrKysrKysrKysrKy0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L3JlbmVzYXMv
S2NvbmZpZyBiL2RyaXZlcnMvcGh5L3JlbmVzYXMvS2NvbmZpZw0KPiA+IGluZGV4IGUzNDBhOTIu
Ljk2MWNjYjEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9waHkvcmVuZXNhcy9LY29uZmlnDQo+
ID4gKysrIGIvZHJpdmVycy9waHkvcmVuZXNhcy9LY29uZmlnDQo+ID4gQEAgLTE5LDcgKzE5LDcg
QEAgY29uZmlnIFBIWV9SQ0FSX0dFTjNfUENJRSAgY29uZmlnDQo+IFBIWV9SQ0FSX0dFTjNfVVNC
Mg0KPiA+ICAJdHJpc3RhdGUgIlJlbmVzYXMgUi1DYXIgZ2VuZXJhdGlvbiAzIFVTQiAyLjAgUEhZ
IGRyaXZlciINCj4gPiAgCWRlcGVuZHMgb24gQVJDSF9SRU5FU0FTDQo+ID4gLQlkZXBlbmRzIG9u
IEVYVENPTg0KPiA+ICsJZGVwZW5kcyBvbiBFWFRDT04gfHwgQVJDSF9SOEE3NzQ3MA0KPiA+ICAJ
ZGVwZW5kcyBvbiBVU0JfU1VQUE9SVA0KPiA+ICAJc2VsZWN0IEdFTkVSSUNfUEhZDQo+ID4gIAlz
ZWxlY3QgVVNCX0NPTU1PTg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9yZW5lc2FzL3Bo
eS1yY2FyLWdlbjMtdXNiMi5jDQo+ID4gYi9kcml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yY2FyLWdl
bjMtdXNiMi5jDQo+ID4gaW5kZXggMGEzNDc4Mi4uYWMzM2EwMiAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yY2FyLWdlbjMtdXNiMi5jDQo+ID4gKysrIGIvZHJpdmVy
cy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4zLXVzYjIuYw0KPiA+IEBAIC0yMiw2ICsyMiw3IEBA
DQo+ID4gICNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4gICNpbmNsdWRlIDxs
aW51eC91c2Ivb2YuaD4NCj4gPiAjaW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+DQo+ID4gKyNp
bmNsdWRlIDxsaW51eC9zeXNfc29jLmg+DQo+ID4NCj4gPiAgLyoqKioqKiogVVNCMi4wIEhvc3Qg
cmVnaXN0ZXJzIChvcmlnaW5hbCBvZmZzZXQgaXMgKzB4MjAwKSAqKioqKioqLw0KPiA+ICAjZGVm
aW5lIFVTQjJfSU5UX0VOQUJMRQkJMHgwMDANCj4gPiBAQCAtMzkzLDYgKzM5NCwxMiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHBoeV9vcHMNCj4gcmNhcl9nZW4zX3BoeV91c2IyX29wcyA9IHsNCj4g
PiAgCS5vd25lcgkJPSBUSElTX01PRFVMRSwNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IHBoeV9vcHMgcnpfZzFjX3BoeV91c2IyX29wcyA9IHsNCj4gPiArCS5pbml0CQk9
IHJjYXJfZ2VuM19waHlfdXNiMl9pbml0LA0KPiA+ICsJLmV4aXQJCT0gcmNhcl9nZW4zX3BoeV91
c2IyX2V4aXQsDQo+ID4gKwkub3duZXIJCT0gVEhJU19NT0RVTEUsDQo+ID4gK307DQo+ID4gKw0K
PiA+ICBzdGF0aWMgaXJxcmV0dXJuX3QgcmNhcl9nZW4zX3BoeV91c2IyX2lycShpbnQgaXJxLCB2
b2lkICpfY2gpICB7DQo+ID4gIAlzdHJ1Y3QgcmNhcl9nZW4zX2NoYW4gKmNoID0gX2NoOw0KPiA+
IEBAIC00MTEsNiArNDE4LDcgQEAgc3RhdGljIGlycXJldHVybl90IHJjYXJfZ2VuM19waHlfdXNi
Ml9pcnEoaW50IGlycSwNCj4gPiB2b2lkICpfY2gpICB9DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgcmNhcl9nZW4zX3BoeV91c2IyX21hdGNoX3RhYmxlW10gPSB7
DQo+ID4gKwl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMsdXNiMi1waHktcjhhNzc0NzAiIH0sDQo+
ID4gIAl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMsdXNiMi1waHktcjhhNzc5NSIgfSwNCj4gPiAg
CXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyx1c2IyLXBoeS1yOGE3Nzk2IiB9LA0KPiA+ICAJeyAu
Y29tcGF0aWJsZSA9ICJyZW5lc2FzLHVzYjItcGh5LXI4YTc3OTY1IiB9LCBAQCAtNDI1LDEyICs0
MzMsMTgNCj4gQEANCj4gPiBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJjYXJfZ2VuM19waHlf
Y2FibGVbXSA9IHsNCj4gPiAgCUVYVENPTl9OT05FLA0KPiA+ICB9Ow0KPiA+DQo+ID4gK3N0YXRp
YyBzdHJ1Y3Qgc29jX2RldmljZV9hdHRyaWJ1dGUgc29jX3I4YTc3NDcwW10gPSB7DQo+ID4gKwl7
IC5zb2NfaWQgPSAicjhhNzc0NzAiIH0sDQo+ID4gKwl7IC8qIHNlbnRpbmVsICovIH0NCj4gPiAr
fTsNCj4gPiArDQo+ID4gIHN0YXRpYyBpbnQgcmNhcl9nZW4zX3BoeV91c2IyX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpICB7DQo+ID4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAm
cGRldi0+ZGV2Ow0KPiA+ICAJc3RydWN0IHJjYXJfZ2VuM19jaGFuICpjaGFubmVsOw0KPiA+ICAJ
c3RydWN0IHBoeV9wcm92aWRlciAqcHJvdmlkZXI7DQo+ID4gIAlzdHJ1Y3QgcmVzb3VyY2UgKnJl
czsNCj4gPiArCWNvbnN0IHN0cnVjdCBwaHlfb3BzICpwaHlfdXNiMl9vcHMgPSAmcmNhcl9nZW4z
X3BoeV91c2IyX29wczsNCj4gPiAgCWludCBpcnEsIHJldCA9IDA7DQo+ID4NCj4gPiAgCWlmICgh
ZGV2LT5vZl9ub2RlKSB7DQo+ID4gQEAgLTQ4MSw3ICs0OTUsMTAgQEAgc3RhdGljIGludCByY2Fy
X2dlbjNfcGh5X3VzYjJfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
PiAgCSAqIEFuZCB0aGVuLCBwaHktY29yZSB3aWxsIG1hbmFnZSBydW50aW1lIHBtIGZvciB0aGlz
IGRldmljZS4NCj4gPiAgCSAqLw0KPiA+ICAJcG1fcnVudGltZV9lbmFibGUoZGV2KTsNCj4gPiAt
CWNoYW5uZWwtPnBoeSA9IGRldm1fcGh5X2NyZWF0ZShkZXYsIE5VTEwsDQo+ICZyY2FyX2dlbjNf
cGh5X3VzYjJfb3BzKTsNCj4gPiArCWlmIChzb2NfZGV2aWNlX21hdGNoKHNvY19yOGE3NzQ3MCkp
DQo+ID4gKwkJcGh5X3VzYjJfb3BzID0gJnJ6X2cxY19waHlfdXNiMl9vcHM7DQo+IA0KPiBXaHkg
bm90IGhhdmUgdGhlIHBoeV9vcHMgaW4gZHJpdmVyX2RhdGEgc2luY2UgeW91IGFueXdheXMgaGF2
ZSBhIG5ldw0KPiBjb21wYXRpYmxlIGZvciByOGE3NzQ3MD8NCg0KU29DIGRldmljZSBtYXRjaCB3
aWxsIHRha2UgY2FyZSBvZiBTb0MgcmV2aXNpb24uIFdlIGhhdmUgbXVsdGlwbGUgcmV2aXNpb24g
b2YgU29DIHZhcmlhbnRzIGxpa2UgRVMxLjAsIEVTMS4xDQpUaGVyZSBpcyBhbm90aGVyICBTb0Mg
c2ltaWxhciB0byBSWi9HMUMga25vd24gYXMgUi1DYXIgRTJYLiAgIElmIHlvdSBhZGQgaXQgaW4g
Y29tcGF0aWJsZSwgaXQgdGFrZXMgY2FyZSBvbmx5IGFib3V0IHRoZSBTb0MgLCBub3QgdGhlIFNv
QyByZXZpc2lvbnMuDQoNClJlZ2FyZHMsDQpCaWp1DQoNCg0KDQo=
