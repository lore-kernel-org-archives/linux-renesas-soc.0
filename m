Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:47748 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726412AbeHFJhC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 05:37:02 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/5] gpio: rcar: Add GPIO hole support
Date: Mon, 6 Aug 2018 07:29:13 +0000
Message-ID: <OSBPR01MB210308E2DDCC648D235E7327B8200@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1533219087-33695-1-git-send-email-biju.das@bp.renesas.com>
 <1533219087-33695-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdW7rY9Vho4qpo=K9qoqR1bfn=6Xqb9h=T0CGfb+v=X11Q@mail.gmail.com>
 <OSBPR01MB21039FF2E727B7E9CFC43E9DB8230@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdX8wsky2EiESFe4y_JeMengPgjTeXCyFh1TwcFCJkTD7A@mail.gmail.com>
In-Reply-To: <CAMuHMdX8wsky2EiESFe4y_JeMengPgjTeXCyFh1TwcFCJkTD7A@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SEkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA0IEF1Z3VzdCAyMDE4IDEwOjI1DQo+IFRvOiBCaWp1IERhcyA8Ymlq
dS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc+OyBvcGVuIGxpc3Q6R1BJTyBTVUJTWVNURU0NCj4gPGxpbnV4LWdwaW9Admdl
ci5rZXJuZWwub3JnPjsgU2ltb24gSG9ybWFuIDxob3Jtc0B2ZXJnZS5uZXQuYXU+Ow0KPiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgQ2hyaXMgUGF0ZXJzb24N
Cj4gPENocmlzLlBhdGVyc29uMkByZW5lc2FzLmNvbT47IEZhYnJpemlvIENhc3Rybw0KPiA8ZmFi
cml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPjsgTGludXgtUmVuZXNhcyA8bGludXgtcmVuZXNh
cy0NCj4gc29jQHZnZXIua2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzVd
IGdwaW86IHJjYXI6IEFkZCBHUElPIGhvbGUgc3VwcG9ydA0KPiA+ID4gPiBAQCAtNDcxLDYgKzQ5
NSw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19yY2FyX3Byb2JlKHN0cnVjdA0KPiA+ID4gPiBwbGF0Zm9y
bV9kZXZpY2UNCj4gPiA+ICpwZGV2KQ0KPiA+ID4gPiAgICAgICAgIGdwaW9fY2hpcC0+b3duZXIg
PSBUSElTX01PRFVMRTsNCj4gPiA+ID4gICAgICAgICBncGlvX2NoaXAtPmJhc2UgPSAtMTsNCj4g
PiA+ID4gICAgICAgICBncGlvX2NoaXAtPm5ncGlvID0gbnBpbnM7DQo+ID4gPiA+ICsgICAgICAg
Z3Bpb19jaGlwLT5uZWVkX3ZhbGlkX21hc2sgPSBwLT5iYW5rX2luZm8uZ3Bpb21zayA/IHRydWUg
Og0KPiA+ID4gPiArIGZhbHNlOw0KPiA+ID4NCj4gPiA+IGdwaW9jaGlwX2luaXRfdmFsaWRfbWFz
aygpIGFscmVhZHkgc2V0cyBncGlvX2NoaXAtPm5lZWRfdmFsaWRfbWFzaw0KPiA+ID4gdG8gdHJ1
ZSBpZiAiZ3Bpby1yZXNlcnZlZC1yYW5nZXMiIGlzIGRldGVjdGVkLg0KPiA+DQo+ID4gVGhlIHBs
YW4gaXMgIHRvIHNldCAgIm9mX25vZGUiICB2YXJpYWJsZSBpbiBkcml2ZXIuIFNvIHRoYXQNCj4g
Z3Bpb2NoaXBfaW5pdF92YWxpZF9tYXNrKCkgc2V0cyBncGlvX2NoaXAtPm5lZWRfdmFsaWRfbWFz
ayB0byB0cnVlLg0KPiA+IFdoYXQgaXMgeW91ciBvcGluaW9uIG9uIHRoaXM/DQo+DQo+IFNvdW5k
cyBmaW5lIHRvIG1lLg0KPg0KPiBZb3Ugc2FpZCBvbiBJUkMgdGhhdCBpdCBjdXJyZW50bHkgY3Jh
c2hlcyB3aGVuICJncGlvLXJlc2VydmVkLXJhbmdlcyIgaXMNCj4gdXNlZC4NCg0KWWVzIHRoYXQg
aXMgY29ycmVjdC4gaWYgd2UgYWRkICJncGlvLXJlc2VydmVkLXJhbmdlcyIgIG9uIGRldmljZSB0
cmVlIHdpdGhvdXQNCnNldHRpbmcgICJvZl9ub2RlIiBvciAgIiBuZWVkX3ZhbGlkX21hc2siICBp
biBkcml2ZXIsIGdwaW9jaGlwX2luaXRfdmFsaWRfbWFzaygpDQp3b24ndCBhbGxvY2F0ZSBtZW1v
cnkgZm9yIHZhbGlkX21hc2sgYW5kICBiaXRtYXBfY2xlYXIoKSBpbiBvZl9ncGlvY2hpcF9pbml0
X3ZhbGlkX21hc2soKQ0KY3Jhc2hlcy4gTWF5IGJlIHdlIG5lZWQgdG8gbW9kaWZ5IHRoZSBjb2Rl
IGxpa2UgdGhpcyB0byBmaXggdGhlIGNyYXNoLg0KDQppZiAoY2hpcC0+dmFsaWRfbWFzaykNCmJp
dG1hcF9jbGVhcihjaGlwLT52YWxpZF9tYXNrLCBzdGFydCwgY291bnQpOw0KZWxzZQ0KcHJfd2Fy
bigidmFsaWRfbWFzayBpcyBub3Qgc2V0ICIpOw0KDQoNCg0KPiBJTUhPIHRoYXQncyBzb21ldGhp
bmcgdGhhdCBzaG91bGQgYmUgZml4ZWQgc2VwYXJhdGVseSwgcG9zc2libHkgZm9yIHY0LjE5Lg0K
Pg0KPiBMb29rcyBsaWtlIGFsbCBvdGhlciBSZW5lc2FzIGdwaW8gZHJpdmVycyAoc29tZSBjb21i
aW5lZCBwaW5jdHJsL2dwaW8pLA0KPiBleGNlcHQgZm9yIGdwaW8tZW0uYywgYWxzbyBmYWlsIHRv
IHNldCBncGlvX2NoaXAub2Zfbm9kZS4gV2lsbCBoYXZlIGEgY2xvc2VyDQo+IGxvb2suLi4NCg0K
UmVnYXJkcywNCkJpanUNCg0KDQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEx0ZCwgRHVr
ZXMgTWVhZG93LCBNaWxsYm9hcmQgUm9hZCwgQm91cm5lIEVuZCwgQnVja2luZ2hhbXNoaXJlLCBT
TDggNUZILCBVSy4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYgV2FsZXMgdW5kZXIgUmVnaXN0ZXJl
ZCBOby4gMDQ1ODY3MDkuDQo=
