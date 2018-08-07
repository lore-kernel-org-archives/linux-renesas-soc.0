Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:23003 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729922AbeHGVkb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 17:40:31 -0400
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
Date: Tue, 7 Aug 2018 19:24:30 +0000
Message-ID: <TY1PR01MB1562F2D2FD1BF47A80B044028A270@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180806140755.24087-1-geert+renesas@glider.be>
 <20180806140755.24087-5-geert+renesas@glider.be>
 <TY1PR01MB15621F645BA5AA48C6060F0D8A200@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWfsdbmGUQPk4O=9jyPZ_tUEytO5z2XE6-TnagJ3taPVA@mail.gmail.com>
In-Reply-To: <CAMuHMdWfsdbmGUQPk4O=9jyPZ_tUEytO5z2XE6-TnagJ3taPVA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIE1vbmRheSwgQXVndXN0IDA2LCAyMDE4IDEsIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToNCj4gPiBJIGhhZCBhIHNpbXBsZSBwYXRjaCB0byBhZGQgc3VwcG9ydCBmb3Ig
Q09ORklHX0RFQlVHX0xMIGZvciBSWi9BMg0KPiA+IGJlY2F1c2UgZWFybHljb24gbmV2ZXIgd29y
a2VkIGJlY2F1c2Ugb2YgUlovQTIncyBkaWZmZXJlbnQgcmVnaXN0ZXINCj4gbG9jYXRpb25zLg0K
PiANCj4gWWVhaCwgc2NpX3Byb2JlX3JlZ21hcCgpIGFzc3VtZWQgdGhlIHdyb25nIHJlZ3R5cGUg
Zm9yIHlvdXIgVFlQRV9TQ0lGDQo+IHBvcnQuIFlvdSBuZWVkZWQgYW4gT0ZfRUFSTFlDT05fREVD
TEFSRSgpIGxpbmUgdGhhdCBhbHNvIGZpbGxlZCBpbg0KPiB0aGUgY29ycmVjdCByZWd0eXBlLg0K
DQoNCkkgZ2F2ZSB5b3VyIHBhdGNoIGEgdHJ5Lg0KV2hlbiBlYXJseWNvbiBpcyBlbmFibGVkLCBv
biBSWi9BMiwgaXQgZ2V0cyBzdHVjayBpbiBoZXJlOg0KDQpzdGF0aWMgdm9pZCBzY2lfcG9sbF9w
dXRfY2hhcihzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0LCB1bnNpZ25lZCBjaGFyIGMpDQp7DQoJdW5z
aWduZWQgc2hvcnQgc3RhdHVzOw0KDQoJZG8gew0KCQlzdGF0dXMgPSBzZXJpYWxfcG9ydF9pbihw
b3J0LCBTQ3hTUik7DQoJfSB3aGlsZSAoIShzdGF0dXMgJiBTQ3hTUl9URHhFKHBvcnQpKSk7DQoN
CglzZXJpYWxfcG9ydF9vdXQocG9ydCwgU0N4VERSLCBjKTsNCglzY2lfY2xlYXJfU0N4U1IocG9y
dCwgU0N4U1JfVER4RV9DTEVBUihwb3J0KSAmIH5TQ3hTUl9URU5EKHBvcnQpKTsNCn0NCg0KDQpJ
IHNlZSB0aGF0IHlvdSBhZGRlZCB0aGlzOg0KDQpPRl9FQVJMWUNPTl9ERUNMQVJFKHNjaWYsICJy
ZW5lc2FzLHNjaWYtcjdzOTIxMCIsIHJ6YTJfZWFybHlfY29uc29sZV9zZXR1cCk7DQoNCiBhbmQg
InJlbmVzYXMsc2NpZi1yN3M5MjEwIiBtYXRjaGVzIHdoYXQgSSBoYXZlIGluIG15IC5kdHNpLg0K
DQpCdXQsIHdoZW4gSSBydW4gdGhlIGNvZGUsIEkgZW5kIHVwIGluIGZ1bmN0aW9uIHNjaWZfZWFy
bHlfY29uc29sZV9zZXR1cCwNCm5vdCByemEyX2Vhcmx5X2NvbnNvbGVfc2V0dXANCg0KSSdtIGFz
c3VtaW5nIEknbSBqdXN0IHN1cHBvc2VkIHRvIHVzZSB0aGlzIG9uIG15IGJvb3RhcmdzOg0KICAg
ZWFybHljb249c2NpZiwweEU4MDA5MDAwDQoNCg0KQ2hyaXMNCg0K
