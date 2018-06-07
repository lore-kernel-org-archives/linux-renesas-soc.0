Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:43303 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750878AbeFGEdN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 00:33:13 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Subject: RE: [PATCH] soc: renesas: rcar-sysc: Make PM domain initialization
 more robust
Date: Thu, 7 Jun 2018 04:33:07 +0000
Message-ID: <OSBPR01MB22939931CC2349CC441554C2D8640@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1528211115-12334-1-git-send-email-geert+renesas@glider.be>
 <20180606085218.5ug5moky75pzlrim@verge.net.au>
 <CAMuHMdWxKaNM21d1_YfX25CkbXzGfw1C-12MjMKNsn=Vn8N6yA@mail.gmail.com>
In-Reply-To: <CAMuHMdWxKaNM21d1_YfX25CkbXzGfw1C-12MjMKNsn=Vn8N6yA@mail.gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEJlaGFsZiBPZiBHZWVydCBVeXR0ZXJob2V2ZW4sIFNl
bnQ6IFdlZG5lc2RheSwgSnVuZSA2LCAyMDE4IDU6NTggUE0NCj4gDQo+IEhpIFNpbW9uLA0KPiAN
Cj4gT24gV2VkLCBKdW4gNiwgMjAxOCBhdCAxMDo1MiBBTSwgU2ltb24gSG9ybWFuIDxob3Jtc0B2
ZXJnZS5uZXQuYXU+IHdyb3RlOg0KPiA+IE9uIFR1ZSwgSnVuIDA1LCAyMDE4IGF0IDA1OjA1OjE1
UE0gKzAyMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCjxzbmlwPg0KPiA+IFRoaXMgbG9v
a3MgZmluZSB0byBtZSBidXQgSSB3aWxsIHdhaXQgdG8gc2VlIGlmIHRoZXJlIGFyZSBvdGhlciBy
ZXZpZXdzDQo+ID4gYmVmb3JlIGFwcGx5aW5nLg0KPiANCj4gTGV0J3Mgd2FpdCBmb3IgZmVlZGJh
Y2sgZnJvbSBTaGltb2RhLXNhbi4gUGVycGFwcyB0aGUgcXVpcmsgZGlkIHJlbHkgb24NCj4gdGhl
IGJ1Z2d5IGJlaGF2aW9yLg0KDQpJIGNoZWNrZWQgL3N5cy9rZXJuZWwvZGVidWcvcG1fZ2VucGQv
cG1fZ2VucGRfc3VtbWFyeS4NCg0KPCBCZWZvcmUgYXBwbGllcyB0aGUgcGF0Y2ggPg0KIC0gIjNk
Zy1iJ3MiIHN0YXR1cyBpcyAib2ZmLTAiLg0KIC0gIjNkZy1iIiBkb2Vzbid0IGhhdmUgYW55IHNs
YXZlcy4NCg0KPCBBZnRlciBhcHBsaWVkIHRoZSBwYXRjaCA+DQogLSAiM2RnLWIncyIgc3RhdHVz
IGlzICJvbiIuDQogLSAiM2RnLWIiIGhhcyAiM2RnLWEiIHNsYXZlLg0KDQpTbywNCg0KVGVzdGVk
LWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+
DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gPiBSZXZpZXdlZC1ieTog
U2ltb24gSG9ybWFuIDxob3JtcytyZW5lc2FzQHZlcmdlLm5ldC5hdT4NCj4gDQo+IFRoYW5rcyEN
Cj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
