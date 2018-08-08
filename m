Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:26696 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727000AbeHHPBS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Aug 2018 11:01:18 -0400
From: Adnan Ali <adnan.ali@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        batareich batareich <vladimir.barinov@cogentembedded.com>
Subject: RE: Fix RCAR-V3H SoC wrong IPSR9/10 registers
Date: Wed, 8 Aug 2018 12:41:40 +0000
Message-ID: <TYAPR01MB206461FCFEB57C956975187DDA260@TYAPR01MB2064.jpnprd01.prod.outlook.com>
References: <TYAPR01MB20648212DBBF5ECA75BD3FBCDA260@TYAPR01MB2064.jpnprd01.prod.outlook.com>
 <CAMuHMdWxYfrdMVCYT3UmnRDLSmDn7RnCnJjLxhc9EDa5NErK5g@mail.gmail.com>
In-Reply-To: <CAMuHMdWxYfrdMVCYT3UmnRDLSmDn7RnCnJjLxhc9EDa5NErK5g@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkNCg0KVGhhbmtzICBmb3IgeW91ciByZXZpZXcuIEknbSB1c2luZyBsaW5rIGZyb20gZWxpbnV4
IG1heSBiZSBJIG5lZWQgdG8gc2VuZA0KSXQgdG8gc29tZW9uZSB3aG8ncyBtYWludGFpbmluZyB0
aGlzIGJyYW5jaC4gSSBoYXZlIGlzc3VlcyBzZW5kaW5nDQpwYXRjaCBmcm9tICBjb29wZXJhdGUg
ZG9tYWluIHZpYSBzZW5kLWVtYWlsLg0KDQpUaGlzIGZpbGUgaXMgY2FsbGVkIGRyaXZlcnMvcGlu
Y3RybC9zaC1wZmMvcGZjLXI4YTc3OTgwLmMgaW4gdXBzdHJlYW0gTGludXguDQo+Pj4gVGhhbmtz
DQoNCj4gICAgICAgfSwNCj4gICAgICAgeyBQSU5NVVhfQ0ZHX1JFRygiSVBTUjEwIiwgMHhlNjA2
MDIyOCwgMzIsIDQpIHsNCj4gLSAgICAgICAgICAgICBJUDhfMzFfMjgNCj4gLSAgICAgICAgICAg
ICBJUDhfMjdfMjQNCj4gLSAgICAgICAgICAgICBJUDhfMjNfMjANCj4gLSAgICAgICAgICAgICBJ
UDhfMTlfMTYNCj4gLSAgICAgICAgICAgICBJUDhfMTVfMTINCj4gLSAgICAgICAgICAgICBJUDhf
MTFfOA0KPiAtICAgICAgICAgICAgIElQOF83XzQNCj4gLSAgICAgICAgICAgICBJUDhfM18wIH0N
Cj4gKyAgICAgICAgICAgICBJUDlfMzFfMjgNCj4gKyAgICAgICAgICAgICBJUDlfMjdfMjQNCj4g
KyAgICAgICAgICAgICBJUDlfMjNfMjANCj4gKyAgICAgICAgICAgICBJUDlfMTlfMTYNCj4gKyAg
ICAgICAgICAgICBJUDlfMTVfMTINCj4gKyAgICAgICAgICAgICBJUDlfMTFfOA0KPiArICAgICAg
ICAgICAgIElQOV83XzQNCj4gKyAgICAgICAgICAgICBJUDlfM18wIH0NCg0KU2hvdWxkJ3QgdGhh
dCBiZSBJUDEwXy4uLj8NCj4+PiBJIGFjY2lkZW50bHkgc2VudCB5b3Ugd3JvbmcgdmVyc2lvbiBv
ZiBwYXRjaC4gSXRzIGZpeGVkIGluIG9yaWdpbmFsIHZlcnNpb24NCkkgaGF2ZS4NCg0KDQpSZWdh
cmRzDQpBZG5hbg0KDQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEdtYkgsR2VzY2hhZWZ0
c2Z1ZWhyZXIvUHJlc2lkZW50IDogTWljaGFlbCBIYW5uYXdhbGQsIFNpdHogZGVyIEdlc2VsbHNj
aGFmdC9SZWdpc3RlcmVkIG9mZmljZTogRHVlc3NlbGRvcmYsIEFyY2FkaWFzdHJhc3NlIDEwLCA0
MDQ3MiBEdWVzc2VsZG9yZiwgR2VybWFueSxIYW5kZWxzcmVnaXN0ZXIvQ29tbWVyY2lhbCBSZWdp
c3RlcjogRHVlc3NlbGRvcmYsIEhSQiAzNzA4IFVTdC1JRE5yLi9UYXggaWRlbnRpZmljYXRpb24g
bm8uOiBERSAxMTkzNTM0MDYgV0VFRS1SZWcuLU5yLi9XRUVFIHJlZy4gbm8uOiBERSAxNDk3ODY0
Nw0K
