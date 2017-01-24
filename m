Return-Path: <devicetree-owner@vger.kernel.org>
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
Date: Tue, 24 Jan 2017 14:43:10 +0000
Message-ID: <SG2PR06MB11652097D0BFA1A058F9CFBC8A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170123135423.28780-1-chris.brandt@renesas.com>
 <20170123135423.28780-3-chris.brandt@renesas.com> <20170123175210.GH2166@mai>
 <SG2PR06MB11657AE9653A4B66B1EA02718A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170124143222.GA2021@mai>
In-Reply-To: <20170124143222.GA2021@mai>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
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
Y2sgY29kZSBldmVyeXdoZXJlLg0KDQoNClNvIEkgcmVhbGl6ZWQgdGhhdCBpbiBvcmRlciB0byB1
c2UgYnVpbHRpbl9wbGF0Zm9ybSwgSSBjYW4ndCBoYXZlIGFueSBvZiB0aGUNCmZ1bmN0aW9ucyBp
biBfX2luaXQgYmVjYXVzZSB0aGUgYnVpbGQgc3lzdGVtIGhhcyBubyBpZGVhIHRoYXQgSSBuZXZl
ciBwbGFuDQpvbiByZW1vdmluZyBvciBwcm9iaW5nIGFnYWluIGFmdGVyIGJvb3QuIEJ1dCwgZXZl
biBpZiBJIHRha2Ugb3V0IGFsbCB0aGUNCl9faW5pdCBmcm9tIG15IGNvZGUsIEknbSBzdGlsbCBj
YWxsaW5nIGNsb2Nrc291cmNlX21taW9faW5pdCB3aGljaCBpcyBfX2luaXQNCnNvIEkgY2FuIG5l
dmVyIGVzY2FwZSB0aGUgIlNlY3Rpb24gbWlzbWF0Y2giLg0KDQpUaGlzIGxlYXZlcyBtZSB3aXRo
IDIgb3B0aW9uczoNCg0KMSkgUHVsbCB0aGUgY2xvY2tzb3VyY2VfbW1pbyBkcml2ZXIgY29kZSBp
bnRvIG15IGRyaXZlciBhbmQgbGVhdmUgZXZlcnl0aGluZw0KICAgb3V0IG9mIF9faW5pdA0KMikg
UmV3cml0ZSBhcyBhIERUIGRyaXZlciB1c2luZyBDTE9DS1NPVVJDRV9PRl9ERUNMQVJFIHdoaWNo
IHB1dHMgbW9zdCBvZg0KICAgdGhlIGNvZGUgaW4gX19pbml0DQoNCk9mIGNvdXJzZSB0aGUgYmV0
dGVyIChsb3dlciBzeXN0ZW0gbWVtb3J5KSBhbnN3ZXIgaXMgIzIuDQoNCkknbGwgdHJ5IHlvdXIg
dHJpY2sgYWJvdXQgb2ZfZmluZF9kZXZpY2VfYnlfbm9kZSBiZWNhdXNlIHdoaWxlIHRoZXJlIGFy
ZQ0KZXF1aXZhbGVudCBPRiBmdW5jdGlvbnMgZm9yIG1hcHBpbmcgcmVzb3VyY2VzLCBJIGRvIGxp
a2UgdGhlIGF1dG8tcm9sbGJhY2sNCmZlYXR1cmUgb2YgZGVtdg0KDQpUaGFuayB5b3UsDQpDaHJp
cw0K
