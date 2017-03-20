Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:51977 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754312AbdCTQ1T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 12:27:19 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        RTCLINUX <rtc-linux@googlegroups.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/5] rtc: Add rtc-sh
Date: Mon, 20 Mar 2017 16:26:46 +0000
Message-ID: <SG2PR06MB11650F098CFD2BCCB74C823B8A3A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-3-chris.brandt@renesas.com>
 <CAMuHMdVu0dQjptyW0F5YS+V6sixXTM3P6VWq2=8BQ5njUOXf-Q@mail.gmail.com>
 <SG2PR06MB1165A9931C930DF9BCD5C0A98A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdW0nHiZkE_RxVLX3G0MuwQLPHVFyNq5C1tx0yAqDQefaA@mail.gmail.com>
 <SG2PR06MB11653BB788CADBEE78FE4CF58A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdWs3NtKLiBnKCmxGYNBW3zzWYydj=JGKr+mH7ao97L2_Q@mail.gmail.com>
 <20170317150524.oijto6gtjxycdnwn@piout.net>
 <SG2PR06MB1165819F41CF40562F44F08B8A3A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdWxs4Xwc0T5AHL73ZtF6r8pN9v6g-GEzozdLvTc4j4aSw@mail.gmail.com>
In-Reply-To: <CAMuHMdWxs4Xwc0T5AHL73ZtF6r8pN9v6g-GEzozdLvTc4j4aSw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIE1vbmRheSwgTWFyY2ggMjAsIDIwMTcsIEdlZXJ0IFV5dHRlcmhvZXZl
biB3cm90ZToNCj4gPiArICAgICAgIHJ0YzogcnRjQGZjZmYxMDAwIHsNCj4gPiArICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI3czcyMTAwLXJ0YyIsICJyZW5lc2FzLHNoLXJ0
YyI7DQo+ID4gKyAgICAgICAgICAgICAgIHJlZyA9IDwweGZjZmYxMDAwIDB4MmU+Ow0KPiA+ICsg
ICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjc2IElSUV9UWVBFX0VER0VfUklT
SU5HDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR0lDX1NQSSAyNzcgSVJRX1RZ
UEVfRURHRV9SSVNJTkcNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHSUNfU1BJ
IDI3OCBJUlFfVFlQRV9FREdFX1JJU0lORz47DQo+ID4gKyAgICAgICAgICAgICAgIGludGVycnVw
dC1uYW1lcyA9ICJhbGFybSIsICJwZXJpb2QiLCAiY2FycnkiOw0KPiA+ICsgICAgICAgICAgICAg
ICBjbG9ja3MgPSA8Jm1zdHA2X2Nsa3MgUjdTNzIxMDBfQ0xLX1JUQz4sIDwmcnRjX3gxX2Nsaz4s
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICA8JmV4dGFsX2Nsaz4gLCA8JnJ0Y194M19j
bGs+Ow0KPiA+ICsgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJmY2siLCAicnRjX3gxIiwg
ImV4dGFsIiwgInJ0Y194MyI7DQo+ID4gKyAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8
JmNwZ19jbG9ja3M+Ow0KPiA+ICsgICAgICAgICAgICAgICBjb3VudC1zb3VyY2UgPSAicnRjX3gx
IjsgICAgPDw8PDw8PCB0aGlzIHdvdWxkIGJlIGluIHRoZQ0KPiBib2FyZCBkdHMgZmlsZQ0KPiAN
Cj4gSU1ITyB0aGF0J3Mgc29mdHdhcmUgcG9saWN5LCBub3QgaGFyZHdhcmUgZGVzY3JpcHRpb24s
IHNvIGl0IGRvZXNuJ3QNCj4gYmVsb25nIGluIERULg0KDQpSZWFsbHk/IEknbSBzbyBjb25mdXNl
ZCBhYm91dCB3aGF0IGlzIGFuZCBpc24ndCB0aGUgcmVzcG9uc2liaWxpdHkgb2YgRFQuDQoNCg0K
PiBIb3dldmVyLCBieSBzY2FubmluZyB0aGUgbGlzdCBvZiBhbGxvd2VkIGNsb2NrIG5hbWVzLCBh
bmQgbG9va2luZyBhdCBjbG9jaw0KPiByYXRlcywgdGhlIGRyaXZlciBjYW4gZmluZCBhIHN1aXRh
YmxlIGNsb2NrIGl0c2VsZi4NCg0KWWVzLCBJIGNvdWxkIG1ha2UgdGhlIHNlbGVjdGlvbiBhdXRv
bWF0aWMgYnkgbG9va2luZyB0aGF0IHRoZSBjbG9jayBuYW1lcyAoYW5kDQpJIHdpbGwgZG8gdGhh
dCBmb3IgdGhpcyBkcml2ZXIpLCBidXQgd2hhdCBhYm91dCB0aGUgY2FzZSB3aGVyZSBhIHVzZXIg
bmVlZHMNCnRvIHNlbGVjdCBzb21ldGhpbmcgZnJvbSBhIGxpc3Qgb2YgcG9zc2libGUgSFcgb3B0
aW9ucz8gSW4gb3RoZXIgd29yZHMsIHdoZXJlDQpkb2VzICdzb2Z0d2FyZSBvcHRpb24nIHNlbGVj
dGlvbiBzdHVmZiBnbyBpZiBub3QgaW4gdGhlIERUPw0KDQoNClRoYW5rcywNCkNocmlzDQo=
