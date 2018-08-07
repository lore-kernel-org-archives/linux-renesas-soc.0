Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:55427 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726027AbeHGX0f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 19:26:35 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "uli@fpond.eu" <uli@fpond.eu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH/RFC 4/4] sh-sci: Derive regshift value from DT compatible
 value
Date: Tue, 7 Aug 2018 21:10:13 +0000
Message-ID: <TY1PR01MB1562ED9B51B87FBE0F2C1A828A270@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180806140755.24087-1-geert+renesas@glider.be>
 <20180806140755.24087-5-geert+renesas@glider.be>
 <TY1PR01MB15621F645BA5AA48C6060F0D8A200@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWfsdbmGUQPk4O=9jyPZ_tUEytO5z2XE6-TnagJ3taPVA@mail.gmail.com>
 <TY1PR01MB1562F2D2FD1BF47A80B044028A270@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWgJrPRh8TRTrEjWsaRAhEQX0T7M5eBGP_z3Ft=T6FfDg@mail.gmail.com>
In-Reply-To: <CAMuHMdWgJrPRh8TRTrEjWsaRAhEQX0T7M5eBGP_z3Ft=T6FfDg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIFR1ZXNkYXksIEF1Z3VzdCAwNywgMjAxOCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOg0KPiA+IEJ1dCwgd2hlbiBJIHJ1biB0aGUgY29kZSwgSSBlbmQgdXAgaW4gZnVu
Y3Rpb24gc2NpZl9lYXJseV9jb25zb2xlX3NldHVwLA0KPiA+IG5vdCByemEyX2Vhcmx5X2NvbnNv
bGVfc2V0dXANCj4gDQo+IEhtbSwgcGVyaGFwcyBpdCBkb2Vzbid0IHBpY2sgdGhlIGZpcnN0L21v
c3Qgc3BlY2lhbGl6ZWQgbWF0Y2guDQo+IA0KPiA+IEknbSBhc3N1bWluZyBJJ20ganVzdCBzdXBw
b3NlZCB0byB1c2UgdGhpcyBvbiBteSBib290YXJnczoNCj4gPiAgICBlYXJseWNvbj1zY2lmLDB4
RTgwMDkwMDANCj4gDQo+IEp1c3QgImVhcmx5Y29uIiBzaG91bGQgYmUgc3VmZmljaWVudC4gSXQn
bGwgZmluZCB0aGUgcmlnaHQgcG9ydCBmcm9tDQo+IGNob3Nlbi9zdGRvdXQtcGF0aA0KPiBpbiBE
VC4gQ2FuIHlvdSBwbGVhc2UgcmV0cnkgdXNpbmcgdGhhdD8NCg0KV2l0aCBqdXN0IHVzaW5nICJl
YXJseWNvbiIsIEkgZ2V0IHRoZSBzYW1lIHJlc3VsdC4NCg0KSSB0aGluayB0aGUgY29kZSB0aGF0
IGRvZXMgdGhlIG1hdGNoaW5nIGlzIGluIGRyaXZlcnMvb2YvZmR0LmMNCkZ1bmN0aW9uICJlYXJs
eV9pbml0X2R0X3NjYW5fY2hvc2VuX3N0ZG91dCIuDQoNCkknbGwgc3RlcCB0aHJvdWdoIHRoZSBj
b2RlIGEgYml0IHRvIHNlZSBpZiBJIGNhbiBmaWd1cmUgb3V0IHdoeS4NCg0KQ2hyaXMNCg0KDQo=
