Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:39541 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1733074AbeHFSUv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 14:20:51 -0400
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
Date: Mon, 6 Aug 2018 16:10:59 +0000
Message-ID: <TY1PR01MB15622D51FC913D8A99A43AAF8A200@TY1PR01MB1562.jpnprd01.prod.outlook.com>
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
ZXZlbiB3cm90ZToNCj4gQlRXLCBpdCB3b3VsZCBoYXZlIGJlZW4gdmVyeSB2YWx1YWJsZSB0byBr
bm93IHRoYXQgZWFybHljb24gZGlkbid0IHdvcmssDQo+IGFzIHRoYXQNCj4gd291bGQgaGF2ZSBo
ZWxwZWQgaW4gYXZvaWRpbmcgdGhlIGVhcmx5Y29uIGJyZWFrYWdlIG9uIG90aGVyIHBhcnRzLg0K
DQpNeSBhcG9sb2dpZXMuDQoNCldoZW4gSSBoYWQgZmlyc3QgbG9va2VkIGF0IHRoaXMgbW9udGhz
IGFnbywgSSBxdWlja2x5IHJlYWxpemVkIHRoYXQgDQplYXJseWNvbiB3YXMgbm90IGdvaW5nIHRv
IHdvcmsgYmVjYXVzZSB0aGUgUlovQTIgU0NJRiB3YXMgbm90IGxpa2UgYWxsIHRoZSANCm90aGVy
IFNDSUYgZGV2aWNlcy4NClNvIGluc3RlYWQgSSB3ZW50IHdpdGggYSBzaW1wbGUgMiBsaW5lIGNo
YW5nZSB0byBERUJVR19MTC4gQWZ0ZXIgdGhhdCANCnBvaW50LCBJIGZvcmdvdCBhbGwgYWJvdXQg
ZWFybHljb24gdW50aWwgSSBzYXcgeW91IG1lbnRpb24gaXQgdGhpcyBtb3JuaW5nLg0KDQoNCkNo
cmlzDQoNCg==
