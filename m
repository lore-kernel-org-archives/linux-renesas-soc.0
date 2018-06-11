Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:35611 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932711AbeFKKmN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jun 2018 06:42:13 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] clocksource/drivers/sh_cmt: wait for CMCNT on init
Date: Mon, 11 Jun 2018 10:42:09 +0000
Message-ID: <OSBPR01MB210349939FB878315FD11D1EB8780@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1528474785-11778-1-git-send-email-biju.das@bp.renesas.com>
 <4a274cfd-b5eb-b935-a3b5-af4bacd126c1@cogentembedded.com>
 <OSBPR01MB21038E08CD17E7E071EC381AB8780@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB21038E08CD17E7E071EC381AB8780@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

PiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGNsb2Nrc291cmNlL2RyaXZlcnMvc2hfY210OiB3YWl0
IGZvciBDTUNOVCBvbg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2Uvc2hf
Y210LmMNCj4gPiA+IGIvZHJpdmVycy9jbG9ja3NvdXJjZS9zaF9jbXQuYyBpbmRleCA3MGIzY2Y4
Li40ODkxMGRmIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS9zaF9jbXQu
Yw0KPiA+ID4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS9zaF9jbXQuYw0KPiA+ID4gQEAgLTMy
OCw3ICszMjgsNyBAQCBzdGF0aWMgdm9pZCBzaF9jbXRfc3RhcnRfc3RvcF9jaChzdHJ1Y3QNCj4g
PiA+IHNoX2NtdF9jaGFubmVsICpjaCwgaW50IHN0YXJ0KQ0KPiA+ID4NCj4gPiA+ICAgc3RhdGlj
IGludCBzaF9jbXRfZW5hYmxlKHN0cnVjdCBzaF9jbXRfY2hhbm5lbCAqY2gpDQo+ID4gPiAgIHsN
Cj4gPiA+IC1pbnQgaywgcmV0Ow0KPiA+ID4gK2ludCBqLCBrLCByZXQ7DQo+ID4gPg0KPiA+ID4g
ICBwbV9ydW50aW1lX2dldF9zeW5jKCZjaC0+Y210LT5wZGV2LT5kZXYpOw0KPiA+ID4gICBkZXZf
cG1fc3lzY29yZV9kZXZpY2UoJmNoLT5jbXQtPnBkZXYtPmRldiwgdHJ1ZSk7IEBAIC0zNjgsMTEN
Cj4gPiA+ICszNjgsMTcgQEAgc3RhdGljIGludCBzaF9jbXRfZW5hYmxlKHN0cnVjdCBzaF9jbXRf
Y2hhbm5lbCAqY2gpDQo+ID4gPiAgICAqIFdoaWxlIGF0IGl0LCB3ZSdyZSBzdXBwb3NlZCB0byBj
bGVhciBvdXQgdGhlIENNQ05UIGFzIG9mIHRoaXMNCj4gPiA+ICAgICogbW9tZW50LCBzbyBtYWtl
IHN1cmUgaXQncyBwcm9jZXNzZWQgcHJvcGVybHkgaGVyZS4gIFRoaXMgd2lsbA0KPiA+ID4gICAg
KiB0YWtlIFJDTEt4MiBhdCBtYXhpbXVtLg0KPiA+ID4gKyAqDQo+ID4gPiArICogU2ltaWxhciBy
ZWdpc3RlciBhY2Nlc3MgdXNhZ2UgZm9yIENNQ05UIGlzIG1lbnRpb25lZCBpbiBSLUNhcg0KPiA+
ID4gKyAqIEdlblsyLzNdL1JaL0cxIHVzZXIncyBtYW51YWwsIFJDTEt4MiBmb3IgY210MCBhbmQg
UkNMS3gyIG9yDQo+ID4gPiArICogQ1DPlXgyIChDUEVYz5V4MikpIGZvciBjbXQxLg0KPiA+ID4g
ICAgKi8NCj4gPiA+IC1mb3IgKGsgPSAwOyBrIDwgMTAwOyBrKyspIHsNCj4gPiA+IC1pZiAoIXNo
X2NtdF9yZWFkX2NtY250KGNoKSkNCj4gPiA+IC1icmVhazsNCj4gPiA+IC11ZGVsYXkoMSk7DQo+
ID4gPiArZm9yIChqID0gMDsgaiA8IDI7IGorKykgew0KPiA+ID4gK2ZvciAoayA9IDA7IGsgPCAx
MDA7IGsrKykgew0KPiA+DQo+ID4gICAgIFdoeSBub3Qgc2ltcGx5IGNvdW50IHRvIDIwMCBJU08g
MTAwPz4NCg0KVGhhdCBhbHNvIHdvcmtzLiBJdCBuZWVkcyBkZWxheSBtb3JlIHRoYW4gMTAwLg0K
VGhlIHdvcnN0IGNhc2Ugd2FpdCBpcyBhcm91bmQgMTMwLTE1MCBtaWNyb3NlY29uZHMuDQoNClBy
ZXZpb3VzbHksIEkgaGF2ZSBwdXQgYSBwcmludCBzdGF0ZW1lbnQganVzdCBiZWZvcmUgYnJlYWsg
c3RhdGVtZW50IGR1cmluZyBkZWJ1Z2dpbmcuDQoNCj4gVGhpcyBpc3N1ZSBpcyByZWxhdGVkIHRv
IHNldHRsaW5nIG9mIENNQ05UIHJlZ2lzdGVyIGR1cmluZyBpbml0Lg0KPg0KPiBEdXJpbmcgbXkg
dGVzdGluZywgSSBmb3VuZCB0aGF0IHRoZSBmaXJzdCBsb29wIGV4aXQgaW1tZWRpYXRlbHkgYmVm
b3JlIGFjdHVhbGx5DQo+IHNldHRsaW5nIHRoaXMgcmVnaXN0ZXIgdmFsdWUgdG8gIjAiLiBpZSwg
dGhlIGluc3RhbnRhbmVvdXMgdmFsdWUgb2YgcmVnaXN0ZXINCj4gYmVjb21lcyAiMCIgaW4gdGhl
IGZpcnN0IGNoZWNrIGFuZCBpdCBicmVha3MgdGhlIGZpcnN0IGxvb3AgYW5kIGluIHRoZSBuZXh0
DQo+IGNoZWNrIHJlcG9ydCB0aGUgZXJyb3IuDQo+DQo+IFRoZSBuZXcgbG9naWMgaXMgdG8gZG91
YmxlIGNoZWNrIHRoaXMgcmVnaXN0ZXIgdmFsdWUgYW5kIG1ha2Ugc3VyZSB0aGF0IHRoaXMNCj4g
cmVnaXN0ZXIgdmFsdWUgaXMgc2V0dGxlZCB0byAiMCIsIGJlZm9yZSBzdGFydGluZyB0aGUgdGlt
ZXIgY2hhbm5lbC4NCj4NCj4gUmVnYXJkcywNCj4gQmlqdQ0KDQoNCg0KDQpSZW5lc2FzIEVsZWN0
cm9uaWNzIEV1cm9wZSBMdGQsIER1a2VzIE1lYWRvdywgTWlsbGJvYXJkIFJvYWQsIEJvdXJuZSBF
bmQsIEJ1Y2tpbmdoYW1zaGlyZSwgU0w4IDVGSCwgVUsuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCAm
IFdhbGVzIHVuZGVyIFJlZ2lzdGVyZWQgTm8uIDA0NTg2NzA5Lg0K
