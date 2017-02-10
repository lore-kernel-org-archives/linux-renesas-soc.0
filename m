Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:26597 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932069AbdBJTqX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2017 14:46:23 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] ARM: shmobile: r7s72100: add restart handler
Date: Fri, 10 Feb 2017 19:46:17 +0000
Message-ID: <SG2PR06MB11654A11A81D46A70DB1D1BF8A440@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170209191259.29774-1-chris.brandt@renesas.com>
 <CAMuHMdVhbpfsLEn3Ke5f93AhaOnS4TSJC+QpY8xdtT1MNejVJA@mail.gmail.com>
 <SG2PR06MB11657431F033ABBDE1D750F38A440@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdXp-V393uR_-vhDSZyiXTD-+WxeNuchAK89YNKz+yPWdg@mail.gmail.com>
In-Reply-To: <CAMuHMdXp-V393uR_-vhDSZyiXTD-+WxeNuchAK89YNKz+yPWdg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIEZyaWRheSwgRmVicnVhcnkgMTAsIDIwMTcsIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToNCj4gQWx0ZXJuYXRpdmVseSwgeW91IGNhbiB3cml0ZSBhIHJlc3RhcnQgZHJp
dmVyIChjZnIuDQo+IGRyaXZlcnMvcG93ZXIvcmVzZXQvcm1vYmlsZS1yZXNldC5jKSB0aGF0IGJp
bmRzIGFnYWluc3QgYQ0KPiAicmVuZXNhcyxyN3M3MjEwMC13ZHQiIGRldmljZSBub2RlLCBidXQg
ZG9lc24ndCBpbXBsZW1lbnQgd2F0Y2hkb2cNCj4gZnVuY3Rpb25hbGl0eS4NCj4gWW91J3JlIGdv
bm5hIG5lZWQgRFQgYmluZGluZ3MgYW55d2F5Lg0KDQpJIGxpa2UgdGhhdCBpZGVhLiBUaGF0IHNo
b3VsZCB0YWtlIG1lIG5vIHRpbWUgYXQgYWxsLg0KVGhhbmsgeW91Lg0KDQpEbyB5b3UgdGhpbmsg
SSBjYW4gc3RpbGwga2VlcCBteSAnd2VhayBmdW5jdGlvbicgaWRlYSBpbiB0aGVyZT8/DQoNCg0K
ZXh0ZXJuIHZvaWQgX19hdHRyaWJ1dGVfXyAoKHdlYWspKSBwcmVwYXJlX2Zvcl9yZXN0YXJ0KHZv
aWQpDQp7DQoJLyogb3ZlcnJpZGUgdG8gZG8gYm9hcmQgc3BlY2lmaWMgc3R1ZmYgKi8NCn0NCg0K
c3RhdGljIGludCByZW5lc2FzX3dkdF9yZXNldF9oYW5kbGVyKHN0cnVjdCBub3RpZmllcl9ibG9j
ayAqdGhpcywNCgkJCQkgdW5zaWduZWQgbG9uZyBtb2RlLCB2b2lkICpjbWQpDQp7DQoJcHJfZGVi
dWcoIiVzICVsdVxuIiwgX19mdW5jX18sIG1vZGUpOw0KDQoJcHJlcGFyZV9mb3JfcmVzdGFydCgp
Ow0KDQoJLyogc2V0IFdEVCBmb3IgcmVzZXQgKi8NCgkuIC4gLg0KDQoJcmV0dXJuIE5PVElGWV9E
T05FOw0KfQ0KDQoNCg0KT3IuLi5kbyB5b3UgdGhpbmsgSSBjYW4ganVzdCB1c2UgdGhlIHJtb2Jp
bGUtcmVzZXQuYyBkcml2ZXIgYW5kDQpqdXN0IGFkZCBXRFQgdG8gaXQ/DQoNCkhvbmVzdGx5LCB0
aGUgb25seSB0aGluZyBkaWZmZXJlbnQgd2lsbCBiZSBybW9iaWxlX3Jlc2V0X2hhbmRsZXIoKS4N
CkkgY291bGQgbWFrZSBhIHJtb2JpbGVfd2R0X3Jlc2V0X2hhbmRsZXIoKSBhbmQgSSBjb3VsZCBq
dXN0IHBhc3MgaW4NCmEgZGlmZmVyZW50IG5vdGlmaWVyX2Jsb2NrIGRlcGVuZGluZyBvbiB0aGUg
RFQuDQoNCldoYXQgZG8geW91IHRoaW5rPw0KDQpzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBybW9iaWxlX3Jlc2V0X29mX21hdGNoW10gPSB7DQoJeyAuY29tcGF0aWJsZSA9ICJyZW5l
c2FzLHN5c2Mtcm1vYmlsZSIsIH0sDQoJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHdkdC1ybW9i
aWxlIiwgfSwNCgl7IC8qIHNlbnRpbmVsICovIH0NCn07DQoNCg0KQ2hyaXMNCg0K
