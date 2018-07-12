Return-Path: <devicetree-owner@vger.kernel.org>
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt: serial: Add Renesas RZ/N1 binding documentation
Date: Thu, 12 Jul 2018 12:05:21 +0000
Message-ID: <TY1PR01MB1769F2878EB466D0A1BB4268F5590@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <1531312174-17489-1-git-send-email-phil.edworthy@renesas.com>
 <1531312174-17489-2-git-send-email-phil.edworthy@renesas.com>
 <CAMuHMdU6-vKAfbd-pf9jXrrFFbSANHckGGQnkHsXabQsCvFFNg@mail.gmail.com>
In-Reply-To: <CAMuHMdU6-vKAfbd-pf9jXrrFFbSANHckGGQnkHsXabQsCvFFNg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIDExIEp1bHkgMjAxOCAxMzozOSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOg0KPiBPbiBXZWQsIEp1bCAxMSwgMjAxOCBhdCAyOjMwIFBNIFBoaWwgRWR3b3J0aHkgd3Jv
dGU6DQo+ID4gVGhlIFJaL04xIFVBUlQgaXMgYSBtb2RpZmllZCBTeW5vcHN5cyBEZXNpZ25XYXJl
IFVBUlQuDQo+ID4gVGhlIG1vZGlmaWNhdGlvbnMgb25seSByZWxhdGUgdG8gRE1BIHNvIHlvdSBj
b3VsZCBhY3R1YWxseSB1c2UgdGhlDQo+ID4gY29udHJvbGxlciB3aXRoIHRoZSBTeW5vcHN5cyBj
b21wYXRpYmxlIHN0cmluZyBpZiB5b3UgYXJlIG5vdCB1c2luZw0KPiA+IERNQSwgYnV0IHlvdSBz
aG91bGQgbm90IGRvIHNvLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGhpbCBFZHdvcnRoeSA8
cGhpbC5lZHdvcnRoeUByZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEN
Cj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxyem4xLXVhcnQudHh0DQo+ID4gQEAgLTAsMCArMSwx
MCBAQA0KPiA+ICtSZW5lc2FzIFJaL04xIFVBUlQNCj4gPiArDQo+ID4gK1RoaXMgY29udHJvbGxl
ciBpcyBiYXNlZCBvbiB0aGUgU3lub3BzeXMgRGVzaWduV2FyZSBBQlAgVUFSVCBhbmQNCj4gPiAr
aW5oZXJpdHMgYWxsIHByb3BlcnRpZXMgZGVmaW5lZCBpbiBzbnBzLWR3LWFwYi11YXJ0LnR4dCBl
eGNlcHQgZm9yIHRoZQ0KPiBjb21wYXRpYmxlIHByb3BlcnR5Lg0KPiA+ICsNCj4gPiArUmVxdWly
ZWQgcHJvcGVydGllczoNCj4gPiArLSBjb21wYXRpYmxlIDogVGhlIGRldmljZSBzcGVjaWZpYyBz
dHJpbmcgZm9sbG93ZWQgYnkgdGhlIGdlbmVyaWMgUlovTjENCj4gc3RyaW5nLg0KPiA+ICsgICBU
aGVyZWZvcmUgaXQgbXVzdCBiZSBvbmUgb2Y6DQo+ID4gKyAgICJyZW5lc2FzLHVhcnQtcjlhMDZn
MDMyIiwgInJlbmVzYXMsdWFydC1yem4xIg0KPiANCj4gInJlbmVzYXMscjlhMDZnMDMyLXVhcnQi
LCAicmVuZXNhcyxyem4xLXVhcnQiDQo+IA0KPiA+ICsgICAicmVuZXNhcyx1YXJ0LXI5YTA2ZzAz
MyIsICJyZW5lc2FzLHVhcnQtcnpuMSINCj4gDQo+ICJyZW5lc2FzLHI5YTA2ZzAzMy11YXJ0Iiwg
InJlbmVzYXMscnpuMS11YXJ0Ig0KSSBmb2xsb3dlZCB0aGUgcmVuZXNhcyBjb252ZW50aW9uIG9m
IHJlbmVzYXMscGVyaXBoZXJhbC1kZXZpY2UgdGhhdCBpcyB1c2VkIGZvcg0KbW9zdCBSLUNhciBk
cml2ZXJzLCBidXQgaGFwcHkgdG8gY2hhbmdlLg0KDQo+IEkgYXNzdW1lIHlvdSBwbGFuIHRvIGRl
c2NyaWJlIHRoZSBETUEtcmVsYXRlZCBwcm9wZXJ0aWVzIGxhdGVyPw0KWWVzLCBpdCB3aWxsIHRh
a2UgYSB3aGlsZSB0byBzb3J0IG91dC4NCg0KVGhhbmtzDQpQaGlsDQo=
