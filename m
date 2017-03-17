Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:14315 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751061AbdCQNsm (ORCPT
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
Subject: RE: [PATCH 2/5] rtc: Add rtc-sh
Date: Fri, 17 Mar 2017 13:41:10 +0000
Message-ID: <SG2PR06MB11653BB788CADBEE78FE4CF58A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-3-chris.brandt@renesas.com>
 <CAMuHMdVu0dQjptyW0F5YS+V6sixXTM3P6VWq2=8BQ5njUOXf-Q@mail.gmail.com>
 <SG2PR06MB1165A9931C930DF9BCD5C0A98A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdW0nHiZkE_RxVLX3G0MuwQLPHVFyNq5C1tx0yAqDQefaA@mail.gmail.com>
In-Reply-To: <CAMuHMdW0nHiZkE_RxVLX3G0MuwQLPHVFyNq5C1tx0yAqDQefaA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIEZyaWRheSwgTWFyY2ggMTcsIDIwMTcsIEdlZXJ0IFV5dHRlcmhvZXZl
biB3cm90ZToNCj4gPiBPbiBGcmlkYXksIE1hcmNoIDE3LCAyMDE3LCBHZWVydCBVeXR0ZXJob2V2
ZW4gd3JvdGU6DQo+ID4+IE9uIFRodSwgTWFyIDE2LCAyMDE3IGF0IDY6NTEgUE0sIENocmlzIEJy
YW5kdA0KPiA+PiA8Y2hyaXMuYnJhbmR0QHJlbmVzYXMuY29tPg0KPiA+PiB3cm90ZToNCj4gPj4g
PiArLSBjbG9ja3M6IHRoZSBjbG9jayBzb3VyY2UgZm9yIHRoZSBSVEMgY29udHJvbGxlci4NCj4g
Pj4NCj4gPj4gVGhlIGRhdGFzaGVldCBtZW50aW9ucyAzIHBvc3NpYmxlIGNsb2NrIHNvdXJjZXM/
DQo+ID4NCj4gPiBUaGVyZSBpcyB0aGUgY2xvY2sgc291cmNlIHRoYXQgZG9lcyB0aGUgY291bnRp
bmcgKFJUQ19YMSwgUlRDX1gzLCBYVEFMKSwNCj4gYW5kIHRoZW4gYSBjbG9jayBzb3VyY2UgdGhh
dCBydW5zIHRoZSByZWdpc3RlciBpbnRlcmZhY2UgKHJ1biBvZmYgb2YgdGhlDQo+IHAwIGNsb2Nr
KS4gU28gSSBqdXN0IG5lZWQgdG8gdHVybiBvbiB0aGUgcDAgY2xvY2sgc28gSSBjYW4gZ2V0IGF0
IHRoZQ0KPiByZWdpc3RlcnMuIE5vdGUgdGhhdCBpZiB5b3UgZG8gYSBoYXJkIHJlc2V0IHdpdGgg
YSBSRVNFVCBidXR0b24sIGFuZCBhbGwNCj4gdGhlIHJlZ2lzdGVycyBpbiB0aGUgY2hpcCBnbyBi
YWNrIHRvIHRoZWlyIFBPUiBzdGF0ZSwgdGhlIGNvdW50ZXIgc3RpbGwNCj4gY291bnRzIG9mZiBv
ZiB0aGUgMzJLSHogWFRBTCBldmVuIHRob3VnaCB0aGUgInBlcmlwaGVyYWwgY2xvY2siIGlzIHN0
b3BwZWQNCj4gKHdoaWNoIGp1c3QgbWVhbnMgeW91IGNhbid0IGdldCB0byB0aGUgcmVnaXN0ZXJz
KS4NCj4gPg0KPiA+IEluIHJlYWxpdHksIHlvdSBoYXZlIHRvIGFzc3VtZSB0aGUgUlRDIGNvdW50
aW5nIHNvdXJjZSBoYXMgYWxyZWFkeSBiZWVuDQo+IHNldCB1cCBieSB1LWJvb3QsIG9yIGZyb20g
YSBwYXN0IHJlYm9vdCwgc28gSSBkb24ndCBkbyBhbnkgb2YgdGhhdCBzZWxlY3QNCj4gY29uZmln
dXJhdGlvbiBhdCBhbGwuDQo+IA0KPiBpdCB3b3VsZCBzdGlsbCBiZSBnb29kIHRvIGhhdmUgcGhh
bmRsZXMgdG8gdGhlIGV4dGVybmFsIGNsb2NrIHNvdXJjZXMgYXMNCj4gd2VsbCwgYXMgdGhhdCBk
ZXNjcmliZXMgdGhlIGhhcmR3YXJlIHRvcG9sb2d5Lg0KDQpJJ20gY29uZnVzZWQsIHlvdSBtZWFu
IG1ha2UgbmV3IGNsb2NrcyBub2RlIGZvciBSVENfWDEgKGZpeGVkIGF0IDMyLjc2OGtIWikgYW5k
DQpSVENfWDMgKGZpeGVkIGF0IDRNSHopLCBidXQgdGhlbiBub3QgcmVhbGx5IGRvIGFueXRoaW5n
IHdpdGggdGhlbj8gKHRoZSBkcml2ZXINCmRvZXNuJ3QgbmVlZCB0aGVtKQ0KDQoNCkNocmlzDQo=
