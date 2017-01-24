Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:16834 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750766AbdAXUT4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2017 15:19:56 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] clocksource: Add renesas-ostm timer driver
Date: Tue, 24 Jan 2017 20:19:50 +0000
Message-ID: <SG2PR06MB1165F79A1675FAC9ABEF12998A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170123135423.28780-1-chris.brandt@renesas.com>
 <20170123135423.28780-3-chris.brandt@renesas.com> <20170123175210.GH2166@mai>
 <SG2PR06MB11657AE9653A4B66B1EA02718A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170124143222.GA2021@mai>
In-Reply-To: <20170124143222.GA2021@mai>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgRGFuaWVsLA0KDQpPbiBUdWVzZGF5LCBKYW51YXJ5IDI0LCAyMDE3LCBEYW5pZWwgTGV6Y2Fu
byB3cm90ZToNCj4gPiA+ID4gK2Vhcmx5X3BsYXRmb3JtX2luaXQoImVhcmx5dGltZXIiLCAmb3N0
bV90aW1lcik7DQo+ID4gPiA+ICtzdWJzeXNfaW5pdGNhbGwob3N0bV9pbml0KTsgbW9kdWxlX2V4
aXQob3N0bV9leGl0KTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArTU9EVUxFX0FVVEhPUigiQ2hyaXMg
QnJhbmR0Iik7DQo+ID4gPiA+ICtNT0RVTEVfREVTQ1JJUFRJT04oIlJlbmVzYXMgT1NUTSBUaW1l
ciBEcml2ZXIiKTsNCj4gPiA+ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsNCj4gPiA+DQo+
ID4gPiBNYXliZSB5b3UgY2FuIHRyeSB3aXRoIGJ1aWx0aW5fcGxhdGZvcm0gPw0KPiA+DQo+ID4g
R29vZCBpZGVhLiBCdXQsIG5vdyBJIGdldCBhICJTZWN0aW9uIG1pc21hdGNoIiBkdXJpbmcgbGlu
ayB0aW1lIHNvDQo+ID4gSSdsbCBoYXZlIHRvIGZpZ3VyZSBvdXQgd2h5IHRoYXQgaXMuDQo+IA0K
PiBNbWgsIEkgdGhpbmsgaXQgd291bGQgYmUgbW9yZSBjb25zaXN0ZW50IHRvIGNvbnZlcnQgdGhp
cyB0bzoNCj4gDQo+IENMT0NLU09VUkNFX09GX0RFQ0xBUkUob3N0bSwgInJlbmVzYXMsb3N0bSIs
IG9zdG1faW5pdCk7DQo+IA0KPiBUaGUgb25seSBwcm9ibGVtIGlzIHRvIGdldCB0aGUgc3RydWN0
IGRldmljZSBhc3NvY2lhdGVkIHRvIHRoZSBvZl9ub2RlDQo+IHBhc3NlZCBhcyBwYXJhbWV0ZXIg
dG8gb3N0bV9pbml0IGluIG9yZGVyIHRvIHVzZSB0aGUgZGV2bV8qIEFQSS4NCj4gDQo+IEkgdGhp
bmsgb2ZfZmluZF9kZXZpY2VfYnlfbm9kZSBzaG91bGQgcmV0dXJuIHRoZSBwbGF0Zm9ybV9kZXZp
Y2UsIHRoZW4NCj4gcGRldi0+ZGV2LiBJZiB0aGF0IHdvcmtzIHRoZSBvdGhlciBkcml2ZXJzIHdp
bGwgYmVuZWZpdCBmcm9tIHRoYXQgdG8NCj4gcGRldi0+cmVtb3ZlIGFsbA0KPiB0aGUgcm9sbGJh
Y2sgY29kZSBldmVyeXdoZXJlLg0KDQoNCkl0IHdhcyBhIGdvb2QgaWRlYS4uLi5idXQgaXQgd2ls
bCBub3Qgd29yay4NCg0KV2hpbGUgQ0xPQ0tTT1VSQ0VfT0ZfREVDTEFSRSBpcyBnb29kIGF0IHB1
dHRpbmcgdGhlIGRyaXZlciBhdCB0aGUNCmZyb250IG9mIHRoZSBsaW5lIGZvciBsb2FkaW5nLCBp
dCdzIHRvbyBlYXJseSBpbiBib290IHRvIGRldGVjdA0KYSBwbGF0Zm9ybV9kZXZpY2UuDQoNCm9m
X2ZpbmRfZGV2aWNlX2J5X25vZGUgY2FsbHMgYnVzX2ZpbmRfZGV2aWNlLiBCdXQgdGhlIGZpcnN0
IHRoaW5nIHRoYXQNCmJ1c19maW5kX2RldmljZSBkb2VzIGlzOg0KDQoJaWYgKCFidXMgfHwgIWJ1
cy0+cCkNCgkJcmV0dXJuIE5VTEw7DQoNCkJ1dCBidXMtPnA9MCBzbyBpdCByZXR1cm5zIGltbWVk
aWF0ZWx5Lg0KDQoNCk9mIGNvdXJzZSBjaGFuZ2luZyB0aGUgY29kZSBvdmVyIHRvOg0KICAgICAg
ICBkZXZtX2t6YWxsb2MgLT4gZGV2bV9remFsbG9jDQpkZXZtX2lvcmVtYXBfbm9jYWNoZSAtPiBv
Zl9pb19yZXF1ZXN0X2FuZF9tYXANCiAgICBwbGF0Zm9ybV9nZXRfaXJxIC0+IGlycV9vZl9wYXJz
ZV9hbmRfbWFwDQogICAgICAgICAgICAgZGV2X2VyciAtPiBwcl9lcnINCg0KDQpUaGVuIHRoaW5n
cyB3b3JrLCBidXQgSSdtIGJhY2sgdG8gbWFuYWdpbmcgdGhlIHJvbGxiYWNrIGNvZGUgbWFudWFs
bHkuDQoNCg0KQW55IG90aGVyIGlkZWFzIG9uIGhvdyB0byBnZXQgdGhlIGNvcnJlc3BvbmRpbmcg
cGxhdGZvcm1fZGV2aWNlIGZvcg0KYSBEVCBub2RlPw0KDQoNCkNocmlzDQoNCg==
