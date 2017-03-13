Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "kishon@ti.com" <kishon@ti.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] phy: rcar-gen3-usb2: fix implementation for runtime PM
Date: Mon, 13 Mar 2017 23:39:20 +0000
Message-ID: <PS1PR06MB1692AE431C1F92F39CBBAAF3D8250@PS1PR06MB1692.apcprd06.prod.outlook.com>
References: <1489397969-26153-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <983f7c65-38f8-a04f-f809-ab6bbd8ac8f5@cogentembedded.com>
In-Reply-To: <983f7c65-38f8-a04f-f809-ab6bbd8ac8f5@cogentembedded.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkhDQoNCj4gRnJvbTogU2VyZ2VpIFNodHlseW92DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMTMs
IDIwMTcgODo1NyBQTQ0KPiANCj4gT24gMDMvMTMvMjAxNyAxMjozOSBQTSwgWW9zaGloaXJvIFNo
aW1vZGEgd3JvdGU6DQo+IA0KPiA+IFRoaXMgcGF0Y2ggZml4ZXMgYW4gaXNzdWUgdGhhdCB0aGlz
IGRyaXZlciBkb2Vzbid0IHRha2UgY2FyZSBvZiB0aGUgcnVudGltZQ0KPiA+IFBNLiBUaGlzIGNv
ZGUgYXNzdW1lZCB0aGF0IGRldm1fcGh5X2NyZWF0ZSgpIGNhbGxlZCBwbV9ydW50aW1lX2VuYWJs
ZShkZXYpLA0KPiA+IGJ1dCBpdCBtaXN1bmRlcnN0b29kIHRoZSBkZXZfcGh5X2NyZWF0ZSgpJ3Mg
c3BlY2lmaWNhdGlvbi4NCj4gPiBUaGlzIGRyaXZlciBzaG91bGQgY2FsbCBpdHMgb3duIHBtX3J1
bnRpbWVfcG0oKSBiZWZvcmUgZGV2X3BoeV9jcmVhdGUoKS4NCj4gDQo+ICAgICBZb3UgcHJvYmFi
bHkgbWVhbnQgcG1fcnVudGltZV9lbmFibGUoKT8gU29ycnkgZm9yIG5vdCBub3RpY2luZyB0aGUg
MXN0IHRpbWUuLi4NCg0KWWVzLCBJIG1lYW50IHBtX3J1bnRpbWVfZW5hYmxlKCkuIFRoYW5rIHlv
dSBmb3IgdGhlIHJldmlldyBhZ2FpbiBhbmQgYWdhaW4uDQoNCkJlc3QgcmVnYXJkcywNCllvc2hp
aGlybyBTaGltb2RhDQoNCg==
