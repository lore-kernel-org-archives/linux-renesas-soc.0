Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410129.outbound.protection.outlook.com ([40.107.141.129]:55363
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726187AbeK2XHa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 18:07:30 -0500
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>
Subject: RE: [PATCH v6 3/6] m68k: coldfire: Add clk_get_optional() function
Date: Thu, 29 Nov 2018 12:02:17 +0000
Message-ID: <TY1PR01MB1769821858C257F94E9470BAF5D20@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <20181116145937.27660-1-phil.edworthy@renesas.com>
 <20181116145937.27660-4-phil.edworthy@renesas.com>
 <bcb0278b-a4f5-068b-324f-7be3ca963102@linux-m68k.org>
In-Reply-To: <bcb0278b-a4f5-068b-324f-7be3ca963102@linux-m68k.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR3JlcSwNCg0KT24gMjkgTm92ZW1iZXIgMjAxOCAxMTo1NSwgR3JlZyBVbmdlcmVyIHdyb3Rl
Og0KPiBPbiAxNy8xMS8xOCAxMjo1OSBhbSwgUGhpbCBFZHdvcnRoeSB3cm90ZToNCj4gPiBjbGtf
Z2V0X29wdGlvbmFsKCkgcmV0dXJucyBOVUxMIGlmIG5vdCBmb3VuZCBpbnN0ZWFkIG9mIC1FTk9F
TlQsDQo+ID4gb3RoZXJ3aXNlIHRoZSBiZWhhdmlvdXIgaXMgdGhlIHNhbWUgYXMgY2xrX2dldCgp
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGhpbCBFZHdvcnRoeSA8cGhpbC5lZHdvcnRoeUBy
ZW5lc2FzLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBHcmVnIFVuZ2VyZXIgPGdlcmdAQGxpbnV4LW02
OGsub3JnPg0KPiANCj4gTG9va3MgZ29vZC4gRG8geW91IHdhbnQgbWUgdG8gdGFrZSB0aGlzIGlu
IHRoZSBtNjhrbm9tbXUgZ2l0IHRyZWU/DQo+IE9yIGlzIHRoZSB3aG9sZSBzZXJpZXMgZ29pbmcg
dGhyb3VnaCBzb21lIG90aGVyIHRyZWU/DQpUaGlzIHBhdGNoIGlzIG5vIGxvbmdlciBuZWVkZWQg
YXMgSSBmb3VuZCBhIGJldHRlciB3YXkgdG8gaW1wbGVtZW50IHRoaXM6DQpbUEFUQ0ggdjhdIGNs
azogQWRkIChkZXZtXyljbGtfZ2V0X29wdGlvbmFsKCkgZnVuY3Rpb25zDQpodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3BhdGNoLzEwNjkwNDM3Lw0KDQpBcG9sb2dpZXMgZm9yIGFueSBjb25m
dXNpb24sDQpQaGlsDQoNCj4gUmVnYXJkcw0KPiBHcmVnDQo+IA0KPiANCj4gDQo+ID4gLS0tDQo+
ID4gICBhcmNoL202OGsvY29sZGZpcmUvY2xrLmMgfCAxMSArKysrKysrKysrKw0KPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNo
L202OGsvY29sZGZpcmUvY2xrLmMgYi9hcmNoL202OGsvY29sZGZpcmUvY2xrLmMgaW5kZXgNCj4g
PiA3YmM2NjZlNDgyZWIuLmIyMjFjYWJjN2Y1NCAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL202OGsv
Y29sZGZpcmUvY2xrLmMNCj4gPiArKysgYi9hcmNoL202OGsvY29sZGZpcmUvY2xrLmMNCj4gPiBA
QCAtODcsNiArODcsMTcgQEAgc3RydWN0IGNsayAqY2xrX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYs
IGNvbnN0IGNoYXIgKmlkKQ0KPiA+ICAgfQ0KPiA+ICAgRVhQT1JUX1NZTUJPTChjbGtfZ2V0KTsN
Cj4gPg0KPiA+ICtzdHJ1Y3QgY2xrICpjbGtfZ2V0X29wdGlvbmFsKHN0cnVjdCBkZXZpY2UgKmRl
diwgY29uc3QgY2hhciAqaWQpIHsNCj4gPiArCXN0cnVjdCBjbGsgKmNsayA9IGNsa19nZXQoZGV2
LCBpZCk7DQo+ID4gKw0KPiA+ICsJaWYgKGNsayA9PSBFUlJfUFRSKC1FTk9FTlQpKQ0KPiA+ICsJ
CWNsayA9IE5VTEw7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIGNsazsNCj4gPiArfQ0KPiA+ICtFWFBP
UlRfU1lNQk9MKGNsa19nZXRfb3B0aW9uYWwpOw0KPiA+ICsNCj4gPiAgIGludCBjbGtfZW5hYmxl
KHN0cnVjdCBjbGsgKmNsaykNCj4gPiAgIHsNCj4gPiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0K
PiA+DQo=
