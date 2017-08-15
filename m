Return-Path: <devicetree-owner@vger.kernel.org>
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 1/3] ARM: dts: r8a7745: add PFC support
Date: Tue, 15 Aug 2017 08:47:40 +0000
Message-ID: <TY1PR06MB07025D9CE628A3D4CED37AA9B78D0@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <20170415202036.987901107@cogentembedded.com>
 <CAMuHMdUPda7Mjo_P8p1V5a20XOAYM6GFf8Jqf0KLUuO7zAODeA@mail.gmail.com>
In-Reply-To: <CAMuHMdUPda7Mjo_P8p1V5a20XOAYM6GFf8Jqf0KLUuO7zAODeA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gU2ltb24sDQoNCj4gRnJvbTogbGludXgtcmVuZXNhcy1zb2Mtb3duZXJAdmdlci5rZXJu
ZWwub3JnIFttYWlsdG86bGludXgtcmVuZXNhcy1zb2MtDQo+IG93bmVyQHZnZXIua2VybmVsLm9y
Z10gT24gQmVoYWxmIE9mIEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiBTZW50OiAyMCBBcHJpbCAyMDE3
IDE1OjA5DQo+IFRvOiBTZXJnZWkgU2h0eWx5b3YgPHNlcmdlaS5zaHR5bHlvdkBjb2dlbnRlbWJl
ZGRlZC5jb20+DQo+IENjOiBTaW1vbiBIb3JtYW4gPGhvcm1zQHZlcmdlLm5ldC5hdT47IFJvYiBI
ZXJyaW5nDQo+IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFu
ZEBhcm0uY29tPjsgTGludXgtDQo+IFJlbmVzYXMgPGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2Vy
bmVsLm9yZz47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBNYWdudXMgRGFtbSA8bWFn
bnVzLmRhbW1AZ21haWwuY29tPjsgUnVzc2VsbCBLaW5nDQo+IDxsaW51eEBhcm1saW51eC5vcmcu
dWs+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAxLzNdIEFSTTogZHRzOiByOGE3NzQ1OiBhZGQgUEZDIHN1cHBvcnQNCj4gDQo+IE9u
IFNhdCwgQXByIDE1LCAyMDE3IGF0IDEwOjE4IFBNLCBTZXJnZWkgU2h0eWx5b3YNCj4gPHNlcmdl
aS5zaHR5bHlvdkBjb2dlbnRlbWJlZGRlZC5jb20+IHdyb3RlOg0KPiA+IERlZmluZSB0aGUgZ2Vu
ZXJpYyBSOEE3NzQ1IHBhcnQgb2YgdGhlIFBGQyBkZXZpY2Ugbm9kZS4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFNlcmdlaSBTaHR5bHlvdiA8c2VyZ2VpLnNodHlseW92QGNvZ2VudGVtYmVkZGVk
LmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPg0KDQpJdCBsb29rcyBsaWtlIHRoZSBkZXBlbmRlbmNpZXMgZm9yIHRoaXMg
cGF0Y2ggYXJlIG1ldCBub3cgWzFdLg0KDQpBcmUgeW91IGhhcHB5IHRvIGFjY2VwdCB0aGlzIHBh
dGNoPyAoYW5kIHByZXN1bWFibHkgdGhlIG90aGVycyBpbiB0aGUgc2VyaWVzIGZvciB0aGUgc2st
cnpnMWUgYm9hcmQpLg0KDQpXZSBwbGFuIHRvIGFkZCBHUElPIHN1cHBvcnQgZm9yIHI4YTc3NDUs
IGJ1dCBuZWVkIHRoaXMgcGF0Y2ggaW4gcGxhY2UgZmlyc3QuDQoNCg0KWzFdIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTcwNTI0OS8NCg0KS2luZCByZWdhcmRzLCBDaHJpcw0K
