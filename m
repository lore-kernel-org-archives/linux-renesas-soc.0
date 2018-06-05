Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail1.bemta25.messagelabs.com ([195.245.230.67]:27742 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751921AbeFERQX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 13:16:23 -0400
From: Steve Twiss <stwiss.opensource@diasemi.com>
To: Marek Vasut <marek.vasut@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Support Opensource <Support.Opensource@diasemi.com>
Subject: RE: [PATCH v3 03/10] mfd: da9063: Rename PMIC_DA9063 to
 PMIC_CHIP_ID_DA9063
Date: Tue, 5 Jun 2018 17:16:19 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB701941AD654@SW-EX-MBX02.diasemi.com>
References: <20180602101155.26375-1-marek.vasut+renesas@gmail.com>
 <20180602101155.26375-3-marek.vasut+renesas@gmail.com>
 <20180604122658.GC21163@dell>
 <3853ee6e-86a7-793e-c633-fc9c2910976f@gmail.com>
In-Reply-To: <3853ee6e-86a7-793e-c633-fc9c2910976f@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DQoNCk9uIDA0IEp1bmUgMjAxOCAxOTozMiwgTWFyZWsgVmFzdXQgd3JvdGUsDQoNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MyAwMy8xMF0gbWZkOiBkYTkwNjM6IFJlbmFtZSBQTUlDX0RBOTA2MyB0
bw0KPiBQTUlDX0NISVBfSURfREE5MDYzDQo+IA0KPiBPbiAwNi8wNC8yMDE4IDAyOjI2IFBNLCBM
ZWUgSm9uZXMgd3JvdGU6DQo+ID4gT24gU2F0LCAwMiBKdW4gMjAxOCwgTWFyZWsgVmFzdXQgd3Jv
dGU6DQo+ID4NCj4gPj4gVGhlIFBNSUNfREE5MDYzIGlzIGEgY29tcGxldGUgbWlzbm9tZXIsIGl0
IGRlbm90ZXMgdGhlIHZhbHVlIG9mIHRoZQ0KPiA+PiBEQTkwNjMgY2hpcCBJRCByZWdpc3Rlciwg
c28gcmVuYW1lIGl0IGFzIHN1Y2guIEl0IGlzIGFsc28gdGhlIHZhbHVlDQo+ID4+IG9mIGNoaXAg
SUQgcmVnaXN0ZXIgb2YgREE5MDYzTCB0aG91Z2gsIHNvIGRyb3AgdGhlIGVudW0gYXMgYWxsIHRo
ZQ0KPiA+PiBEQTkwNjMgIm1vZGVscyIgc2hhcmUgdGhlIHNhbWUgY2hpcCBJRCBhbmQgdGh1cyB0
aGUgZGlzdGluY3Rpb24gd2lsbA0KPiA+PiBoYXZlIHRvIGJlIG1hZGUgdXNpbmcgRFQgb3Igb3Ro
ZXJ3aXNlLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZWsudmFz
dXQrcmVuZXNhc0BnbWFpbC5jb20+DQo+ID4+IENjOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+PiBDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4NCj4gPj4gQ2M6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4gPj4gQ2M6
IFN0ZXZlIFR3aXNzIDxzdHdpc3Mub3BlbnNvdXJjZUBkaWFzZW1pLmNvbT4NCj4gPj4gQ2M6IFdv
bGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+DQo+ID4+IENjOiBs
aW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gQWNrZWQtYnk6IE1hcmsgQnJv
d24gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4gPj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4+IC0tLQ0KPiA+PiBWMjogTm8gY2hh
bmdlDQo+ID4+IFYzOiBObyBjaGFuZ2UNCj4gPj4gLS0tDQo+ID4+ICBkcml2ZXJzL21mZC9kYTkw
NjMtY29yZS5jICAgICAgICAgICAgfCAyICstDQo+ID4+ICBkcml2ZXJzL21mZC9kYTkwNjMtaTJj
LmMgICAgICAgICAgICAgfCAyICstDQo+ID4+ICBkcml2ZXJzL3JlZ3VsYXRvci9kYTkwNjMtcmVn
dWxhdG9yLmMgfCAyICstDQo+ID4+ICBpbmNsdWRlL2xpbnV4L21mZC9kYTkwNjMvY29yZS5oICAg
ICAgfCA0ICstLS0NCj4gPj4gIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gRm9yIG15IG93biByZWZlcmVuY2U6DQo+ID4gICBBY2tlZC1m
b3ItTUZELWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPg0KPiANCj4gVGhhbmtz
Lg0KPiANCj4gQW55IG90aGVyIGNvbW1lbnRzIGJlZm9yZSBJIHN1Ym1pdCB0aGUgbmV4dCByb3Vu
ZCBpbiBhIGZldyBkYXlzPw0KPiANCg0KSGkgTWFyZWssDQoNClRoYW5rcy4NCkknbSByZXZpZXdp
bmcgaXQgbm93Lg0KQ291bGQgeW91IGhvbGQgb2ZmIHVudGlsIHRvbW9ycm93IHBsZWFzZT8NCg0K
UmVnYXJkcywNClN0ZXZlDQo=
