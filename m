Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:3754 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727796AbeISPaq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 11:30:46 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 2/5] pinctrl: sh-pfc: r8a77470: Add DU0 pin groups
Date: Wed, 19 Sep 2018 09:53:32 +0000
Message-ID: <TY1PR01MB1770BC3383401C0BAEF363B9C01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1537278478-1744-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537278478-1744-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXwG+XRB9L9WPHMvLuOmeqKE3fpqhDkiTxG2nMCqpjEHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXwG+XRB9L9WPHMvLuOmeqKE3fpqhDkiTxG2nMCqpjEHQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjay4NCg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDIvNV0gcGluY3RybDogc2gtcGZjOiByOGE3NzQ3MDogQWRkIERVMCBwaW4g
Z3JvdXBzDQo+DQo+IEhpIEZhYnJpemlvLA0KPg0KPiBPbiBUdWUsIFNlcCAxOCwgMjAxOCBhdCAz
OjQ4IFBNIEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29t
PiB3cm90ZToNCj4gPiBBZGQgRFUwIHBpbiBncm91cHMgYW5kIGZ1bmN0aW9uIHRvIHRoZSBSOEE3
NzQ3MCBTb0MuDQo+DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4NCj4gU2FtZSBxdWVzdGlv
bjogbm8gbmVlZCBmb3IgRFUxPw0KDQpUaGVyZSBpcyBubyB3YXkgd2UgY2FuIHRlc3QgaXQgb24g
dGhlIGl3ZzIzcywgdGhlcmVmb3JlIHdlIGhhdmUgbm8gcGxhbnMgZm9yIHN1cHBvcnRpbmcgRFUx
IGF0IHRoaXMgcG9pbnQgaW4gdGltZS4NCg0KVGhhbmtzLA0KRmFiDQoNCj4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4N
Cj4gPiBSZXZpZXdlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPg0KPg0K
PiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT4NCj4NCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+DQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0DQo+DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4NCj4gSW4gcGVyc29u
YWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBo
YWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkg
InByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0KDQoNClJlbmVzYXMgRWxlY3Ryb25p
Y3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVhZG93LCBNaWxsYm9hcmQgUm9hZCwgQm91cm5lIEVuZCwg
QnVja2luZ2hhbXNoaXJlLCBTTDggNUZILCBVSy4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYgV2Fs
ZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4gMDQ1ODY3MDkuDQo=
