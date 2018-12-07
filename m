Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:5937 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbeLGJnI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 04:43:08 -0500
From: <Tudor.Ambarus@microchip.com>
To: <fabrizio.castro@bp.renesas.com>, <broonie@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
        <computersforpeace@gmail.com>, <boris.brezillon@bootlin.com>,
        <geert+renesas@glider.be>, <horms@verge.net.au>, <richard@nod.at>
CC: <devicetree@vger.kernel.org>, <Chris.Paterson2@renesas.com>,
        <magnus.damm@gmail.com>, <linux-spi@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <biju.das@bp.renesas.com>
Subject: Re: [PATCH 2/4] mtd: spi-nor: Add support for is25lp016d
Date: Fri, 7 Dec 2018 09:43:05 +0000
Message-ID: <4996db3a-26eb-2035-3d98-7aba2bc8630c@microchip.com>
References: <1541075705-1333-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1541075705-1333-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1541075705-1333-3-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3685F6842A18A45BBF47B11B6FC306D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DQoNCk9uIDExLzAxLzIwMTggMDI6MzUgUE0sIEZhYnJpemlvIENhc3RybyB3cm90ZToNCj4gVGhl
IGlzMjVscDAxNmQgaXMgZm91bmQgb24gdGhlIGl3ZzIzcyBmcm9tIGlXYXZlLCB0aGVyZWZvcmUN
Cj4gYWRkIGRyaXZlciBzdXBwb3J0IGZvciBpdCBzbyB0aGF0IHdlIGNhbiB1cHN0cmVhbSBib2Fy
ZCBzdXBwb3J0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXpp
by5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQoNClJldmlld2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0
dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL210ZC9zcGkt
bm9yL3NwaS1ub3IuYyB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyBiL2RyaXZl
cnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQo+IGluZGV4IDk0MDdjYTUuLjg1ZDg2OWIgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQo+ICsrKyBiL2RyaXZlcnMv
bXRkL3NwaS1ub3Ivc3BpLW5vci5jDQo+IEBAIC0xMzUyLDYgKzEzNTIsOCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGZsYXNoX2luZm8gc3BpX25vcl9pZHNbXSA9IHsNCj4gIAl7ICJpczI1Y2Q1MTIi
LCAgSU5GTygweDdmOWQyMCwgMCwgMzIgKiAxMDI0LCAgIDIsIFNFQ1RfNEspIH0sDQo+ICAJeyAi
aXMyNWxxMDQwYiIsIElORk8oMHg5ZDQwMTMsIDAsIDY0ICogMTAyNCwgICA4LA0KPiAgCQkJU0VD
VF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpIH0sDQo+ICsJeyAi
aXMyNWxwMDE2ZCIsIElORk8oMHg5ZDYwMTUsIDAsIDY0ICogMTAyNCwgIDMyLA0KPiArCQkJU0VD
VF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpIH0sDQo+ICAJeyAi
aXMyNWxwMDgwZCIsIElORk8oMHg5ZDYwMTQsIDAsIDY0ICogMTAyNCwgIDE2LA0KPiAgCQkJU0VD
VF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpIH0sDQo+ICAJeyAi
aXMyNWxwMTI4IiwgIElORk8oMHg5ZDYwMTgsIDAsIDY0ICogMTAyNCwgMjU2LA0KPiANCg==
