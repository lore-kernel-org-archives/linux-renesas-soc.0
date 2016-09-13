Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:61618 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750940AbcIMNuz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2016 09:50:55 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 1/3] mmc: sh_mobile_sdhi: add ocr_mask option
Date: Tue, 13 Sep 2016 13:50:49 +0000
Message-ID: <SG2PR06MB1165D0EE862CCCFD713181938AFE0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20160912141507.6837-1-chris.brandt@renesas.com>
 <20160912141507.6837-2-chris.brandt@renesas.com>
 <CAPDyKFqdznJ4xr5=L862uOfvqjsRpR3d+yRWtN1-8H5ZvP9GeQ@mail.gmail.com>
 <CAMuHMdVGgWaVcC4Pfuf0NSTpU4ahdEg6Q7iKZ1n+mb7KexE6yg@mail.gmail.com>
In-Reply-To: <CAMuHMdVGgWaVcC4Pfuf0NSTpU4ahdEg6Q7iKZ1n+mb7KexE6yg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVyZSdzIGEgcXVlc3Rpb246DQoNClRoZSBEVCByZWd1bGF0b3IgbWV0aG9kIGlzIGdvb2QgaWYg
eW91IHdhbnQgdG8gYmUgYWJsZSB0byBjb250cm9sIHRoZSByZWd1bGF0b3IgYXQgcnVuLXRpbWUg
YnkgdGhlIHN5c3RlbS4NCg0KQnV0IGZvciBNTUMgYW5kIFNESEksIHdoeSBpc24ndCB0aGVyZSBh
IHdheSB0byBqdXN0IHNldCB0aGUgT0NSIHZvbHRhZ2UgaW4gdGhlIGJvYXJkJ3MgRFQgaWYgaXQn
cyBmaXhlZCAob3RoZXIgdGhhbiBtYWtpbmcgYSBmaXhlZCByZWd1bGF0b3Igbm9kZSk/DQpXaHkg
aXNuJ3QgdGhlcmUgYSBtbWMtb2NyLW1hc2sgcHJvcGVydHk/IFRoYXQncyByZWFsbHkgd2hhdCBJ
IHdhbnQgYW5kIGl0IHNlZW1zIGxpa2UgaXQgd291bGQgbWFrZSBhIGxvdCBvZiBkdHMgZmlsZXMg
bW9yZSBzaW1wbGUuDQoNCg0KQ2hyaXMNCg0KDQo=
