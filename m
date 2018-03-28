Return-Path: <devicetree-owner@vger.kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 08/12] ARM: dts: r8a77470: Initial SoC device tree
Date: Wed, 28 Mar 2018 13:16:06 +0000
Message-ID: <OSBPR01MB210391B03FC3FE0A8552547BB8A30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
 <1522161443-54428-9-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVdRKpRXhd=0W3hVRt9MD0NVwBpoYa7dsZ+DAEn=sHD-A@mail.gmail.com>
In-Reply-To: <CAMuHMdVdRKpRXhd=0W3hVRt9MD0NVwBpoYa7dsZ+DAEn=sHD-A@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IE9uIFR1ZSwgTWFyIDI3
LCAyMDE4IGF0IDQ6MzcgUE0sIEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4gd3Jv
dGU6DQo+ID4gVGhlIGluaXRpYWwgUjhBNzc0NzAgU29DIGRldmljZSB0cmVlIGluY2x1ZGluZyBD
UFUwLCBHSUMsIHRpbWVyLCBTWVNDLA0KPiA+IFJTVCwgQ1BHLCBhbmQgdGhlIHJlcXVpcmVkIGNs
b2NrIGRlc2NyaXB0aW9ucy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1
LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogRmFicml6aW8gQ2FzdHJvIDxm
YWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRj
aCENCj4NCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcjhh
Nzc0NzAuZHRzaQ0KPiA+IEBAIC0wLDAgKzEsMTU2IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKy8qDQo+ID4gKyAqIERldmljZSBUcmVlIFNvdXJjZSBm
b3IgdGhlIHI4YTc3NDcwIFNvQw0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTgg
UmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4NCj4gPiArI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gPiArI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3I4YTc3NDd4LWNwZy1tc3NyLmg+DQo+ID4gKyNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9wb3dlci9yOGE3NzQ3eC1zeXNjLmg+DQo+DQo+IEl0IGlzIGJldHRlciB0
byB1c2UgbnVtZXJpY2FsIHZhbHVlcyBmb3IgdGhlIGluaXRpYWwgc3VibWlzc2lvbiwgYXMgdGhl
IGR0LWJpbmRpbmdzDQo+IGhlYWRlcnMgYW5kIHRoZSBEVFMgZmlsZXMgZ28gdXBzdHJlYW0gdGhy
b3VnaCBkaWZmZXJlbnQgbWFpbnRhaW5lciBwYXRocy4NCj4NCj4gPiArLyB7DQo+ID4gKyAgICAg
ICBjb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc0NzAiOw0KPg0KPiA+ICsgICAgICAgc29jIHsN
Cj4NCj4gPiArICAgICAgICAgICAgICAgaWNyYW0yOiBzcmFtQGU2MzAwMDAwIHsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1taW8tc3JhbSI7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHhlNjMwMDAwMCAwIDB4NDAwMDA+Ow0KPg0KPiBT
aXplIHNob3VsZCBiZSAweDIwMDAwIChoYWxmIG9mIG90aGVyIG1lbWJlcnMgaW4gdGhlIFJaL0cx
IGZhbWlseSk/DQoNClllcywgeW91IGFyZSBjb3JyZWN0LiBXaWxsIGJlIGZpeGVkIGluIFYyLg0K
DQo+IFdpdGggdGhlIGFib3ZlIGZpeGVkOg0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4NCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+DQo+IC0tDQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtDQo+IG02OGsub3JnDQo+DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hlbg0KPiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzDQoNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBMdGQsIER1a2VzIE1lYWRv
dywgTWlsbGJvYXJkIFJvYWQsIEJvdXJuZSBFbmQsIEJ1Y2tpbmdoYW1zaGlyZSwgU0w4IDVGSCwg
VUsuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCAmIFdhbGVzIHVuZGVyIFJlZ2lzdGVyZWQgTm8uIDA0
NTg2NzA5Lg0K
