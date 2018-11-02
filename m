Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ty1jpn01on0135.outbound.protection.outlook.com ([104.47.93.135]:6069
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726016AbeKCEI1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Nov 2018 00:08:27 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC] gpio: rcar: Request GPIO before enabling interrupt
Date: Fri, 2 Nov 2018 19:00:04 +0000
Message-ID: <TY1PR01MB177079AA335A6017A66ED183C0CF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1540583850-30825-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CACRpkdahZAKWSPdMk=yp-GrSSAjFAzBijMK1ws3a4KUfzFmzgg@mail.gmail.com>
In-Reply-To: <CACRpkdahZAKWSPdMk=yp-GrSSAjFAzBijMK1ws3a4KUfzFmzgg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gTGludXMsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KSSBhbSBzb3Jy
eSBmb3IgdGhlIGRlbGF5IG9mIG15IGFuc3dlciwgSSB3YXMgaG9waW5nIG90aGVycw0Kd291bGQg
anVtcCBpbiB0aGUgZGlzY3Vzc2lvbiBhcyB3ZWxsLg0KDQo+ID4gKyAgICAgICBlcnIgPSBnYy0+
cmVxdWVzdChnYywgaHdpcnEpOw0KPg0KPiBUaGlzIGlzIGRvbmUgaW4gc29tZSBkcml2ZXJzIHdo
ZW4gd2hhdCB5b3Ugd2FudCBpcyBleGFjdGx5DQo+IHRoZSB3b3JrIGNhcnJpZWQgb3V0IGJ5IHRo
YXQgY2FsbGJhY2suIEJ1dCBjYW4ndCB5b3UganVzdCBjYWxsDQo+IGdwaW9fcmNhcl9yZXF1ZXN0
KCkgZGlyZWN0bHkgaW4gdGhpcyBjYXNlIHNvIGl0IGlzIGNsZWFyIHRoYXQNCj4gdGhlIGRyaXZl
ciBpcyBtZWRkbGluZyB3aXRoIHRoZSBpbnRlcm5hbCBzdGF0ZSBvZiB0aGUgaGFyZHdhcmUNCj4g
YW5kIG5vdCByZWFsbHkgaW50ZW5kaW5nIHRvIGxvb3Agb3V0IGludG8gdGhlIGV4dGVybmFsDQo+
IEFQSSBvciBleHRlcm5hbCBjYWxsYmFja3M/DQoNCmdwaW9fcmNhcl9yZXF1ZXN0IGlzIHN0YXRp
YyB1bmZvcnR1bmF0ZWx5LCBtYXliZSBJIHNob3VsZA0KZXhwb3J0IHRoZSBzeW1ib2w/DQoNCj4N
Cj4gWW91J3JlIG5vdCBvbiBvbmUgb2YgdGhlc2UgcGxhdGZvcm1zIHRoYXQgcHJlZmVyIHNldHRp
bmcgdXANCj4gdGhlIHBpbiBhcyBHUElPIHVzaW5nIGEgcGluIGNvbnRyb2wgaG9nIGluIHRoZSBk
ZXZpY2UgdHJlZT8NCg0KTXkgcGVyc29uYWwgcHJlZmVyZW5jZSB3b3VsZCBiZSB0byBkZWFsIHdp
dGggdGhpcyBmcm9tDQp3aXRoaW4gaXJxY2hpcCwgYXMgd2hlbiB5b3UgaG9vayB1cCBhIGdwaW8g
YXMgaW50ZXJydXB0DQpmcm9tIHRoZSBEVCB0aGUga2VybmVsIHNob3VsZCBkbyBldmVyeXRoaW5n
IHRoYXQncyBuZWNlc3NhcnkNCnRvIG1ha2UgaXQgaGFwcGVuLCBidXQgdGhhdCBpcyBqdXN0IGEg
cGVyc29uYWwgb3Bpbmlvbi4NCkFueXdheSwgSSBkaWQgZ2l2ZSBncGlvLWhvZyBhIHRyeSBhbmQg
aXQgd29ya3MgZm9yIG1lLg0KDQo+DQo+IFNhZGx5IHRoZXJlIGlzIHNvbWV0aW1lcyBtb3JlIHRo
YW4gb25lIHdheSB0byBkbyB0aGluZ3MNCj4gYXJvdW5kIGhlcmUgOi8NCg0Kc28gdHJ1ZQ0KDQo+
DQo+IEdlZXJ0IHdpbGwga25vdyB3aGF0IGlzIGJlc3QuDQoNClllYWgsIEkgYW0gcmVhbGx5IGtl
ZW4gaW4gaGVhcmluZyBmcm9tIGhpbSBhYm91dCB0aGlzLCBpbiB0aGUgbWVhbnRpbWUNCkkgd2Vu
dCB0aHJvdWdoIGEgYnVuY2ggb2YgbWFudWFscywgYW5kIG1vdmluZyB0aGUgZ3BpbyByZXF1ZXN0
IHRvIHRoZQ0KYm90dG9tIG9mIGdwaW9fcmNhcl9pcnFfc2V0X3R5cGUgc2VlbXMgdG8gYmUgb2th
eSBmb3IgUkNhciBkZXZpY2VzIGluDQpnZW5lcmFsLCBidXQgR2VlcnQga25vd3MgZGVmaW5pdGVs
eSBiZXR0ZXIuDQpJJ2xsIHNlbmQgdGhpcyBvdGhlciBvcHRpb24gb3V0IGFzIGEgcGF0Y2ggdGhp
cyB0aW1lLCBob3BpbmcgdG8gZ2V0IG1vcmUNCmZlZWRiYWNrcyBhYm91dCB0aGUgdG9waWMuDQoN
CkFnYWluLCB0aGFuayB5b3UuDQoNCkZhYg0KDQo+DQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlq
DQoNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBMdGQsIER1a2VzIE1lYWRvdywgTWls
bGJvYXJkIFJvYWQsIEJvdXJuZSBFbmQsIEJ1Y2tpbmdoYW1zaGlyZSwgU0w4IDVGSCwgVUsuIFJl
Z2lzdGVyZWQgaW4gRW5nbGFuZCAmIFdhbGVzIHVuZGVyIFJlZ2lzdGVyZWQgTm8uIDA0NTg2NzA5
Lg0K
