Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:16626 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726824AbeGaHw4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 03:52:56 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: r8a77990: Enable PWM for Ebisu board
Date: Tue, 31 Jul 2018 06:14:15 +0000
Message-ID: <OSBPR01MB2293CA243F691BD9AF07A948D82E0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1532951531-29188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVEMs6j-GVVQdUN5Hx8ExSHWcyKinLjU8eKCZOfzXBb8g@mail.gmail.com>
In-Reply-To: <CAMuHMdVEMs6j-GVVQdUN5Hx8ExSHWcyKinLjU8eKCZOfzXBb8g@mail.gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgSnVseSAzMSwgMjAxOCAxMjozNCBBTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0KPiBP
biBNb24sIEp1bCAzMCwgMjAxOCBhdCAxOjU1IFBNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5b3No
aWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBhZGRz
IFBXTSBkZXZpY2Ugbm9kZXMgYW5kIGVuYWJsZXMgUFdNMyBhbmQgUFdNNSBmb3INCj4gPiBSLUNh
ciBFMyBFYmlzdSBib2FyZC4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCg0KVGhhbmsg
eW91IGZvciB5b3VyIHJldmlldyENCg0KPiBUaGlzIGlzIHVzZWQgZm9yIGJsYWNrbGlnaHQgY29u
dHJvbCwgcmlnaHQ/DQoNClllcy4NCg0KPiBJdCBtYXkgYmUgYSBnb29kIGlkZWEgdG8gbWVudGlv
biB0aGF0IGluIHRoZSBjb21tZW50cyBhbmQvb3IgcGF0Y2gNCj4gZGVzY3JpcHRpb24uDQoNCkkg
Z290IGl0LiBJJ2xsIHJldmlzZSB0aGUgcGF0Y2ggZGVzY3JpcHRpb24gYXMgdGhlIGZvbGxvd2lu
Zy4gSXMgaXQgZ29vZD8NCg0KLS0tDQpUaGlzIHBhdGNoIGFkZHMgUFdNIGRldmljZSBub2RlcyBh
bmQgZW5hYmxlcyBQV00zIGFuZCBQV001IGZvcg0KUi1DYXIgRTMgRWJpc3UgYm9hcmQuIFRoZXNl
IGRldmljZXMgYXJlIHVzZWQgZm9yIGJhY2tsaWdodCBjb250cm9sLg0KLS0tDQoNCkJlc3QgcmVn
YXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8g
U2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IA0KPiBSZXZpZXdl
ZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+
IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQN
Cj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
