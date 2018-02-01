Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:56705 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932153AbeBACJc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 21:09:32 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: host: xhci-hub: avoid xhci_warn() when PORT_PE was
 clear.
Date: Thu, 1 Feb 2018 02:09:27 +0000
Message-ID: <TY1PR06MB0992E431B870518E122C6C6BD8FA0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1517399893-24883-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <9a651725-c50f-5e07-6911-b630ac8a7cb8@linux.intel.com>
In-Reply-To: <9a651725-c50f-5e07-6911-b630ac8a7cb8@linux.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGksDQoNCj4gRnJvbTogTWF0aGlhcyBOeW1hbiwgU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDMx
LCAyMDE4IDk6MjkgUE0NCj4gDQo+IE9uIDMxLjAxLjIwMTggMTM6NTgsIFlvc2hpaGlybyBTaGlt
b2RhIHdyb3RlOg0KPiA+IFRoZSBjb21taXQgMzdiZTY2NzY3ZTNjICgidXNiOiBodWI6IEZpeCBh
dXRvLXJlbW91bnQgb2Ygc2FmZWx5IHJlbW92ZWQNCj4gPiBvciBlamVjdGVkIFVTQi0zIGRldmlj
ZXMiKSBjYXVzZXMgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuIHdlDQo+ID4gZGlzY29ubmVjdGVk
IGEgdXNiIDMuMCBkZXZpY2Ugb24gc29tZSBlbnZpcm9ubWVudCAoZS5nLiBSLUNhciBIMyk6DQo+
ID4NCj4gPiAgIHhoY2ktaGNkIGVlMDAwMDAwLnVzYjogQ2Fubm90IHNldCBsaW5rIHN0YXRlLg0K
PiA+ICAgdXNiIHVzYjgtcG9ydDE6IGNhbm5vdCBkaXNhYmxlIChlcnIgPSAtMzIpDQo+ID4NCj4g
PiBBY2NvcmRpbmcgdG8gRmlndXJlIDM1IGluIHhoY2kgc3BlYywgdGhlIFBFRCAoUE9SVF9QRSkg
d2lsbA0KPiA+IGJlIHNldCB0byAwIGFmdGVyIHRoZSB1c2IzIHJvb3QgaHViIGVudGVycyAiRXJy
b3IiIG9yICJEaXNjb25uZWN0ZWQiDQo+ID4gc3RhdGUuIFNvLCB0aGlzIHBhdGNoIGF2b2lkcyB0
aGUgZXJyb3IgbWVzc2FnZXMgdG8gcmV0dXJuIC1FTk9ERVYgd2hlbg0KPiA+IGFza2VkIHRvIHNl
dCB0aGUgVVNCX1BPUlRfRkVBVF9MSU5LX1NUQVRFIGZlYXR1cmUgdG8gVTMgYW5kIFBPUlRfUEUN
Cj4gPiB3YXMgY2xlYXIuDQo+ID4NCj4gPiBTdWdnZXN0ZWQtYnk6IE1hdGhpYXMgTnltYW4gPG1h
dGhpYXMubnltYW5AbGludXguaW50ZWwuY29tPg0KPiA+IFN1Z2dlc3RlZC1ieTogQWxhbiBTdGVy
biA8c3Rlcm5Acm93bGFuZC5oYXJ2YXJkLmVkdT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhp
cm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+
ID4gICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktaHViLmMgfCA3ICsrKysrLS0NCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLWh1Yi5jIGIvZHJpdmVycy91c2IvaG9zdC94
aGNpLWh1Yi5jDQo+ID4gaW5kZXggMmE5MDIyOS4uN2U5NWY5ZSAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL3VzYi9ob3N0L3hoY2ktaHViLmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3ho
Y2ktaHViLmMNCj4gPiBAQCAtMTIyOSw4ICsxMjI5LDExIEBAIGludCB4aGNpX2h1Yl9jb250cm9s
KHN0cnVjdCB1c2JfaGNkICpoY2QsIHUxNiB0eXBlUmVxLCB1MTYgd1ZhbHVlLA0KPiA+ICAgCQkJ
ICogcG9ydCBsaW5rIHN0YXRlIGFib3ZlICczJyAoVTMpIGFuZCB0aGUgcG9ydA0KPiA+ICAgCQkJ
ICogbXVzdCBiZSBlbmFibGVkLg0KPiA+ICAgCQkJICovDQo+ID4gLQkJCWlmICgodGVtcCAmIFBP
UlRfUEUpID09IDAgfHwNCj4gPiAtCQkJCShsaW5rX3N0YXRlID4gVVNCX1NTX1BPUlRfTFNfVTMp
KSB7DQo+ID4gKwkJCWlmICgodGVtcCAmIFBPUlRfUEUpID09IDApIHsNCj4gPiArCQkJCXJldHZh
bCA9IC1FTk9ERVY7DQo+ID4gKwkJCQlicmVhazsNCj4gPiArCQkJfQ0KPiA+ICsJCQlpZiAobGlu
a19zdGF0ZSA+IFVTQl9TU19QT1JUX0xTX1UzKSB7DQo+ID4gICAJCQkJeGhjaV93YXJuKHhoY2ks
ICJDYW5ub3Qgc2V0IGxpbmsgc3RhdGUuXG4iKTsNCj4gPiAgIAkJCQlnb3RvIGVycm9yOw0KPiA+
ICAgCQkJfQ0KPiA+DQo+IA0KPiBUaGFua3MuDQo+IERpZG4ndCBub3RpY2UgdGhpcyBiZWZvcmUg
d3JpdGluZyBhIHNpbWlsYXIgcGF0Y2guDQo+IEFueXdheSwgSSdsbCBtYWtlIHN1cmUgb25lIG9m
IHRoZW0gZ29lcyBmb3J3YXJkIGFmdGVyIHJjMQ0KDQpJIHRoaW5rIHlvdXIgcGF0Y2ggaXMgYmV0
dGVyIHRoYW4gbXkgcGF0Y2guDQpTbywgSSdsbCB0ZXN0IHlvdXIgcGF0Y2ggbGF0ZXIuDQoNCkJl
c3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gLU1hdGhpYXMNCg==
