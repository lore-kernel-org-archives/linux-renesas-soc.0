Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:54313 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752466AbdGFIFu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jul 2017 04:05:50 -0400
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>
CC: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] ARM: shmobile: defconfig: Enable Ethernet AVB
Date: Thu, 6 Jul 2017 08:05:43 +0000
Message-ID: <TY1PR06MB07020F58F15C964FC1AA1D22B7D50@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <afcd181c-c805-8f3c-955f-652d001a03d4@cogentembedded.com>
 <1499270189-29945-1-git-send-email-biju.das@bp.renesas.com>
 <1499270189-29945-3-git-send-email-biju.das@bp.renesas.com>
 <12c32eee-8e4d-457e-97d7-625a5c63ad59@cogentembedded.com>
In-Reply-To: <12c32eee-8e4d-457e-97d7-625a5c63ad59@cogentembedded.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gU2VyZ2VpLCANCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzLg0KDQo+IEZyb206
IFNlcmdlaSBTaHR5bHlvdiBbbWFpbHRvOnNlcmdlaS5zaHR5bHlvdkBjb2dlbnRlbWJlZGRlZC5j
b21dDQo+IFNlbnQ6IDA1IEp1bHkgMjAxNyAxNzoxNA0KPiANCj4gSGVsbG8hDQo+IA0KPiBPbiAw
Ny8wNS8yMDE3IDA2OjU2IFBNLCBCaWp1IERhcyB3cm90ZToNCj4gDQo+ID4gVGhlIGlXYXZlIFJa
L0cxTSBRNyBTT00gc3VwcG9ydHMgR2lnYWJpdCBFdGhlcm5ldCBQaHkgKE1pY3JlbA0KPiBLU1o5
MDMxTU5YKS4NCj4gPiBHaWdhYml0IEV0aGVybmV0IHN1cHBvcnQgaXMgYXZhaWxhYmxlIGluIFJl
bmVzYXMgQVZCIGRyaXZlci4NCj4gPiBUbyBpbmNyZWFzZSBoYXJkd2FyZSBzdXBwb3J0IGVuYWJs
ZSB0aGUgZHJpdmVyIGluIHRoZQ0KPiA+IHNobW9iaWxlX2RlZmNvbmZpZyBtdWx0aXBsYXRmb3Jt
IGNvbmZpZ3VyYXRpb24uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXNAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IENocmlzIFBhdGVyc29uIDxjaHJp
cy5wYXRlcnNvbjJAcmVuZXNhcy5jb20+DQo+ID4gQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtL2NvbmZp
Z3Mvc2htb2JpbGVfZGVmY29uZmlnIHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3Mvc2htb2JpbGVf
ZGVmY29uZmlnDQo+ID4gYi9hcmNoL2FybS9jb25maWdzL3NobW9iaWxlX2RlZmNvbmZpZw0KPiA+
IGluZGV4IDNjNjZhNDIuLmQ5OTI5MTEgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm0vY29uZmln
cy9zaG1vYmlsZV9kZWZjb25maWcNCj4gPiArKysgYi9hcmNoL2FybS9jb25maWdzL3NobW9iaWxl
X2RlZmNvbmZpZw0KPiA+IEBAIC04Myw2ICs4Myw3IEBAIENPTkZJR19ORVRERVZJQ0VTPXkNCj4g
PiAgIyBDT05GSUdfTkVUX1ZFTkRPUl9NSUNSRUwgaXMgbm90IHNldCAgIw0KPiBDT05GSUdfTkVU
X1ZFTkRPUl9OQVRTRU1JIGlzDQo+ID4gbm90IHNldCAgQ09ORklHX1NIX0VUSD15DQo+ID4gK0NP
TkZJR19SQVZCPXkNCj4gDQo+ICAgICBIbSwgSSB3b3VsZCBlbmFibGUgaXQgb25seSBhcyBhIG1v
ZHVsZSwgZ2l2ZW4gaXQncyBub3QgZWFzeSB0byBtYWtlIHVzZSBvZg0KPiBBVkIgb24gdGhlIDMy
LWJpdCBib2FyZHMuDQoNCk9uIHRoZSBpV2F2ZS1NIHBsYXRmb3JtcyB0aGUgb25seSBhdmFpbGFi
bGUgRXRoZXJuZXQgaW50ZXJmYWNlIGlzIEFWQi4gV2l0aG91dCBpbmNsdWRpbmcgdGhlIFJBVkIg
ZHJpdmVyIGluIHRoZSBLZXJuZWwgd2Ugd29uJ3QgYmUgYWJsZSB0byB1c2UgTkZTLg0KDQpJIGtu
b3cgYWRkaW5nIENPTkZJR19SQVZCIGZvciBhbGwgc2htb2JpbGUgZGV2aWNlcyBtYXkgaW5jcmVh
c2UgdGhlIEtlcm5lbCBzaXplIGZvciBldmVyeW9uZSwgZXNwZWNpYWxseSB3aGVuIG1vc3QgY2Fu
bm90IHVzZSBBVkIgd2l0aG91dCBhbiBhZGQtb24gYm9hcmQsIGJ1dCBJIGRvbid0IHRoaW5rIHRo
ZSBpbmNyZWFzZSB3aWxsIGJlIGJpZy4NCg0KDQpLaW5kIHJlZ2FyZHMsIENocmlzIA0KDQo+IA0K
PiBbLi4uXQ0KPiANCj4gTUJSIFNlcmdlaQ0KDQo=
