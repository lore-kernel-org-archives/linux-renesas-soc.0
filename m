Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:35760 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750790AbdHaIyQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 04:54:16 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Kishon Vijay Abraham I <kishon@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/4] phy: rcar-gen3-usb2: add SoC-specific parameter for
 dedicated pins
Date: Thu, 31 Aug 2017 08:35:11 +0000
Message-ID: <TY1PR06MB09923200A5A7349E84B7382FD89D0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1504164672-20677-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1504164672-20677-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWm2Ej6gV0QSBUrh1u9YY5KkE-iSWKVc7KGDZEEKmu3oA@mail.gmail.com>
 <TY1PR06MB0992F3C5BB9FB2808980FEB1D89D0@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdWwqnR0hFhkD8=LdV2RyRm+-S8AU3jBbgJGHfFb+s2pzg@mail.gmail.com>
In-Reply-To: <CAMuHMdWwqnR0hFhkD8=LdV2RyRm+-S8AU3jBbgJGHfFb+s2pzg@mail.gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiBTZW50OiBUaHVy
c2RheSwgQXVndXN0IDMxLCAyMDE3IDU6MjcgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiAN
Cj4gT24gVGh1LCBBdWcgMzEsIDIwMTcgYXQgMTA6MTUgQU0sIFlvc2hpaGlybyBTaGltb2RhDQo+
IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbg0KPiA+PiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDMxLCAyMDE3IDQ6
NTEgUE0NCj4gPj4gT24gVGh1LCBBdWcgMzEsIDIwMTcgYXQgOTozMSBBTSwgWW9zaGloaXJvIFNo
aW1vZGENCj4gPj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCjwg
c25pcCA+DQo+ID4+IEdpdmVuIHRoZSBnZW5lcmljIFItQ2FyIEdlbjMgZW50cnkgc2V0cyBSQ0FS
X0dFTjNfUEhZX0hBU19ERURJQ0FURURfUElOUywgeW91DQo+ID4+IGNhbm5vdCBzcGVjaWZ5IHRo
ZSBmYWxsYmFjayBjb21wYXRpYmxlIHZhbHVlIG9mICJyZW5lc2FzLHJjYXItZ2VuMy11c2IyLXBo
eSINCj4gPj4gaW4gdGhlIFItQ2FyIEQzIC5kdHNpLg0KPiA+DQo+ID4gSSB1bmRlcnN0b29kIGl0
Lg0KPiA+DQo+ID4+IFNvIEknbSB3b25kZXJpbmcsIGRvZXMgdGhlIFVTQjIgUEhZIHN0aWxsIHdv
cmsgKHdpdGggbGltaXRhdGlvbnMpIG9uIFItQ2FyIEgzDQo+ID4+IGFuZCBNMy1XIGlmIHlvdSBk
cm9wIFJDQVJfR0VOM19QSFlfSEFTX0RFRElDQVRFRF9QSU5TPw0KPiA+DQo+ID4gWWVzLCB0aGUg
VVNCIFBIWSBzdGlsbCB3b3JrIHdpdGggbGltaXRhdGlvbiAob3RnIGNhcGFiaWxpdHkgY2hhbm5l
bCB3b3JrcyBhcw0KPiA+IHBlcmlwaGVyYWwgbW9kZSBvbmx5LiBPdGhlciBjaGFubmVscyBhcmUg
bm8gbGltaXRhdGlvbikuDQo+IA0KPiBUaGF0J3MgZ29vZCB0byBoZWFyLg0KPiANCj4gPj4gSWYg
eWVzLCB5b3UgY2FuIGRyb3AgdGhlIGZsYWcgZnJvbSB0aGUgZ2VuZXJpYyBlbnRyeSwgYW5kIFIt
Q2FyIEQzIGNhbiBzcGVjaWZ5DQo+ID4+IHRoZSBnZW5lcmljIGZhbGxiYWNrIGNvbXBhdGlibGUg
dmFsdWUgaW4gaXRzIC5kdHNpLCBsaWtlIEgzIGFuZCBNMy1XLg0KPiA+DQo+ID4gSSBnb3QgaXQu
IEkgd2lsbCBmaXggdGhpcyBwYXRjaCBzZXQuDQo+IA0KPiBBbmQgeW91IGNhbiBkcm9wIHRoZSBk
cml2ZXIgY2hhbmdlIGZyb20gIltQQVRDSCA0LzRdIHBoeTogcmNhci1nZW4zLXVzYjI6IGFkZA0K
PiBiaW5kaW5nIGZvciByOGE3Nzk5NSIsIGFzIGl0IHdpbGwgbWF0Y2ggYWdhaW5zdCB0aGUgZ2Vu
ZXJpYyBmYWxsYmFjayBvbiBEMy4NCg0KSSBnb3QgaXQuIEkgd2lsbCBzdWJtaXQgdjIgcGF0Y2hl
cyBzb29uLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IFRoYW5rcy4N
Cj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
