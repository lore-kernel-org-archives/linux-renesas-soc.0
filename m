Return-Path: <devicetree-owner@vger.kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 10/12] ARM: dts: iwg23s-sbc: Add support for iWave
 G23S-SBC based on RZ/G1C
Date: Wed, 28 Mar 2018 13:13:53 +0000
Message-ID: <OSBPR01MB210354AFAFCD7D1AF4FB5EF6B8A30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
 <1522161443-54428-11-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUWB8=hByJsoZhT1=7QncFexKgZQFiNaUPZrkzGgB-=tg@mail.gmail.com>
In-Reply-To: <CAMuHMdUWB8=hByJsoZhT1=7QncFexKgZQFiNaUPZrkzGgB-=tg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IE9uIFR1ZSwgTWFyIDI3
LCAyMDE4IGF0IDQ6MzcgUE0sIEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4gd3Jv
dGU6DQo+ID4gQWRkIHN1cHBvcnQgZm9yIGlXYXZlIGlXLVJhaW5ib1ctRzIzUyBzaW5nbGUgYm9h
cmQgY29tcHV0ZXIgYmFzZWQgb24NCj4gPiBSWi9HMUMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEZh
YnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPg0KPiBUaGFu
a3MgZm9yIHlvdXIgcGF0Y2ghDQo+DQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPg0KPiBPbmUgcXVlc3Rpb24gYmVsb3cuDQo+DQo+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDcwLWl3
ZzIzcy1zYmMuZHRzDQo+ID4gQEAgLTAsMCArMSwzMCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICsvKg0KPiA+ICsgKiBEZXZpY2UgVHJlZSBTb3VyY2Ug
Zm9yIHRoZSBpV2F2ZS1SWi9HMUMgc2luZ2xlIGJvYXJkIGNvbXB1dGVyDQo+ID4gKyAqDQo+ID4g
KyAqIENvcHlyaWdodCAoQykgMjAxOCBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAuDQo+ID4gKyAq
Lw0KPiA+ICsNCj4gPiArL2R0cy12MS87DQo+ID4gKyNpbmNsdWRlICJyOGE3NzQ3MC5kdHNpIg0K
PiA+ICsvIHsNCj4gPiArICAgICAgIG1vZGVsID0gImlXYXZlIGlXLVJhaW5ib1ctRzIzUyBzaW5n
bGUgYm9hcmQgY29tcHV0ZXIgYmFzZWQgb24NCj4gUlovRzFDIjsNCj4gPiArICAgICAgIGNvbXBh
dGlibGUgPSAiaXdhdmUsZzIzcyIsICJyZW5lc2FzLHI4YTc3NDcwIjsNCj4gPiArDQo+ID4gKyAg
ICAgICBhbGlhc2VzIHsNCj4gPiArICAgICAgICAgICAgICAgc2VyaWFsMSA9ICZzY2lmMTsNCj4g
PiArICAgICAgIH07DQo+DQo+IE5vIGNob3NlbiAvIHN0ZG91dC1wYXRoPw0KDQpJIGFtIHBsYW5u
aW5nIHRoaXMgbGF0ZXIgYXMgcGFydCBvZiBldGhlcm5ldCBwYXRjaCBzdWJtaXNzaW9uLg0KDQoN
Cg0KDQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVhZG93LCBNaWxs
Ym9hcmQgUm9hZCwgQm91cm5lIEVuZCwgQnVja2luZ2hhbXNoaXJlLCBTTDggNUZILCBVSy4gUmVn
aXN0ZXJlZCBpbiBFbmdsYW5kICYgV2FsZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4gMDQ1ODY3MDku
DQo=
