Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-db5eur01on0051.outbound.protection.outlook.com ([104.47.2.51]:59776
	"EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752661AbcGDHnr (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 4 Jul 2016 03:43:47 -0400
From: Peter Chen <peter.chen@nxp.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linux PM list <linux-pm@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: RE: [PATCH 2/7] arm: mach-shmobile: pm-rmobile: add missing
 of_node_put after calling of_parse_phandle
Date: Mon, 4 Jul 2016 02:10:04 +0000
Message-ID: <HE1PR04MB14504D0A5905A777452DC57D8B380@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <1467366121-14120-1-git-send-email-peter.chen@nxp.com>
 <1467366121-14120-3-git-send-email-peter.chen@nxp.com>
 <CAMuHMdVE8VzPunLzr7WO-kzcg25rKvFkoQcjJ4czwrQxX_obiw@mail.gmail.com>
In-Reply-To: <CAMuHMdVE8VzPunLzr7WO-kzcg25rKvFkoQcjJ4czwrQxX_obiw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

IA0KPk9uIEZyaSwgSnVsIDEsIDIwMTYgYXQgMTE6NDEgQU0sIFBldGVyIENoZW4gPHBldGVyLmNo
ZW5AbnhwLmNvbT4gd3JvdGU6DQo+PiBvZl9ub2RlX3B1dCBuZWVkcyB0byBiZSBjYWxsZWQgd2hl
biB0aGUgZGV2aWNlIG5vZGUgd2hpY2ggaXMgZ290IGZyb20NCj4+IG9mX3BhcnNlX3BoYW5kbGUg
aGFzIGZpbmlzaGVkIHVzaW5nLg0KPj4NCj4+IENjOiBTaW1vbiBIb3JtYW4gPGhvcm1zQHZlcmdl
Lm5ldC5hdT4NCj4+IENjOiBNYWdudXMgRGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPg0KPj4g
U2lnbmVkLW9mZi1ieTogUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAuY29tPg0KPg0KPk5BS2Vk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPg0KPj4g
LS0tIGEvYXJjaC9hcm0vbWFjaC1zaG1vYmlsZS9wbS1ybW9iaWxlLmMNCj4+ICsrKyBiL2FyY2gv
YXJtL21hY2gtc2htb2JpbGUvcG0tcm1vYmlsZS5jDQo+PiBAQCAtMjA5LDYgKzIwOSw3IEBAIHN0
YXRpYyB2b2lkIF9faW5pdCBhZGRfc3BlY2lhbF9wZChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLA0K
PmVudW0gcGRfdHlwZXMgdHlwZSkNCj4+ICAgICAgICAgc3BlY2lhbF9wZHNbbnVtX3NwZWNpYWxf
cGRzXS5wZCA9IHBkOw0KPg0KPlRoZSBwZCBwb2ludGVyIGlzIHN0b3JlZCBpbiB0aGUgbGluZSBh
Ym92ZSwgYW5kIHJlbGVhc2VkIGxhdGVyIGluIHB1dF9zcGVjaWFsX3BkcygpLg0KPg0KPj4gICAg
ICAgICBzcGVjaWFsX3Bkc1tudW1fc3BlY2lhbF9wZHNdLnR5cGUgPSB0eXBlOw0KPj4gICAgICAg
ICBudW1fc3BlY2lhbF9wZHMrKzsNCj4+ICsgICAgICAgb2Zfbm9kZV9wdXQocGQpOw0KPg0KPkhl
bmNlIGl0IG11c3Qgbm90IGJlIHJlbGVhc2VkIGhlcmUsIGFzIHRoYXQgd291bGQgY2F1c2UgYSBk
b3VibGUgcmVsZWFzZSB3aGVuDQo+cHV0X3NwZWNpYWxfcGRzKCkgaXMgZXhlY3V0ZWQuDQo+DQoN
ClRoYW5rcywgR2VlcnQsIGl0IGlzIG15IGNhcmVsZXNzLg0KDQpQbGVhc2UgZm9yZ2V0IHRoaXMg
cGF0Y2guDQoNClBldGVyDQo=
