Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAE1C282CE
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 13:11:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90C602084F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 13:11:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="i1heSpYt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbfDINLd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 09:11:33 -0400
Received: from mail-eopbgr1410093.outbound.protection.outlook.com ([40.107.141.93]:25499
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726112AbfDINLd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 09:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tySuANb3lABMUPTofJWNb3BV/NWwbnug/rxYn6AHsiQ=;
 b=i1heSpYtlwbx+YYnpSc7//6Q+gCZyJubbRqWH2E3QOxqmaLuKdS9POoF4gZQa/0+uoUqAck56EtxtpxgVfFkqFTMOiiRAC6rVlHezGDUH0P9rSH1Jm3lVNM6RgrHgtITpERoV+WMYgm01lYLtsTz1WIbWW3ieQnd4Xc1vJ0vv7g=
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com (52.133.176.147) by
 TYAPR01MB2591.jpnprd01.prod.outlook.com (20.177.102.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.18; Tue, 9 Apr 2019 13:11:29 +0000
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::149e:7303:9d5c:9f41]) by TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::149e:7303:9d5c:9f41%2]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 13:11:29 +0000
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
Thread-Index: AQHU6gjyqdd4KsYgRU6jaEiK9Ns87qYzqdmAgAAIy/CAAAffAIAAAAgg
Date:   Tue, 9 Apr 2019 13:11:29 +0000
Message-ID: <TYAPR01MB2111437129325DEBDA7AC909B82D0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-5-git-send-email-biju.das@bp.renesas.com>
 <acaa3754-0fb0-c50b-4fc3-3f15a0612d4e@ti.com>
 <TYAPR01MB2111193B54726C0ACDDFAB7FB82D0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
 <f335f523-78fa-7611-7adc-01670eba9dbb@ti.com>
In-Reply-To: <f335f523-78fa-7611-7adc-01670eba9dbb@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fb4aa7c-f6ce-4715-b594-08d6bcece12b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB2591;
x-ms-traffictypediagnostic: TYAPR01MB2591:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB259177FC90A401228A5417DCB82D0@TYAPR01MB2591.jpnprd01.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(346002)(376002)(136003)(39860400002)(51914003)(43544003)(189003)(199004)(53936002)(2171002)(74316002)(6306002)(14454004)(6246003)(102836004)(478600001)(6116002)(9686003)(55016002)(3846002)(99286004)(97736004)(966005)(6506007)(305945005)(53546011)(54906003)(110136005)(256004)(4326008)(7736002)(186003)(316002)(25786009)(26005)(33656002)(229853002)(446003)(11346002)(66066001)(105586002)(5660300002)(486006)(93886005)(476003)(2906002)(106356001)(52536014)(44832011)(68736007)(71200400001)(81166006)(8936002)(81156014)(86362001)(76176011)(7696005)(71190400001)(8676002)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2591;H:TYAPR01MB2111.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vdXaaWToerrdWfrjpHvKIxqj+g+yb2uLGZMxaUk1LbgIbdlHl9ULQ4+AKgF681Bn1VUIGNDxA5HFu2OfyaGepiPFSf/kLvg40oA+34qCG706rn8mYyGtUHDpUo9Vo1h1fYi8AKo/wiLRfAojIWY8aT/cw9IqkAzpLF3SZxuclgIlhZWlF4F6wZcNdjtN4QYPcYvAIapaA+B3JmsS+9iHUExgrV0xxiszqqm/d6xw4jt9H/1JoCiGW9Ez+KCWKpEA6RwLyjGFP8gMjmNbr7SUy9r0Ak0InmUIvlqgcZh+UWMylgUp/31LUQs89dGbkXr7mLa9wo0JBS21qlBtZEHXPimf5jOGZbBE690+FsWNCMmANsKqRsk66ajWxWsIFezulckaovp3X8gvuJgugrN39c8cKBsYNnExDvjKeyEy+Dk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb4aa7c-f6ce-4715-b594-08d6bcece12b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 13:11:29.4314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2591
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS2lzaG9uLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiA+PiBTdWJqZWN0OiBS
ZTogW1BBVENIIFYzIDA0LzEzXSBwaHk6IHJjYXItZ2VuMy11c2IyOiBBZGQgc3VwcG9ydCBmb3IN
Cj4gPj4gcjhhNzc0NzANCj4gPj4NCj4gPj4gSGkgQmlqdSwNCj4gPj4NCj4gPj4gT24gMDMvMDQv
MTkgMzo1OCBQTSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+PiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9y
dCBmb3IgcjhhNzc0NzAgKFJaL0cxQykuIFdlIGNhbiByZXVzZSB0aGlzDQo+ID4+PiBkcml2ZXIg
Zm9yIGluaXRpYWxpemluZyB0aW1pbmcvaW50ZXJydXB0IGdlbmVyYXRpb24gcmVnaXN0ZXJzLg0K
PiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2Fz
LmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gVjEtLT5WMg0KPiA+Pj4gICogSW5jb3Jwb3JhdGVkIHNo
aW1vZGEtc2FuJ3MgcmV2aWV3IGNvbW1lbnQNCj4gPj4+ICBSZWY6IGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcGF0Y2gvMTA2NTU4NTUvDQo+ID4+PiAtLS0NCj4gPj4+ICBkcml2ZXJzL3Bo
eS9yZW5lc2FzL0tjb25maWcgICAgICAgICAgICAgIHwgIDIgKy0NCj4gPj4+ICBkcml2ZXJzL3Bo
eS9yZW5lc2FzL3BoeS1yY2FyLWdlbjMtdXNiMi5jIHwgMTkgKysrKysrKysrKysrKysrKysrLQ0K
PiA+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvcmVuZXNhcy9LY29uZmlnDQo+
ID4+PiBiL2RyaXZlcnMvcGh5L3JlbmVzYXMvS2NvbmZpZyBpbmRleCBlMzQwYTkyLi45NjFjY2Ix
IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9waHkvcmVuZXNhcy9LY29uZmlnDQo+ID4+PiAr
KysgYi9kcml2ZXJzL3BoeS9yZW5lc2FzL0tjb25maWcNCj4gPj4+IEBAIC0xOSw3ICsxOSw3IEBA
IGNvbmZpZyBQSFlfUkNBUl9HRU4zX1BDSUUgIGNvbmZpZw0KPiA+PiBQSFlfUkNBUl9HRU4zX1VT
QjINCj4gPj4+ICAJdHJpc3RhdGUgIlJlbmVzYXMgUi1DYXIgZ2VuZXJhdGlvbiAzIFVTQiAyLjAg
UEhZIGRyaXZlciINCj4gPj4+ICAJZGVwZW5kcyBvbiBBUkNIX1JFTkVTQVMNCj4gPj4+IC0JZGVw
ZW5kcyBvbiBFWFRDT04NCj4gPj4+ICsJZGVwZW5kcyBvbiBFWFRDT04gfHwgQVJDSF9SOEE3NzQ3
MA0KPiA+Pj4gIAlkZXBlbmRzIG9uIFVTQl9TVVBQT1JUDQo+ID4+PiAgCXNlbGVjdCBHRU5FUklD
X1BIWQ0KPiA+Pj4gIAlzZWxlY3QgVVNCX0NPTU1PTg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGh5L3JlbmVzYXMvcGh5LXJjYXItZ2VuMy11c2IyLmMNCj4gPj4+IGIvZHJpdmVycy9waHkv
cmVuZXNhcy9waHktcmNhci1nZW4zLXVzYjIuYw0KPiA+Pj4gaW5kZXggMGEzNDc4Mi4uYWMzM2Ew
MiAxMDA2NDQNCj4gPj4+IC0tLSBhL2RyaXZlcnMvcGh5L3JlbmVzYXMvcGh5LXJjYXItZ2VuMy11
c2IyLmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvcGh5L3JlbmVzYXMvcGh5LXJjYXItZ2VuMy11c2Iy
LmMNCj4gPj4+IEBAIC0yMiw2ICsyMiw3IEBADQo+ID4+PiAgI2luY2x1ZGUgPGxpbnV4L3JlZ3Vs
YXRvci9jb25zdW1lci5oPiAgI2luY2x1ZGUgPGxpbnV4L3VzYi9vZi5oPg0KPiA+Pj4gI2luY2x1
ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPg0KPiA+Pj4gKyNpbmNsdWRlIDxsaW51eC9zeXNfc29jLmg+
DQo+ID4+Pg0KPiA+Pj4gIC8qKioqKioqIFVTQjIuMCBIb3N0IHJlZ2lzdGVycyAob3JpZ2luYWwg
b2Zmc2V0IGlzICsweDIwMCkgKioqKioqKi8NCj4gPj4+ICAjZGVmaW5lIFVTQjJfSU5UX0VOQUJM
RQkJMHgwMDANCj4gPj4+IEBAIC0zOTMsNiArMzk0LDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cGh5X29wcw0KPiA+PiByY2FyX2dlbjNfcGh5X3VzYjJfb3BzID0gew0KPiA+Pj4gIAkub3duZXIJ
CT0gVEhJU19NT0RVTEUsDQo+ID4+PiAgfTsNCj4gPj4+DQo+ID4+PiArc3RhdGljIGNvbnN0IHN0
cnVjdCBwaHlfb3BzIHJ6X2cxY19waHlfdXNiMl9vcHMgPSB7DQo+ID4+PiArCS5pbml0CQk9IHJj
YXJfZ2VuM19waHlfdXNiMl9pbml0LA0KPiA+Pj4gKwkuZXhpdAkJPSByY2FyX2dlbjNfcGh5X3Vz
YjJfZXhpdCwNCj4gPj4+ICsJLm93bmVyCQk9IFRISVNfTU9EVUxFLA0KPiA+Pj4gK307DQo+ID4+
PiArDQo+ID4+PiAgc3RhdGljIGlycXJldHVybl90IHJjYXJfZ2VuM19waHlfdXNiMl9pcnEoaW50
IGlycSwgdm9pZCAqX2NoKSAgew0KPiA+Pj4gIAlzdHJ1Y3QgcmNhcl9nZW4zX2NoYW4gKmNoID0g
X2NoOw0KPiA+Pj4gQEAgLTQxMSw2ICs0MTgsNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgcmNhcl9n
ZW4zX3BoeV91c2IyX2lycShpbnQNCj4gPj4+IGlycSwgdm9pZCAqX2NoKSAgfQ0KPiA+Pj4NCj4g
Pj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCByY2FyX2dlbjNfcGh5X3VzYjJf
bWF0Y2hfdGFibGVbXSA9DQo+ID4+PiB7DQo+ID4+PiArCXsgLmNvbXBhdGlibGUgPSAicmVuZXNh
cyx1c2IyLXBoeS1yOGE3NzQ3MCIgfSwNCj4gPj4+ICAJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2Fz
LHVzYjItcGh5LXI4YTc3OTUiIH0sDQo+ID4+PiAgCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyx1
c2IyLXBoeS1yOGE3Nzk2IiB9LA0KPiA+Pj4gIAl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMsdXNi
Mi1waHktcjhhNzc5NjUiIH0sIEBAIC00MjUsMTIgKzQzMywxOA0KPiA+PiBAQA0KPiA+Pj4gc3Rh
dGljIGNvbnN0IHVuc2lnbmVkIGludCByY2FyX2dlbjNfcGh5X2NhYmxlW10gPSB7DQo+ID4+PiAg
CUVYVENPTl9OT05FLA0KPiA+Pj4gIH07DQo+ID4+Pg0KPiA+Pj4gK3N0YXRpYyBzdHJ1Y3Qgc29j
X2RldmljZV9hdHRyaWJ1dGUgc29jX3I4YTc3NDcwW10gPSB7DQo+ID4+PiArCXsgLnNvY19pZCA9
ICJyOGE3NzQ3MCIgfSwNCj4gPj4+ICsJeyAvKiBzZW50aW5lbCAqLyB9DQo+ID4+PiArfTsNCj4g
Pj4+ICsNCj4gPj4+ICBzdGF0aWMgaW50IHJjYXJfZ2VuM19waHlfdXNiMl9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KSAgew0KPiA+Pj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAm
cGRldi0+ZGV2Ow0KPiA+Pj4gIAlzdHJ1Y3QgcmNhcl9nZW4zX2NoYW4gKmNoYW5uZWw7DQo+ID4+
PiAgCXN0cnVjdCBwaHlfcHJvdmlkZXIgKnByb3ZpZGVyOw0KPiA+Pj4gIAlzdHJ1Y3QgcmVzb3Vy
Y2UgKnJlczsNCj4gPj4+ICsJY29uc3Qgc3RydWN0IHBoeV9vcHMgKnBoeV91c2IyX29wcyA9ICZy
Y2FyX2dlbjNfcGh5X3VzYjJfb3BzOw0KPiA+Pj4gIAlpbnQgaXJxLCByZXQgPSAwOw0KPiA+Pj4N
Cj4gPj4+ICAJaWYgKCFkZXYtPm9mX25vZGUpIHsNCj4gPj4+IEBAIC00ODEsNyArNDk1LDEwIEBA
IHN0YXRpYyBpbnQgcmNhcl9nZW4zX3BoeV91c2IyX3Byb2JlKHN0cnVjdA0KPiA+PiBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+ID4+PiAgCSAqIEFuZCB0aGVuLCBwaHktY29yZSB3aWxsIG1hbmFn
ZSBydW50aW1lIHBtIGZvciB0aGlzIGRldmljZS4NCj4gPj4+ICAJICovDQo+ID4+PiAgCXBtX3J1
bnRpbWVfZW5hYmxlKGRldik7DQo+ID4+PiAtCWNoYW5uZWwtPnBoeSA9IGRldm1fcGh5X2NyZWF0
ZShkZXYsIE5VTEwsDQo+ID4+ICZyY2FyX2dlbjNfcGh5X3VzYjJfb3BzKTsNCj4gPj4+ICsJaWYg
KHNvY19kZXZpY2VfbWF0Y2goc29jX3I4YTc3NDcwKSkNCj4gPj4+ICsJCXBoeV91c2IyX29wcyA9
ICZyel9nMWNfcGh5X3VzYjJfb3BzOw0KPiA+Pg0KPiA+PiBXaHkgbm90IGhhdmUgdGhlIHBoeV9v
cHMgaW4gZHJpdmVyX2RhdGEgc2luY2UgeW91IGFueXdheXMgaGF2ZSBhIG5ldw0KPiA+PiBjb21w
YXRpYmxlIGZvciByOGE3NzQ3MD8NCj4gPg0KPiA+IFNvQyBkZXZpY2UgbWF0Y2ggd2lsbCB0YWtl
IGNhcmUgb2YgU29DIHJldmlzaW9uLiBXZSBoYXZlIG11bHRpcGxlIHJldmlzaW9uDQo+IG9mIFNv
QyB2YXJpYW50cyBsaWtlIEVTMS4wLCBFUzEuMQ0KPiA+IFRoZXJlIGlzIGFub3RoZXIgIFNvQyBz
aW1pbGFyIHRvIFJaL0cxQyBrbm93biBhcyBSLUNhciBFMlguICAgSWYgeW91IGFkZCBpdCBpbg0K
PiBjb21wYXRpYmxlLCBpdCB0YWtlcyBjYXJlIG9ubHkgYWJvdXQgdGhlIFNvQyAsIG5vdCB0aGUg
U29DIHJldmlzaW9ucy4NCj4gDQo+IFdlIHNob3VsZCBhZGQgdGhhdCB3aGVuIHRoZXJlJ3MgcmVh
bGx5IGEgY29uZmlndXJhdGlvbiBjaGFuZ2UgYmV0d2Vlbg0KPiBFUzEuMCBhbmQgRVMxLjEuIEV2
ZW4gdGhlIHBoeV9vcHMgY2FuIGJlIHRoZSBzYW1lIHdpdGgNCj4gcG93ZXJfb24vcG93ZXJfb2Zm
IHJldHVybiBmb3INCj4gcjhhNzc0NzAgdW5sZXNzIHlvdSBoYXZlIHBsYW5uZWQgdG8gYWRkIHNv
bWV0aGluZyBsYXRlci4NCg0KT0suIEkgd2lsbCBhZGQgcGh5X29wcyBpbiBkcml2ZXJfZGF0YSBh
bmQgcmVtb3ZlIHNvY19kZXZpY2VfbWF0Y2guDQoNCk9uIGZ1dHVyZSBpZiB0aGVyZSBpcyBhIGNv
bmZpZ3VyYXRpb24gY2hhbmdlL25lZWQgZm9yIGEgcXVpcmtzIGJldHdlZW4gU29DIHZlcnNpb25z
DQp3aWxsIGFkZCB0aGUgc2FtZS4NCg0KUmVnYXJkcywNCkJpanUNCg0KIA0KDQo=
