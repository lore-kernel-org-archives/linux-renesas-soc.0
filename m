Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:62162 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932157AbdERMTb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2017 08:19:31 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Petre Pircalabu <petre.pircalabu@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "horms@verge.net.au" <horms@verge.net.au>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "mirea_bogdan@mentor.com" <mirea_bogdan@mentor.com>,
        Petre Pircalabu <Petre_Pircalabu@mentor.com>
Subject: RE: [PATCH] phy: rcar-gen3-usb3: Initial support for xhci phy
Date: Thu, 18 May 2017 12:19:25 +0000
Message-ID: <TY1PR06MB099210D9B30BA7EB7F276455D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1495043888-20934-1-git-send-email-Petre_Pircalabu@mentor.com>
 <TY1PR06MB09928E2327894F8E9E7738D4D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdV4z8TBdBAsWCLNZ4r8vE7Qa-6_X711A2RtBwEa_RNrgg@mail.gmail.com>
 <TY1PR06MB0992B8DC97323FF06A0B7BA3D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdVzk6yqV8nB9OrfnQRHG3X=5o2D4wiu_87p0aBzAqBZkg@mail.gmail.com>
In-Reply-To: <CAMuHMdVzk6yqV8nB9OrfnQRHG3X=5o2D4wiu_87p0aBzAqBZkg@mail.gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiBTZW50OiBUaHVy
c2RheSwgTWF5IDE4LCAyMDE3IDg6NDEgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
T24gVGh1LCBNYXkgMTgsIDIwMTcgYXQgMToxMyBQTSwgWW9zaGloaXJvIFNoaW1vZGENCj4gPHlv
c2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPj4gPj4gKy0gcmVnOiBv
ZmZzZXQgYW5kIGxlbmd0aCBvZiB0aGUgcGFydGlhbCBVU0IgMy4wIEhvc3QgUEhZIHJlZ2lzdGVy
IGJsb2NrLg0KPiA+PiA+PiArLSAjcGh5LWNlbGxzOiBzZWUgcGh5LWJpbmRpbmdzLnR4dCBpbiB0
aGUgc2FtZSBkaXJlY3RvcnksIG11c3QgYmUgPDA+Lg0KPiA+PiA+DQo+ID4+ID4gSSB0aGluayB3
ZSBzaG91bGQgYWRkICJjbG9ja3MiIHByb3BlcnR5IGFzIHJlcXVpcmVkLg0KPiA+PiA+DQo+ID4+
ID4+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+PiA+DQo+ID4+ID4gWW91IHNob3VsZCBhZGQg
InJlbmVzYXMsdXNlLW9uLWNoaXAtY2xrIiBoZXJlLg0KPiA+PiA+IEFuZCwgdGhlIG5hbWUgb2Yg
InVzZS1vbi1jaGlwLWNsayIgaXMgbm90IGdvb2QgdG8gbWUuDQo+ID4+ID4gRllJLCBteSBkZXZl
bG9waW5nIHBhdGNoIG5hbWVzICJyZW5lc2FzLHVzYi1leHRhbCIuDQoNCkknbSBzb3JyeSBmb3Ig
dGhpcy4gSSBtaXNzZWQgZGVzY3JpcHRpb24gIm9uLWNoaXAgY2xvY2sgc291cmNlIGlzIHN1cHBs
aWVkIHRob3VnaA0KVVNCX0VYVEFML1VTQl9YVEFMIiBpbiB0aGUgbWFudWFsLiBTbywgdGhpcyAi
cmVuZXNhcyx1c2Utb24tY2hpcC1jbGsiIGlzIHJlYXNvbmFibGUuDQoNCj4gPj4gQ2FuIHRoaXMg
YmUgZGVjaWRlZCBhdCBydW50aW1lLCBlLmcuIGJ5IGxvb2tpbmcgYXQgdGhlIHJhdGVzIG9mIHRo
ZSBjbG9ja3MNCj4gPj4gdG8gc2VlIHdoaWNoIG9uZSBpcyBhdmFpbGFibGUvYmVzdCBzdWl0ZWQ/
DQo+ID4NCj4gPiBBY2NvcmRpbmcgdG8gdGhlIEhXIG1hbnVhbCwgdGhpcyBtb2R1bGUgY2Fubm90
IHNlZSB3aGljaCBvbmUgaXMgYXZhaWxhYmxlL2Jlc3Qgc3VpdGVkLg0KPiA+IFNvLCBJIGRvbid0
IHRoaW5rIHRoaXMgY2FuIGJlIGRlY2lkZWQgYXQgcnVudGltZS4NCj4gDQo+IEkgbWVhbiwgY2Fu
J3QgTGludXggbG9vayBhdCB0aGUgcmF0ZXMgb2YgdGhlIHR3byBjbG9ja3MsIGFuZCBpZiBvbmUg
aXMgemVybywNCj4gdXNlIHRoZSBvdGhlcj8NCg0KSSBzdGlsbCBtaXN1bmRlcnN0YW5kIHlvdXIg
cXVlc3Rpb24gdGhvdWdoLCBidXQgc29mdHdhcmUgY2Fubm90IGxvb2sgYXQgdGhlIHJhdGVzDQpv
ZiBVU0IzUzBfQ0xLX1AvVVNCM1MwX0NMS19NIGFuZCBVU0JfRVhUQUwvWFRBTCBiZWNhdXNlIHRo
ZSBIVyBkb2Vzbid0IGhhdmUgcmVnaXN0ZXJzDQpmb3IgaW5kaWNhdGluZyB0aGUgcmF0ZXMuDQoN
CkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gR3J7b2V0amUsZWV0aW5nfXMs
DQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMg
VG9ydmFsZHMNCg==
