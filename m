Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:50682 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933095AbcH2PdJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2016 11:33:09 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Simon Horman" <horms+renesas@verge.net.au>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: rz: Select EXTAL vs USB clock
Date: Mon, 29 Aug 2016 15:32:46 +0000
Message-ID: <SG2PR06MB116574538B09E83FAA4F73868AE10@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20160825190518.20764-1-chris.brandt@renesas.com>
 <CAMuHMdWiPfZq=VgWhFRaQBoazLGSDo3+AB_cUG5hMhPxzypLAA@mail.gmail.com>
 <SG2PR06MB1165182DE474D907F38694E98AE10@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdXtzSNo84hLDNg=nZpG3HB1YPC2JNk6tiFx5eoFtHZjdg@mail.gmail.com>
In-Reply-To: <CAMuHMdXtzSNo84hLDNg=nZpG3HB1YPC2JNk6tiFx5eoFtHZjdg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpPbiBBdWcgMjksIDIwMTYsIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToNCj4gV2UgcmVhbGx5IG5lZWQgdG8gZ2V0IHRoZSBHUElPIGRyaXZlciB1cHN0
cmVhbSwgYW5kIGFkZCBzdXBwb3J0IGZvciByZWFkaW5nIHRoZSBNRF8qIHBpbnMuDQoNCk9LLCB3
ZSBjYW4ganVzdCByZWFkIHRoZSBtb2RlIHBpbiBpbnN0ZWFkIG9mIGxvb2tpbmcgYXQgdGhlIERU
Lg0KDQpJbiBzZXR1cC1yOGE3Nzc5LmMsIHRoZXkgdXNlIGlvcmVtYXAgdG8gcmVhZCB0aGUgbW9k
ZSBhbmQgdGhlbiBwYXNzIHRoZSBtb2RlIGludG8gcjhhNzc3OV9jbG9ja3NfaW5pdCgpIGluIHRo
ZSBjbG9jayBmaWxlLg0KTG9va3MgbGlrZSBzZXR1cC1yY2FyLWdlbjIuYyBkb2VzIHRoZSBzYW1l
IHRoaW5nLg0KDQpTbywgY2FuIHdlIGRvIHRoZSBzYW1lIGluIHNldHVwLXI3czcyMTAwLmMgYW5k
IGNsay1yei5jPyBObyBHUElPIGRyaXZlciBpcyBuZWVkZWQgYW5kIGl0IHdvdWxkIG1hdGNoIHRo
ZSBvdGhlciBwbGF0Zm9ybXMgYXJlIGRvaW5nLg0KDQoNCkNocmlzDQo=
