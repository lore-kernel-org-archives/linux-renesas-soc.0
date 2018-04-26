Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:22943 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753403AbeDZJed (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 05:34:33 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: Chris Paterson <Chris.Paterson2@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH/RFC v2] ARM: shmobile: defconfig: Enable LPAE
Date: Thu, 26 Apr 2018 09:34:28 +0000
Message-ID: <TY1PR01MB177054B9D9E465A3B7932273C08E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1524672875-14130-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <90afbd8b-462d-8484-74e8-b983a9803fc4@gmail.com>
In-Reply-To: <90afbd8b-462d-8484-74e8-b983a9803fc4@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gRmxvcmlhbiwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0gvUkZDIHYyXSBBUk06IHNobW9iaWxlOiBkZWZjb25maWc6IEVuYWJsZSBM
UEFFDQo+DQo+IE9uIDA0LzI1LzIwMTggMDk6MTQgQU0sIEZhYnJpemlvIENhc3RybyB3cm90ZToN
Cj4gPiBPbiBpV2F2ZSdzIGl3ZzIwbSBERFIxIDUxMk1CIG1lbW9yeSBjYW5ub3QgYmUgYWNjZXNz
ZWQgd2l0aCAzMi1iaXQNCj4gPiBhZGRyZXNzZXMsIGhlbmNlIHdlIG5lZWQgTFBBRS4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5l
c2FzLmNvbT4NCj4gPiAtLS0NCj4gPiBUaGlzIGluZm9ybWF0aW9uIGlzIG1lbnRpb25lZCBpbiB0
aGUgIlJaL0cgU2VyaWVzIFVzZXLigJlzIE1hbnVhbDogSGFyZHdhcmUiLA0KPiA+IENoYXB0ZXIg
MiwgQXJlYSBNYXAuIElzIHRoaXMgcGF0Y2ggZ29pbmcgdG8gYnJlYWsgdGhlIGZ1bmN0aW9uYWxp
dHkgb2Ygb3RoZXINCj4gPiBib2FyZHM/IENvbW1lbnRzIHdlbGNvbWUuDQo+DQo+IExQQUUgaXMg
bm90IHN1cHBvcnRlZCBieSBhbGwgQ29ydGV4LUEgY2xhc3MgY29yZXMsIGZvciBpbnN0YW5jZQ0K
PiBDb3J0ZXgtQTkgZG9lcyBub3Qgc3VwcG9ydCBMUEFFLCBpZiB5b3UgaGF2ZSBib2FyZHMgdXNp
bmcgc3VjaCBjb3JlcywNCj4gdGhlbiB0aGlzIHdvdWxkIHJlc3VsdCBpbiBhIGtlcm5lbCB0aGF0
IHdvdWxkIG5vdCBib290IG9uIHRoZXNlDQo+IHBsYXRmb3Jtcy4gQ2FuIHRoYXQgYmUgYSBwcm9i
bGVtIHdpdGggdGhlIHNobW9iaWxlX2RlZmNvbmZpZz8NCg0KSXQgZGVmaW5pdGVseSBpcywgdGhl
cmVmb3JlIEkgYW0gZ29pbmcgdG8gZHJvcCB0aGlzIHBhdGNoIGFzIGl0IHdvdWxkIGJyZWFrIHRo
aW5ncy4NCg0KQmVzdCByZWdhcmRzLA0KRmFiDQoNCj4gLS0NCj4gRmxvcmlhbg0KDQoNCg0KUmVu
ZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgTHRkLCBEdWtlcyBNZWFkb3csIE1pbGxib2FyZCBSb2Fk
LCBCb3VybmUgRW5kLCBCdWNraW5naGFtc2hpcmUsIFNMOCA1RkgsIFVLLiBSZWdpc3RlcmVkIGlu
IEVuZ2xhbmQgJiBXYWxlcyB1bmRlciBSZWdpc3RlcmVkIE5vLiAwNDU4NjcwOS4NCg==
