Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:19357 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752360AbdHIJVo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 05:21:44 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 2/2] ARM: dts: r8a7743: Add IIC cores to dtsi
Date: Wed, 9 Aug 2017 09:21:38 +0000
Message-ID: <KL1PR06MB17020393F851912D578B9EAFB88B0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1502196418-31341-1-git-send-email-biju.das@bp.renesas.com>
 <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
In-Reply-To: <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2VyZ2VpIFNodHlseW92
IFttYWlsdG86c2VyZ2VpLnNodHlseW92QGNvZ2VudGVtYmVkZGVkLmNvbV0NCj4gU2VudDogMDkg
QXVndXN0IDIwMTcgMTA6MTcNCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNv
bT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Ow0KPiBNYXJrIFJ1dGxhbmQgPG1h
cmsucnV0bGFuZEBhcm0uY29tPg0KPiBDYzogU2ltb24gSG9ybWFuIDxob3Jtc0B2ZXJnZS5uZXQu
YXU+OyBXb2xmcmFtIFNhbmcgPHdzYUB0aGUtDQo+IGRyZWFtcy5kZT47IE1hZ251cyBEYW1tIDxt
YWdudXMuZGFtbUBnbWFpbC5jb20+OyBSdXNzZWxsIEtpbmcNCj4gPGxpbnV4QGFybWxpbnV4Lm9y
Zy51az47IENocmlzIFBhdGVyc29uIDxDaHJpcy5QYXRlcnNvbjJAcmVuZXNhcy5jb20+Ow0KPiBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMi8yXSBBUk06IGR0czogcjhhNzc0MzogQWRkIElJQyBjb3JlcyB0byBkdHNp
DQo+DQo+IE9uIDgvOC8yMDE3IDM6NDYgUE0sIEJpanUgRGFzIHdyb3RlOg0KPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4g
PiBUaGlzIHBhdGNoIGhhcyBiZWVuIHRlc3RlZCBhZ2FpbnN0IExpbnV4LW5leHQgdGFnIDIwMTcw
NzI3IGFuZCByZW5lc2FzLWRldg0KPiBicmFuY2guDQo+ID4gVGhpcyBwYXRjaCBkZXBlbmRzIG9u
DQo+ID4gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvYXJtLWtlcm5lbC9tc2c1OTkyMjAu
aHRtbA0KPiA+DQo+ID4gICBhcmNoL2FybS9ib290L2R0cy9yOGE3NzQzLmR0c2kgfCA1NQ0KPiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
Ym9vdC9kdHMvcjhhNzc0My5kdHNpDQo+ID4gYi9hcmNoL2FybS9ib290L2R0cy9yOGE3NzQzLmR0
c2kgaW5kZXggMTQyMjJjNzIuLjVjMmIxNDAgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvcjhhNzc0My5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcjhhNzc0My5k
dHNpDQo+IFsuLi5dDQo+ID4gQEAgLTQzNiw2ICs0MzksNTggQEANCj4gPiAgIHN0YXR1cyA9ICJk
aXNhYmxlZCI7DQo+ID4gICB9Ow0KPiA+DQo+ID4gK2kyYzY6IGkyY0BlNjBiMDAwMCB7DQo+DQo+
ICAgICBJJ2QgdXNlIGlpYzAgYXMgdGhlIGxhYmVsLg0KPg0KPiA+ICsvKiBkb2Vzbid0IG5lZWQg
cGlubXV4ICovDQo+ID4gKyNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsjc2l6ZS1jZWxscyA9
IDwwPjsNCj4gPiArY29tcGF0aWJsZSA9ICJyZW5lc2FzLGlpYy1yOGE3NzQzIiwNCj4gPiArICAg
ICAicmVuZXNhcyxyY2FyLWdlbjItaWljIiwNCj4gPiArICAgICAicmVuZXNhcyxybW9iaWxlLWlp
YyI7DQo+ID4gK3JlZyA9IDwwIDB4ZTYwYjAwMDAgMCAweDQyNT47DQo+ID4gK2ludGVycnVwdHMg
PSA8R0lDX1NQSSAxNzMgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gK2Nsb2NrcyA9IDwmY3Bn
IENQR19NT0QgOTI2PjsNCj4gPiArZG1hcyA9IDwmZG1hYzAgMHg3Nz4sIDwmZG1hYzAgMHg3OD4s
DQo+ID4gKyAgICAgICA8JmRtYWMxIDB4Nzc+LCA8JmRtYWMxIDB4Nzg+Ow0KPiA+ICtkbWEtbmFt
ZXMgPSAidHgiLCAicngiLCAidHgiLCAicngiOw0KPiA+ICtwb3dlci1kb21haW5zID0gPCZzeXNj
IFI4QTc3NDNfUERfQUxXQVlTX09OPjsNCj4gPiArcmVzZXRzID0gPCZjcGcgQ1BHX01PRCA5MjY+
Ow0KPg0KPiAgICAgQ1BHX01PRCBub3QgbmVlZGVkIGhlcmUsIGl0J3Mgbm90IGEgImNsb2NrcyIg
cHJvcC4NClRoYW5rcyBTZXJnaWUsICBJIHdpbGwgY29ycmVjdCB0aGlzLg0KWz5dDQo+IFsuLi5d
DQo+DQo+IE1CUiwgU2VyZ2VpDQoNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBMdGQs
IER1a2VzIE1lYWRvdywgTWlsbGJvYXJkIFJvYWQsIEJvdXJuZSBFbmQsIEJ1Y2tpbmdoYW1zaGly
ZSwgU0w4IDVGSCwgVUsuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCAmIFdhbGVzIHVuZGVyIFJlZ2lz
dGVyZWQgTm8uIDA0NTg2NzA5Lg0K
