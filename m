Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:30141 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751291AbdAMRQt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2017 12:16:49 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
Date: Fri, 13 Jan 2017 17:16:32 +0000
Message-ID: <SG2PR06MB1165D0D67AD68A12030C961D8A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170112181149.29035-1-chris.brandt@renesas.com>
 <CAMuHMdUz6nb-STMQK39hDqwHRt4R5t+Lndj150Lkg7prN=HQZQ@mail.gmail.com>
 <PS1PR06MB116243F531726538252C2BAE8A780@PS1PR06MB1162.apcprd06.prod.outlook.com>
 <CAMuHMdVkTS21UnZA9OyEZ=mR5+GtAEbiLwpe=uKB_O6deXBPyw@mail.gmail.com>
In-Reply-To: <CAMuHMdVkTS21UnZA9OyEZ=mR5+GtAEbiLwpe=uKB_O6deXBPyw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCg0KPiA+IEJ1dC4uLnRoYXQgd291bGQgbWFrZSBtZSB0aGluayBvbiBib290
IGl0IHdvdWxkIGJlIHNldCB0byAnMDEnIChzZXR0aW5nIHByb2hpYml0ZWQpLg0KPiANCj4gWWVh
aCwgcnVubmluZyB3aXRoIGVuYWJsZWQgU0RISSBjb3JlIGFuZCBkaXNhYmxlZCBjYXJkIGRldGVj
dCBzb3VuZHMgc2lsbHkuDQoNCkkganVzdCBkaWQgc29tZSB0ZXN0aW5nIGFuZCB3aXRoIG9ubHkg
MSBjbG9jayBlbmFibGVkICgnMDEnKSwgdGhlIGNvcmUgd29ya3MgYnV0DQpjYXJkIGRldGVjdCBk
b2Vzbid0IHdvcmsuIElmIHlvdSBib290IHdpdGggdGhlIGNhcmQgaW4sIHlvdSBjYW4gcmVhZCBp
dCBmaW5lLCBidXQNCmlmIHlvdSBwdWxsIGl0Li4ubm8gcmVtb3ZhbCBpcyBkZXRlY3RlZC4NCkFz
IHNvb24gYXMgSSB0dXJuIHRoZSBvdGhlciBjbG9jayBvbiAoJzAwJyksIGNhcmQgZGV0ZWN0IG1h
Z2ljYWxseSBzdGFydHMgd29ya2luZy4NCg0KU28gZnJvbSBteSBleHBlcmltZW50czoNCg0KICAw
MDogU0QgSG9zdCBJbnRlcmZhY2UgMSBNb2R1bGUgcnVucy4NCiAgICAgID4+IGV2ZXJ5dGhpbmcg
d29ya3MNCg0KICAwMTogU2V0dGluZyBwcm9oaWJpdGVkLg0KICAgICAgPj4gY29yZSBydW5zLCBi
dXQgbm8gY2FyZCBkZXRlY3QNCg0KICAxMDogT25seSBjYXJkIGRldGVjdCBibG9jayBpbiBTRCBI
b3N0IEludGVyZmFjZSAxIE1vZHVsZSBydW5zLg0KICAgICAgPj4gU0RISSBhZGRyZXNzIHNwYWNl
IGFsbCAwMHMgKGNvcmUgbm90IHJ1bm5pbmcpDQoNCiAgMTE6IENsb2NrIHN1cHBseSB0byBTRCBI
b3N0IEludGVyZmFjZSAxIE1vZHVsZSBpcyBoYWx0ZWQNCiAgICAgID4+IG5vdGhpbmcgd29ya3Mg
KG9mIGNvdXJzZSkNCg0KDQo+IFNvIHR5cGljYWxseSB5b3Ugd2FudCB0byB1c2UgMTAgd2hlbiBp
ZGxlLCBhbmQgMDAgd2hlbiBhY3RpdmUuDQoNCkkgd29uZGVyIGlmIHRoYXQgd291bGQgbWVhbiB0
aGUgc3lzdGVtIHdvdWxkIGdldCBhIENEIGludGVycnVwdC4gT2YgY291cnNlDQppZiBubyBJU1Ig
cmVnaXN0ZXJlZCAoU0RISSBub3QgZW5hYmxlZCksIHRoZSBrZXJuZWwgd291bGQgdGhyb3cgaXQg
YXdheS4NCg0KDQo+IE5vIHRoZXJlIGlzbid0LiBUaGF0J3MgYW5vdGhlciByZWFzb24gd2h5IGEg
ZnVsbC1mbGVkZ2VkIGNsb2NrIGRyaXZlciB3aXRoDQo+IHRhYmxlcyBpbiBDIGlzIGEgYmV0dGVy
IGlkZWEgdGhhbiB0cnlpbmcgdG8gZGVzY3JpYmUgYWxsIGNsb2NrcyBpbiBEVC4NCj4gVGhlIG5l
dyBDUEcvTVNTUiBiYXNlZCBkcml2ZXIgKHJlbmVzYXMtY3BnLW1zc3IuYykgc3VwcG9ydHMgImNy
aXRpY2FsDQo+IG1vZHVsZSBjbG9ja3MiIHRocm91Z2ggQ0xLX0VOQUJMRV9IQU5EX09GRi4gVW5m
b3J0dW5hdGVseSB0aGF0IGZsYWcgaGFzbid0DQo+IG1hZGUgaXQgdXBzdHJlYW0sIHNvIEkgcmVh
bGx5IHNob3VsZCBjb252ZXJ0IHRoZSBkcml2ZXIgdG8gdXNlIHRoZSBuZXcNCj4gQ0xLX0lTX0NS
SVRJQ0FMIGluc3RlYWQuLi4NCg0KU28gYmFzaWNhbGx5IGF0IHRoZSBtb21lbnQgeW91J3JlIHRl
bGwgbWUgaXQncyBnb2luZyB0byBzdGF5IGJyb2tlICh1bmxlc3MgaXQncw0KZW5hYmxlZCBpbiB1
LWJvb3QpLg0KDQoNCkluIHNoX21vYmlsZV9zZGhpLmMsIGNhbiB3ZSBjaGFuZ2Ugc2hfbW9iaWxl
X3NkaGlfcHJvYmUoKSBzbyB0aGF0IGlmIHRoZXJlDQphcmUgMiBjbG9ja3Mgc3BlY2lmaWVkIChp
biBEVCBvciBwbGF0Zm9ybSBkYXRhKSwgaXQgYXV0b21hdGljYWxseSBlbmFibGVzDQp0aGUgMm5k
IGNsb2NrIChmb3JldmVyKSBhbmQganVzdCB1c2VzIHRoZSAxc3QgY2xvY2sgYXMgdGhlIG9uL29m
ZiBjbG9jaz8NCg0KDQoNCkNocmlzDQoNCg0KDQo=
