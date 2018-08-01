Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:17924 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387411AbeHAJEl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Aug 2018 05:04:41 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/4] gpio: rcar: Enhance gpio-ranges support
Date: Wed, 1 Aug 2018 07:20:20 +0000
Message-ID: <TYAPR01MB211178DDD3B0C636DACEE539B82D0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
References: <1532685089-35645-1-git-send-email-biju.das@bp.renesas.com>
 <1532685089-35645-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVqSbeGCN-Oq0R2CY5fOoG3ncdc_MtAp6M5+SoW4xXQZw@mail.gmail.com>
In-Reply-To: <CAMuHMdVqSbeGCN-Oq0R2CY5fOoG3ncdc_MtAp6M5+SoW4xXQZw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzRdIGdwaW86IHJjYXI6IEVuaGFu
Y2UgZ3Bpby1yYW5nZXMgc3VwcG9ydA0KDQo+IEEgc2ltcGxlIHdheSB0byB3b3JrIGFyb3VuZCB0
aGlzIGlzIHRvIHNldCBuZ3Bpb3MgdG8gdGhlIGhpZ2hlc3QgYml0IG51bWJlciBpbg0KPiB1c2Ug
KyAxLiBCdXQgeW91IHN0aWxsIG5lZWQgYSBtZWNoYW5pc20gdG8gYXZvaWQgYWNjZXNzaW5nIHRo
ZSB1bnVzZWQgYml0cyBpbg0KPiB0aGUgZ2FwIGJldHdlZW4gMTYgYW5kIDI3Lg0KPg0KSSB3aWxs
IHNlbmQgVjIgd2l0aCBmb2xsb3dpbmcgY2hhbmdlcw0KDQoxKSBEdCBiaW5kaW5nIHJlbGF0ZWQg
dG8gY2hhbmdlcyBmb3IgYWRkaW5nIG9wdGlvbmFsIHByb3BlcnR5ICIgZ3Bpby1yZXNlcnZlZC1y
YW5nZXMiIG9uIHJlbmVzYXMgYmluZGluZyBkb2N1bWVudGF0aW9uDQoyKSBTb0MgRHRzaSB3aXRo
ICAiIGdwaW8tcmFuZ2VzID0gPCZwZmMgMCA5NiAzMD4iDQozKSBTb0MgRHRzaSB3aXRoIiBncGlv
LXJlc2VydmVkLXJhbmdlcyA9IDwxNyAxMD4iIHdoaWNoIGRlZmluZXMgdW51c2VkIGdwaW9zDQo0
KSBIYW5kbGUgdW51c2VkIGdwaW9zIGluDQogICAgICAgYSkgZ3Bpb19yY2FyX3JlcXVlc3QNCiAg
ICAgICBiKSBncGlvX3JjYXJfc2V0X211bHRpcGxlDQogICAgICAgYykgIGdwaW9fcmNhcl9yZXN1
bWUNCg0KUmVnYXJkcywNCkJpanUNCg0KDQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEx0
ZCwgRHVrZXMgTWVhZG93LCBNaWxsYm9hcmQgUm9hZCwgQm91cm5lIEVuZCwgQnVja2luZ2hhbXNo
aXJlLCBTTDggNUZILCBVSy4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYgV2FsZXMgdW5kZXIgUmVn
aXN0ZXJlZCBOby4gMDQ1ODY3MDkuDQo=
