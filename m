Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:19163 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751359AbdATPwK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 10:52:10 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 1/3] mmc: sh_mobile_sdhi: add support for 2 clocks
Date: Fri, 20 Jan 2017 15:52:04 +0000
Message-ID: <SG2PR06MB1165089B50C28BFD333299CB8A710@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170118172502.13876-1-chris.brandt@renesas.com>
 <20170118172502.13876-2-chris.brandt@renesas.com>
 <CAPDyKFqO3YrDdKqOqJ=xKSH7uAiZ+rCPEDKMZ+c8Y5RKaVK4kg@mail.gmail.com>
In-Reply-To: <CAPDyKFqO3YrDdKqOqJ=xKSH7uAiZ+rCPEDKMZ+c8Y5RKaVK4kg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gVWxmLA0KDQoNCk9uIEZyaWRheSwgSmFudWFyeSAyMCwgMjAxNywgVWxmIEhhbnNzb24g
d3JvdGU6DQo+IE9uIDE4IEphbnVhcnkgMjAxNyBhdCAxODoyNSwgQ2hyaXMgQnJhbmR0IDxjaHJp
cy5icmFuZHRAcmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFNvbWUgY29udHJvbGxlcnMgaGF2
ZSAyIGNsb2NrIHNvdXJjZXMgaW5zdGVhZCBvZiAxLCBzbyB0aGV5IGJvdGggbmVlZA0KPiA+IHRv
IGJlIHR1cm5lZCBvbi9vZmYuDQo+IA0KPiBUaGlzIGRvZXNuJ3QgdGVsbCBtZSBlbm91Z2guIFBs
ZWFzZSBlbGFib3JhdGUuDQo+IA0KPiBGb3IgZXhhbXBsZSwgdGVsbCBob3cgeW91IHRyZWF0IHRo
ZSBjbG9ja3MsIHdoaWNoIG9mIHRoZW0gdGhhdCBpcyBvcHRpb25hbA0KPiBhbmQgd2h5Lg0KDQpC
YXNpY2FsbHksIHRoZSBjaGlwIGRlc2lnbmVycyB3ZW50IGluIGFuZCBicm9rZSBvdXQgdGhlIGxv
Z2ljIHRoYXQganVzdCBkb2VzDQp0aGUgY2FyZCBkZXRlY3QgKG1vcmUgb3IgbGVzcyBpdCdzIHBy
b2JhYmx5IGp1c3Qgc29tZSBzaW1wbGUgSVJRIGxvZ2ljKSBzbw0KdGhhdCB5b3UgY291bGQgc2h1
dCBvZmYgdGhlIElQIGJsb2NrLCBidXQgaWYgeW91IHB1dCBpbiBhIGNhcmQsIHRoZSBpbnRlcm5h
bA0KaW50ZXJydXB0IHNpZ25hbCBzdGlsbCB3ZW50IHRvIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxl
ciBhbmQgcmVnaXN0ZXJlZCB0aGUNCmludGVycnVwdCBldmVuIHRob3VnaCB0aGUgcmVzdCBvZiB0
aGUgSVAgYmxvY2sgKGluY2x1ZGluZyB0aGUgcmVnaXN0ZXIgc3BhY2UpDQp3YXMgZGVhZC4NCg0K
VGhlIGlkZWEgc2VlbXMgdG8gYmUgdGhhdCB5b3UgY291bGQgcHV0IHRoZSBlbnRpcmUgY2hpcCBp
bnRvIGxvdyBwb3dlciBtb2RlDQphbmQgd2FrZSBpdCB1cCBpZiB5b3Ugc3R1Y2sgYSBjYXJkIGlu
Lg0KDQpNeSBndWVzcyBpcyB0aGF0IHRoaXMgd2FzIGZvciBzb21lIGN1c3RvbWVyIHJlcXVlc3Qg
b3Igc29tZXRoaW5nLg0KDQpQZXJzb25hbGx5Li4ueW91IGNvdWxkIGhhdmUgZG9uZSB0aGUgc2Ft
ZSB0aGluZyBpZiB5b3UgbGFpZCBvdXQgYSBib2FyZA0KYW5kIHRpZWQgb25lIG9mIHRoZSBleHRy
YSBJUlEgbGluZXMgdG8gdGhlIGNkIHNpZ25hbC4uLmJ1dCBJJ20gbm90IHN1cmUgaWYNCmFueW9u
ZSB0aG91Z2h0IGFib3V0IHRoYXQgYXQgdGhlIHRpbWUuDQoNCg0KU28gdG8geW91ciByZXF1ZXN0
LCBJIGNvdWxkIHB1dCBhbGwgdGhpcyB1Z2x5IGluZm8gaW50byB0aGUgZG9jdW1lbnRhdGlvbiwN
CmJ1dCBiYXNpY2FsbHkgYWxsIEknbSB0cnlpbmcgdG8gZG8gaXMgam9pbiB0aGUgMiBjbG9ja3Mg
YmFjayB0b2dldGhlcg0KdG8gbWFrZSBpdCB3b3JrIGxpa2UgYWxsIHRoZSBvdGhlciBTb0NzIHNp
bmNlIHRoaXMgbmV3ICdmZWF0dXJlJyBtaWdodA0Kbm90IHJlYWxseSBiZSBwcmFjdGljYWwgdG8g
ZXZlcnkgdXNlIGluIHRoaXMgZW52aXJvbm1lbnQuDQoNCg0KDQo+ID4gIHN0YXRpYyBpbnQgc2hf
bW9iaWxlX3NkaGlfY2FyZF9idXN5KHN0cnVjdCBtbWNfaG9zdCAqbW1jKSBAQCAtNTcyLDYNCj4g
PiArNTgxLDEwIEBAIHN0YXRpYyBpbnQgc2hfbW9iaWxlX3NkaGlfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICAgICAgICAgICAgZ290byBlcHJvYmU7DQo+ID4g
ICAgICAgICB9DQo+ID4NCj4gPiArICAgICAgIHByaXYtPmNsa19jZCA9IGRldm1fY2xrX2dldCgm
cGRldi0+ZGV2LCAiY2QiKTsNCj4gPiArICAgICAgIGlmIChJU19FUlIocHJpdi0+Y2xrX2NkKSkN
Cj4gPiArICAgICAgICAgICAgICAgcHJpdi0+Y2xrX2NkID0gTlVMTDsNCj4gDQo+IElzIHRoaXMg
Y2xvY2sgc29sZWx5IGFib3V0IGNhcmQgZGV0ZWN0aW9uPyBTbyBpbiBjYXNlcyB3aGVuIHlvdSBo
YXZlIGENCj4gR1BJTyBjYXJkIGRldGVjdCwgdGhlIGNsb2NrIGlzbid0IG5lZWRlZD8NCj4gDQo+
IEp1c3QgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhpbmdzIGEgYml0IGJldHRlci4uLg0KDQpBY2Nv
cmRpbmcgdG8gdGhlIGhhcmR3YXJlIG1hbnVhbCwgZW5hYmxpbmcgdGhlICJjb3JlIiBjbG9jayBi
dXQgbm90IHRoZQ0KImNkIiBjbG9jayBpcyBub3QgYSB2YWxpZCBzZXR0aW5nLiBTbyBpbiBvdXIg
Y2FzZSwgaXQncyBhbHdheXMgYWxsIG9yDQpub3RoaW5nLg0KDQoNCkNocmlzDQo=
