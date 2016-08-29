Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:45227 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753613AbcH2QVp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2016 12:21:45 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Mark Brown <broonie@kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Palmer <danieruru@gmail.com>
Subject: RE: [PATCH] spi: rspi: Increase accuracy of bit rate for RZ
Date: Mon, 29 Aug 2016 16:21:38 +0000
Message-ID: <SG2PR06MB1165A5B9BD0ACFE5E34D4F708AE10@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1470404163-27427-1-git-send-email-chris.brandt@renesas.com>
 <CAMuHMdWVvZLWvVVzHMr+5--PAJkGx0r-Z1=eCiGJddcY6aDNLA@mail.gmail.com>
In-Reply-To: <CAMuHMdWVvZLWvVVzHMr+5--PAJkGx0r-Z1=eCiGJddcY6aDNLA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIE1vbiwgQXVnIDI5LCAyMDE2LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IEkgYmVsaWV2ZSB0aGlzIGFwcGxpZXMgbm90IG9ubHkgdG8gUlosIGJ1dCB0byBhbGwg
b3RoZXIgc3VwcG9ydGVkIFJTUEkgdmFyaWFudHM/DQo+IEhlbmNlIEkgdGhpbmsgaXQgc2hvdWxk
IGJlIG1hZGUgY29tbW9uLg0KDQpJIHdvdWxkIHRoaW5rIGl0IHdvdWxkIGJlIHRoZSBzYW1lIGZv
ciBhbGwgdGhlIG90aGVyIHBhcnRzIHdpdGggUlNQSS4NCg0KQ3VycmVudGx5IHRoZXJlIGFyZSAz
IHNlcGFyYXRlIGNvbmZpZyBmdW5jdGlvbnM6DQogLSByc3BpX3NldF9jb25maWdfcmVnaXN0ZXIN
CiAtIHJzcGlfcnpfc2V0X2NvbmZpZ19yZWdpc3Rlcg0KIC0gcXNwaV9zZXRfY29uZmlnX3JlZ2lz
dGVyDQoNCkJ5ICJjb21tb24iLCBkbyB5b3UgbWVhbjoNCkEpIGFkZCB0aGUgc2FtZSBjb2RlIHRv
IGVhY2ggb2YgdGhlIG90aGVyIDIgZnVuY3Rpb25zPw0KICAgICAoaWUsIGNvbW1vbiBmdW5jdGlv
bmFsaXR5IGZvciBhbGwgZGV2aWNlKQ0KDQpCKSBtYWtlIHNvbWUgbmV3IGZ1bmN0aW9uL21hY3Jv
IHRoYXQgYWxsIGNvbmZpZyBmdW5jdGlvbnMgY2FsbD8NCiAgICAgKGllLCBzYW1lIGNvZGUgZm9y
IHNldHRpbmcgdGhlIHJlZ2lzdGVyIGJpdHMpDQoNCg0KTm90ZTogSSBvbmx5IHJlYWxseSBoYXZl
IGEgUlovQSBwbGF0Zm9ybSwgc28gSSBjYW4ndCByZWFsbHkgdGVzdCBpdCBvbiBhbnkgb3RoZXIg
ZGV2aWNlcyAob3RoZXIgdGhhbiBqdXN0IGxvb2tpbmcgaW4gdGhlIGhhcmR3YXJlIG1hbnVhbHMp
DQoNCkNocmlzDQoNCg0K
