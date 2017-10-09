Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:23117 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755014AbdJINpN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 09:45:13 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] ARM: dts: iwg20d-q7: Add support for ttySC3
Date: Mon, 9 Oct 2017 13:45:07 +0000
Message-ID: <TY1PR06MB0895612044D5E21BCBFEF46BC0740@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1507539981-4193-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUprE7QuXF_sX47JyrvuZXhXnQFufy4OHeJ5ExwwoogKw@mail.gmail.com>
In-Reply-To: <CAMuHMdUprE7QuXF_sX47JyrvuZXhXnQFufy4OHeJ5ExwwoogKw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gR2VlcnQsDQoNCnRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPg0KPiBIaSBG
YWJyaXppbywgQ2hyaXMsDQo+DQo+IE9uIE1vbiwgT2N0IDksIDIwMTcgYXQgMTE6MDYgQU0sIEZh
YnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5y
ZW5lc2FzLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYXRlcnNvbiA8Y2hyaXMucGF0
ZXJzb24yQHJlbmVzYXMuY29tPg0KPg0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+DQo+IFJl
dmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0K
Pg0KPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaQ0KPiA+
ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaQ0KPiA+IEBAIC0x
MSw2ICsxMSw3IEBADQo+ID4gIC8gew0KPiA+ICAgICAgICAgYWxpYXNlcyB7DQo+ID4gICAgICAg
ICAgICAgICAgIHNlcmlhbDAgPSAmc2NpZjA7DQo+ID4gKyAgICAgICAgICAgICAgIHNlcmlhbDMg
PSAmc2NpZmIxOw0KPg0KPiBHaXZlbiB0aGlzIHBvcnQgaXMgbm90IGxhYmVsZWQgInNlcmlhbDMi
LCBidXQgY2FsbGVkICJkYXRhIHVhcnQiLCB5b3UgbWF5IHdhbnQNCj4gdG8gYWRkIGEgY29tbWVu
dCB0byBhdm9pZCBjb25mdXNpb246DQoNCkl0J3MgYSBsaXR0bGUgYml0IGNvbmZ1c2luZywgaXNu
J3QgaXQ/IFRoZSBsaW5lcyByZWxhdGVkIHRvIHN1Y2ggaW50ZXJmYWNlIGFyZSBuYW1lZCBhcyBV
QVJUMF94IG9uIHRoZSBjYXJyaWVyIGJvYXJkIHNjaGVtYXRpYywgdGhlIHNlY3Rpb24gb2YgdGhl
IHNjaGVtYXRpYyB0aGF0IGNvbnRhaW5zIHRoZSBoZWFkZXIgaXMgbmFtZWQgImRhdGEgdWFydCBo
ZWFkZXIiLCBhbmQgdGhlIGJvYXJkIGRvY3VtZW50YXRpb24gbmFtZXMgaXQgZXhwbGljaXRseSBh
cyAiVUFSVCAzIC0gL2Rldi90dHlTQzMgKFNDSUZCMSkiLg0KDQpJIGRvbid0IHRoaW5rIHRoZXJl
IGlzIGFueXRoaW5nIHdlIGNhbiBkbyB0byBtYWtlIHRoaXMgZWFzaWVyIGZvciB0aGUgdXNlciBy
ZWFsbHksIGlzIHRoZXJlPyA6RA0KSWYgd2UgZGVjaWRlIHRvIGFkZCBhIGNvbW1lbnQgdG8gc2Vy
aWFsIDMsIEkgZ3Vlc3Mgd2UgbmVlZCB0byBiZSBjb25zaXN0ZW50IGFuZCBhZGQgY29tbWVudHMg
Zm9yIHRoZSBvdGhlciBzZXJpYWwgaW50ZXJmYWNlcyB0b28uDQpJZiB5b3Ugc3RpbGwgcHJlZmVy
IGhhdmluZyBhIGNvbW1lbnQgdGhlcmUgSSdsbCBzZW5kIGEgdjIgYW5kIHBhdGNoKGVzKSBmb3Ig
YWRkaW5nIGNvbW1lbnRzIHRvIHRoZSBvdGhlciBpbnRlcmZhY2VzLCBqdXN0IGxldCBtZSBrbm93
Lg0KDQpUaGFua3MsDQpGYWINCg0KPg0KPiAgICAgc2VyaWFsMyA9ICZzY2lmYjE7IC8qIGRhdGEg
dWFydCAqLw0KPg0KPiA+ICAgICAgICAgICAgICAgICBldGhlcm5ldDAgPSAmYXZiOw0KPiA+ICAg
ICAgICAgfTsNCj4NCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+DQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0DQo+DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxv
dHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4NCj4gSW4g
cGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNl
bGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVz
dCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0KDQoNClJlbmVzYXMgRWxl
Y3Ryb25pY3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVhZG93LCBNaWxsYm9hcmQgUm9hZCwgQm91cm5l
IEVuZCwgQnVja2luZ2hhbXNoaXJlLCBTTDggNUZILCBVSy4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5k
ICYgV2FsZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4gMDQ1ODY3MDkuDQo=
