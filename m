Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:64830 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751269AbeEDJns (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 May 2018 05:43:48 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] pinctrl: sh-pfc: Add r8a77470 PFC support
Date: Fri, 4 May 2018 09:43:43 +0000
Message-ID: <OSBPR01MB2103497CE105003E909F49F6B8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1524567788-51738-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdWsndFNTVgmzru9Mg0iB5QDGeKS-63=+kZXN0xbbfw7=A@mail.gmail.com>
In-Reply-To: <CAMuHMdWsndFNTVgmzru9Mg0iB5QDGeKS-63=+kZXN0xbbfw7=A@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjJdIHBpbmN0cmw6IHNoLXBmYzogQWRkIHI4YTc3NDcwIFBGQyBzdXBwb3J0DQo+DQo+
IEhpIEJpanUsDQo+DQo+IE9uIFR1ZSwgQXByIDI0LCAyMDE4IGF0IDE6MDMgUE0sIEJpanUgRGFz
IDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWRkIFBGQyBzdXBwb3J0IGZv
ciB0aGUgUjhBNzc0NzAgU29DIGluY2x1ZGluZyBwaW4gZ3JvdXBzIGZvciBzb21lDQo+ID4gb24t
Y2hpcCBkZXZpY2VzIHN1Y2ggYXMgU0NJRiwgQVZCIGFuZCBNTUMuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQt
Ynk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPg0K
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+DQo+ID4gLS0tDQo+ID4gVjEtLT5WMg0KPiA+ICog
SW5jb3JvcG9yYXRlZCB0aGUgZm9sbG93aW5nIHJldmlldyBjb21tZW50cw0KPiA+ICogRml4ZWQg
TU9EX1NFTCB0byBNT0RfU0VMMA0KPiA+ICogQ3JlYXRlZCBzZXBlcmF0ZSBwaW4gZ3JvdXAgZm9y
IEFWQl9DT0wgYW5kIEFWQl9DUlMNCj4gPiAqIEFkZGVkIHRoZSBwaW4gZ3JvdXAgQVZCX0NBUFRV
UkUgYW5kIEFWQl9NQVRDSA0KPiA+ICogQWRkZWQgbWlzc2luZyBTQ0lGIHBpbiBncm91cHMNCj4N
Cj4gSSBiZWxpZXZlIHRoaXMgaXMgdjMsIG5vdCB2Mj8NCg0KWWVzIGl0IGlzIHYzLCAgSSBoYXZl
IHJlYWxpc2VkIHRoaXMgYWZ0ZXIgc2VuZGluZyB0aGUgcGF0Y2guDQoNCj4gUmV2aWV3ZWQtYnk6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+DQo+IEdpdmVu
IHRoZSAodW5maW5pc2hlZCkgZGlzY3Vzc2lvbiBhYm91dCB0aGUgQVZCIHBpbnMsIEknbGwgYXBw
bHkgYW5kIHF1ZXVlDQo+IHlvdXIgcGF0Y2ggaW4gc2gtcGZjLWZvci12NC4xOCB3aXRoIHRoZSBB
VkIgcGluIGdyb3VwcyByZW1vdmVkLg0KDQpJdCBpcyBvayBmb3IgbWUuDQoNClJlZ2FyZHMsDQpC
aWp1DQoNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBMdGQsIER1a2VzIE1lYWRvdywg
TWlsbGJvYXJkIFJvYWQsIEJvdXJuZSBFbmQsIEJ1Y2tpbmdoYW1zaGlyZSwgU0w4IDVGSCwgVUsu
IFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCAmIFdhbGVzIHVuZGVyIFJlZ2lzdGVyZWQgTm8uIDA0NTg2
NzA5Lg0K
