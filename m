Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:13287 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S965738AbcHDTxy (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 15:53:54 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Daniel Palmer <danieruru@gmail.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: spi-rspi mixes DMA and PIO transfers causing PIO transfer to
 fail.
Date: Thu, 4 Aug 2016 19:47:17 +0000
Message-ID: <KL1PR06MB1749B1F2FF9AD5FDFF82CA9C8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
References: <CAO64nm4ozZHoB5uKn8pKsShUOezrWAQwbk2XNSpKejTqPSPOtw@mail.gmail.com>
 <KL1PR06MB174925EF47C3CB04495A88FC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm52MSOe5Zk-m0gfiOV=sQCeZra5MvuGcTNY8BSb9Ls64A@mail.gmail.com>
 <CAMuHMdXfK4kdBqr8gDngoZ5Nug66gDAf90nMJZe2qDVKxtPN8g@mail.gmail.com>
 <CAO64nm5dwJ2m__2QA40Gdr4rZQiQE+WYMzO0crfbYFvnB48ASQ@mail.gmail.com>
 <KL1PR06MB174903281FA1D587BFC9F0CC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm4oCFoYUPZHDaDEJRCg9jEA5k2+S8yzAuHhS26mBmGhRw@mail.gmail.com>
In-Reply-To: <CAO64nm4oCFoYUPZHDaDEJRCg9jEA5k2+S8yzAuHhS26mBmGhRw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

PiBUaGUgZ3IgcGVhY2ggYm9hcmQgb25seSBoYXMgdGhlIGludGVybmFsIDEwTUIgU1JBTSBzbyBl
dmVyeXRoaW5nIHNob3VsZCBiZQ0KPiBjb21pbmcgZnJvbSB0aGVyZS4NCg0KRGFtbi4gVGhlcmUg
Z29lcyB0aGF0IGVhc3kgZXhjdXNlIG9mIHdoeSBpdCdzIHNsb3cuDQoNCg0KPiBUaGUga2VybmVs
IGlzIHJ1bm5pbmcgZnJvbSB0aGUgbWVtb3J5IG1hcHBlZCBTUEkgZmxhc2ggaG93ZXZlci4gSSdt
IG5vdCBzdXJlDQo+IGlmIHRoYXQgd291bGQgbWFrZSBhIGRpZmZlcmVuY2UuDQoNCk5vLCB0aGF0
IHNob3VsZCBub3QgYmUgdGhlIGlzc3VlIGJlY2F1c2UgdGhlIERNQSBtb3ZpbmcgYnl0ZXMgdG8g
dGhlIFJTUEkgYWNyb3NzIHRoZSBpbnRlcm5hbCBidXNzZXMgc2hvdWxkIG5vdCBuZWVkIHRoZSBD
UFUuDQoNClN0aWxsLCBJIGd1ZXNzIHRoZSBnb29kIHRoaW5nIGFib3V0IHVzaW5nIERNQSBpcyB0
aGF0IHlvdSBjYW4gdHJhbnNmZXIgb3V0IChvciBpbikgbG90cyBvZiBkYXRhIGFuZCBkb24ndCBo
YXZlIHRvIHdvcnJ5IGFib3V0IGxvdHMgb2YgaW50ZXJydXB0cy4NCg0KDQpDaHJpcw0KDQo=
