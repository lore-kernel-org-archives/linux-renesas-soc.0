Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:11663 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752237AbeC1NzR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Mar 2018 09:55:17 -0400
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
Date: Wed, 28 Mar 2018 13:55:12 +0000
Message-ID: <OSBPR01MB21033FDFC31C3F6B66C44B18B8A30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
 <1522161443-54428-11-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUWB8=hByJsoZhT1=7QncFexKgZQFiNaUPZrkzGgB-=tg@mail.gmail.com>
 <OSBPR01MB210354AFAFCD7D1AF4FB5EF6B8A30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdXtp0JGuuoJ_m0MoEbwBFP5yC6q-vidjxNY73=0S4sp+w@mail.gmail.com>
In-Reply-To: <CAMuHMdXtp0JGuuoJ_m0MoEbwBFP5yC6q-vidjxNY73=0S4sp+w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IEhpIEJpanUsDQo+DQo+
IE9uIFdlZCwgTWFyIDI4LCAyMDE4IGF0IDM6MTMgUE0sIEJpanUgRGFzIDxiaWp1LmRhc0BicC5y
ZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4+IE9uIFR1ZSwgTWFyIDI3LCAyMDE4IGF0IDQ6MzcgUE0s
IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4+ID4gQWRk
IHN1cHBvcnQgZm9yIGlXYXZlIGlXLVJhaW5ib1ctRzIzUyBzaW5nbGUgYm9hcmQgY29tcHV0ZXIg
YmFzZWQNCj4gPj4gPiBvbiBSWi9HMUMuDQo+ID4+ID4NCj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+ID4+ID4gUmV2aWV3ZWQtYnk6IEZh
YnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+Pg0KPiA+
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4+DQo+ID4+IFJldmlld2VkLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+Pg0KPiA+PiBPbmUgcXVl
c3Rpb24gYmVsb3cuDQo+ID4+DQo+ID4+ID4gLS0tIC9kZXYvbnVsbA0KPiA+PiA+ICsrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDcwLWl3ZzIzcy1zYmMuZHRzDQo+ID4+ID4gQEAgLTAsMCAr
MSwzMCBAQA0KPiA+PiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+
PiA+ICsvKg0KPiA+PiA+ICsgKiBEZXZpY2UgVHJlZSBTb3VyY2UgZm9yIHRoZSBpV2F2ZS1SWi9H
MUMgc2luZ2xlIGJvYXJkIGNvbXB1dGVyDQo+ID4+ID4gKyAqDQo+ID4+ID4gKyAqIENvcHlyaWdo
dCAoQykgMjAxOCBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAuDQo+ID4+ID4gKyAqLw0KPiA+PiA+
ICsNCj4gPj4gPiArL2R0cy12MS87DQo+ID4+ID4gKyNpbmNsdWRlICJyOGE3NzQ3MC5kdHNpIg0K
PiA+PiA+ICsvIHsNCj4gPj4gPiArICAgICAgIG1vZGVsID0gImlXYXZlIGlXLVJhaW5ib1ctRzIz
UyBzaW5nbGUgYm9hcmQgY29tcHV0ZXIgYmFzZWQNCj4gPj4gPiArb24NCj4gPj4gUlovRzFDIjsN
Cj4gPj4gPiArICAgICAgIGNvbXBhdGlibGUgPSAiaXdhdmUsZzIzcyIsICJyZW5lc2FzLHI4YTc3
NDcwIjsNCj4gPj4gPiArDQo+ID4+ID4gKyAgICAgICBhbGlhc2VzIHsNCj4gPj4gPiArICAgICAg
ICAgICAgICAgc2VyaWFsMSA9ICZzY2lmMTsNCj4gPj4gPiArICAgICAgIH07DQo+ID4+DQo+ID4+
IE5vIGNob3NlbiAvIHN0ZG91dC1wYXRoPw0KPiA+DQo+ID4gSSBhbSBwbGFubmluZyB0aGlzIGxh
dGVyIGFzIHBhcnQgb2YgZXRoZXJuZXQgcGF0Y2ggc3VibWlzc2lvbi4NCj4NCj4gQnV0IHN0ZG91
dC1wYXRoIGlzIG5vdCByZWxhdGVkIHRvIEV0aGVybmV0Pw0KDQpPay4gV2lsbCBhZGQgc3Rkb3V0
LXBhdGggaW4gVjIuDQoNCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+DQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0DQo+DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+
DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hlbg0KPiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQoNCg0KDQpSZW5l
c2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBMdGQsIER1a2VzIE1lYWRvdywgTWlsbGJvYXJkIFJvYWQs
IEJvdXJuZSBFbmQsIEJ1Y2tpbmdoYW1zaGlyZSwgU0w4IDVGSCwgVUsuIFJlZ2lzdGVyZWQgaW4g
RW5nbGFuZCAmIFdhbGVzIHVuZGVyIFJlZ2lzdGVyZWQgTm8uIDA0NTg2NzA5Lg0K
