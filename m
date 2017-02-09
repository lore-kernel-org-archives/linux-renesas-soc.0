Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:20928 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751096AbdBID6p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Feb 2017 22:58:45 -0500
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
Date: Thu, 9 Feb 2017 03:50:55 +0000
Message-ID: <SG2PR06MB1165828CEDD6C06F6D1CBBF98A450@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170209033044.19513-1-chris.brandt@renesas.com>
 <20170209033044.19513-2-chris.brandt@renesas.com>
 <519f1f67-5cfc-db78-c2b7-6bb74b78f3c8@gmail.com>
In-Reply-To: <519f1f67-5cfc-db78-c2b7-6bb74b78f3c8@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gRmxvcmlhbiwNCg0KT24gV2VkbmVzZGF5LCBGZWJydWFyeSAwOCwgMjAxNywgRmxvcmlh
biBGYWluZWxsaSB3cm90ZToNCj4gT24gMDIvMDgvMjAxNyAwNzozMCBQTSwgQ2hyaXMgQnJhbmR0
IHdyb3RlOg0KPiA+IENyZWF0ZXMgYSBuZXcgQVJNX1NJTkdMRV9BUk1WNyBvcHRpb24gYXMgYW4g
YWx0ZXJuYXRpdmUNCj4gQVJDSF9NVUxUSVBMQVRGT1JNLg0KPiA+DQo+ID4gQVJNX1NJTkdMRV9B
Uk1WNyBpcyB2ZXJ5IHNpbWlsYXIgdG8gQVJDSF9NVUxUSVBMQVRGT1JNLCBleGNlcHQgdGhlDQo+
ID4gb3B0aW9ucyBmcm9tIEFSQ0hfTVVMVElfVjZfVjcgd2VyZSBjb3BpZWQgZGlyZWN0bHkgaW50
byB0aGUgbmV3DQo+IEFSTV9TSU5HTEVfQVJNVjcuDQo+ID4NCj4gPiBBZGRpdGlvbmFsbHksIGV2
ZXJ5d2hlcmUgQVJDSF9NVUxUSVBMQVRGT1JNIGV4aXN0ZWQgaW4gYnVpbGQgc2NyaXB0cywNCj4g
PiBBUk1fU0lOR0xFX0FSTVY3IHdhcyBhZGRlZCBhbG9uZyBzaWRlIGl0IGluIG9yZGVyIHRvIHBy
b2R1Y2Ugc2ltaWxhcg0KPiA+IHJlc3VsdHMuDQo+IA0KPiBDb3VsZCB3ZSB0cnkgdG8gYmUgYSBs
aXR0bGUgc21hcnRlciB0aGFuIHRoaXMgYW5kIGlmIEFSQ0hfTVVMVElQTEFURk9STSBpcw0KPiBz
ZWxlY3RlZCBidXQgb25seSBvbmUgcGxhdGZvcm0gYmVuZWF0aCBpcyB3ZSBhdXRvbWF0aWNhbGx5
IHNlbGVjdA0KPiBBUk1fU0lOR0xFX0FSTVY3ICh0aGlzIG1heSByZXF1aXJlIEtjb25maWcgaGFj
a2VyeSk/DQoNCk1vbnRocyBhZ28gSSBzcGVudCBob3VycyBvbiB0cnlpbmcgdG8gZ2V0IHRoZSBj
dXJyZW50IGtidWlsZCBzeXN0ZW0gdG8gZG8NCnRoYXQgYW5kIG5vdGhpbmcgSSBjYW1lIHVwIHdp
dGggd291bGQgd29yay4gSXQncyBzaW1wbHkgbm90IGRlc2lnbmVkIHRoYXQNCndheS4NCg0KSSB0
aGluayB0aGUgY2xvc2VzdCBJIG1pZ2h0IGhhdmUgY29tZSB3YXMgdG8gcHVycG9zZWx5IGJyZWFr
IHRoZSBidWlsZA0KaWYgbW9yZSB0aGVuIDEgd2FzIHNlbGVjdCwgYnV0IHRoYXQgc3RpbGwgZGlk
bid0IHN0b3AgeW91IGZyb20gbWFraW5nDQp0aGUgc2VsZWN0aW9uLg0KDQpJZiBzb21lb25lIHNt
YXJ0ZXIgdGhhbiBtZSBoYXMgYSB3YXkgdG8gZG8gKG5vdCBqdXN0IGFuIGlkZWEuLi5JIHJlY2Vp
dmVkDQpsb3RzIG9mIGlkZWFzIGJ1dCBub25lIG9mIHRoZW0gd29ya2VkKSwgSSdkIGJlIGhhcHB5
IHRvIGhlYXIgaXQuDQoNCg0KDQo+IEkgc2VlIHZhbHVlIGluIHdoYXQgeW91IGFyZSBkb2luZywg
YnV0IEkgZG9uJ3QgdGhpbmsgcHVsbGluZyB0aGUgcGxhdGZvcm1zDQo+IG91dCBvZiB0aGUgbWVu
dSBsaWtlIHdoYXQgeW91IGRvIGluIHRoZSBzdWJzZXF1ZW50IHBhdGNoIGlzIGxvb2tpbmcgbmlj
ZQ0KPiBhcyBhbiB1c2VyL2NvbmZpZ3VyYXRvci4NCg0KV2hhdCBJIHdhcyB0cnlpbmcgdG8gZG8g
KGFuZCB3aGF0IHdhcyBhbHJlYWR5IHJlbW92ZWQgZnJvbSBLY29uZmlncykgd2FzDQp0byBhdm9p
ZCBoYXZpbmcgYSBkdXBsaWNhdGUgc2V0IG9mIGNvbmZpZ3MgZm9yIGVhY2ggU09DOiBvbmUgZm9y
IHNpbmdsZSBhbmQNCm9uZSBmb3IgbXVsdGkuDQoNCg0KI0knbSB0cnlpbmcgdG8gZ2V0IGF3YXkg
ZnJvbSBtYW51YWxseSBoYWNraW5nIHRoZXNlIEtjb25maWcgZmlsZXMgZXZlcnkgdGltZQ0KYSBu
ZXcga2VybmVsIGlzIHJlbGVhc2VkLg0KDQoNCkNocmlzDQoNCg==
