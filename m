Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:47560 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729691AbeGMMgr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 08:36:47 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH/RFC] ARM: shmobile: Always enable ARCH_TIMER on SoCs with
 A7 and/or A15
Date: Fri, 13 Jul 2018 12:22:16 +0000
Message-ID: <TY1PR01MB1562D500B559B159DA971B998A580@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180712160857.31471-1-geert+renesas@glider.be>
 <CANqRtoTuofutGtWycNcHq+rPzHqAsjy8ZY0W0k9m_SNWnOajVg@mail.gmail.com>
 <CAMuHMdVsASDbnk-8CtgZu6g5JYCVpj2eF4qFCy7q6bzBr1OEoA@mail.gmail.com>
In-Reply-To: <CAMuHMdVsASDbnk-8CtgZu6g5JYCVpj2eF4qFCy7q6bzBr1OEoA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

T24gRnJpZGF5LCBKdWx5IDEzLCAyMDE4LCBsaW51eC1yZW5lc2FzLXNvYy1vd25lckB2Z2VyLmtl
cm5lbC5vcmcgd3JvdGU6DQo+ID4gRXhhY3RseSB3aGF0IHRoZSBsZXZlbCBvZiBzb2Z0d2FyZSBz
dXBwb3J0IGlzIGF2YWlsYWJsZSBmb3IgdGhlIEFSTQ0KPiA+IHRpbWVycyBhdCB0aGlzIHBvaW50
IEknbSBub3Qgc28gc3VyZSBhYm91dC4NCj4gDQo+IFVzaW5nIHRoZSBUV0QgdGltZXIgaW5kZWVk
IGhhcyB0d28gaXNzdWVzOg0KPiAgIC0gSXQncyBhdmFpbGFibGUgb24gbXVsdGktY29yZSBDb3J0
ZXgtQTkgU29DcyBvbmx5LA0KPiAgIC0gSXRzIGRyaXZlciBkb2VzIG5vdCBjYWxsIHJlZ2lzdGVy
X2N1cnJlbnRfdGltZXJfZGVsYXkoKSwgc28gaXQgZG9lc24ndA0KPiBzZXQNCj4gICAgIHVwIGxw
al9maW5lIGZvciBza2lwcGluZyBsb29wIGNhbGlicmF0aW9uLg0KPiANCj4gVGhlIGdsb2JhbCB0
aW1lciBkcml2ZXIgZG9lcyBjYWxsIHJlZ2lzdGVyX2N1cnJlbnRfdGltZXJfZGVsYXkoKSwgYnV0
IHNvDQo+IGZhciBubw0KPiBSZW5lc2FzIFNvQ3MgZGVzY3JpYmUgaXRzIHByZXNlbmNlIGluIERU
Lg0KPiANCj4gQXQgbGVhc3QgU0gtTW9iaWxlIEFHNSBhbmQgUi1DYXIgTTFBIGFuZCBIMSBzZWVt
IHRvIGhhdmUgaXQuDQo+IFJaL0ExIChhbmQgQTIpIGFuZCBSLU1vYmlsZSBBMSBkb24ndCBzZWVt
IHRvIGhhdmUgaXQsIHRob3VnaC4NCj4gUGVyaGFwcyB0aGUgY2FsbCB0byByZWdpc3Rlcl9jdXJy
ZW50X3RpbWVyX2RlbGF5KCkgY291bGQgYmUgYWRkZWQgdG8NCj4gdGhlIFJaL0EgT1NUTSBkcml2
ZXI/DQoNCkZvciBSWi9BMSwgdGVjaG5pY2FsbHkgeW91IGNvdWxkIHVzZSBNVFUyIG9yIE9TVE0g
YXMgeW91ciBzeXN0ZW0gdGltZXIuIA0KSG93ZXZlciwgbm8gb25lIHdvdWxkIGV2ZXJ5IHVzZSBN
VFUyIGJlY2F1c2UgT1NUTSBpcyB3YXkgbW9yZSBhY2N1cmF0ZS4NCg0KUmVnYXJkbGVzcywgd291
bGQgd2UgYWx3YXlzIGNhbGwgcmVnaXN0ZXJfY3VycmVudF90aW1lcl9kZWxheSgpIGZyb20gdGhl
DQpPU1RNIGRyaXZlcj8NCk5vdGUgdGhhdCB0aGVyZSBhcmUgMiBPU1RNIGNoYW5uZWxzIG9uIFJa
L0ExLiBUaGUgZmlyc3Qgb25lIGlzIGxvYWRlZCBhcw0KYSBjbG9ja3NvdXJjZSwgdGhlIHNlY29u
ZCBpcyB1c2VkIGFzIGFuIGV2ZW50IGNvdW50ZXIuIFdvdWxkIHdlIGNhbGwgDQpyZWdpc3Rlcl9j
dXJyZW50X3RpbWVyX2RlbGF5KCkgZm9yIGJvdGggaW5zdGFuY2VzPw0KDQpDaHJpcw0KDQo=
