Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:27939 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755697AbcJ1IO1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2016 04:14:27 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Xuan Truong Nguyen <nx-truong@jinso.co.jp>
CC: Wolfram Sang <wsa@sang-engineering.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        hideo inayoshi <h-inayoshi@jinso.co.jp>,
        =?utf-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
        <niklas.soderlund@ragnatech.se>
Subject: RE: The failure summary report of GEN2 for linux stable v4.8
Date: Fri, 28 Oct 2016 08:14:19 +0000
Message-ID: <SIXPR06MB0559BA3B149F002AE534F8C5D8AD0@SIXPR06MB0559.apcprd06.prod.outlook.com>
References: <57A46D20.7040106@jinso.co.jp> <57C9764F.2070802@jinso.co.jp>
 <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp>
 <9d9a647b-d75f-e89a-2d4d-55e409ccabae@jinso.co.jp>
 <580620CD.50703@sang-engineering.com>
 <b7e9b4c2-1d5d-2e76-c0f4-fcc50150dc30@jinso.co.jp>
 <CAMuHMdWuHZ=5ogTE9rG=hjJxVn4dADc_cXuEcO76goq8KDf9kg@mail.gmail.com>
 <125b4831-cbdf-f8e1-da97-8ea9cf458c22@jinso.co.jp>
 <CAMuHMdU1-+AqnQpQPrsSxD0tQpjaeEPxiawULTJaUFsGO2Kc1A@mail.gmail.com>
In-Reply-To: <CAMuHMdU1-+AqnQpQPrsSxD0tQpjaeEPxiawULTJaUFsGO2Kc1A@mail.gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQtc2FuLCBYdWFuLXNhbiwNCg0KPiBGcm9tOiBsaW51eC1yZW5lc2FzLXNvYy1vd25l
ckB2Z2VyLmtlcm5lbC5vcmcgW21haWx0bzpsaW51eC1yZW5lc2FzLXNvYy1vd25lckB2Z2VyLmtl
cm5lbC5vcmddIE9uIEJlaGFsZiBPZiBHZWVydA0KPiBVeXR0ZXJob2V2ZW4NCj4gU2VudDogTW9u
ZGF5LCBPY3RvYmVyIDI0LCAyMDE2IDY6MjEgUE0NCj4gDQo+IE9uIE1vbiwgT2N0IDI0LCAyMDE2
IGF0IDExOjEzIEFNLCBYdWFuIFRydW9uZyBOZ3V5ZW4NCj4gPG54LXRydW9uZ0BqaW5zby5jby5q
cD4gd3JvdGU6DQo+ID4+IFRoaXMgaXMgd2l0aCBzaG1vYmlsZV9kZWZjb25maWc/DQo+ID4NCj4g
PiB5ZXMuIHdlIGFsc28gYXR0YWNoIHRoZSBjb25maWdzIGZpbGUgd2UgdXNlZA0KPiA+IChsYWdl
ci1zY2lmLXBpby12NC45LXJjMi5jb25maWcpDQo+ID4NCj4gPj4gRG9lcyBpdCB3b3JrIGJldHRl
ciBpZiB5b3UgZW5hYmxlIENPTkZJR19TRVJJQUxfU0hfU0NJX0RNQT8NCj4gPg0KPiA+IHllcywg
aXQncyBiZXR0ZXIgYSBsaXR0bGUgYml0LiB0aGUga2VybmVsIGRvZXMgbm90IGhhbmdzIHVwLCBi
dXQgdGhlIHdhcm5pbmcNCj4gPiBtZXNzYWdlIGlzIG91dHB1dC4NCj4gPiBwbGVhc2UgcmVmZXIg
bGFnZXItc2NpZi1kbWEubG9nLg0KPiA+DQo+ID4gd2UgdGVzdGVkIG9uIHY0LjktcmMyLiB0aGUg
aXNzdWUgaXMgdGhlIHNhbWUuDQo+ID4NCj4gPiBpZiB5b3UgbmVlZCBhbnkgaW5mb3JtYXRpb24s
IHBsZWFzZSBsZXQgdXMga25vdy4NCj4gDQo+ID4gV0FSTklORzogQ1BVOiAwIFBJRDogMjI0OSBh
dCBkcml2ZXJzL2RtYS9zaC9yY2FyLWRtYWMuYzoxMjU3IHJjYXJfZG1hY190eF9zdGF0dXMrMHgx
MjgvMHg0DQo+ID4gTm8gZGVzY3JpcHRvciBmb3IgY29va2llIQ0KPiANCj4gPiBbPGMwMzQxOWU4
Pl0gKHJjYXJfZG1hY190eF9zdGF0dXMpIGZyb20gWzxjMDM3MWUwND5dIChyeF90aW1lcl9mbisw
eDQ4LzB4MTQ4KQ0KPiANCj4gPiBbPGMwMzcxZGJjPl0gKHJ4X3RpbWVyX2ZuKSBmcm9tIFs8YzAx
NmRlZGM+XSAoY2FsbF90aW1lcl9mbisweDJjLzB4YTApDQo+IA0KPiBUaGF0IGxvb2tzIGxpa2Ug
YSByYWNlIGNvbmRpdGlvbiBiZXR3ZWVuIHRpbWVvdXQgaGFuZGxpbmcgYW5kIGFjdHVhbCBjb21w
bGV0aW9uDQo+IG9mIHRoZSBETUE/DQoNCkkgZm91bmQgYW4gaXNzdWUgaW4gc2gtc2NpLmMgYW5k
IG1hZGUgYSBwYXRjaCB0byByZXNvbHZlIGl0Lg0KQnV0LCBJJ20gbm90IHN1cmUgdGhpcyBpcyBj
b3JyZWN0IHdheS4NCklmIHRoaXMgaXMgY29ycmVjdCB3YXksIHdlIGFsc28gaGF2ZSB0byBmaXgg
ZGV2X2RiZygpIGluIHNvbWUgZnVuY3Rpb25zLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8g
U2hpbW9kYQ0KDQpTaW5jZSBJIHNlbmQgdGhpcyBlbWFpbCB1c2luZyBPdXRsb29rLCB0aGUgcGF0
Y2ggZm9ybWF0IG1heSBiZSBub3QgZ29vZC4NCi0tLQ0KRnJvbTogWW9zaGloaXJvIFNoaW1vZGEg
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KRGF0ZTogRnJpLCAyOCBPY3QgMjAx
NiAxNjo1MjozNiArMDkwMA0KU3ViamVjdDogW1BBVENIXSBzZXJpYWw6IHNoLXNjaTogcmVtb3Zl
IGRldl93YXJuKCkgdG8gYXZvaWQgZG91YmxlIHNwaW4gbG9jaw0KIGhlbGQNCg0KSWYgd2UgdXNl
IHNlcmlhbCBjb25zb2xlIGFuZCBDT05GSUdfU0VSSUFMX1NIX1NDSV9ETUE9eSwgc2luY2UNCnNj
aV9kbWFfcnhfcHVzaCgpIGlzIGNhbGxlZCB3aXRoIHBvcnQtPmxvY2sgaGVsZCBhbmQgZGV2X3dh
cm4oKSB3aWxsDQpjYWxsIHNlcmlhbF9jb25zb2xlX3dyaXRlKCkgZmluYWxseSwgdGhpcyBpcyBw
b3NzaWJsZSB0byBjYWxsDQpzcGluX2xvY2t7X2lycXNhdmV9KCkgdHdpY2UuDQpUbyBhdm9pZCB0
aGlzLCB0aGlzIHBhdGNoIHJlbW92ZSBkZXZfd2FybigpIGluIHNjaV9kbWFfcnhfcHVzaCgpLg0K
DQpSZXBvcnRlZC1ieTogWHVhbiBUcnVvbmcgTmd1eWVuIDxueC10cnVvbmdAamluc28uY28uanA+
DQpTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhA
cmVuZXNhcy5jb20+DQotLS0NCiBkcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMgfCA1ICstLS0t
DQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5jIGIvZHJpdmVycy90dHkvc2VyaWFs
L3NoLXNjaS5jDQppbmRleCA0YjI2MjUyLi4zODBiNWQ3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy90
dHkvc2VyaWFsL3NoLXNjaS5jDQorKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMNCkBA
IC0xMTQyLDExICsxMTQyLDggQEAgc3RhdGljIGludCBzY2lfZG1hX3J4X3B1c2goc3RydWN0IHNj
aV9wb3J0ICpzLCB2b2lkICpidWYsIHNpemVfdCBjb3VudCkNCiAJaW50IGNvcGllZDsNCiANCiAJ
Y29waWVkID0gdHR5X2luc2VydF9mbGlwX3N0cmluZyh0cG9ydCwgYnVmLCBjb3VudCk7DQotCWlm
IChjb3BpZWQgPCBjb3VudCkgew0KLQkJZGV2X3dhcm4ocG9ydC0+ZGV2LCAiUnggb3ZlcnJ1bjog
ZHJvcHBpbmcgJXp1IGJ5dGVzXG4iLA0KLQkJCSBjb3VudCAtIGNvcGllZCk7DQorCWlmIChjb3Bp
ZWQgPCBjb3VudCkNCiAJCXBvcnQtPmljb3VudC5idWZfb3ZlcnJ1bisrOw0KLQl9DQogDQogCXBv
cnQtPmljb3VudC5yeCArPSBjb3BpZWQ7DQogDQotLSANCjEuOS4xDQo=
