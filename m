Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:5666 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1756479AbcIPNIT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 09:08:19 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH 2/4] ARM: dts: r7s72100: add mmcif to device tree
Date: Fri, 16 Sep 2016 13:08:13 +0000
Message-ID: <SG2PR06MB11655B678F23E16AB93C9B008AF30@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20160915193405.26943-1-chris.brandt@renesas.com>
 <20160915193405.26943-3-chris.brandt@renesas.com>
 <CAMuHMdU6DKuxYUKNV_-FyczV-pPFpTLso=5HruWgNiXNOenVRQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU6DKuxYUKNV_-FyczV-pPFpTLso=5HruWgNiXNOenVRQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIDkvMTUvMjAxNiwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+
ICsgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjY4IElSUV9UWVBFX0xFVkVM
X0hJR0gNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHSUNfU1BJIDI2OSBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsNCj4gDQo+IFRoZSBiaW5kaW5ncyBkbyBub3Qgc2F5IGFueXRoaW5n
IGFib3V0IGludGVycnVwdHMgKGhlbmNlIHRoYXQgc2hvdWxkIGJlDQo+IGFkZGVkKS4NCg0KSSdt
IHNvcnJ5LCBJJ20gY29uZnVzZWQuLi4NCkFyZSB5b3Ugc2F5aW5nOg0KIEEpIEkgZm9yZ290IHRv
IGFkZCBzb21ldGhpbmc/DQogQikgQXMgYSBnZW5lcmFsIHN0YXRlbWVudCwgdGhlIHJlbmVzYXMs
bW1jaWYudHh0IGZpbGUgZG9lc24ndCBzYXkgYW55dGhpbmcgYWJvdXQgaW50ZXJydXB0cz8NCg0K
DQo+IFRoZSBkcml2ZXIgaGFuZGxlcyBlaXRoZXIgMSBjb21iaW5lZCBvciAyIHNlcGFyYXRlIGlu
dGVycnVwdHMuDQo+IFRoZSBkYXRhc2hlZXQgc2F5cyBNTUMgaGFzIDMgaW50ZXJydXB0IHJlcXVl
c3RzLCB0aG91Z2g/DQoNClRoZSBJUCBpdHNlbGYgaGFzIDMgaW50ZXJydXB0czoNCiAjMS4gTU1D
MCwyOTk6IENhcmQgZGV0ZWN0DQogIzIuIE1NQzEsMzAwOiBTdGF0dXMgQ2hhbmdlDQogIzMuIE1N
QzIsMzAxOiBFcnJvcg0KDQpNYW55IG9mIHRoZSAnTGludXgnIFNvQyBkZXZpY2VzIHRoYXQgdXNl
IHRoaXMgTU1DIChTSDQsIFItQ2FyKSBhcmUgb25seSBldmVyIGdvaW5nIHRvIHVzZSBlTU1DLCBz
byB0aGUgY2FyZCBkZXRlY3Rpb24gcG9ydGlvbiBvZiB0aGUgSVAgd2FzIGlycmVsZXZhbnQuIEkg
YWdyZWUgdGhpcyBpcyB0aGUgc2FtZSBjYXNlIGZvciB0aGUgUlovQSAod2hvIHdvdWxkIGV2ZXIg
dXNlIGFuIE1NQyBjYXJkIG5vdyBhIGRheXM/Pz8/PykNClRoZSAnc21hbGxlcicgU29DcyBrZXB0
IGl0IGluIChTSDJBLCBSWi9BMSkgYnV0IHRoZSAnYmlnZ2VyJyBTb0NzIGxlZnQgaXQgb3V0IChT
SDRBLCBSLUNhcikuDQoNClRoZSBvbmx5IHdheSB0byBlbmFibGUgdGhhdCBpbnRlcnJ1cHQgaXMg
dG8gd3JpdGUgdG8gdGhlIENFX0RFVEVDVCByZWdpc3RlciAob2Zmc2V0IDB4NzApIHdoaWNoIHRo
ZSBkcml2ZXIgZG9lc24ndCBkby4NCg0KSG93ZXZlci4uLi5pZiB5b3UgbG9vayBpbiBzaF9tbWNp
Zi5oLCB5b3UnbGwgc2VlIHRoYXQgc2FtZSBvZmZzZXQgKDB4NzApIGlzIGNhbGxlZCBDRV9DTEtf
Q1RSTDINCg0KI2RlZmluZSBNTUNJRl9DRV9DTEtfQ1RSTDIgICAgICAweDAwMDAwMDcwDQoNCldo
aWNoIGl0IG9ubHkgd3JpdGVzIHRvIGlmICdjbGtfY3RybDJfZW5hYmxlJyBpcyBkZXNpZ25hdGVk
Lg0KDQoJaWYgKGhvc3QtPmNsa19jdHJsMl9lbmFibGUpDQoJCXNoX21tY2lmX3dyaXRlbChob3N0
LT5hZGRyLCBNTUNJRl9DRV9DTEtfQ1RSTDIsIDB4MEYwRjAwMDApOw0KDQpBbmQsIEkgc2VlIG5v
IFJlbmVzYXMgU29DIHRoYXQgZXZlciBzZXRzIHRoYXQgb3Igd291bGQgZXZlciB1c2UgaXQgc28g
SSBjYW4ndCBldmVuIHRlbGwgeW91IHdoYXQgU29DIHRoYXQgd2FzIGZvciAoU0g0LCBTSC1Nb2Jp
bGUsIEFSTSkNCg0KDQpTbyBhZnRlciBhbGwgdGhhdCByYW50aW5nLi4uSSBzZWUgbm8gbmVlZCB0
byBzdXBwb3J0IGNhcmQgZGV0ZWN0IGZvciBNTUMgZm9yIHRoZSBSWi9BIChvciBhbnkgZnV0dXJl
IFJaKSBzbyBJJ2QgbGlrZSB0byBqdXN0IGxlYXZlIGl0IGFzIGlzLg0KDQpEbyB5b3UgYWdyZWU/
DQoNCkNocmlzDQoNCg0K
