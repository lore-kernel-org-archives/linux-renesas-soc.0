Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:29925 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751039AbdCQNQm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 09:16:42 -0400
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
Date: Fri, 17 Mar 2017 13:16:25 +0000
Message-ID: <SG2PR06MB1165A9931C930DF9BCD5C0A98A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-3-chris.brandt@renesas.com>
 <CAMuHMdVu0dQjptyW0F5YS+V6sixXTM3P6VWq2=8BQ5njUOXf-Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVu0dQjptyW0F5YS+V6sixXTM3P6VWq2=8BQ5njUOXf-Q@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCg0KSGFwcHkgU3QgUGF0cmljaydzIERheSENCg0KICAgIChJIGtub3cgeW91
IGFyZSBub3QgSXJpc2guLi4uYnV0IHlvdSBhcmUgY2xvc2VyIHRvIElyZWxhbmQgdGhhbiBJIGFt
IDspDQoNCg0KT24gRnJpZGF5LCBNYXJjaCAxNywgMjAxNywgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOg0KPiBPbiBUaHUsIE1hciAxNiwgMjAxNyBhdCA2OjUxIFBNLCBDaHJpcyBCcmFuZHQgPGNo
cmlzLmJyYW5kdEByZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gcnRjLXNoIGlzIGEgUlRDIGZv
ciBTdXBlckggYW5kIFJaL0EgU29Dcy4NCj4gDQo+IGFuIFJUQz8NCg0KR29vZCBwb2ludC4gVGhh
dCdzIG1vcmUgYmV0dGVyIDspDQoNCg0KPiA+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ICst
IGNvbXBhdGlibGU6IFNob3VsZCBiZSAicmVuZXNhcyxyN3M3MjEwMC1ydGMiIG9yICJyZW5lc2Fz
LHNoLXJ0YyIgYXMNCj4gPiArYQ0KPiANCj4gcy9vci9hbmQvDQoNCk9LDQoNCg0KPiA+ICsgIGZh
bGxiYWNrLg0KPiA+ICstIHJlZzogcGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2Yg
bWVtb3J5IG1hcHBlZCByZWdpb24uDQo+ID4gKy0gaW50ZXJydXB0czogMyBpbnRlcnJ1cHRzIGZv
ciBhbGFybSwgcGVyaW9kLCBhbmQgY2FycnkuDQo+IA0KPiBJZiB0aGVyZSdzIGEgbmVlZCBmb3Ig
bXVsdGlwbGUgaW50ZXJydXB0cywgaXQncyBhbHdheXMgYSBnb29kIGlkZWEgdG8gdXNlDQo+IGlu
dGVycnVwdC1uYW1lcy4gVGhlIGRhdGFzaGVldCBjYWxscyB0aGVtICJhcm0iLCAicHJkIiwgYW5k
ICJjdXAiLCBidXQgSQ0KPiB3b3VsZG4ndCBvYmplY3QgYWdhaW5zdCAiYWxhcm0iLCAicGVyaW9k
IiwgYW5kICJjYXJyeSIgOy0pDQoNCk9LLiBJJ2xsIGNoYW5nZS4NCkkgbGlrZSB0aGUgbG9uZ2Vy
IG5hbWVzIGFzIHdlbGwgKCJwcmQiIGxvb2tzIHVnbHkpDQoNCg0KPiA+ICstIGNsb2NrczogdGhl
IGNsb2NrIHNvdXJjZSBmb3IgdGhlIFJUQyBjb250cm9sbGVyLg0KPiANCj4gVGhlIGRhdGFzaGVl
dCBtZW50aW9ucyAzIHBvc3NpYmxlIGNsb2NrIHNvdXJjZXM/DQoNClRoZXJlIGlzIHRoZSBjbG9j
ayBzb3VyY2UgdGhhdCBkb2VzIHRoZSBjb3VudGluZyAoUlRDX1gxLCBSVENfWDMsIFhUQUwpLCBh
bmQgdGhlbiBhIGNsb2NrIHNvdXJjZSB0aGF0IHJ1bnMgdGhlIHJlZ2lzdGVyIGludGVyZmFjZSAo
cnVuIG9mZiBvZiB0aGUgcDAgY2xvY2spLiBTbyBJIGp1c3QgbmVlZCB0byB0dXJuIG9uIHRoZSBw
MCBjbG9jayBzbyBJIGNhbiBnZXQgYXQgdGhlIHJlZ2lzdGVycy4gTm90ZSB0aGF0IGlmIHlvdSBk
byBhIGhhcmQgcmVzZXQgd2l0aCBhIFJFU0VUIGJ1dHRvbiwgYW5kIGFsbCB0aGUgcmVnaXN0ZXJz
IGluIHRoZSBjaGlwIGdvIGJhY2sgdG8gdGhlaXIgUE9SIHN0YXRlLCB0aGUgY291bnRlciBzdGls
bCBjb3VudHMgb2ZmIG9mIHRoZSAzMktIeiBYVEFMIGV2ZW4gdGhvdWdoIHRoZSAicGVyaXBoZXJh
bCBjbG9jayIgaXMgc3RvcHBlZCAod2hpY2gganVzdCBtZWFucyB5b3UgY2FuJ3QgZ2V0IHRvIHRo
ZSByZWdpc3RlcnMpLg0KDQpJbiByZWFsaXR5LCB5b3UgaGF2ZSB0byBhc3N1bWUgdGhlIFJUQyBj
b3VudGluZyBzb3VyY2UgaGFzIGFscmVhZHkgYmVlbiBzZXQgdXAgYnkgdS1ib290LCBvciBmcm9t
IGEgcGFzdCByZWJvb3QsIHNvIEkgZG9uJ3QgZG8gYW55IG9mIHRoYXQgc2VsZWN0IGNvbmZpZ3Vy
YXRpb24gYXQgYWxsLg0KDQoNCkNocmlzDQo=
