Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:30688 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755413AbdGKMUN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2017 08:20:13 -0400
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>
CC: "David S. Miller" <davem@davemloft.net>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [PATCH v2] dt-bindings: net: ravb : Add support for r8a7743 SoC
Date: Tue, 11 Jul 2017 12:20:06 +0000
Message-ID: <TY1PR06MB07023342440946F384B7C80EB7AE0@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <20170710012024.j4cso2jyi6canws2@rob-hp-laptop>
 <1499700776-54504-1-git-send-email-biju.das@bp.renesas.com>
 <52eb0b92-5d25-e1f4-df54-e4fcf648c90e@cogentembedded.com>
In-Reply-To: <52eb0b92-5d25-e1f4-df54-e4fcf648c90e@cogentembedded.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gU2VyZ2VpLA0KDQo+IEZyb206IFNlcmdlaSBTaHR5bHlvdiBbbWFpbHRvOnNlcmdlaS5z
aHR5bHlvdkBjb2dlbnRlbWJlZGRlZC5jb21dDQo+IFNlbnQ6IDExIEp1bHkgMjAxNyAxMzoxMg0K
PiANCj4gSGVsbG8hDQo+IA0KPiBPbiAwNy8xMC8yMDE3IDA2OjMyIFBNLCBCaWp1IERhcyB3cm90
ZToNCj4gDQo+ID4gQWRkIGEgbmV3IGNvbXBhdGlibGUgc3RyaW5nIGZvciB0aGUgUlovRzFNIChS
OEE3NzQzKSBTb0MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNA
YnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjEtPnYyDQo+ID4gKiBDaGFuZ2VkIHRoZSBz
dWJqZWN0DQo+ID4gKiByZS1mb3JtYXR0ZWQgdGhlIHJlcXVpcmVkIHByb3BlcnRpZXMNCj4gPg0K
PiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyYXZiLnR4dCAgICAgICB8
IDI5ICsrKysrKysrKysrKystLS0tLS0NCj4gLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVzYXMscmF2Yi50eHQNCj4gPiBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyYXZiLnR4dA0K
PiA+IGluZGV4IGI1MTk1MDMuLjQ3MTdiYzIgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJhdmIudHh0DQo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJhdmIudHh0DQo+ID4g
QEAgLTQsMTkgKzQsMjQgQEAgVGhpcyBmaWxlIHByb3ZpZGVzIGluZm9ybWF0aW9uIG9uIHdoYXQg
dGhlIGRldmljZQ0KPiA+IG5vZGUgZm9yIHRoZSBFdGhlcm5ldCBBVkIgIGludGVyZmFjZSBjb250
YWlucy4NCj4gPg0KPiA+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+IC0tIGNvbXBhdGlibGU6
ICJyZW5lc2FzLGV0aGVyYXZiLXI4YTc3OTAiIGlmIHRoZSBkZXZpY2UgaXMgYSBwYXJ0IG9mIFI4
QTc3OTANCj4gU29DLg0KPiA+IC0JICAgICAgInJlbmVzYXMsZXRoZXJhdmItcjhhNzc5MSIgaWYg
dGhlIGRldmljZSBpcyBhIHBhcnQgb2YgUjhBNzc5MSBTb0MuDQo+ID4gLQkgICAgICAicmVuZXNh
cyxldGhlcmF2Yi1yOGE3NzkyIiBpZiB0aGUgZGV2aWNlIGlzIGEgcGFydCBvZiBSOEE3NzkyIFNv
Qy4NCj4gPiAtCSAgICAgICJyZW5lc2FzLGV0aGVyYXZiLXI4YTc3OTMiIGlmIHRoZSBkZXZpY2Ug
aXMgYSBwYXJ0IG9mIFI4QTc3OTMgU29DLg0KPiA+IC0JICAgICAgInJlbmVzYXMsZXRoZXJhdmIt
cjhhNzc5NCIgaWYgdGhlIGRldmljZSBpcyBhIHBhcnQgb2YgUjhBNzc5NCBTb0MuDQo+ID4gLQkg
ICAgICAicmVuZXNhcyxldGhlcmF2Yi1yOGE3Nzk1IiBpZiB0aGUgZGV2aWNlIGlzIGEgcGFydCBv
ZiBSOEE3Nzk1IFNvQy4NCj4gPiAtCSAgICAgICJyZW5lc2FzLGV0aGVyYXZiLXI4YTc3OTYiIGlm
IHRoZSBkZXZpY2UgaXMgYSBwYXJ0IG9mIFI4QTc3OTYgU29DLg0KPiA+IC0JICAgICAgInJlbmVz
YXMsZXRoZXJhdmItcmNhci1nZW4yIiBmb3IgZ2VuZXJpYyBSLUNhciBHZW4gMiBjb21wYXRpYmxl
DQo+IGludGVyZmFjZS4NCj4gPiAtCSAgICAgICJyZW5lc2FzLGV0aGVyYXZiLXJjYXItZ2VuMyIg
Zm9yIGdlbmVyaWMgUi1DYXIgR2VuIDMgY29tcGF0aWJsZQ0KPiBpbnRlcmZhY2UuDQo+ID4gKy0g
Y29tcGF0aWJsZTogTXVzdCBjb250YWluIG9uZSBvciBtb3JlIG9mIHRoZSBmb2xsb3dpbmc6DQo+
IA0KPiAgICAgTm8sIGl0IGNhbid0IGNvbnRhaW4gbW9yZSB0aGFuIG9uZSBTb0Mgc3BlY2lmaWMg
dmFsdWUuDQoNClN1cmVseSBpdCBjYW4gY29udGFpbiBib3RoICJyZW5lc2FzLGV0aGVyYXZiLXI4
YTc3NDMiIGFuZCAicmVuZXNhcyxldGhlcmF2Yi1yY2FyLWdlbjIiIGZvciBleGFtcGxlPw0KDQpB
cyBpbmRlZWQgZGljdGF0ZWQgYnkgdGhlIGluc3RydWN0aW9uIGZ1cnRoZXIgZG93bjoNCg0KPiA+
ICsJV2hlbiBjb21wYXRpYmxlIHdpdGggdGhlIGdlbmVyaWMgdmVyc2lvbiwgbm9kZXMgbXVzdCBs
aXN0IHRoZQ0KPiA+ICsJU29DLXNwZWNpZmljIHZlcnNpb24gY29ycmVzcG9uZGluZyB0byB0aGUg
cGxhdGZvcm0gZmlyc3QgZm9sbG93ZWQgYnkNCj4gPiArCXRoZSBnZW5lcmljIHZlcnNpb24uDQoN
CktpbmQgcmVnYXJkcywgQ2hyaXMNCg==
