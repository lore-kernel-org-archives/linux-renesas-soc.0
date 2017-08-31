Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:33227 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750826AbdHaE3h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 00:29:37 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 5/8] pinctrl: sh-pfc: r8a77995: Add EthernetAVB pins,
 groups and functions
Date: Thu, 31 Aug 2017 04:29:32 +0000
Message-ID: <TY1PR06MB0992331C7DF35D5054B7BEF6D89D0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1502281187-24068-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1502281187-24068-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWQD9Gnt0hCHf8nwdq0etWQW=zSuXqFe7qrxmQ7SAEVjw@mail.gmail.com>
 <TY1PR06MB099216F35EEA6909DFE6AC80D89C0@TY1PR06MB0992.apcprd06.prod.outlook.com>
In-Reply-To: <TY1PR06MB099216F35EEA6909DFE6AC80D89C0@TY1PR06MB0992.apcprd06.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQtc2FuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFlv
c2hpaGlybyBTaGltb2RhDQo+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDMwLCAyMDE3IDEwOjE0
IFBNDQo+IA0KPiBIaSBHZWVydC1zYW4sDQo+IA0KPiBTb3JyeSwgSSBhbHNvIG1pc3NlZCB0aGlz
IGVtYWlsLi4uDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTog
R2VlcnQgVXl0dGVyaG9ldmVuDQo+ID4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMTYsIDIwMTcg
ODowNiBQTQ0KPiA+DQo+ID4gSGkgU2hpbW9kYS1zYW4sIEtpaGFyYS1zYW4sDQo+ID4NCj4gPiBP
biBXZWQsIEF1ZyA5LCAyMDE3IGF0IDI6MTkgUE0sIFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPHlv
c2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IFRha2Vz
aGkgS2loYXJhIDx0YWtlc2hpLmtpaGFyYS5kZkByZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBUYWtlc2hpIEtpaGFyYSA8dGFrZXNoaS5raWhhcmEuZGZAcmVuZXNhcy5j
b20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNo
aW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPg0KPiA+IEJ1dCBiZWZvcmUgSSBh
cHBseSB0aGlzLCBwbGVhc2Ugc2VlIG15IHF1ZXN0aW9uIGJlbG93Li4uDQo+ID4NCj4gPiA+IC0t
LSBhL2RyaXZlcnMvcGluY3RybC9zaC1wZmMvcGZjLXI4YTc3OTk1LmMNCj4gPiA+ICsrKyBiL2Ry
aXZlcnMvcGluY3RybC9zaC1wZmMvcGZjLXI4YTc3OTk1LmMNCj4gPg0KPiA+ID4gK3N0YXRpYyBj
b25zdCBjaGFyICogY29uc3QgYXZiMF9ncm91cHNbXSA9IHsNCj4gPiA+ICsgICAgICAgImF2YjBf
dGQiLA0KPiA+ID4gKyAgICAgICAiYXZiMF9yZCIsDQo+ID4gPiArICAgICAgICJhdmIwX3R4X2N0
bCIsDQo+ID4gPiArICAgICAgICJhdmIwX3J4X2N0bCIsDQo+ID4gPiArICAgICAgICJhdmIwX3R4
YyIsDQo+ID4gPiArICAgICAgICJhdmIwX3J4YyIsDQo+ID4gPiArICAgICAgICJhdmIwX3R4Y3Jl
ZmNsayIsDQo+ID4gPiArICAgICAgICJhdmIwX2xpbmsiLA0KPiA+ID4gKyAgICAgICAiYXZiMF9t
YWdpYyIsDQo+ID4gPiArICAgICAgICJhdmIwX3BoeV9pbnQiLA0KPiA+ID4gKyAgICAgICAiYXZi
MF9tZGMiLA0KPiA+ID4gKyAgICAgICAiYXZiMF9tZGlvIiwNCj4gPiA+ICsgICAgICAgImF2YjBf
YXZ0cF9wcHNfYSIsDQo+ID4gPiArICAgICAgICJhdmIwX2F2dHBfbWF0Y2hfYSIsDQo+ID4gPiAr
ICAgICAgICJhdmIwX2F2dHBfY2FwdHVyZV9hIiwNCj4gPiA+ICsgICAgICAgImF2YjBfYXZ0cF9w
cHNfYiIsDQo+ID4gPiArICAgICAgICJhdmIwX2F2dHBfbWF0Y2hfYiIsDQo+ID4gPiArICAgICAg
ICJhdmIwX2F2dHBfY2FwdHVyZV9iIiwNCj4gPiA+ICt9Ow0KPiA+DQo+ID4gSXMgdGhlcmUgYW55
IHNwZWNpZmljIHJlYXNvbiB0aGlzIHVzZXMgYSBkaWZmZXJlbnQgc3BsaXQgdGhhbiB0aGUNCj4g
PiBFdGhlckFWQiBncm91cHMNCj4gPiBpbiBwaW5jdHJsIGRyaXZlcnMgZm9yIG90aGVyIFNvQ3M/
DQo+IA0KPiBJIHdpbGwgY2hlY2sgdGhpcyB0b21vcnJvdyAob3IgbGF0ZXIuLi4pLg0KDQpJIGFz
a2VkIEtpaGFyYS1zYW4gYWJvdXQgdGhpcyBhbmQgaGUgZG9lc24ndCBrbm93IG90aGVyIFNvQyAo
cjhhNzc5NSkgaGFzIG1paSBncm91cC4NClNvLCBJIHdpbGwgbW9kaWZ5IHRoZSBwYXRjaCBsaWtl
IHI4YTc3OTUncyBncm91cC4NCg0KQnV0Li4uDQoNCj4gPiBOb3RlIHRoYXQgSSBkbyB1bmRlcnN0
YW5kIHRoYXQgdGhlIGRpZmZlcmVudCBwcmVmaXggKCJhdmIwIiB2cy4gImF2YiIpDQo+ID4gd2Fz
IHVzZWQgdG8NCj4gPiBtYXRjaCB0aGUgUi1DYXIgRDMgZGF0YXNoZWV0LCB3aGljaCBpcyB0aHVz
IE9LLg0KDQpJIGNoZWNrZWQgdGhpcyBvbiB0aGUgZGF0YXNoZWV0LCBidXQgaXQgc2VlbXMgZXJy
b3IgaW4gaXQuDQpQRkMgc2VjdGlvbiBuYW1lcyAiQVZCMCIsIGJ1dCBFdGhlcm5ldCBBVkIgc2Vj
dGlvbiBuYW1lcyAiQVZCIi4NClNvLCBJJ20gYXNraW5nIGh3IHRlYW0gYWJvdXQgdGhpcy4gQWZ0
ZXIgSSBnb3QgcmVwbHkgZnJvbSB0aGVtLA0KSSB3aWxsIHNlbmQgdjIgcGF0Y2guDQoNCkJlc3Qg
cmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gPiBUaGFua3MhDQo+ID4NCj4gPiBHcntv
ZXRqZSxlZXRpbmd9cywNCj4gPg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+
ID4NCj4gPiAtLQ0KPiA+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGlu
dXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gPg0KPiA+IEluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQNCj4gPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
