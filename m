Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:45355 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728008AbeISPc5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 11:32:57 -0400
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
Subject: RE: [PATCH 3/5] pinctrl: sh-pfc: r8a77470: Add QSPI0 pin groups
Date: Wed, 19 Sep 2018 09:55:44 +0000
Message-ID: <TY1PR01MB17709400F0567517825FACBFC01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1537278478-1744-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537278478-1744-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVNnKTb4Y+Pe547PCzb=sCsF-0=fw28A-+Zo+EhNAgWSw@mail.gmail.com>
In-Reply-To: <CAMuHMdVNnKTb4Y+Pe547PCzb=sCsF-0=fw28A-+Zo+EhNAgWSw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzVdIHBpbmN0cmw6IHNoLXBm
YzogcjhhNzc0NzA6IEFkZCBRU1BJMCBwaW4gZ3JvdXBzDQo+DQo+IE9uIFR1ZSwgU2VwIDE4LCAy
MDE4IGF0IDM6NDggUE0gRmFicml6aW8gQ2FzdHJvDQo+IDxmYWJyaXppby5jYXN0cm9AYnAucmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCBRU1BJMCBwaW4gZ3JvdXBzIGFuZCBmdW5jdGlvbiB0
byB0aGUgUjhBNzc0NzAgU29DLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2Fz
dHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEJp
anUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4NCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+DQo+IEJ1dCBJIG1pc3Nl
ZCBRU1BJMS4uLg0KDQrwn5iDIHNhbWUgdGhpbmcgaGVyZSwgY2FuJ3QgdGVzdCBRU1BJMSBlYXNp
bHksIHNvIGZvciBub3cgd2UgYXJlIGdvaW5nIHRvIGxlYXZlIHRoaXMgYmVoaW5kLg0KDQpUaGFu
a3MsDQpGYWINCg0KPg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4NCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQNCj4NCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3Mg
bG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPg0KPiBJ
biBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15
c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0KDQoNCg0KUmVuZXNhcyBF
bGVjdHJvbmljcyBFdXJvcGUgTHRkLCBEdWtlcyBNZWFkb3csIE1pbGxib2FyZCBSb2FkLCBCb3Vy
bmUgRW5kLCBCdWNraW5naGFtc2hpcmUsIFNMOCA1RkgsIFVLLiBSZWdpc3RlcmVkIGluIEVuZ2xh
bmQgJiBXYWxlcyB1bmRlciBSZWdpc3RlcmVkIE5vLiAwNDU4NjcwOS4NCg==
