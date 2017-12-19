Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:33069 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751520AbdLSLhS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Dec 2017 06:37:18 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "Biju Das" <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2 3/6] ARM: dts: r8a7743: Add PWM SoC support
Date: Tue, 19 Dec 2017 11:37:12 +0000
Message-ID: <TY1PR06MB089542724CCC3530DD4677F5C00F0@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1513619528-12060-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513619528-12060-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVEgBq+eZqAeas3kf3ARHegSQK9xyVrTDHRyctyTK87QQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVEgBq+eZqAeas3kf3ARHegSQK9xyVrTDHRyctyTK87QQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAzLzZdIEFSTTogZHRzOiBy
OGE3NzQzOiBBZGQgUFdNIFNvQyBzdXBwb3J0DQo+DQo+IE9uIE1vbiwgRGVjIDE4LCAyMDE3IGF0
IDY6NTIgUE0sIEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiBBZGQgdGhlIGRlZmluaXRpb25zIGZvciBwd21bMDEyMzQ1Nl0gdG8g
dGhlIFNvQyAuZHRzaS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8
ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+DQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPg0KPiA+IC0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3I4YTc3NDMuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3
NDMuZHRzaQ0KPiA+IEBAIC0xMDgyLDYgKzEwODIsODMgQEANCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICAgICAgICAgICAgICAgICB9Ow0KPiA+
DQo+ID4gKyAgICAgICAgICAgICAgIHB3bTA6IHB3bUBlNmUzMDAwMCB7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHB3bS1yOGE3NzQzIiwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInJlbmVzYXMscHdtLXJjYXIiOw0K
Pg0KPiBJIHRoaW5rIHRoZSBhYm92ZSBjYW4gZml0IGluIG9uZSBsaW5lLg0KDQpkbyB5b3UgdGhp
bmsgdGhpcyBkZXNlcnZlcyBhIHYzPw0KDQpUaGFua3MsDQpGYWINCg0KPg0KPiBHcntvZXRqZSxl
ZXRpbmd9cywNCj4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4NCj4gLS0NCj4g
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPg0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4g
SSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29t
ZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0KDQoNCltodHRwczovL3d3dzIucmVuZXNhcy5ldS9tZWRpYS9lbWFpbC91
bmljZWZfMjAxNy5qcGddDQoNClRoaXMgQ2hyaXN0bWFzLCBpbnN0ZWFkIG9mIHNlbmRpbmcgb3V0
IGNhcmRzLCBSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBoYXZlIGRlY2lkZWQgdG8gc3VwcG9y
dCBVbmljZWYgd2l0aCBhIGRvbmF0aW9uLiBGb3IgZnVydGhlciBkZXRhaWxzIGNsaWNrIGhlcmU8
aHR0cHM6Ly93d3cudW5pY2VmLm9yZy8+IHRvIGZpbmQgb3V0IGFib3V0IHRoZSB2YWx1YWJsZSB3
b3JrIHRoZXkgZG8sIGhlbHBpbmcgY2hpbGRyZW4gYWxsIG92ZXIgdGhlIHdvcmxkLg0KV2Ugd291
bGQgbGlrZSB0byB0YWtlIHRoaXMgb3Bwb3J0dW5pdHkgdG8gd2lzaCB5b3UgYSBNZXJyeSBDaHJp
c3RtYXMgYW5kIGEgcHJvc3Blcm91cyBOZXcgWWVhci4NCg0KDQoNClJlbmVzYXMgRWxlY3Ryb25p
Y3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVhZG93LCBNaWxsYm9hcmQgUm9hZCwgQm91cm5lIEVuZCwg
QnVja2luZ2hhbXNoaXJlLCBTTDggNUZILCBVSy4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYgV2Fs
ZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4gMDQ1ODY3MDkuDQo=
