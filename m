Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:54036 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751087AbdCQNsm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 09:48:42 -0400
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
Date: Fri, 17 Mar 2017 13:48:00 +0000
Message-ID: <SG2PR06MB116586A6CF6082C2CF0341AD8A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-4-chris.brandt@renesas.com>
 <CAMuHMdXAvMoLu5azcBfX5pH_KYApcYSipBktpbfLybvnCG+bwg@mail.gmail.com>
 <SG2PR06MB1165ECF439A79E31978ACF228A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdWm=4My_H-i-fNpXY9knSLpN+-zNarC5Xdq08kgvauM_w@mail.gmail.com>
In-Reply-To: <CAMuHMdWm=4My_H-i-fNpXY9knSLpN+-zNarC5Xdq08kgvauM_w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIEZyaWRheSwgTWFyY2ggMTcsIDIwMTcsIEdlZXJ0IFV5dHRlcmhvZXZl
biB3cm90ZToNCj4gU28gaW4gdGhlIGFic2VuY2Ugb2YgYW4gInJ0YzAiIGNsb2NrIGluIHRoZSBk
ZXZpY2Ugbm9kZSAoeW91IGRvbid0IGhhdmUNCj4gImNsb2NrLW5hbWVzIiBwcm9wZXJ0aWVzIGlu
IHRoZSBydGMgZGV2dmljZSBub2RlIHlldCksIGl0IHdpbGwgZmFsbCBiYWNrDQo+IHRvIGNsa19n
ZXRfc3lzKCksIGFuZCB3aWxsIGZpbmQgdGhlIGdsb2JhbCAicnRjMCIgY2xvY2suIFVubGVzcyB5
b3UgY2FsbA0KPiBpdCAicnRjIi4uLg0KPiANCj4gTW9zdCBkcml2ZXJzIHVzaW5nIGEgc2luZ2xl
IGNsb2NrIGp1c3QgcGFzcyBOVUxMIGluc3RlYWQgb2YgYSBuYW1lLCBzbyBpdA0KPiB3aWxsIG1h
dGNoIHRoZSBmaXJzdCBjbG9jayBmb3VuZC4NCj4gDQo+IEkgdGhpbmsgdGhlIHNpbXBsZXN0IHNv
bHV0aW9uIGlzIHRvIGNoZWNrIGlmIHlvdXIgZGV2aWNlIGlzIGluc3RhbnRpYXRlZA0KPiBmcm9t
IERUIChwZGV2LT5kZXYub2Zfbm9kZSAhPSBOVUxMKSwgYW5kIHBhc3MgTlVMTCAob3IgImZjayIs
IHdoZW4geW91IGFkZA0KPiBtdWx0aXBsZSBjbG9ja3MgdG8gdGhlIERUIGJpbmRpbmdzKSB0byBk
ZXZtX2Nsa19nZXQoKSBpZiB0aGF0J3MgdGhlIGNhc2UuDQoNCg0KT0ssIHNvIGxlYXZlIGN1cnJl
bnQgU3VwZXJIIGNvZGUgdGhlIHdheSBpdCBpcywgYnV0IGFkZCB0aGUgY2FzZSBmb3INCihwZGV2
LT5kZXYub2Zfbm9kZSAhPSBOVUxMKSBhbmQgZG8gdGhpbmdzIHRoZSAnbmV3IHdheScgc28gSSBj
YW4gaGF2ZQ0KYW4gUlRDIGNsb2NrIG5hbWUgb2YgInJ0YyIuDQoNClF1ZXN0aW9uOiBJcyB5b3Vy
IGlkZWEgdG8gYWRkIGFsbCB0aGUgY2xvY2tzIChYMSwgWDMsIEVYVEFMKSwgYnV0IHB1dCB0aGUN
CmZpcnN0IG9uZSBhcyB0aGUgcGVyaXBoZXJhbCBjbG9jayAodGhlIG9uZSB0aGF0IHJ1bnMgdGhl
IHJlZ2lzdGVyIGludGVyZmFjZSAncDAnKT8NCg0KDQpDaHJpcw0KDQo=
