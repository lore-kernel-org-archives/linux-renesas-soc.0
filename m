Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:22548 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726758AbeGLMMQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jul 2018 08:12:16 -0400
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        "ed.blake@sondrel.com" <ed.blake@sondrel.com>,
        "Stefan.Potyra@elektrobit.com" <Stefan.Potyra@elektrobit.com>
Subject: RE: [PATCH 2/2] serial: 8250_dw: Add compatible string for Renesas
 RZ/N1 UART
Date: Thu, 12 Jul 2018 12:02:55 +0000
Message-ID: <TY1PR01MB1769386775A40ABEF1D891F4F5590@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <1531312174-17489-1-git-send-email-phil.edworthy@renesas.com>
 <1531312174-17489-3-git-send-email-phil.edworthy@renesas.com>
 <CAMuHMdWHPp4kGzPqkhCKOxNSiKgkrb=w76tofSb4SwP5DF5tdw@mail.gmail.com>
 <TY1PR01MB1769F9774BC336B8670704BBF55A0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1769F9774BC336B8670704BBF55A0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIDExIEp1bHkgMjAxOCAxNjowMiwgUGhpbCBFZHdvcnRoeSB3cm90ZToN
Cj4gT24gMTEgSnVseSAyMDE4IDEzOjQyLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+ID4g
T24gV2VkLCBKdWwgMTEsIDIwMTggYXQgMjozMCBQTSBQaGlsIEVkd29ydGh5IHdyb3RlOg0KPiA+
ID4gVGhlIFJlbmVzYXMgUlovTjEgVUFSVCBpcyBiYXNlZCBvbiB0aGUgU3lub3BzeXMgRFcgVUFS
VCwgYnV0IGhhcw0KPiA+ID4gYWRkaXRpb25hbCByZWdpc3RlcnMgZm9yIERNQS4gVGhpcyBwYXRj
aCBkb2VzIG5vdCBhZGRyZXNzIHRoZQ0KPiA+ID4gY2hhbmdlcyByZXF1aXJlZCBmb3IgRE1BIHN1
cHBvcnQsIGl0IHNpbXBseSBhZGRzIHRoZSBjb21wYXRpYmxlIHN0cmluZy4NCj4gPiA+DQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBQaGlsIEVkd29ydGh5IDxwaGlsLmVkd29ydGh5QHJlbmVzYXMuY29t
Pg0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+DQpbLi4uXQ0KPiA+ID4gLS0t
IGEvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jDQo+ID4gPiArKysgYi9kcml2ZXJz
L3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMNCj4gPiA+IEBAIC02OTMsNiArNjkzLDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQNCj4gPiA+IGR3ODI1MF9vZl9tYXRjaFtdDQo+
ID4gPSB7DQo+ID4gPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItdWFydCIg
fSwNCj4gPiA+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJjYXZpdW0sb2N0ZW9uLTM4NjAtdWFy
dCIgfSwNCj4gPiA+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtYXJ2ZWxsLGFybWFkYS0zOHgt
dWFydCIgfSwNCj4gPiA+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHVhcnQtcnpu
MSIgfSwNCj4gPg0KPiA+IHJlbmVzYXMscnpuMS11YXJ0DQpJIG1pc3NlZCB0aGlzIGNvbW1lbnQu
IEkgZm9sbG93ZWQgdGhlIHJlbmVzYXMgY29udmVudGlvbiBvZiByZW5lc2FzLHBlcmlwaGVyYWwt
ZGV2aWNlDQp0aGF0IGlzIHVzZWQgZm9yIG1vc3QgUi1DYXIgZHJpdmVycywgYnV0IGhhcHB5IHRv
IGNoYW5nZS4gDQoNClRoYW5rcw0KUGhpbA0K
