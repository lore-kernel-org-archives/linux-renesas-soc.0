Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-db5eur01on0093.outbound.protection.outlook.com ([104.47.2.93]:55327
	"EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752910AbcHPLPc (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 07:15:32 -0400
From: "Baumann, Christoph (C.)" <cbaumann@visteon.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH] sh-sci: fix transition from noflow to HW flow control
Date: Tue, 16 Aug 2016 11:15:28 +0000
Message-ID: <HE1PR0601MB2683A4FF3F4E8D050A96BAC5D0130@HE1PR0601MB2683.eurprd06.prod.outlook.com>
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCj4gPiBPbiBjYWxsaW5nIGNsb3NlKCkgc2NpX3NldF9tY3RybCgpIGFuZCBz
Y2lfc2h1dGRvd24oKSBhcmUgY2FsbGVkDQo+IGluIHRoaXMgb3JkZXIuDQo+IA0KPiBPSywgc28g
aXQgd29ya3Mgb24gc3Vic2VxdWVudCB1c2VzIGFzIHRoZSBmbGFnIGlzIGtlcHQgaW4gLmNfY2Zs
YWc/DQoNCnllcywgaW5kZWVkLiBJZiB5b3UgY2xvc2UgdGhlIHBvcnQgYW5kIG9wZW4gaXQgYWdh
aW4sIHRoZSBzZXR0aW5ncyBhcmUgY29ycmVjdCBhbmQgY29tbXVuaWNhdGlvbiB3b3Jrcy4NClVu
Zm9ydHVuYXRlbHkgZS5nLiBoY2lhdHRhY2ggb3BlbnMgdGhlIHBvcnQsIHNldHMgaXQgdG8gc29t
ZSBkZWZhdWx0cyAoMTE1MjAwLCBub2Zsb3cpIGFuZCB0aGVuIGV2YWx1YXRlcyB0aGUgY29tbWFu
ZCBsaW5lIHZhbHVlcy4gVGhpcyB3YXkgdGhlIGNvbm5lY3Rpb24gYWx3YXlzIGZhaWxzIGlmIHlv
dSBzcGVjaWZ5IGZsb3cgY29udHJvbC4NCg0KDQo+ID4gTm8sIEkgaGF2ZW4ndCB0cmllZCBHUElP
IFJUUy9DVFMgc28gZmFyLiBIb3cgd291bGQgdGhpcyBiZQ0KPiBjb25maWd1cmVkPw0KPiANCj4g
SW4gRFQsIGluc3RlYWQgb2Ygc3BlY2lmeWluZyAidWFydC1oYXMtcnRzY3RzIiBhbmQgcGluY3Ry
bCBmb3IgdGhlDQo+ICJjdHJsIiBncm91cCwgeW91IHNwZWNpZnkgInJ0cy1ncGlvcyIgYW5kICJj
dHMtZ3Bpb3MiLg0KDQpUaGFua3MsIEkgd2lsbCBoYXZlIGEgbG9vay4NCg0KDQoNCg0KUmVnYXJk
cywNCkNocmlzdG9waA0K
