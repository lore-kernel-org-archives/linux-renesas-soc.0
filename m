Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:18438 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751279AbdIMX6y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2017 19:58:54 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] arm64: dts: renesas: r8a77995: draak: enable
 EthernetAVB
Date: Wed, 13 Sep 2017 23:58:47 +0000
Message-ID: <TY1PR06MB0992906ACD39FA3D176CDFE6D86E0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1505305119-4257-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1505305119-4257-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX3q=foc1hkcqTc3WQYxCh1x+bc8fu9+YcqVAx9bp4qaA@mail.gmail.com>
In-Reply-To: <CAMuHMdX3q=foc1hkcqTc3WQYxCh1x+bc8fu9+YcqVAx9bp4qaA@mail.gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiBTZW50OiBXZWRu
ZXNkYXksIFNlcHRlbWJlciAxMywgMjAxNyAxMTo1NSBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4s
DQo+IA0KPiBPbiBXZWQsIFNlcCAxMywgMjAxNyBhdCAyOjE4IFBNLCBZb3NoaWhpcm8gU2hpbW9k
YQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRoaXMg
cGF0Y2ggZW5hYmxlcyBFdGhlcm5ldEFWQiBmb3IgUi1DYXIgRDMgZHJhYWsgYm9hcmQuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEu
dWhAcmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0t
LSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5NS1kcmFhay5kdHMNCj4gPiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUtZHJhYWsuZHRzDQo+IA0K
PiA+IEBAIC0zNyw2ICszOSwxNCBAQA0KPiA+ICB9Ow0KPiA+DQo+ID4gICZwZmMgew0KPiA+ICsg
ICAgICAgYXZiMF9waW5zOiBhdmIgew0KPiA+ICsgICAgICAgICAgICAgICBtdXggew0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGdyb3VwcyA9ICJhdmIwX2xpbmsiLCAiYXZiMF9waHlfaW50
IiwgImF2YjBfbWRjIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiYXZi
MF9taWkiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGZ1bmN0aW9uID0gImF2YjAiOw0K
PiANCj4gVGhpcyBwYXJ0IGRlcGVuZHMgb24gKGFuIHVwZGF0ZWQgdmVyc2lvbiBvZikgIltQQVRD
SCA1LzhdIHBpbmN0cmw6IHNoLXBmYzoNCj4gcjhhNzc5OTU6IEFkZCBFdGhlcm5ldEFWQiBwaW5z
LCBncm91cHMgYW5kIGZ1bmN0aW9ucyIsIHNvIGl0IG1heSBjaGFuZ2U/DQoNCk9vcHMsIEkgZm90
Z290IHRvIHN1Ym1pdCB2MiBQRkMgcGF0Y2ggeWVzdGVyZGF5Li4uDQpZZXMsIGl0IGlzIGNoYW5n
ZWQgbGlrZSBvdGhlciBnZW4zIFNvQ3MuIEkgc3VibWl0dGVkIGl0IG5vdy4gDQoNCj4gQW5kIHdl
IHdpbGwgcHJvYmFibHkgaGF2ZSB0byBhZGQgZHJpdmVyLXN0cmVuZ3RocyBsYXRlciwgdG8gYXZv
aWQgYQ0KPiBkZXBlbmRlbmN5IG9uIGJvb3Rsb2FkZXIgc2V0dXA/DQoNClllcywgSSB3aWxsIGRv
IHNvLCBpZiBuZWVkZWQuDQoNCj4gQXBhcnQgZnJvbSB0aGF0Og0KPiBSZXZpZXdlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCg0KVGhhbmsgeW91IGZv
ciB5b3VyIHJldmlldyENCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiBH
cntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+
IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
