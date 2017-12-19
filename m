Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:19037 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751520AbdLSLhl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Dec 2017 06:37:41 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "Biju Das" <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2 2/4] ARM: dts: r8a7745: Add PWM SoC support
Date: Tue, 19 Dec 2017 11:37:35 +0000
Message-ID: <TY1PR06MB0895EEB655C7E4830DCFA47FC00F0@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1513620411-17478-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513620411-17478-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUi953N1J+vfJWJo0GMKO4tBZV9HnX7haG0fvyNHfOvOA@mail.gmail.com>
In-Reply-To: <CAMuHMdUi953N1J+vfJWJo0GMKO4tBZV9HnX7haG0fvyNHfOvOA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzRdIEFSTTogZHRzOiBy
OGE3NzQ1OiBBZGQgUFdNIFNvQyBzdXBwb3J0DQo+DQo+IE9uIE1vbiwgRGVjIDE4LCAyMDE3IGF0
IDc6MDYgUE0sIEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiBBZGQgdGhlIGRlZmluaXRpb25zIGZvciBwd21bMDEyMzQ1Nl0gdG8g
dGhlIFNvQyAuZHRzaS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8
ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+DQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPg0KPiA+IC0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3I4YTc3NDUuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3
NDUuZHRzaQ0KPiA+IEBAIC05NjgsNiArOTY4LDgzIEBADQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiAgICAgICAgICAgICAgICAgfTsNCj4gPg0K
PiA+ICsgICAgICAgICAgICAgICBwd20wOiBwd21AZTZlMzAwMDAgew0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxwd20tcjhhNzc0NSIsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZW5lc2FzLHB3bS1yY2FyIjsNCj4N
Cj4gSSB0aGluayB0aGlzIGNhbiBmaXQgb24gb25lIGxpbmUuDQoNCmRvIHlvdSB0aGluayB0aGlz
IGRlc2VydmVzIGEgdjM/DQoNClRoYW5rcywNCkZhYg0KDQo+DQo+IEdye29ldGplLGVldGluZ31z
LA0KPg0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPg0KPiAtLQ0KPiBHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnDQo+DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzDQoNCg0KW2h0dHBzOi8vd3d3Mi5yZW5lc2FzLmV1L21lZGlhL2VtYWlsL3VuaWNlZl8y
MDE3LmpwZ10NCg0KVGhpcyBDaHJpc3RtYXMsIGluc3RlYWQgb2Ygc2VuZGluZyBvdXQgY2FyZHMs
IFJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIGhhdmUgZGVjaWRlZCB0byBzdXBwb3J0IFVuaWNl
ZiB3aXRoIGEgZG9uYXRpb24uIEZvciBmdXJ0aGVyIGRldGFpbHMgY2xpY2sgaGVyZTxodHRwczov
L3d3dy51bmljZWYub3JnLz4gdG8gZmluZCBvdXQgYWJvdXQgdGhlIHZhbHVhYmxlIHdvcmsgdGhl
eSBkbywgaGVscGluZyBjaGlsZHJlbiBhbGwgb3ZlciB0aGUgd29ybGQuDQpXZSB3b3VsZCBsaWtl
IHRvIHRha2UgdGhpcyBvcHBvcnR1bml0eSB0byB3aXNoIHlvdSBhIE1lcnJ5IENocmlzdG1hcyBh
bmQgYSBwcm9zcGVyb3VzIE5ldyBZZWFyLg0KDQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJv
cGUgTHRkLCBEdWtlcyBNZWFkb3csIE1pbGxib2FyZCBSb2FkLCBCb3VybmUgRW5kLCBCdWNraW5n
aGFtc2hpcmUsIFNMOCA1RkgsIFVLLiBSZWdpc3RlcmVkIGluIEVuZ2xhbmQgJiBXYWxlcyB1bmRl
ciBSZWdpc3RlcmVkIE5vLiAwNDU4NjcwOS4NCg==
