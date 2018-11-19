Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr140100.outbound.protection.outlook.com ([40.107.14.100]:28686
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725898AbeKTHzC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 02:55:02 -0500
From: Peter Rosin <peda@axentia.se>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>
CC: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3] drm/bridge/sii902x: Add missing dependency on I2C_MUX
Date: Mon, 19 Nov 2018 21:29:23 +0000
Message-ID: <4c59a292-40bf-7542-b32f-648834440fac@axentia.se>
References: <1542633978-22064-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1542633978-22064-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <24C196A31ABA1B4F916E5FD0E43D3B06@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

T24gMjAxOC0xMS0xOSAxNDoyNiwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiBrYnVpbGQgdGVz
dCByb2JvdCByZXBvcnRzOg0KPiANCj4+PiBFUlJPUjogImkyY19tdXhfYWRkX2FkYXB0ZXIiIFtk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMngua29dDQo+IHVuZGVmaW5lZCENCj4+PiBFUlJP
UjogImkyY19tdXhfYWxsb2MiIFtkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMngua29dDQo+
IHVuZGVmaW5lZCENCj4+PiBFUlJPUjogImkyY19tdXhfZGVsX2FkYXB0ZXJzIiBbZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmtvXQ0KPiB1bmRlZmluZWQhDQoNCkhpIQ0KDQpNeSBwcmVm
ZXJlbmNlIHdvdWxkIGJlIHRvIG5vdCB3cmFwIHRoZSBxdW90ZWQgdGV4dC4gVG8gaGVsbCB3aXRo
DQp3YXJuaW5ncyBhYm91dCBsb25nIGxpbmVzIGZvciBjYXNlcyBsaWtlIHRoaXMuIEhvd2V2ZXIs
IEknbSBub3QNCmdvaW5nIHRvIHJlcXVpcmUgYSBuZXcgaXRlcmF0aW9uIGZvciB0aGF0IGRldGFp
bCwgYnV0IGtlZXAgdGhhdA0KaW4gbWluZCBmb3IgdGhlIG5leHQgcGF0Y2ggb3IgaWYgeW91IGVu
ZCB1cCByZXNlbmRpbmcgZm9yIHNvbWUNCnVucmVsYXRlZCByZWFzb24uDQoNCj4gDQo+IFF1aXRl
IG9idmlvdXNseSB0aGUgZHJpdmVyIGRlcGVuZHMgb24gSTJDX01VWCwgYnV0IGFkZGluZyBhICJk
ZXBlbmRzIG9uIg0KPiBpbnRyb2R1Y2VzIGEgcmVjdXJzaXZlIGRlcGVuZGVuY3ksIHRoZXJlZm9y
ZSB0aGlzIHBhdGNoIHNlbGVjdHMgSTJDX01VWA0KPiBpbnN0ZWFkLg0KDQpUaGlzIGRyaXZlciB3
aWxsIG5vdCBiZSB0aGUgZmlyc3QgdG8gc2VsZWN0IEkyQ19NVVguIFNvLCBldmVuIGlmIGl0DQpp
dCBpcyBhIGJpdCB1bnRpZHkgdG8gc2VsZWN0IHN0dWZmIHRoYXQgaXMgYWxzbyBzZWxlY3RhYmxl
IGJ5IHRoZQ0KdXNlci4uLg0KDQpBY2tlZC1ieTogUGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5z
ZT4NCg0KPiANCj4gRml4ZXM6IDIxZDgwODQwNWZlNCAoImRybS9icmlkZ2Uvc2lpOTAyeDogRml4
IEVESUQgcmVhZGJhY2siKQ0KPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJp
emlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gTGluazogaHR0cHM6Ly9saXN0cy4wMS5vcmcv
cGlwZXJtYWlsL2tidWlsZC1hbGwvMjAxOC1Ob3ZlbWJlci8wNTQ5MjQuaHRtbA0KPiAtLS0NCj4g
djItPnYzOg0KPiAqIENoYW5nZWQgdGhlIHRpdGxlDQo+IA0KPiB2MS0+djI6DQo+ICogQWRkZWQg
IkZpeGVzIiB0YWcNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgfCAxICsN
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2Nv
bmZpZw0KPiBpbmRleCA5ZWViOGVmLi4yZmVlNDdiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29u
ZmlnDQo+IEBAIC05NSw2ICs5NSw3IEBAIGNvbmZpZyBEUk1fU0lJOTAyWA0KPiAgCWRlcGVuZHMg
b24gT0YNCj4gIAlzZWxlY3QgRFJNX0tNU19IRUxQRVINCj4gIAlzZWxlY3QgUkVHTUFQX0kyQw0K
PiArCXNlbGVjdCBJMkNfTVVYDQo+ICAJLS0taGVscC0tLQ0KPiAgCSAgU2lsaWNvbiBJbWFnZSBz
aWk5MDJ4IGJyaWRnZSBjaGlwIGRyaXZlci4NCj4gIA0KPiANCg0K
