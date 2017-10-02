Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:60988 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751345AbdJBBSz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 Oct 2017 21:18:55 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
CC: "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 20/22] arm64: dts: renesas: r8a77995: draak: enable
 EthernetAVB
Date: Mon, 2 Oct 2017 01:18:49 +0000
Message-ID: <TY1PR06MB09924F9B2BE2CA1C5F1CF318D87D0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <cover.1506678250.git.horms+renesas@verge.net.au>
 <4503b50eac08f472e8690ec61f4d144e62cbdc55.1506678250.git.horms+renesas@verge.net.au>
 <29d4573f-4127-225c-1abc-7f341734d7d7@cogentembedded.com>
In-Reply-To: <29d4573f-4127-225c-1abc-7f341734d7d7@cogentembedded.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2VyZ2VpIFNo
dHlseW92DQo+IFNlbnQ6IFNhdHVyZGF5LCBTZXB0ZW1iZXIgMzAsIDIwMTcgNzoyNCBQTQ0KPiAN
Cj4gSGVsbG8hDQo+IA0KPiBPbiA5LzI5LzIwMTcgMjo1MiBQTSwgU2ltb24gSG9ybWFuIHdyb3Rl
Og0KPiANCj4gPiBGcm9tOiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhA
cmVuZXNhcy5jb20+DQo+ID4NCj4gPiBUaGlzIHBhdGNoIGVuYWJsZXMgRXRoZXJuZXRBVkIgZm9y
IFItQ2FyIEQzIGRyYWFrIGJvYXJkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJv
IFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+IFJldmlld2Vk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFNpbW9uIEhvcm1hbiA8aG9ybXMrcmVuZXNhc0B2ZXJnZS5uZXQuYXU+DQo+
ID4gLS0tDQo+ID4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUtZHJhYWsu
ZHRzIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjhhNzc5OTUtZHJhYWsuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I4YTc3OTk1LWRyYWFrLmR0cw0KPiA+IGluZGV4IDdiNzc2Y2I3ZTkyOC4uOTZiN2ZmNWNj
MzIxIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5
NS1kcmFhay5kdHMNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5
OTUtZHJhYWsuZHRzDQo+IFsuLi5dDQo+ID4gQEAgLTM3LDYgKzM5LDE0IEBADQo+ID4gICB9Ow0K
PiA+DQo+ID4gICAmcGZjIHsNCj4gPiArCWF2YjBfcGluczogYXZiIHsNCj4gPiArCQltdXggew0K
PiA+ICsJCQlncm91cHMgPSAiYXZiMF9saW5rIiwgImF2YjBfcGh5X2ludCIsICJhdmIwX21kYyIs
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5e
Xl5eXl5eXl4NCj4gICAgIEh1bSwgSSBkb24ndCB0aGluayBpdCdzIGNvbXBhdGlibGUgd2l0aCBy
b3V0aW5nIHRoZSBQSFkgaW50ZXJydXB0IHZpYQ0KPiBHUElPNV8xOSBiZWxvdy4gVGhlIGRyaXZl
ciBkb2Vzbid0IHN1cHBvcnQgc2lnbmFsbGluZyB2aWEgQVZCX1BIWV9JTlQgYW55d2F5Lg0KDQpP
b3BzISBZb3UncmUgY29ycmVjdC4gSSBzaG91bGQgZHJvcCAiYXZiMF9waHlfaW50Ii4NCg0KU2lt
b24tc2FuLCBtYXkgSSBzZW5kIGEgZm9sbG93LXVwIHBhdGNoIHRvIGZpeCB0aGlzPw0KDQpCZXN0
IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+ID4gKwkJCQkgImF2YjBfbWlpIjsNCj4g
PiArCQkJZnVuY3Rpb24gPSAiYXZiMCI7DQo+ID4gKwkJfTsNCj4gPiArCX07DQo+ID4gKw0KPiA+
ICAgCXNjaWYyX3BpbnM6IHNjaWYyIHsNCj4gPiAgIAkJZ3JvdXBzID0gInNjaWYyX2RhdGEiOw0K
PiA+ICAgCQlmdW5jdGlvbiA9ICJzY2lmMiI7DQo+ID4gQEAgLTU2LDYgKzY2LDIxIEBADQo+ID4g
ICAJc3RhdHVzID0gIm9rYXkiOw0KPiA+ICAgfTsNCj4gPg0KPiA+ICsmYXZiIHsNCj4gPiArCXBp
bmN0cmwtMCA9IDwmYXZiMF9waW5zPjsNCj4gPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
DQo+ID4gKwlyZW5lc2FzLG5vLWV0aGVyLWxpbms7DQo+ID4gKwlwaHktaGFuZGxlID0gPCZwaHkw
PjsNCj4gPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gPiArDQo+ID4gKwlwaHkwOiBldGhlcm5ldC1w
aHlAMCB7DQo+ID4gKwkJcnhjLXNrZXctcHMgPSA8MTUwMD47DQo+ID4gKwkJcmVnID0gPDA+Ow0K
PiA+ICsJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW81PjsNCj4gPiArCQlpbnRlcnJ1cHRzID0g
PDE5IElSUV9UWVBFX0xFVkVMX0xPVz47DQo+ID4gKwl9Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAg
ICZzY2lmMiB7DQo+ID4gICAJcGluY3RybC0wID0gPCZzY2lmMl9waW5zPjsNCj4gPiAgIAlwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiANCj4gTUJSLCBTZXJnZWkNCg==
