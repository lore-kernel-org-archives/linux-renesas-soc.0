Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:36980 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1759791AbcHEPT6 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 11:19:58 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Daniel Palmer <danieruru@gmail.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: spi-rspi mixes DMA and PIO transfers causing PIO transfer to
 fail.
Date: Fri, 5 Aug 2016 15:19:52 +0000
Message-ID: <KL1PR06MB174953C61C3E5B57D7B8A15D8A180@KL1PR06MB1749.apcprd06.prod.outlook.com>
References: <CAO64nm4ozZHoB5uKn8pKsShUOezrWAQwbk2XNSpKejTqPSPOtw@mail.gmail.com>
 <KL1PR06MB174925EF47C3CB04495A88FC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm52MSOe5Zk-m0gfiOV=sQCeZra5MvuGcTNY8BSb9Ls64A@mail.gmail.com>
 <CAMuHMdXfK4kdBqr8gDngoZ5Nug66gDAf90nMJZe2qDVKxtPN8g@mail.gmail.com>
 <CAO64nm5dwJ2m__2QA40Gdr4rZQiQE+WYMzO0crfbYFvnB48ASQ@mail.gmail.com>
 <KL1PR06MB174903281FA1D587BFC9F0CC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm4oCFoYUPZHDaDEJRCg9jEA5k2+S8yzAuHhS26mBmGhRw@mail.gmail.com>
 <KL1PR06MB1749B1F2FF9AD5FDFF82CA9C8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm6MA8dtJ07zm4C4XRHP2UGdBJ2Fmg73Kwp7_O3L43vCKw@mail.gmail.com>
 <KL1PR06MB17491404850EDA552933EC288A180@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm6uk-nRV+DzOmxM9MK8DxcEiBWs6pQJYUofNetj=FbaiA@mail.gmail.com>
In-Reply-To: <CAO64nm6uk-nRV+DzOmxM9MK8DxcEiBWs6pQJYUofNetj=FbaiA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

PiBOb3QgYSBtYXNzaXZlIGRpZmZlcmVuY2UgYnV0IGF0IDEwTUh6IChpbiByZWFsaXR5DQo+IH44
LjZNSHopIHRoZSBkZWxheSBiZXR3ZWVuIGJ5dGVzIGdvZXMgZnJvbSAxLjM2dXMgZG93biB0byAx
LjI0dXMuDQoNClJlYWxseT8/Pw0KDQpZb3UncmUgZXhwZXJpbWVudCB3YXMgdG8gbG9hZCB1cCB0
aGUgRklGTyAoOCBieXRlcykgdXNpbmcgdGhlIERNQSB3aGljaCB3b3VsZCBtYWtlIG1lIHRoaW5r
IHRoYXQgeW91IHdvdWxkIHNlZSBidXJzdHMgb2YgZmFzdCBkYXRhLg0KDQotLVtdW11bXVtdW11b
XVtdW10tLS1kZWxheS0tLVtdW11bXVtdW11bXVtdW10tLS1kZWxheS0tLVtdW11ldGMuLi4NCg0K
QnV0LCBpdCBzb3VuZHMgbGlrZSB0aGVyZSBpcyBzdGlsbCBhIGRlbGF5IGJldHdlZW4gYnl0ZXMN
Cg0KLS1bXS0tW10tLVtdLS1bXS0tZXRjLi4uDQoNClRoYXQgc3VycHJpc2VzIG1lLg0KDQoNCi1D
aHJpcw0K
