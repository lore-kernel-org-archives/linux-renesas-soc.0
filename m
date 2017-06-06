Return-Path: <devicetree-owner@vger.kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 3/4] ARM: dts: iwg20m: Add iWave RZG1M Qseven SOM
Date: Tue, 6 Jun 2017 10:31:38 +0000
Message-ID: <KL1PR06MB17024AD50F89CF891E16A367B8CB0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1496420523-23506-1-git-send-email-biju.das@bp.renesas.com>
 <1496420523-23506-4-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdV8Ugz_kvHLbV7sii-2v1WdHTSFm3meM8faVtx3jBpC+Q@mail.gmail.com>
In-Reply-To: <CAMuHMdV8Ugz_kvHLbV7sii-2v1WdHTSFm3meM8faVtx3jBpC+Q@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DQo+IE9uIEZyaSwgSnVuIDIsIDIwMTcgYXQgNjoyMiBQTSwgQmlqdSBEYXMgPGJpanUuZGFzQGJw
LnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgc3VwcG9ydCBmb3IgaVdhdmUgUlpHMU0gUXNl
dmVuIFN5c3RlbSBPbiBNb2R1bGUuDQo+ID4gaHR0cDovL3d3dy5pd2F2ZXN5c3RlbXMuY29tL3J6
LWcxbS1xc2V2ZW4tbW9kdWxlLmh0bWwNCj4NCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4g
PiBSZXZpZXdlZC1ieTogQ2hyaXMgUGF0ZXJzb24gPGNocmlzLnBhdGVyc29uMkByZW5lc2FzLmNv
bT4NCj4NCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcjhh
Nzc0My1pd2cyMG0uZHRzaQ0KPiA+IEBAIC0wLDAgKzEsMjcgQEANCj4gPiArLyoNCj4gPiArICog
RGV2aWNlIFRyZWUgU291cmNlIGZvciB0aGUgaVdhdmUtUlpHMU0tMjBNIFFzZXZlbiBTT00NCj4g
PiArICoNCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDE3IFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29y
cC4NCj4gPiArICoNCj4gPiArICogVGhpcyBmaWxlIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljDQo+ID4gK0xpY2Vuc2UNCj4gPiArICogdmVyc2lv
biAyLiAgVGhpcyBwcm9ncmFtIGlzIGxpY2Vuc2VkICJhcyBpcyIgd2l0aG91dCBhbnkgd2FycmFu
dHkNCj4gPiArb2YgYW55DQo+ID4gKyAqIGtpbmQsIHdoZXRoZXIgZXhwcmVzcyBvciBpbXBsaWVk
Lg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJyOGE3NzQzLmR0c2kiDQo+ID4gKw0K
PiA+ICsvIHsNCj4NCj4gR2l2ZW4gdGhpcyBpcyBhIHN1Yi1ib2FyZCB3aXRoIG1hbnkgb3RoZXIg
Y29tcG9uZW50cywgSSB0aGluayBpdCBzaG91bGQgaGF2ZQ0KPiBpdHMgb3duIChkb2N1bWVudGVk
KSBjb21wYXRpYmxlIHZhbHVlLCBlLmcuDQo+DQo+ICAgICBjb21wYXRpYmxlID0gIml3YXZlLGcy
MG0iLCAicmVuZXNhcyxyOGE3NzQzIjsNCg0KVGhhbmtzIGZvciB0aGUgaW5wdXQuIEkgd2lsbCBk
b2N1bWVudCB0aGlzIHN5c3RlbSBvbiBtb2R1bGUgYW5kIGFwcGx5IHRoZSBhYm92ZSBjaGFuZ2Uu
DQoNCj4gPiArICAgICAgIG1lbW9yeUA0MDAwMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgIGRl
dmljZV90eXBlID0gIm1lbW9yeSI7DQo+ID4gKyAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4NDAw
MDAwMDAgMCAweDIwMDAwMDAwPjsNCj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAg
bWVtb3J5QDIwMDAwMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gIm1l
bW9yeSI7DQo+ID4gKyAgICAgICAgICAgICAgIHJlZyA9IDwyIDB4MDAwMDAwMDAgMCAweDIwMDAw
MDAwPjsNCj4gPiArICAgICAgIH07DQo+ID4gK307DQo+DQoNCls+XQ0KUmVnYXJkcywNCkJpanUN
Cg0KDQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVhZG93LCBNaWxs
Ym9hcmQgUm9hZCwgQm91cm5lIEVuZCwgQnVja2luZ2hhbXNoaXJlLCBTTDggNUZILCBVSy4gUmVn
aXN0ZXJlZCBpbiBFbmdsYW5kICYgV2FsZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4gMDQ1ODY3MDku
DQo=
