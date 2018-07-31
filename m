Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:57521 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727071AbeGaJLw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 05:11:52 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: r8a77990: Enable PWM for Ebisu board
Date: Tue, 31 Jul 2018 07:32:50 +0000
Message-ID: <OSBPR01MB2293229BD968492CF115C337D82E0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1532951531-29188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVEMs6j-GVVQdUN5Hx8ExSHWcyKinLjU8eKCZOfzXBb8g@mail.gmail.com>
 <OSBPR01MB2293CA243F691BD9AF07A948D82E0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <CAMuHMdXTK436z=qvN_CU6Ehvi-vXZ=c=nvwAnpaVybDhQWn1GA@mail.gmail.com>
In-Reply-To: <CAMuHMdXTK436z=qvN_CU6Ehvi-vXZ=c=nvwAnpaVybDhQWn1GA@mail.gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgSnVseSAzMSwgMjAxOCAzOjM5IFBNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IE9u
IFR1ZSwgSnVsIDMxLCAyMDE4IGF0IDg6MTQgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hp
aGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0IFV5
dHRlcmhvZXZlbiwgU2VudDogVHVlc2RheSwgSnVseSAzMSwgMjAxOCAxMjozNCBBTQ0KPiA+ID4g
T24gTW9uLCBKdWwgMzAsIDIwMTggYXQgMTo1NSBQTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA+ID4g
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gVGhpcyBw
YXRjaCBhZGRzIFBXTSBkZXZpY2Ugbm9kZXMgYW5kIGVuYWJsZXMgUFdNMyBhbmQgUFdNNSBmb3IN
Cj4gPiA+ID4gUi1DYXIgRTMgRWJpc3UgYm9hcmQuDQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciB5
b3VyIHBhdGNoIQ0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyENCj4gPg0KPiA+
ID4gVGhpcyBpcyB1c2VkIGZvciBibGFja2xpZ2h0IGNvbnRyb2wsIHJpZ2h0Pw0KPiA+DQo+ID4g
WWVzLg0KPiA+DQo+ID4gPiBJdCBtYXkgYmUgYSBnb29kIGlkZWEgdG8gbWVudGlvbiB0aGF0IGlu
IHRoZSBjb21tZW50cyBhbmQvb3IgcGF0Y2gNCj4gPiA+IGRlc2NyaXB0aW9uLg0KPiA+DQo+ID4g
SSBnb3QgaXQuIEknbGwgcmV2aXNlIHRoZSBwYXRjaCBkZXNjcmlwdGlvbiBhcyB0aGUgZm9sbG93
aW5nLiBJcyBpdCBnb29kPw0KPiA+DQo+ID4gLS0tDQo+ID4gVGhpcyBwYXRjaCBhZGRzIFBXTSBk
ZXZpY2Ugbm9kZXMgYW5kIGVuYWJsZXMgUFdNMyBhbmQgUFdNNSBmb3INCj4gPiBSLUNhciBFMyBF
YmlzdSBib2FyZC4gVGhlc2UgZGV2aWNlcyBhcmUgdXNlZCBmb3IgYmFja2xpZ2h0IGNvbnRyb2wu
DQo+IA0KPiBTb3VuZHMgZ29vZCB0byBtZS4gVGhhbmtzIQ0KDQpUaGFuayB5b3UgZm9yIHlvdXIg
Y29tbWVudCEgSSdsbCBzdWJtaXQgdjIgcGF0Y2guDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGly
byBTaGltb2RhDQoNCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3Mg
bG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4g
SW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBt
eXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkg
anVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
