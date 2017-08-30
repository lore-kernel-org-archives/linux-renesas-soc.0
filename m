Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:13106 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751388AbdH3NNh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 09:13:37 -0400
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
Date: Wed, 30 Aug 2017 13:13:33 +0000
Message-ID: <TY1PR06MB099216F35EEA6909DFE6AC80D89C0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1502281187-24068-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1502281187-24068-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWQD9Gnt0hCHf8nwdq0etWQW=zSuXqFe7qrxmQ7SAEVjw@mail.gmail.com>
In-Reply-To: <CAMuHMdWQD9Gnt0hCHf8nwdq0etWQW=zSuXqFe7qrxmQ7SAEVjw@mail.gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQtc2FuLA0KDQpTb3JyeSwgSSBhbHNvIG1pc3NlZCB0aGlzIGVtYWlsLi4uDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuDQo+
IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDE2LCAyMDE3IDg6MDYgUE0NCj4gDQo+IEhpIFNoaW1v
ZGEtc2FuLCBLaWhhcmEtc2FuLA0KPiANCj4gT24gV2VkLCBBdWcgOSwgMjAxNyBhdCAyOjE5IFBN
LCBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+
IHdyb3RlOg0KPiA+IEZyb206IFRha2VzaGkgS2loYXJhIDx0YWtlc2hpLmtpaGFyYS5kZkByZW5l
c2FzLmNvbT4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRha2VzaGkgS2loYXJhIDx0YWtlc2hp
LmtpaGFyYS5kZkByZW5lc2FzLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hp
bW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IA0KPiBSZXZpZXdlZC1i
eTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IEJ1
dCBiZWZvcmUgSSBhcHBseSB0aGlzLCBwbGVhc2Ugc2VlIG15IHF1ZXN0aW9uIGJlbG93Li4uDQo+
IA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9zaC1wZmMvcGZjLXI4YTc3OTk1LmMNCj4gPiAr
KysgYi9kcml2ZXJzL3BpbmN0cmwvc2gtcGZjL3BmYy1yOGE3Nzk5NS5jDQo+IA0KPiA+ICtzdGF0
aWMgY29uc3QgY2hhciAqIGNvbnN0IGF2YjBfZ3JvdXBzW10gPSB7DQo+ID4gKyAgICAgICAiYXZi
MF90ZCIsDQo+ID4gKyAgICAgICAiYXZiMF9yZCIsDQo+ID4gKyAgICAgICAiYXZiMF90eF9jdGwi
LA0KPiA+ICsgICAgICAgImF2YjBfcnhfY3RsIiwNCj4gPiArICAgICAgICJhdmIwX3R4YyIsDQo+
ID4gKyAgICAgICAiYXZiMF9yeGMiLA0KPiA+ICsgICAgICAgImF2YjBfdHhjcmVmY2xrIiwNCj4g
PiArICAgICAgICJhdmIwX2xpbmsiLA0KPiA+ICsgICAgICAgImF2YjBfbWFnaWMiLA0KPiA+ICsg
ICAgICAgImF2YjBfcGh5X2ludCIsDQo+ID4gKyAgICAgICAiYXZiMF9tZGMiLA0KPiA+ICsgICAg
ICAgImF2YjBfbWRpbyIsDQo+ID4gKyAgICAgICAiYXZiMF9hdnRwX3Bwc19hIiwNCj4gPiArICAg
ICAgICJhdmIwX2F2dHBfbWF0Y2hfYSIsDQo+ID4gKyAgICAgICAiYXZiMF9hdnRwX2NhcHR1cmVf
YSIsDQo+ID4gKyAgICAgICAiYXZiMF9hdnRwX3Bwc19iIiwNCj4gPiArICAgICAgICJhdmIwX2F2
dHBfbWF0Y2hfYiIsDQo+ID4gKyAgICAgICAiYXZiMF9hdnRwX2NhcHR1cmVfYiIsDQo+ID4gK307
DQo+IA0KPiBJcyB0aGVyZSBhbnkgc3BlY2lmaWMgcmVhc29uIHRoaXMgdXNlcyBhIGRpZmZlcmVu
dCBzcGxpdCB0aGFuIHRoZQ0KPiBFdGhlckFWQiBncm91cHMNCj4gaW4gcGluY3RybCBkcml2ZXJz
IGZvciBvdGhlciBTb0NzPw0KDQpJIHdpbGwgY2hlY2sgdGhpcyB0b21vcnJvdyAob3IgbGF0ZXIu
Li4pLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IE5vdGUgdGhhdCBJ
IGRvIHVuZGVyc3RhbmQgdGhhdCB0aGUgZGlmZmVyZW50IHByZWZpeCAoImF2YjAiIHZzLiAiYXZi
IikNCj4gd2FzIHVzZWQgdG8NCj4gbWF0Y2ggdGhlIFItQ2FyIEQzIGRhdGFzaGVldCwgd2hpY2gg
aXMgdGh1cyBPSy4NCj4gDQo+IFRoYW5rcyENCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiAN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzDQo=
