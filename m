Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:41475 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932554AbdBIUV6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2017 15:21:58 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>,
        "Geert Uytterhoeven" <geert@linux-m68k.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] ARM: add ARM_SINGLE_ARMV7 as config option
Date: Thu, 9 Feb 2017 20:21:43 +0000
Message-ID: <SG2PR06MB11650C805DD754EE5C9E56C78A450@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170209033044.19513-1-chris.brandt@renesas.com>
 <20170209033044.19513-2-chris.brandt@renesas.com>
 <519f1f67-5cfc-db78-c2b7-6bb74b78f3c8@gmail.com>
 <SG2PR06MB1165828CEDD6C06F6D1CBBF98A450@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <5d90aff5-63b7-83a8-7529-2ac61ef82021@gmail.com>
In-Reply-To: <5d90aff5-63b7-83a8-7529-2ac61ef82021@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

T24gVGh1cnNkYXksIEZlYnJ1YXJ5IDA5LCAyMDE3LCBGbG9yaWFuIEZhaW5lbGxpIHdvcnRlOg0K
PiA+IEkgdGhpbmsgdGhlIGNsb3Nlc3QgSSBtaWdodCBoYXZlIGNvbWUgd2FzIHRvIHB1cnBvc2Vs
eSBicmVhayB0aGUgYnVpbGQNCj4gPiBpZiBtb3JlIHRoZW4gMSB3YXMgc2VsZWN0LCBidXQgdGhh
dCBzdGlsbCBkaWRuJ3Qgc3RvcCB5b3UgZnJvbSBtYWtpbmcNCj4gPiB0aGUgc2VsZWN0aW9uLg0K
PiA+DQo+ID4gSWYgc29tZW9uZSBzbWFydGVyIHRoYW4gbWUgaGFzIGEgd2F5IHRvIGRvIChub3Qg
anVzdCBhbiBpZGVhLi4uSQ0KPiByZWNlaXZlZA0KPiA+IGxvdHMgb2YgaWRlYXMgYnV0IG5vbmUg
b2YgdGhlbSB3b3JrZWQpLCBJJ2QgYmUgaGFwcHkgdG8gaGVhciBpdC4NCj4gDQo+IEkgYW0gZGVm
aW5pdGl2ZWx5IG5vdCBhIEtidWlsZCBleHBlcnQsIGJ1dCBpdCB3b3VsZCBhbG1vc3QgbmVjZXNz
YXJpbHkNCj4gcmVxdWlyZSBpbnRyb2R1Y2Ugc29tZSBraW5kIG9mIG5ldyB0eXBlIGluIHRoZSBL
Y29uZmlnL0tidWlsZCBzeW50YXgNCj4gdGhhdCBkb2VzIHNvbWV0aGluZyBsaWtlIHRoYXQ6DQo+
IA0KPiAtIGhhdmUgYSB3YXkgdG8gY291bnQgdGhlIG51bWJlciBvZiBzeW1ib2xzIHRoYXQgYXJl
IHNlbGVjdGVkIGFuZCBkbyBhDQo+ICJpZiBBUkNIX01VTFRJX1Y2X1Y3IiAob3IgYW4gYXJiaXRy
YXJ5IGV4cHJlc3Npb24pIHRoaXMgbW9zdCBsaWtlbHkNCj4gc2hvdWxkIGV4aXN0IGludGVybmFs
bHkgd2l0aGluIEtjb25maWcNCj4gDQo+IC0gaW50cm9kdWNlIGEgbmV3IHR5cGUgb2YgS2NvbmZp
ZyB0eXBlIHdoaWNoIGlzIGEgImNvdW50IiwgYW5kIGdldHMNCj4gYXNzaWduZWQgdGhpcyB2YWx1
ZSB0aGF0IHdlIGp1c3QgY291bnRlZCwgc29tZXRoaW5nIHRoYXQgY291bGQgbG9vayBsaWtlDQo+
IHRoaXM6DQo+IA0KPiBjb3VudCBBUkNIX01VTFRJX1Y2X1Y3X0NPVU5UDQo+IAl0cmFja3MgQVJD
SF9NVUxUSV9WNl9WNw0KDQpJIGRpZCB0cnkgdGhlIGNvdW50aW5nIHRoaW5nLCBidXQgY291bGRu
J3QgZ2V0IGl0IHRvIHdvcmsuDQpJIGFkbWl0IHRob3VnaCwgSSBkaWQgc3RvcCB3aGVuIHRoZSBu
ZXh0IHN0ZXAgd2FzIHRvIGNyZWF0ZSBhIG5ldyB0eXBlDQpraW5kIG9mIHRoaW5nIHRoYXQgSSBj
b3VsZCB1c2UgZm9yIGNvdW50aW5nLiBUaGF0IHNlZW1lZCB0byBzdGFydCBnb2luZw0KZG93biBh
IGRlZXBlciBwYXRoIHRoYW4gSSB3YXMgaG9waW5nIGZvci4NCg0KSG93ZXZlciwNCkkgYW0gaGVz
aXRhbnQgdG8gZ28gYW5kIHRyeSBhbnl0aGluZyBlbHNlIGJlY2F1c2UgZXZlcnl0aGluZyBJJ3Zl
IHN1Ym1pdHRlZA0Kc28gZmFyIGhhcyBiZWVuIE5BQ0tlZC4gVGhlIG9ubHkgdGhpbmcgUnVzc2Vs
bCBzYWlkIGhlJ2QgYWdyZWUgdG8gaXMgYSB0b3ANCmxldmVsIHNpbmdsZS1wbGF0Zm9ybSBvcHRp
b24uIEJ1dCwgc2luY2UgdGhhdCBhbGwgZ290IHRha2VuIG91dCwgSSBhc3N1bWUNCnRoZXJlJ3Mg
c29tZSByZXNpc3RhbmNlIHRvIHB1dHRpbmcgaXQgYmFjayBpbi4NCg0KDQpDaHJpcw0KDQo=
