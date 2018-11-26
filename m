Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:30882 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbeK0Cqi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 21:46:38 -0500
From: Avri Altman <Avri.Altman@wdc.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: RE: [PATCH 1/2] mmc: core: use mrq->sbc when sending CMD23 for RPMB
Date: Mon, 26 Nov 2018 15:52:06 +0000
Message-ID: <DM6PR04MB49237DADD4A3419028CDCF8BFCD70@DM6PR04MB4923.namprd04.prod.outlook.com>
References: <20181126133814.1185-1-wsa+renesas@sang-engineering.com>
 <20181126133814.1185-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181126133814.1185-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

PiANCj4gV2hlbiBzZW5kaW5nIG91dCBDTUQyMyBpbiB0aGUgYmxrIHByZXBhcmF0aW9uLCB0aGUg
Y29tbWVudCB0aGVyZQ0KPiByaWdodGZ1bGx5IHNheXM6DQo+IA0KPiAJICogSG93ZXZlciwgaXQg
aXMgbm90IHN1ZmZpY2llbnQgdG8ganVzdCBzZW5kIENNRDIzLA0KPiAJICogYW5kIGF2b2lkIHRo
ZSBmaW5hbCBDTUQxMiwgYXMgb24gYW4gZXJyb3IgY29uZGl0aW9uDQo+IAkgKiBDTUQxMiAoc3Rv
cCkgbmVlZHMgdG8gYmUgc2VudCBhbnl3YXkuIFRoaXMsIGNvdXBsZWQNCj4gCSAqIHdpdGggQXV0
by1DTUQyMyBlbmhhbmNlbWVudHMgcHJvdmlkZWQgYnkgc29tZQ0KPiAJICogaG9zdHMsIG1lYW5z
IHRoYXQgdGhlIGNvbXBsZXhpdHkgb2YgZGVhbGluZw0KPiAJICogd2l0aCB0aGlzIGlzIGJlc3Qg
bGVmdCB0byB0aGUgaG9zdC4gSWYgQ01EMjMgaXMNCj4gCSAqIHN1cHBvcnRlZCBieSBjYXJkIGFu
ZCBob3N0LCB3ZSdsbCBmaWxsIHNiYyBpbiBhbmQgbGV0DQo+IAkgKiB0aGUgaG9zdCBkZWFsIHdp
dGggaGFuZGxpbmcgaXQgY29ycmVjdGx5Lg0KPiANCj4gTGV0J3MgZG8gdGhpcyBiZWhhdmlvdXIg
Zm9yIFJQTUIgYXMgd2VsbCwgYW5kIG5vdCBzZW5kIENNRDIzDQo+IGluZGVwZW5kZW50bHkuIE90
aGVyd2lzZSBJUCBjb3JlcyAobGlrZSBSZW5lc2FzIFNESEkpIG1heSB0aW1lb3V0DQo+IGJlY2F1
c2Ugb2YgYXV0b21hdGljIENNRDIzL0NNRDEyIGhhbmRsaW5nLg0KPiANCj4gUmVwb3J0ZWQtYnk6
IE1hc2FoYXJ1IEhheWFrYXdhIDxtYXNhaGFydS5oYXlha2F3YS5yeUByZW5lc2FzLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5n
LmNvbT4NCj4gVGVzdGVkLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29t
Pg0KUmV2aWV3ZWQtYnk6IEF2cmkgQWx0bWFuIDxhdnJpLmFsdG1hbkB3ZGMuY29tPg0KDQo=
