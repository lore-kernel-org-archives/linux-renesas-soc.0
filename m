Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:34669 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750903AbdBMNgp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 08:36:45 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] ARM: shmobile: r7s72100: add restart handler
Date: Mon, 13 Feb 2017 13:36:39 +0000
Message-ID: <SG2PR06MB1165F2EB29FA896A3EC8B2038A590@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170209191259.29774-1-chris.brandt@renesas.com>
 <CAMuHMdVhbpfsLEn3Ke5f93AhaOnS4TSJC+QpY8xdtT1MNejVJA@mail.gmail.com>
 <SG2PR06MB11657431F033ABBDE1D750F38A440@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdXp-V393uR_-vhDSZyiXTD-+WxeNuchAK89YNKz+yPWdg@mail.gmail.com>
 <SG2PR06MB11654A11A81D46A70DB1D1BF8A440@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdUJjdhg1j=sgxGLoLh-h91hS6peKJC_eA0wHJx8NbdBZA@mail.gmail.com>
In-Reply-To: <CAMuHMdUJjdhg1j=sgxGLoLh-h91hS6peKJC_eA0wHJx8NbdBZA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIE1vbmRheSwgRmVicnVhcnkgMTMsIDIwMTcsIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZTogDQo+ID4gc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcm1vYmls
ZV9yZXNldF9vZl9tYXRjaFtdID0gew0KPiA+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyZW5l
c2FzLHN5c2Mtcm1vYmlsZSIsIH0sDQo+ID4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInJlbmVz
YXMsd2R0LXJtb2JpbGUiLCB9LA0KPiANCj4gcmVuZXNhcyxyN3M3MjEwMC13ZHQNCg0KSSByZW1l
bWJlciB3aHkgSSBzdWdnZXN0ZWQgInJlbmVzYXMsd2R0LXJtb2JpbGUiLg0KDQpJZiBJIHRob3Vn
aHQgdGhpcyBXRFQgd2FzIGdvaW5nIHRvIGJlIHJldXNlZCBhZ2FpbiBpbiB0aGUgUlovQSBzZXJp
ZXMsDQp3b3VsZG4ndCBpdCBtYWtlIHNlbnNlIHRvIGp1c3QgZ2l2ZSBpdCBhIGdlbmVyaWMgbmFt
ZSBpbnN0ZWFkIG9mZiBhDQpzcGVjaWZpYyBwYXJ0IG51bWJlcj8NCg0KQW5kIGhlbmNlICJyZW5l
c2FzLHdkdC1ybW9iaWxlIiB3b3VsZCBiZSBhIGJldHRlciBuYW1lIHRoYW4gDQoicmVuZXNhcyxy
N3M3MjEwMC13ZHQiLCAicmVuZXNhcyxyemEyLXdkdCIsICJyZW5lc2FzLHJ6YTMtd2R0IiwgZXRj
Li4uID8NCg0KDQpPciwganVzdCBzdGljayB3aXRoIHRoZSBwYXJ0IG51bWJlciBhbmQgZG9uJ3Qg
d29ycnkgYWJvdXQgaXQ/DQoNCg0KVGhhbmtzLA0KQ2hyaXMNCg0K
