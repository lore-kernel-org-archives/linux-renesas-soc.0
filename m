Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:32114 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755963AbdLOJsY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 04:48:24 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "Biju Das" <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 1/6] ARM: shmobile: defconfig: Enable PWM
Date: Fri, 15 Dec 2017 09:48:19 +0000
Message-ID: <TY1PR06MB0895D343C77D0DB2E9F14680C00B0@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1513248976-26700-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513248976-26700-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWUaQMgT4J0N+hrByAD12K-oO0+iNyDeVczS3nxr5ia9A@mail.gmail.com>
In-Reply-To: <CAMuHMdWUaQMgT4J0N+hrByAD12K-oO0+iNyDeVczS3nxr5ia9A@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzZdIEFSTTogc2htb2JpbGU6IGRl
ZmNvbmZpZzogRW5hYmxlIFBXTQ0KPg0KPiBIaSBGYWJyaXppbywNCj4NCj4gT24gVGh1LCBEZWMg
MTQsIDIwMTcgYXQgMTE6NTYgQU0sIEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJv
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBSWi9HMSBhbmQgUi1DYXIgcGxhdGZvcm1zIGhh
dmUgUFdNIHRpbWVycy4gVGhpcyBwYXRjaCBlbmFibGVzIFBXTSBzdXBwb3J0DQo+ID4gYnkgZGVm
YXVsdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8u
Y2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXNAYnAucmVuZXNhcy5jb20+DQo+DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCg0KVGhhbmsg
eW91IGZvciB5b3VyIGZlZWRiYWNrLg0KDQo+DQo+IElmIEknbSBub3QgbWlzdGFrZW4sIHRoZXJl
IGFyZSBubyBjdXJyZW50IHVzZXJzIG9mIHRoaXMgUFdNIGJsb2NrIGluIHRoZQ0KPiBjdXJyZW50
IFItQ2FyIEdlbjIgYW5kIFJaL0cxIERUUyBmaWxlcz8NCg0KUFdNIHN1cHBvcnQgd2lsbCBiZSBu
ZWVkZWQgdmVyeSBzb29uIGFzIHdlIGFyZSBnb2luZyB0byB1c2UgcHdtMyBvbiB0aGUgaXdnMjBk
IHBsYXRmb3JtIHRvIGNvbnRyb2wgdGhlIFJHQiBkaXNwbGF5IGJhY2tsaWdodC4NClRoZSB3b3Jr
IHRvIGFkZCBkaXNwbGF5IHN1cHBvcnQgaXMgaW4gcHJvZ3Jlc3MsIEkgaG9wZSBpdCB3aWxsIGJl
IHJlYWR5IGJ5IG5leHQgd2Vlaywgd291bGQgeW91IHJhdGhlciBJIHNlbnQgdGhpcyBwYXRjaCB3
aXRoIHRoZSBzZXJpZXMgdG8gYWRkIGRpc3BsYXkgc3VwcG9ydD8NCg0KVGhhbmtzLA0KRmFiDQoN
Cj4gSWYgdGhhdCdzIGNvcnJlY3QsIEkgZG9uJ3QgdGhpbmsgaXQgbWFrZXMgbXVjaCBzZW5zZSB0
byBlbmFibGUgaXQgYWxyZWFkeS4NCj4NCj4gU2ltb246IHdoYXQgZG8geW91IHRoaW5rPw0KPg0K
PiBHcntvZXRqZSxlZXRpbmd9cywNCj4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQN
Cj4NCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPg0KPiBJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0KDQoNCltodHRwczovL3d3dzIucmVuZXNhcy5ldS9t
ZWRpYS9lbWFpbC91bmljZWZfMjAxNy5qcGddDQoNClRoaXMgQ2hyaXN0bWFzLCBpbnN0ZWFkIG9m
IHNlbmRpbmcgb3V0IGNhcmRzLCBSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBoYXZlIGRlY2lk
ZWQgdG8gc3VwcG9ydCBVbmljZWYgd2l0aCBhIGRvbmF0aW9uLiBGb3IgZnVydGhlciBkZXRhaWxz
IGNsaWNrIGhlcmU8aHR0cHM6Ly93d3cudW5pY2VmLm9yZy8+IHRvIGZpbmQgb3V0IGFib3V0IHRo
ZSB2YWx1YWJsZSB3b3JrIHRoZXkgZG8sIGhlbHBpbmcgY2hpbGRyZW4gYWxsIG92ZXIgdGhlIHdv
cmxkLg0KV2Ugd291bGQgbGlrZSB0byB0YWtlIHRoaXMgb3Bwb3J0dW5pdHkgdG8gd2lzaCB5b3Ug
YSBNZXJyeSBDaHJpc3RtYXMgYW5kIGEgcHJvc3Blcm91cyBOZXcgWWVhci4NCg0KDQoNClJlbmVz
YXMgRWxlY3Ryb25pY3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVhZG93LCBNaWxsYm9hcmQgUm9hZCwg
Qm91cm5lIEVuZCwgQnVja2luZ2hhbXNoaXJlLCBTTDggNUZILCBVSy4gUmVnaXN0ZXJlZCBpbiBF
bmdsYW5kICYgV2FsZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4gMDQ1ODY3MDkuDQo=
