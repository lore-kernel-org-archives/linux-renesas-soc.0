Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:53196 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752006AbdI2RHY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 13:07:24 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: RE: [PATCH] i2c: riic: remove fixed clock restriction
Date: Fri, 29 Sep 2017 17:07:20 +0000
Message-ID: <SG2PR06MB11655C3496F84D05D29095878A7E0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170929153259.105408-1-chris.brandt@renesas.com>
 <CAMuHMdW4yWVwwpzHb4wmj3dfb4-YrsqRu7-O+0G=c_f7EDUzaQ@mail.gmail.com>
In-Reply-To: <CAMuHMdW4yWVwwpzHb4wmj3dfb4-YrsqRu7-O+0G=c_f7EDUzaQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIEZyaWRheSwgU2VwdGVtYmVyIDI5LCAyMDE3IDEsIEdlZXJ0IFV5dHRl
cmhvZXZlbiB3cm90ZToNCj4gPiAtICAgICAgIGlmIChyYXRlICE9IDMzMzI1MDAwKSB7DQo+ID4g
KyAgICAgICBpZiAoIXJhdGUpIHsNCj4gPiAgICAgICAgICAgICAgICAgZGV2X2VycigmcmlpYy0+
YWRhcHRlci5kZXYsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgImludmFsaWQgcGFyZW50
IGNsayAoJWx1KS4gTXVzdCBiZSAzMzMyNTAwMEh6XG4iLA0KPiByYXRlKTsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAiaW52YWxpZCBwYXJlbnQgY2xrICglbHUpXG4iLCByYXRlKTsNCj4g
DQo+IFRoZSBwcmludGVkIHJhdGUgaXMgYWx3YXlzIHplcm8gaGVyZS4NCg0KT0ssIEkgd2lsbCBj
aGFuZ2UgdG8ganVzdDoNCg0KImludmFsaWQgcGFyZW50IGNsb2NrIHJhdGUgb2YgMFxuIg0KDQpD
aHJpcw0KDQo=
