Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:60291 "EHLO
	relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1759797AbcHEOUJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 10:20:09 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Daniel Palmer <danieruru@gmail.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: spi-rspi mixes DMA and PIO transfers causing PIO transfer to
 fail.
Date: Fri, 5 Aug 2016 14:20:03 +0000
Message-ID: <KL1PR06MB17491404850EDA552933EC288A180@KL1PR06MB1749.apcprd06.prod.outlook.com>
References: <CAO64nm4ozZHoB5uKn8pKsShUOezrWAQwbk2XNSpKejTqPSPOtw@mail.gmail.com>
 <KL1PR06MB174925EF47C3CB04495A88FC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm52MSOe5Zk-m0gfiOV=sQCeZra5MvuGcTNY8BSb9Ls64A@mail.gmail.com>
 <CAMuHMdXfK4kdBqr8gDngoZ5Nug66gDAf90nMJZe2qDVKxtPN8g@mail.gmail.com>
 <CAO64nm5dwJ2m__2QA40Gdr4rZQiQE+WYMzO0crfbYFvnB48ASQ@mail.gmail.com>
 <KL1PR06MB174903281FA1D587BFC9F0CC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm4oCFoYUPZHDaDEJRCg9jEA5k2+S8yzAuHhS26mBmGhRw@mail.gmail.com>
 <KL1PR06MB1749B1F2FF9AD5FDFF82CA9C8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm6MA8dtJ07zm4C4XRHP2UGdBJ2Fmg73Kwp7_O3L43vCKw@mail.gmail.com>
In-Reply-To: <CAO64nm6MA8dtJ07zm4C4XRHP2UGdBJ2Fmg73Kwp7_O3L43vCKw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

PiBUaGUgRE1BIGNvbnRyb2xsZXIgaW4gdGhlIFJaL0ExIGNhbiBhcHBhcmVudGx5IHJlYWQgYSBs
b25nIGZyb20gdGhlIHNvdXJjZSBpbiBvbmUNCj4gdHJhbnNhY3Rpb24gYW5kIGZlZWQgaXQgdG9v
IHRoZSBkZXN0aW5hdGlvbiBhcyA0IGJ5dGUgd3JpdGVzIHNvIEknbSB0aGlua2luZyBtYXliZQ0K
PiBJIGNhbiBzZXR1cCB0aGUgRE1BIGNvbnRyb2xsZXIgdG8gcmVhZCAyIGxvbmdzIGFuZCB3cml0
ZSB0aGF0IGFzIDggYnl0ZXMgaW4gb25lIGdvDQo+IHNvIHRoYXQgZWFjaCBETUEgdHJhbnNhY3Rp
b24gZmlsbHMgdGhlIFNQSSBjb250cm9sbGVyJ3MgRklGTy4NCg0KSW50ZXJlc3RpbmcgZXhwZXJp
bWVudC4gSWYgeW91IHRyeSBpdCwgbGV0IG1lIGtub3cgaG93IGl0IGdvZXMuDQoNCg0KQ2hyaXMN
Cg==
