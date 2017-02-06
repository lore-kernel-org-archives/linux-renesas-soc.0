Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:19695 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751372AbdBFQCg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Feb 2017 11:02:36 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] ARM: shmobile: r7s72100: Enable L2 cache
Date: Mon, 6 Feb 2017 16:02:30 +0000
Message-ID: <SG2PR06MB1165CCD49259621136C4517C8A400@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170202212000.10768-1-chris.brandt@renesas.com>
 <CAMuHMdU6kJDxGtjUT1S2JkQTLvzrgtF3mkqa5Xo08oF6d3tUbw@mail.gmail.com>
 <SG2PR06MB11657125A12CC1BDE6AD17748A400@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdW0-KPEKS5wFRK7aRKwvvUcjQDa7Rmo0cDDwnfGAAmJ5w@mail.gmail.com>
In-Reply-To: <CAMuHMdW0-KPEKS5wFRK7aRKwvvUcjQDa7Rmo0cDDwnfGAAmJ5w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIE1vbmRheSwgRmVicnVhcnkgMDYsIDIwMTcsIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToNCj4gPiBJIGFncmVlIHRoYXQgZmFraW5nIG91dCBhIHNlY3VyZSB3cml0ZSBm
dW5jdGlvbiBqdXN0IHNvIHRoZSBmaWxsLXplcm9zDQo+ID4gc2lkZWJhbmQgZmVhdHVyZSBpcyBu
b3QgZW5hYmxlZCBpcyBhIGJpdCBvZiBhIGhhY2ssIGJ1dCBJJ20gbm90IHN1cmUNCj4gPiBpZiBt
b2RpZnlpbmcgdGhlIGNhY2hlLWwyeDAuYyB3YXMgYW4gb3B0aW9uLg0KPiANCj4gR2l2ZW4gSSd2
ZSBhZGRlZCAiYXJtLHNoYXJlZC1vdmVycmlkZSIgaW4gdGhlIHBhc3QsIEknZCBzYXkgeWVzIDst
KQ0KPiANCj4gPiBJZiB5b3UgdGhpbmsgc28sIEkgY2FuIHRyeSB0aGUgImFybSxwbDMxMC1uby1z
aWRlYmFuZCIgcGF0aCBmaXJzdCwgYW5kDQo+ID4gaWYgdGhhdCBkb2Vzbid0IGdldCBpbiBJIGNh
biBmYWxsIGJhY2sgdG8gd2hhdCBJJ20gZG9pbmcgbm93Lg0KPiA+DQo+ID4gVGhvdWdodHM/Pz8N
Cj4gDQo+IEFjY29yZGluZyB0byB0aGUgIkNvcmVMaW5rIExldmVsIDIgQ2FjaGUgQ29udHJvbGxl
ciBMMkMtMzEwIiBUUk0sICJubw0KPiBzaWRlYmFuZCBzaWduYWxzIiBpcyBldmVuIHRoZSBkZWZh
dWx0IGNvbmZpZ3VyYXRpb24/DQoNCkdvb2QgcG9pbnQuIFNvIHRlY2huaWNhbGx5IHRoZXJlIGlz
IG5vdGhpbmcgImlsbGVnYWwiIGFib3V0IGhvb2tpbmcgdXANCm9ubHkgdGhlIEFYSSBpbnRlcmZh
Y2UgYW5kIG5vdCB0aGUgc2lkZWJhbmQgc2lnbmFscy4NCg0KSSBndWVzcyB0aGF0IGFsc28gbWVh
bnMgdGhpbmdzIGxpa2UgIkVhcmx5IEJSRVNQIEVuYWJsZSIgYXJlIG5vdCByZWFsbHkNCmdvaW5n
IHRvIHdvcmsgZWl0aGVyLg0KT2YgY291cnNlIHlvdSdsbCBzdGlsbCBzZWUgIkwyQy0zMTAgZW5h
YmxpbmcgZWFybHkgQlJFU1AgZm9yIENvcnRleC1BOSINCnByaW50ZWQgb3V0IG9uIGJvb3QsIHdo
aWNoIGlzIHRydWUgYmVjYXVzZSBpdCB3YXMgZW5hYmxlZCBpbiB0aGUgUEwzMTAsDQpidXQgaW4g
cmVhbGl0eSBpdCB3aWxsIG5ldmVyIGdldCB1c2VkLg0KRmFsc2UgaG9wZSA6KA0KDQoNCkF0IGZp
cnN0IEknbGwgcHV0IHRvZ2V0aGVyIGEgcGF0Y2gganVzdCBmb3IgRnVsbCBsaW5lIG9mIHplcm8g
d3JpdGUgc2luY2UNCnRoYXQgb25lIGNoYW5nZXMgdGhlIGJlaGF2aW9yIG9mIHRoZSBDQTkuLi4u
YW5kIHdpbGwgYnJlYWsgYSBzeXN0ZW0uDQoNCg0KVGhhbmtzLA0KQ2hyaXMNCg0K
