Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-db5eur01on0135.outbound.protection.outlook.com ([104.47.2.135]:8598
	"EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753411AbcHQDJt (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 23:09:49 -0400
From: "Baumann, Christoph (C.)" <cbaumann@visteon.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH] sh-sci: fix transition from noflow to HW flow control
Date: Tue, 16 Aug 2016 09:36:28 +0000
Message-ID: <HE1PR0601MB2683A0C1895F3622D6E1EDA2D0130@HE1PR0601MB2683.eurprd06.prod.outlook.com>
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQogDQoNCj4gV2hpY2ggcG9ydCBhcmUgeW91IHVzaW5nPyBTQ0lGIG9yIEhTQ0lG
Pw0KDQpqdXN0IFNDSUYNCg0KDQo+IFlvdSBtZWFuIHNjaV9zZXRfbWN0cmwoKSBpc24ndCBjYWxs
ZWQgYnkgdGhlIHNlcmlhbCBjb3JlIGFmdGVyDQo+IHNjaV9zZXRfdGVybWlvcygpPw0KPiANCj4g
SG93ZXZlciwgdWFydF9zZXRfdGVybWlvcygpIGNhbGxzIGJvdGggdWFydF9jaGFuZ2Vfc3BlZWQo
KSBhbmQNCj4gdWFydF97Y2xlYXIsc2V0fV9tY3RybCgpLCBpbiB0aGF0IG9yZGVyPw0KDQpVcG9u
IGNhbGxpbmcgb3BlbigpIG9uIHRoZSB0dHkgZGV2aWNlIHNjaV9zZXRfdGVybWlvcygpIGFuZCBz
Y2lfc2V0X21jdHJsKCkgYXJlIGNhbGxlZCBpbiB0aGlzIG9yZGVyLg0KV2hlbiBpc3N1aW5nIGNo
YW5nZXMgKGJhdWQgcmF0ZSwgQ1JUU0NUUy4uLikgb25seSBzY2lfc2V0X3Rlcm1pb3MoKSBnZXRz
IGNhbGxlZC4NCk9uIGNhbGxpbmcgY2xvc2UoKSBzY2lfc2V0X21jdHJsKCkgYW5kIHNjaV9zaHV0
ZG93bigpIGFyZSBjYWxsZWQgaW4gdGhpcyBvcmRlci4NCg0KDQo+IEhhdmUgeW91IHRyaWVkIHVz
aW5nIEdQSU8gUlRTL0NUUyBpbnN0ZWFkIG9mIGhhcmR3YXJlLWFzc2lzdGVkDQo+IFJUUy9DVFM/
DQo+IERvZXMgaXQgc2hvdyB0aGUgc2FtZSBiZWhhdmlvcj8NCj4gV2hlbiBhZGRpbmcgc3VwcG9y
dCBmb3IgaGFyZHdhcmUtYXNzaXN0ZWQgUlRTL0NUUywgSSB1c2VkIHRoZQ0KPiBiZWhhdmlvciBv
ZiBHUElPIFJUUy9DVFMgYXMgdGhlIGV4cGVjdGVkIGJlaGF2aW9yLg0KDQpObywgSSBoYXZlbid0
IHRyaWVkIEdQSU8gUlRTL0NUUyBzbyBmYXIuIEhvdyB3b3VsZCB0aGlzIGJlIGNvbmZpZ3VyZWQ/
DQoNCg0KDQoNClJlZ2FyZHMsDQpDaHJpc3RvcGgNCg==
