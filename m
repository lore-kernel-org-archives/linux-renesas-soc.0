Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:62736 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755652AbeDYQM2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Apr 2018 12:12:28 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Chris Paterson <Chris.Paterson2@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH/RFC] ARM: shmobile: defconfig: Enable LPAE
Date: Wed, 25 Apr 2018 16:12:25 +0000
Message-ID: <TY1PR01MB1770174A08B37248E1CBFED3C08F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1524671610-13908-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYAPR01MB22857E6D2C5C38075841DAA5B78F0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB22857E6D2C5C38075841DAA5B78F0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gQ2hyaXMsDQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSC9SRkNdIEFSTTogc2htb2JpbGU6
IGRlZmNvbmZpZzogRW5hYmxlIExQQUUNCj4NCj4gSGVsbG8gRmFiLA0KPg0KPiA+IEZyb206IEZh
YnJpemlvIENhc3RybyBbbWFpbHRvOmZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbV0NCj4g
PiBTZW50OiAyNSBBcHJpbCAyMDE4IDE2OjU0DQo+ID4NCj4gPiBPbiBpV2F2ZSdzIGl3ZzIwZCBE
RFIxIDUxMk1CIG1lbW9yeSBjYW5ub3QgYmUgYWNjZXNzZWQgd2l0aCAzMi1iaXQNCj4gcy9pd2cy
MGQvaXdnMjBtDQoNCllvdSBhcmUgcmlnaHQsIHRoYW5rIHlvdSBmb3Igc3BvdHRpbmcgdGhpcyEN
CkknbGwgc2VuZCBhIHYyIHRvIGZpeCB0aGlzLg0KDQpDaGVlcnMsDQpGYWINCg0KPg0KPiBSZWdh
cmRzLCBDaHJpcw0KPg0KPiA+IGFkZHJlc3NlcywgaGVuY2Ugd2UgbmVlZCBMUEFFLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVz
YXMuY29tPg0KPiA+IC0tLQ0KPiA+IFRoaXMgaW5mb3JtYXRpb24gaXMgbWVudGlvbmVkIGluIHRo
ZSAiUlovRyBTZXJpZXMgVXNlcuKAmXMgTWFudWFsOiBIYXJkd2FyZSIsDQo+ID4gQ2hhcHRlciAy
LCBBcmVhIE1hcC4gSXMgdGhpcyBwYXRjaCBnb2luZyB0byBicmVhayB0aGUgZnVuY3Rpb25hbGl0
eSBvZiBvdGhlcg0KPiA+IGJvYXJkcz8gQ29tbWVudHMgd2VsY29tZS4NCj4gPg0KPiA+ICBhcmNo
L2FybS9jb25maWdzL3NobW9iaWxlX2RlZmNvbmZpZyB8IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdz
L3NobW9iaWxlX2RlZmNvbmZpZw0KPiA+IGIvYXJjaC9hcm0vY29uZmlncy9zaG1vYmlsZV9kZWZj
b25maWcNCj4gPiBpbmRleCBkZDk1ZDM5Li4yMWIyNWU5IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gv
YXJtL2NvbmZpZ3Mvc2htb2JpbGVfZGVmY29uZmlnDQo+ID4gKysrIGIvYXJjaC9hcm0vY29uZmln
cy9zaG1vYmlsZV9kZWZjb25maWcNCj4gPiBAQCAtMjMsNiArMjMsNyBAQCBDT05GSUdfQVJDSF9S
OEE3NzkyPXkNCj4gPiAgQ09ORklHX0FSQ0hfUjhBNzc5Mz15DQo+ID4gIENPTkZJR19BUkNIX1I4
QTc3OTQ9eQ0KPiA+ICBDT05GSUdfQVJDSF9TSDczQTA9eQ0KPiA+ICtDT05GSUdfQVJNX0xQQUU9
eQ0KPiA+ICBDT05GSUdfUEwzMTBfRVJSQVRBXzU4ODM2OT15DQo+ID4gIENPTkZJR19BUk1fRVJS
QVRBXzc1NDMyMj15DQo+ID4gIENPTkZJR19QQ0k9eQ0KPiA+IC0tDQo+ID4gMi43LjQNCg0KDQoN
Cg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgTHRkLCBEdWtlcyBNZWFkb3csIE1pbGxib2Fy
ZCBSb2FkLCBCb3VybmUgRW5kLCBCdWNraW5naGFtc2hpcmUsIFNMOCA1RkgsIFVLLiBSZWdpc3Rl
cmVkIGluIEVuZ2xhbmQgJiBXYWxlcyB1bmRlciBSZWdpc3RlcmVkIE5vLiAwNDU4NjcwOS4NCg==
