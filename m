Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:37590 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727820AbeISP1K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 11:27:10 -0400
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
Subject: RE: [PATCH 1/5] pinctrl: sh-pfc: r8a77470: Add I2C4 pin groups
Date: Wed, 19 Sep 2018 09:49:51 +0000
Message-ID: <TY1PR01MB1770F22847E3159F651D08A9C01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1537278478-1744-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537278478-1744-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWuHumoTwWQ4d+ToY8+EvRqXjbXirk=osewg_Uw02_nnA@mail.gmail.com>
In-Reply-To: <CAMuHMdWuHumoTwWQ4d+ToY8+EvRqXjbXirk=osewg_Uw02_nnA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjay4NCg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDEvNV0gcGluY3RybDogc2gtcGZjOiByOGE3NzQ3MDogQWRkIEkyQzQgcGlu
IGdyb3Vwcw0KPg0KPiBIaSBGYWJyaXppbywNCj4NCj4gT24gVHVlLCBTZXAgMTgsIDIwMTggYXQg
Mzo0OCBQTSBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNv
bT4gd3JvdGU6DQo+ID4gQWRkIEkyQzQgcGluIGdyb3VwcyBhbmQgZnVuY3Rpb24gdG8gdGhlIFI4
QTc3NDcwIFNvQy4NCj4NCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPg0KPiBBbnkgc3BlY2lm
aWMgcmVhc29uIHlvdSBhZGRlZCBJMkM0IG9ubHksIGFuZCBub3QgdGhlIG90aGVyIEkyQyBpbnN0
YW5jZXM/DQo+IFVzdWFsbHkgd2UgYWRkIGFsbCBvZiB0aGVtIGluIG9uZSBydW4uDQoNClRoZSBp
d2cyM3MgaXMgYSB2ZXJ5IHNtYWxsIFJhc3BiZXJyeSBQaSBsaWtlIFNCQywgdGhlcmUgaXNuJ3Qg
bXVjaCBvbiBpdCwgdGhlcmVmb3JlIHdlIGNhbid0IHRlc3QgYWxsIG9mIHRoZSBpbnRlcmZhY2Vz
IHdlIHdvdWxkIGxpa2UgdG8gdGVzdC4NClRoZSBwbGFuIGlzIHRvIHN0YXJ0IHN1cHBvcnRpbmcg
d2hhdCB3ZSBjYW4gZWFzaWx5IHRlc3QvYWNjZXNzLCBmb3IgZXZlcnl0aGluZyBlbHNlIHdlIHdv
dWxkIGxpa2UgdG8gd2FpdCBhbmQgc2VlLCBtYXliZSBhdCBhIGxhdGVyIHN0YWdlPw0KDQpUaGFu
a3MsDQpGYWINCg0KPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6
aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXNAYnAucmVuZXNhcy5jb20+DQo+DQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4N
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4NCj4gLS0NCj4gR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC1tNjhrLm9yZw0KPg0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcg
dG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2Ug
dGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cw0KDQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgTHRkLCBEdWtlcyBNZWFkb3csIE1p
bGxib2FyZCBSb2FkLCBCb3VybmUgRW5kLCBCdWNraW5naGFtc2hpcmUsIFNMOCA1RkgsIFVLLiBS
ZWdpc3RlcmVkIGluIEVuZ2xhbmQgJiBXYWxlcyB1bmRlciBSZWdpc3RlcmVkIE5vLiAwNDU4Njcw
OS4NCg==
