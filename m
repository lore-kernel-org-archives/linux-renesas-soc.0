Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:14969 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750896AbdGEPCK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 11:02:10 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>
CC: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [PATCH v 1/2] ravb: Add support for r8a7743 SoC
Date: Wed, 5 Jul 2017 15:02:04 +0000
Message-ID: <KL1PR06MB1702A7AAAE97FBC67578E985B8D40@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1499259711-56175-1-git-send-email-biju.das@bp.renesas.com>
 <1499259711-56175-2-git-send-email-biju.das@bp.renesas.com>
 <afcd181c-c805-8f3c-955f-652d001a03d4@cogentembedded.com>
In-Reply-To: <afcd181c-c805-8f3c-955f-652d001a03d4@cogentembedded.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZGV2aWNldHJlZS1vd25l
ckB2Z2VyLmtlcm5lbC5vcmcgW21haWx0bzpkZXZpY2V0cmVlLQ0KPiBvd25lckB2Z2VyLmtlcm5l
bC5vcmddIE9uIEJlaGFsZiBPZiBTZXJnZWkgU2h0eWx5b3YNCj4gU2VudDogMDUgSnVseSAyMDE3
IDE0OjIxDQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+OyBSb2IgSGVy
cmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsNCj4gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRA
YXJtLmNvbT47IFJ1c3NlbGwgS2luZw0KPiA8bGludXhAYXJtbGludXgub3JnLnVrPg0KPiBDYzog
U2ltb24gSG9ybWFuIDxob3Jtc0B2ZXJnZS5uZXQuYXU+OyBNYWdudXMgRGFtbQ0KPiA8bWFnbnVz
LmRhbW1AZ21haWwuY29tPjsgQ2hyaXMgUGF0ZXJzb24NCj4gPENocmlzLlBhdGVyc29uMkByZW5l
c2FzLmNvbT47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1yZW5lc2FzLQ0KPiBz
b2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7
DQo+IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2IDEvMl0g
cmF2YjogQWRkIHN1cHBvcnQgZm9yIHI4YTc3NDMgU29DDQo+DQo+IEhlbGxvIQ0KPg0KPiBPbiAw
Ny8wNS8yMDE3IDA0OjAxIFBNLCBCaWp1IERhcyB3cm90ZToNCj4NCj4gPiBBZGQgc3VwcG9ydCBm
b3IgR2lnYWJpdCBFdGhlcm5ldCBFLU1BQyBvbiByOGE3NzQzIChSWi9HMU0pIFNvQy4NCj4gPiBS
ZW5lc2FzIFJaL0cxTSAoUjhBNzc0MykgU29DIEV0aGVybmV0IEFWQiBJUCBpcyBpZGVudGljYWwg
dG8gdGhlIFItQ2FyDQo+ID4gR2VuMiBmYW1pbHkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IENocmlz
IFBhdGVyc29uIDxjaHJpcy5wYXRlcnNvbjJAcmVuZXNhcy5jb20+DQo+IFsuLi5dDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMNCj4gPiBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMNCj4gPiBpbmRleCA1OTMx
ZTg1Li5lMzViMzBmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVz
YXMvcmF2Yl9tYWluLmMNCj4gPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jh
dmJfbWFpbi5jDQo+ID4gQEAgLTE4NjksNiArMTg2OSw3IEBAIHN0YXRpYyBpbnQgcmF2Yl9tZGlv
X3JlbGVhc2Uoc3RydWN0IHJhdmJfcHJpdmF0ZQ0KPiA+ICpwcml2KSAgfQ0KPiA+DQo+ID4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHJhdmJfbWF0Y2hfdGFibGVbXSA9IHsNCj4g
PiAreyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLGV0aGVyYXZiLXI4YTc3NDMiLCAuZGF0YSA9ICh2
b2lkDQo+ID4gKyopUkNBUl9HRU4yIH0sDQo+DQo+ICAgICBObywgdGhpcyBzaG91bGRuJ3QgYmUg
bmVlZGVkIGlmIHlvdSBzcGVjaWZ5ICJyZW5lc2FzLGV0aGVyYXZiLXJjYXItZ2VuMiIuDQo+DQoN
ClRoYW5rcyBmb3IgdGhlIHJldmlldy4gSSB3aWxsIHJlbW92ZSB0aGlzIGNoYW5nZS4NCg0KPiA+
ICB7IC5jb21wYXRpYmxlID0gInJlbmVzYXMsZXRoZXJhdmItcjhhNzc5MCIsIC5kYXRhID0gKHZv
aWQNCj4gKilSQ0FSX0dFTjIgfSwNCj4gPiAgeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLGV0aGVy
YXZiLXI4YTc3OTQiLCAuZGF0YSA9ICh2b2lkDQo+ICopUkNBUl9HRU4yIH0sDQo+ID4gIHsgLmNv
bXBhdGlibGUgPSAicmVuZXNhcyxldGhlcmF2Yi1yY2FyLWdlbjIiLCAuZGF0YSA9ICh2b2lkDQo+
ID4gKilSQ0FSX0dFTjIgfSwNCj4NCj4gTUJSLCBTZXJnZWkNCj4NCj4gLS0NCj4gVG8gdW5zdWJz
Y3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGRldmljZXRy
ZWUiIGluIHRoZSBib2R5DQo+IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwu
b3JnIE1vcmUgbWFqb3Jkb21vIGluZm8gYXQNCj4gaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpv
cmRvbW8taW5mby5odG1sDQoNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBMdGQsIER1
a2VzIE1lYWRvdywgTWlsbGJvYXJkIFJvYWQsIEJvdXJuZSBFbmQsIEJ1Y2tpbmdoYW1zaGlyZSwg
U0w4IDVGSCwgVUsuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCAmIFdhbGVzIHVuZGVyIFJlZ2lzdGVy
ZWQgTm8uIDA0NTg2NzA5Lg0K
