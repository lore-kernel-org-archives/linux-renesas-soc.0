Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BF7C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:24:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25D68206BA
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:24:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="X0mDNZu6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbfDCKYX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:24:23 -0400
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:38306
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726352AbfDCKYX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS/J4PV8RUoNwTgFc6Q4TrvBFB0+166Eos15xX1FFT0=;
 b=X0mDNZu6srXID/WMJpD+RALLCttjQN7ZT1JAuyw9u0IYIHVfysD/EKJhK1gMn56kZIjwuHZdhWQq+zoOXMIISF2M6AD2wL7OfTF7s9cBlyLx8ERLqmNpClBe+d2GmDnXo2wNc1wfSvc+wBXJnjVsC1+NVsQLFkxYco5Y+pbI7HY=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1530.jpnprd01.prod.outlook.com (52.133.161.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.13; Wed, 3 Apr 2019 10:24:17 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273%4]) with mapi id 15.20.1750.017; Wed, 3 Apr 2019
 10:24:17 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
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
Thread-Index: AQHU0B7lkP0IEM96ZkuriL/7SvPIi6YnbACAgADmdACAAhbigA==
Date:   Wed, 3 Apr 2019 10:24:17 +0000
Message-ID: <TY1PR01MB17703687A7ECF803B338834EC0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <54573748-18bd-1ece-f6e1-bd7801503715@ti.com>
 <TYAPR01MB4271A67EA5A43F11656DD34AD8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4271A67EA5A43F11656DD34AD8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dff0b189-49a3-43a6-4213-08d6b81e8708
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1530;
x-ms-traffictypediagnostic: TY1PR01MB1530:
x-microsoft-antispam-prvs: <TY1PR01MB15305A7393D9D10917C7E6BFC0570@TY1PR01MB1530.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0996D1900D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39860400002)(366004)(346002)(376002)(396003)(199004)(189003)(14444005)(256004)(5660300002)(99286004)(7696005)(74316002)(7736002)(305945005)(186003)(14454004)(26005)(102836004)(44832011)(486006)(476003)(11346002)(446003)(76176011)(478600001)(53546011)(6506007)(6116002)(3846002)(316002)(54906003)(97736004)(66066001)(110136005)(4326008)(71190400001)(71200400001)(33656002)(229853002)(6246003)(9686003)(55016002)(105586002)(81166006)(81156014)(106356001)(2906002)(8676002)(6436002)(68736007)(8936002)(52536014)(93886005)(25786009)(53936002)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1530;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2WYhef9rBA3bPaZzBbZmSXJXQikL/YZQkr0mJ3ByiFDPgDdbXdjCch6Vg5W1GppN9P/OYZbZsjwAqEQ7rOEjsaI+xmdZYSofICrTI2REkl8u4CEVSD7ITwIOe74c1EoSfKn+vEbIWEvHXK5+WLv+WGTHB5v4xOvEdW5uwQx9z8+PZZhtbV3Fto6uQx4Dt6yUeMB460eX16uuu0kblwErCTlhgf1D6UvQxGLLwNwU3W4vPavRIBk5BzX3ZJBocwGcWoWcJ9ik8Z2oKDvmgoH/qJtIsB9AOdNzVdKmi7/q3xRTisXfb7mxR7nmaDjKXH6xPj5Q0aS/c5bNaF2zewwgYBCdycuO70Uy21ge+gNw0ehvoNKBdfnbnZk++lA2O8YkevMKI8jx5k/RLQr/89hX/iPBsJS52Soj1wbt9tcIpL8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff0b189-49a3-43a6-4213-08d6b81e8708
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2019 10:24:17.1817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1530
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gWW9zaGloaXJvLXNhbiwgS2lzaG9uDQoNCj4gRnJvbTogWW9zaGloaXJvIFNoaW1vZGEg
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiBTZW50OiAwMiBBcHJpbCAyMDE5
IDAzOjExDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMi80XSBwaHk6IHJlbmVzYXM6IHJjYXItZ2Vu
My11c2IyOiBObyBuZWVkIHRvIHJlcXVlc3QgSVJRIGZvciBub24tT1RHDQo+IA0KPiBIaSBLaXNo
b24sIEZhYnJpemlvLA0KPiANCj4gPiBGcm9tOiBLaXNob24gVmlqYXkgQWJyYWhhbSBJLCBTZW50
OiBNb25kYXksIEFwcmlsIDEsIDIwMTkgOToyNiBQTQ0KPiA+DQo+ID4gT24gMDEvMDMvMTkgNDoz
NSBQTSwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+ID4gQXMgc3RhdGVkIGluIHRoZSBjb21t
ZW50IGZvdW5kIG9uIHRvcCBvZiByY2FyX2dlbjNfcGh5X3VzYjJfd29yaywNCj4gPiA+IHdlIHNo
b3VsZCBub3QgYmUgcmVnaXN0ZXJpbmcgdGhlIElSUSBpZiAhb3RnX2NoYW5uZWwgfHwgIXVzZXNf
b3RnX3BpbnMuDQo+ID4gPiBPbiB0b3Agb2YgdGhhdCwgd2Ugc2hvdWxkIGFsc28gbWFrZSBzdXJl
IHRoYXQgZXh0Y29uIGhhcyBiZWVuDQo+ID4gPiBhbGxvY2F0ZWQgYmVmb3JlIHJlcXVlc3Rpbmcg
dGhlIGlycSBhcyByY2FyX2dlbjNfcGh5X3VzYjJfd29yaw0KPiA+ID4gdXNlcyBpdCwgaGVuY2Ug
dGhlIHBhdGNoLg0KPiA+ID4NCj4gPiA+IEZpeGVzOiAyYjM4NTQzYzhkYjEgKCJwaHk6IHJjYXIt
Z2VuMy11c2IyOiBhZGQgZXh0Y29uIHN1cHBvcnQiKQ0KPiA+ID4gRml4ZXM6IDczODAxYjkwYTM4
ZiAoInBoeTogcmVuZXNhczogcmNhci1nZW4zLXVzYjI6IGNoYW5nZSBhIGNvbmRpdGlvbiAiZHJf
bW9kZSIiKQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5j
YXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBtZXJnZWQsIHRoYW5rcy4NCj4gDQo+IEkn
bSB2ZXJ5IHNvcnJ5LCBJIGRpZG4ndCBub3RpY2UgdGhpcyBwYXRjaC4uLg0KPiBJJ2QgbGlrZSB0
byBmaXggdGhpcyBwYXRjaCBiZWNhdXNlIHRoaXMgcGF0Y2ggYnJlYWtzIGZvciBSLUNhciBEMy4N
Cj4gSW4gdGhpcyBjYXNlLCBzaG91bGQgSSBzdWJtaXQgYW4gaW5jcmVtZW50YWwgcGF0Y2g/DQoN
Cktpc2hvbiwgaXMgaXQgdG9vIGxhdGUgdG8gZHJvcCB0aGUgcGF0Y2g/DQoNCj4gDQo+ID4gLUtp
c2hvbg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4z
LXVzYjIuYyB8IDI2ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yY2FyLWdlbjMtdXNiMi5jIGIvZHJp
dmVycy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4zLXVzYjIuYw0KPiA+ID4gaW5kZXggMGEzNDc4
Mi4uYmUxYTM5MiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvcGh5L3JlbmVzYXMvcGh5LXJj
YXItZ2VuMy11c2IyLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvcGh5L3JlbmVzYXMvcGh5LXJjYXIt
Z2VuMy11c2IyLmMNCj4gPiA+IEBAIC00NDcsMjAgKzQ0Nyw4IEBAIHN0YXRpYyBpbnQgcmNhcl9n
ZW4zX3BoeV91c2IyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiAg
CWlmIChJU19FUlIoY2hhbm5lbC0+YmFzZSkpDQo+ID4gPiAgCQlyZXR1cm4gUFRSX0VSUihjaGFu
bmVsLT5iYXNlKTsNCj4gPiA+DQo+ID4gPiAtCS8qIGNhbGwgcmVxdWVzdF9pcnEgZm9yIE9URyAq
Lw0KPiA+ID4gLQlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiA+ID4gLQlpZiAo
aXJxID49IDApIHsNCj4gPiA+IC0JCUlOSVRfV09SSygmY2hhbm5lbC0+d29yaywgcmNhcl9nZW4z
X3BoeV91c2IyX3dvcmspOw0KPiA+ID4gLQkJaXJxID0gZGV2bV9yZXF1ZXN0X2lycShkZXYsIGly
cSwgcmNhcl9nZW4zX3BoeV91c2IyX2lycSwNCj4gPiA+IC0JCQkJICAgICAgIElSUUZfU0hBUkVE
LCBkZXZfbmFtZShkZXYpLCBjaGFubmVsKTsNCj4gPiA+IC0JCWlmIChpcnEgPCAwKQ0KPiA+ID4g
LQkJCWRldl9lcnIoZGV2LCAiTm8gaXJxIGhhbmRsZXIgKCVkKVxuIiwgaXJxKTsNCj4gPiA+IC0J
fQ0KPiA+ID4gLQ0KPiA+ID4gIAljaGFubmVsLT5kcl9tb2RlID0gb2ZfdXNiX2dldF9kcl9tb2Rl
X2J5X3BoeShkZXYtPm9mX25vZGUsIDApOw0KPiA+ID4gLQlpZiAoY2hhbm5lbC0+ZHJfbW9kZSAh
PSBVU0JfRFJfTU9ERV9VTktOT1dOKSB7DQo+ID4gPiAtCQlpbnQgcmV0Ow0KPiA+ID4gLQ0KPiA+
ID4gKwlpZiAoY2hhbm5lbC0+ZHJfbW9kZSA9PSBVU0JfRFJfTU9ERV9PVEcpIHsNCj4gDQo+IFIt
Q2FyIEQzIChyOGE3Nzk5NS1kcmFhay5kdHMpIGhhcyBkcl9tb2RlIHdpdGggImhvc3QiLiBTbywg
dGhlIGJvYXJkIGNhbiB1c2UgaG9zdCBtb2RlDQo+IGFzIGRlZmF1bHQgYW5kICJyb2xlIiBtb2Rl
IHRvIHN3aXRjaCB0aGUgcm9sZSBmb3IgcGVyaXBoZXJhbCBsYXRlci4gSG93ZXZlciwgYWZ0ZXIg
d2UNCj4gYXBwbGllZCB0aGlzIHBhdGNoLCB0aGUgUi1DYXIgRDMgVVNCMi4wIGNhbm5vdCBzd2l0
Y2ggdG8gdGhlIHBlcmlwaGVyYWwgbW9kZS4NCg0KSSB1bmRlcnN0YW5kLCBJIGFtIHNvcnJ5IGZv
ciBicmVha2luZyBpdC4NClRoZSBwcm9iaW5nIGZ1bmN0aW9uIHN0aWxsIG5lZWRzIHNvbWUgZml4
aW5nLCBkZXZtX3JlcXVlc3RfaXJxIHVzZXMgcmNhcl9nZW4zX3BoeV91c2IyX2lycSwNCnJjYXJf
Z2VuM19waHlfdXNiMl9pcnEgIGNhbGxzIHJjYXJfZ2VuM19kZXZpY2VfcmVjb2duaXRpb24sIHJj
YXJfZ2VuM19kZXZpY2VfcmVjb2duaXRpb24gbWF5DQpjYWxsIGVpdGhlciByY2FyX2dlbjNfaW5p
dF9mb3JfaG9zdCBvciByY2FyX2dlbjNfaW5pdF9mb3JfcGVyaSwgYm90aCByY2FyX2dlbjNfaW5p
dF9mb3JfaG9zdCBhbmQNCnJjYXJfZ2VuM19pbml0X2Zvcl9wZXJpIHNjaGVkdWxlIHdvcmsgZm9y
IHRoZSB3b3JrIHF1ZXVlIHRoYXQgY2FsbHMgaW50byByY2FyX2dlbjNfcGh5X3VzYjJfd29yaywN
CnJjYXJfZ2VuM19waHlfdXNiMl93b3JrIHVzZXMgZXh0Y29uLCBleHRjb24gZ2V0cyBpbml0aWFs
aXplZCBhZnRlciBkZXZtX3JlcXVlc3RfaXJxLCB3aGljaA0KbWVhbnMgd2Ugc2hvdWxkIG1vdmUg
ZGV2bV9yZXF1ZXN0X2lycSBhZnRlciBleHRjb24gZ2V0cyBpbml0aWFsaXplZCwuDQpBbHNvLCB3
ZSBtYXkgcmVnaXN0ZXIgdGhlIGlycSwgYW5kIG5ldmVyIGRlYWwgd2l0aCBleHRjb24gaWYgZHJf
bW9kZSA9PSBVU0JfRFJfTU9ERV9VTktOT1dOLg0KDQpXb3VsZCB5b3UgbGlrZSB0byBjb21lIHVw
IHdpdGggYSBwYXRjaCB0byBhZGRyZXNzIHRob3NlIHBvaW50cz8NCg0KVGhhbmtzLA0KRmFiDQoN
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gWW9zaGloaXJvIFNoaW1vZGENCj4gDQo+ID4gPiAgCQlj
aGFubmVsLT5pc19vdGdfY2hhbm5lbCA9IHRydWU7DQo+ID4gPiAgCQljaGFubmVsLT51c2VzX290
Z19waW5zID0gIW9mX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYtPm9mX25vZGUsDQo+ID4gPiAgCQkJ
CQkJCSJyZW5lc2FzLG5vLW90Zy1waW5zIik7DQo+ID4gPiBAQCAtNDc2LDYgKzQ2NCwxOCBAQCBz
dGF0aWMgaW50IHJjYXJfZ2VuM19waHlfdXNiMl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiA+ID4gIAkJfQ0KPiA+ID4gIAl9DQo+ID4gPg0KPiA+ID4gKwlpZiAoY2hhbm5l
bC0+aXNfb3RnX2NoYW5uZWwgJiYgY2hhbm5lbC0+dXNlc19vdGdfcGlucykgew0KPiA+ID4gKwkJ
LyogY2FsbCByZXF1ZXN0X2lycSBmb3IgT1RHICovDQo+ID4gPiArCQlpcnEgPSBwbGF0Zm9ybV9n
ZXRfaXJxKHBkZXYsIDApOw0KPiA+ID4gKwkJaWYgKGlycSA+PSAwKSB7DQo+ID4gPiArCQkJSU5J
VF9XT1JLKCZjaGFubmVsLT53b3JrLCByY2FyX2dlbjNfcGh5X3VzYjJfd29yayk7DQo+ID4gPiAr
CQkJaXJxID0gZGV2bV9yZXF1ZXN0X2lycShkZXYsIGlycSwgcmNhcl9nZW4zX3BoeV91c2IyX2ly
cSwNCj4gPiA+ICsJCQkJCSAgICAgICBJUlFGX1NIQVJFRCwgZGV2X25hbWUoZGV2KSwgY2hhbm5l
bCk7DQo+ID4gPiArCQkJaWYgKGlycSA8IDApDQo+ID4gPiArCQkJCWRldl9lcnIoZGV2LCAiTm8g
aXJxIGhhbmRsZXIgKCVkKVxuIiwgaXJxKTsNCj4gPiA+ICsJCX0NCj4gPiA+ICsJfQ0KPiA+ID4g
Kw0KPiA+ID4gIAkvKg0KPiA+ID4gIAkgKiBkZXZtX3BoeV9jcmVhdGUoKSB3aWxsIGNhbGwgcG1f
cnVudGltZV9lbmFibGUoJnBoeS0+ZGV2KTsNCj4gPiA+ICAJICogQW5kIHRoZW4sIHBoeS1jb3Jl
IHdpbGwgbWFuYWdlIHJ1bnRpbWUgcG0gZm9yIHRoaXMgZGV2aWNlLg0KPiA+ID4NCg==
