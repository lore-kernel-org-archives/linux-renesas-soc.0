Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:60268 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726686AbeGLNZD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jul 2018 09:25:03 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/2] dt-bindings: arm: Document RZ/A2 SoC DT bindings
Date: Thu, 12 Jul 2018 13:15:24 +0000
Message-ID: <TY1PR01MB15621B11047F645DE25485E68A590@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180712030149.91385-1-chris.brandt@renesas.com>
 <20180712030149.91385-3-chris.brandt@renesas.com>
 <CAMuHMdXuXJdvtmEu3WYVSgwd0xfCpQcWQeL+FA9vUMxiA7h=VQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXuXJdvtmEu3WYVSgwd0xfCpQcWQeL+FA9vUMxiA7h=VQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIFRodXJzZGF5LCBKdWx5IDEyLCAyMDE4LCBHZWVydCBVeXR0ZXJob2V2
ZW4gd3JvdGU6DQo+ID4gKyAgLSBSWi9BMiAoUjdTOTIxMCkNCj4gPiArICAgIGNvbXBhdGlibGUg
PSAicmVuZXNhcyxyN3M5MjEwIg0KPiANCj4gVGhlcmUgc2VlbXMgdG8gYmUgYSBkaWZmZXJlbmNl
IGJldHdlZW4gdGhlIHI3czkyMTA0eCBhbmQgdGhlIHI3czkyMTA1eA0KPiBwYXJ0cyAod2l0aCAi
eCIganVzdCBkZW5vdGluZyBhIGRpZmZlcmVudCBwYWNrYWdpbmcpPw0KPiBEbyB3ZSBuZWVkIG9u
ZSBtb3JlIGRpZ2l0Pw0KDQpGcm9tIGFuICJhcmNoaXRlY3R1cmUiIHN0YW5kcG9pbnQgYWxsIHRo
ZSBoYXJkd2FyZSBpbiB0aGUgUlovQTIgDQooUjdTOTIxMHh4IHNlcmllcykgd2lsbCBiZSB0aGUg
c2FtZS4gU28gZnJvbSBhIGRldmljZSBkcml2ZXIgc3RhbmRwb2ludCwgDQpDT05GSUdfQVJDSF9S
N1M5MjEwIHdvdWxkIGNvdmVyIGV2ZXJ5dGhpbmcuDQoNClRoZSByZXN0IG9mIHRoZSBudW1iZXJz
IGFyZSBqdXN0IGZvciBwYWNrYWdlIGFuZCBudW1iZXIgb2YgSFcgY2hhbm5lbHMuDQogDQpPZiBj
b3Vyc2UsIHNvbWV0aW1lcyB3aGVuIHRoZXkgbWFrZSBzbWFsbGVyIHBhY2thZ2VzLCB0aGV5IGFs
c28gbWFrZSANCnNtYWxsZXIgc2lsaWNvbiB0byBtYWtlIGl0IGNoZWFwZXIuIEJ1dCBpbiB0aGF0
IGNhc2UsIHRoZXkganVzdCBzaW1wbHkgDQpyZW1vdmUgSFcgb3IgdGhlIG51bWJlciBvZiBjaGFu
bmVscyBmb3IgdGhlIGhhcmR3YXJlLiAoeW91IGRvbid0IG5lZWQgYXMgDQptYW55IHBlcmlwaGVy
YWxzIGlmIHlvdSBkb24ndCBoYXZlIGFzIG1hbnkgcGlucyBhbnltb3JlKS4gQnV0LCB0aGV5IG5l
dmVyIA0KY2hhbmdlIHRoZSBmdW5jdGlvbmFsaXR5IG9mIHRoZSBoYXJkd2FyZS4NCg0KVGFrZSBm
b3IgZXhhbXBsZSBSWi9BMQ0KIFJaL0ExSCAgUjdTNzIxMDB4DQogUlovQTFNICBSN1M3MjEwMXgN
CiBSWi9BMUwgIFI3UzcyMTAyeA0KIFJaL0ExTFUgUjdTNzIxMDN4DQoNClRoZXNlIHBhcnRzIGFs
bCBoYWQgdGhlIHNhbWUgaGFyZHdhcmUsIGJ1dCBkaWZmZXJlbnQgcGFja2FnZSBvcHRpb25zIEFu
ZA0KdGhlICJMIiBwYXJ0cyB3ZXJlIGNoZWFwZXIgYmVjYXVzZSB0aGV5IHJlZHVjZWQgdGhlIGRp
ZSBzaXplIGJ5IA0KcmVtb3ZpbmcgSFcuDQpCdXQgdGhlIHNhbWUgZHJpdmVycyB3b3JrZWQgb24g
YWxsIG9mIHRoZW0gYmVjYXVzZSB0aGUgSVAgd2FzIGFsbCANCmV4YWN0bHkgdGhlIHNhbWUuDQpT
byBJIHdvdWxkIGhhdmUgc3VnZ2VzdGVkIENPTkZJR19BUkNIX1I3UzcyMTAgZm9yIHRoZSBSWi9B
MSBzZXJpZXMuIA0KKHdlbGwsIHVudGlsIEkgZm91bmQgYWJvdXQgdGhlIFItQ2FyIHBhcnQgdGhh
dCB0b29rIHRoZSBzYW1lIHBhcnQgbnVtYmVyIGluIA0KdGhpcyBzZXJpZXMpDQoNCg0KQXMgZm9y
IHRoZSByN3M5MjEwNHggdnMgcjdzOTIxMDV4LCB0aGF0IGlzIGZvciBhIEhXIGZlYXR1cmUgdGhh
dCB3aWxsIA0KaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggTGludXgsIHNvIHdlIGNhbiBpZ25vcmUg
dGhhdCBudW1iZXIuDQoNCkJ1dCBldmVuIGlmIHdlIGRpZCBtYWtlIGEgdGlueSBjdXQtZG93biB2
ZXJzaW9uIG9mIHRoZSBkZXZpY2UsIHNheSBhIA0KUjdTOTIxMDZ4LCBhbGwgSFcgSVAgd291bGQg
YmUgdGhlIHNhbWUsIGp1c3QgbGVzcyBvZiBpdC4gU28gaW4gbXkgbWluZCwgdGhlDQphcmNoaXRl
Y3R1cmUgKGZyb20gYSBDT05GSUdfQVJDSCBwZXJzcGVjdGl2ZSkgaXMgc3RpbGwgdGhlIHNhbWUu
IE1heWJlIA0KanVzdCBhIGRpZmZlcmVudCAuZHRzaS4NCg0KV2hhdCBkbyB5b3UgdGhpbms/DQoN
CkNocmlzDQo=
