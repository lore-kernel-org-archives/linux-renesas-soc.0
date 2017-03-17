Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:46205 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750987AbdCQN1D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 09:27:03 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        RTCLINUX <rtc-linux@googlegroups.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/5] ARM: dts: r7s72100: add rtc clock to device tree
Date: Fri, 17 Mar 2017 13:20:09 +0000
Message-ID: <SG2PR06MB1165ECF439A79E31978ACF228A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-4-chris.brandt@renesas.com>
 <CAMuHMdXAvMoLu5azcBfX5pH_KYApcYSipBktpbfLybvnCG+bwg@mail.gmail.com>
In-Reply-To: <CAMuHMdXAvMoLu5azcBfX5pH_KYApcYSipBktpbfLybvnCG+bwg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIEZyaWRheSwgTWFyY2ggMTcsIDIwMTcsIEdlZXJ0IFV5dHRlcmhvZXZl
biB3cm90ZToNCj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9yN3M3MjEwMC5kdHNpDQo+ID4g
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcjdzNzIxMDAuZHRzaQ0KPiA+IEBAIC0xMTcsNiArMTE3
LDE1IEBADQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stb3V0cHV0LW5hbWVzID0g
Im9zdG0wIiwgIm9zdG0xIjsNCj4gPiAgICAgICAgICAgICAgICAgfTsNCj4gPg0KPiA+ICsgICAg
ICAgICAgICAgICBtc3RwNl9jbGtzOiBtc3RwNl9jbGtzQGZjZmUwNDJjIHsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI3czcyMTAwLW1zdHAtY2xvY2tzIiwNCj4g
InJlbmVzYXMsY3BnLW1zdHAtY2xvY2tzIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHhmY2ZlMDQyYyA0PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3Mg
PSA8JnAwX2Nsaz47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2staW5kaWNlcyA9
IDxSN1M3MjEwMF9DTEtfUlRDPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1v
dXRwdXQtbmFtZXMgPSAicnRjMCI7DQo+IA0KPiAicnRjIj8gVGhlcmUncyBvbmx5IG9uZS4NCg0K
VGhlIHJ0Yy1zaC5jIGNvZGUgd2FudHMgdG8gaGF2ZSBhIG51bWJlciBhdCB0aGUgZW5kLiBTbyBp
ZiBJIGp1c3QgcHV0ICJydGMiIGFzIHRoZSBjbG9jayBuYW1lLCBpdCBkb2VzIG5vdCBmaW5kIGl0
LiBBZ2FpbiwgSSBkaWRuJ3Qgd2FudCB0byBicmVhayBhbnkgU0ggYnVpbGRzLCBzbyBJIGp1c3Qg
Y2hhbmdlZCB0aGUgRFQgdG8gbWF0Y2ggdGhlIGRyaXZlci4NCg0KDQpbIGZyb20gdGhlIHJ0Yy1z
aC5jIGNvZGUgXQ0KDQoJY2xrX2lkID0gcGRldi0+aWQ7DQoJLyogV2l0aCBhIHNpbmdsZSBkZXZp
Y2UsIHRoZSBjbG9jayBpZCBpcyBzdGlsbCAicnRjMCIgKi8NCglpZiAoY2xrX2lkIDwgMCkNCgkJ
Y2xrX2lkID0gMDsNCg0KCXNucHJpbnRmKGNsa19uYW1lLCBzaXplb2YoY2xrX25hbWUpLCAicnRj
JWQiLCBjbGtfaWQpOw0KDQoJcnRjLT5jbGsgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgY2xr
X25hbWUpOw0KCWlmIChJU19FUlIocnRjLT5jbGspKSB7DQoJCS8qDQoJCSAqIE5vIGVycm9yIGhh
bmRsaW5nIGZvciBydGMtPmNsayBpbnRlbnRpb25hbGx5LCBub3QgYWxsDQoJCSAqIHBsYXRmb3Jt
cyB3aWxsIGhhdmUgYSB1bmlxdWUgY2xvY2sgZm9yIHRoZSBSVEMsIGFuZA0KCQkgKiB0aGUgY2xr
IEFQSSBjYW4gaGFuZGxlIHRoZSBzdHJ1Y3QgY2xrIHBvaW50ZXIgYmVpbmcNCgkJICogTlVMTC4N
CgkJICovDQoJCXJ0Yy0+Y2xrID0gTlVMTDsNCgl9DQoNCgljbGtfZW5hYmxlKHJ0Yy0+Y2xrKTsN
Cg0KDQpDaGVlcnMNCg0KQ2hyaXMNCg0K
