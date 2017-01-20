Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:57303 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752479AbdATQFv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 11:05:51 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/3] mmc: sh_mobile_sdhi: explain clock bindings
Date: Fri, 20 Jan 2017 16:05:45 +0000
Message-ID: <SG2PR06MB1165B5BF4296DB866F3D418B8A710@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170118172502.13876-1-chris.brandt@renesas.com>
 <20170118172502.13876-3-chris.brandt@renesas.com>
 <CAPDyKFq9psGMnKUx+SM_QGt6OKoMHgNFop6ANagtLOLwsMTT8w@mail.gmail.com>
In-Reply-To: <CAPDyKFq9psGMnKUx+SM_QGt6OKoMHgNFop6ANagtLOLwsMTT8w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gVWxmLA0KDQpGcmlkYXksIEphbnVhcnkgMjAsIDIwMTcsIFVsZiBIYW5zc29uIHdyb3Rl
Og0KPiA+ICstIGNsb2NrczogTW9zdCBjb250cm9sbGVycyBvbmx5IGhhdmUgMSBjbG9jayBzb3Vy
Y2UgcGVyIGNoYW5uZWwuDQo+IEhvd2V2ZXIsIHNvbWUNCj4gPiArICAgICAgICAgaGF2ZSBhIHNl
Y29uZCBjbG9jayBkZWRpY2F0ZWQgdG8gY2FyZCBkZXRlY3Rpb24uIElmIDIgY2xvY2tzDQo+IGFy
ZQ0KPiA+ICsgICAgICAgICBzcGVjaWZpZWQsIHlvdSBtdXN0IG5hbWUgdGhlbSBhcyAiY29yZSIg
YW5kICJjZCIuIElmIHRoZQ0KPiBjb250cm9sbGVyDQo+ID4gKyAgICAgICAgIG9ubHkgaGFzIDEg
Y2xvY2ssIG5hbWluZyBpcyBub3QgcmVxdWlyZWQuDQo+IA0KPiBDb3VsZCB5b3UgcGxlYXNlIGVs
YWJvcmF0ZSBhIGJpdCBvbiB0aGUgY2FyZCBkZXRlY3Rpb24gY2xvY2s/DQo+IA0KPiBJIGd1ZXNz
IHRoYXQgdGhlcmUgaXMgc29tZSBraW5kIG9mIGludGVybmFsIGNhcmQgZGV0ZWN0aW9uIGxvZ2lj
IChuYXRpdmUNCj4gY2FyZCBkZXRlY3QpIGluIHRoZSBTREhJIElQLCB3aGljaCByZXF1aXJlcyBh
IHNlcGFyYXRlIGNsb2NrIGZvciBpdCB0bw0KPiB3b3JrPyBQZXJoYXBzIHlvdSBjYW4gc3RhdGUg
dGhhdCBzb21laG93Pw0KDQoNClRoZSByZWFsaXR5IGlzIHRoYXQgdGhlIGNoaXAgZ3V5cyBjdXQg
dXAgdGhlIHN0YW5kYXJkIFNESEkgSVAgdG8gYWRkIGENCidjb29sIG5ldyBmZWF0dXJlJywgYnV0
IGFsbCBJIHdhbnQgdG8gZG8gaXMgcHV0IGl0IGJhY2sgdGhlIHdheSBpdCB3YXMuDQoNCk5PVEU6
IFRoZSBkZXNpZ24gZ3V5cyBsaWtlIHRvIHJldXNlIElQIGJsb2NrcyBmcm9tIHByZXZpb3VzIGRl
c2lnbnMgdGhhdCB0aGV5DQprbm93IHdvcmtlZCBhbmQgZGlkbid0IGhhdmUgYnVncy4gU28sIHRo
ZXJlIGlzIGEgZ29vZCBjaGFuY2UgeW91IHdpbGwgc2VlIHRoaXMNCmNoYW5nZSBpbiBmdXR1cmUg
UlovQSBkZXZpY2VzIChvciBldmVuIG90aGVyIGZ1dHVyZSBSZW5lc2FzIFNvQyBkZXZpY2VzKS4N
ClRvIHJlbW92ZSBhbiB1bndhbnRlZCBmZWF0dXJlIGFkZHMgYWRkaXRpb25hbCBkZXNpZ24gcmlz
ayBvZiBicmVha2luZw0Kc29tZXRoaW5nIGVsc2UuLi4uYW5kIGdpdmVuIHRoZSBjb3N0IG9mIHJl
ZG9pbmcgc2lsaWNvbiBtYXNrIGxheWVycy4uLm5vDQplbmdpbmVlciB3YW50cyB0aGF0IG1pc3Rh
a2Ugb24gdGhlaXIgaGFuZHMuDQoNCg0KDQo+ID4gK0V4YW1wbGUgc2hvd2luZyAyIGNsb2NrczoN
Cj4gPiArICAgICAgIHNkaGkwOiBzZEBlODA0ZTAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAicmVuZXNhcyxzZGhpLXI3czcyMTAwIjsNCj4gPiArICAgICAgICAgICAgICAg
cmVnID0gPDB4ZTgwNGUwMDAgMHgxMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICBpbnRlcnJ1cHRz
ID0gPEdJQ19TUEkgMjcwIElSUV9UWVBFX0xFVkVMX0hJR0gNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBHSUNfU1BJIDI3MSBJUlFfVFlQRV9MRVZFTF9ISUdIDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgR0lDX1NQSSAyNzIgSVJRX1RZUEVfTEVWRUxfSElHSD47
DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBjbG9ja3MgPSA8Jm1zdHAxMl9jbGtzIFI3Uzcy
MTAwX0NMS19TREhJMDA+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8Jm1zdHAxMl9j
bGtzIFI3UzcyMTAwX0NMS19TREhJMDE+Ow0KPiA+ICsgICAgICAgICAgICAgICBjbG9jay1uYW1l
cyA9ICJjb3JlIiwgImNkIjsNCj4gPiArICAgICAgICAgICAgICAgY2FwLXNkLWhpZ2hzcGVlZDsN
Cj4gPiArICAgICAgICAgICAgICAgY2FwLXNkaW8taXJxOw0KPiA+ICsgICAgICAgICAgICAgICBz
dGF0dXMgPSAiZGlzYWJsZWQiOw0KPiANCj4gVGhlIGxhc3QgbGluZSBzZWVtcyBhIGJpdCBvZGQg
dG8gaW5jbHVkZSBpbiBhbiBleGFtcGxlLg0KDQpZb3UncmUgcmlnaHQuIEknbGwgdGFrZSB0aGF0
IG91dC4NCg0KVGhhbmtzLA0KQ2hyaXMNCg==
