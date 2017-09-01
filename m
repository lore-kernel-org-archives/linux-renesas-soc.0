Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:56003 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751009AbdIACnd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 22:43:33 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "kishon@ti.com" <kishon@ti.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/4] phy: rcar-gen3-usb2: check dr_mode for otg mode
Date: Fri, 1 Sep 2017 02:43:29 +0000
Message-ID: <SG2PR06MB0981D9D229370B1A6DAD241DD8920@SG2PR06MB0981.apcprd06.prod.outlook.com>
References: <1504164672-20677-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1504164672-20677-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <3a5b6050-01c6-1f92-7d79-42b74c692e3c@cogentembedded.com>
In-Reply-To: <3a5b6050-01c6-1f92-7d79-42b74c692e3c@cogentembedded.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2VyZ2VpIFNo
dHlseW92DQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMzEsIDIwMTcgNjo0MSBQTQ0KPiANCj4g
SGVsbG8hDQo+IA0KPiBPbiA4LzMxLzIwMTcgMTA6MzEgQU0sIFlvc2hpaGlybyBTaGltb2RhIHdy
b3RlOg0KPiANCj4gPiBUaGUgcHJldmlvdXMgY29kZSBhc3N1bWVkIGEgY2hhbm5lbCBoYXMgb3Rn
IGNhcGFiaWxpdHkgaWYgYSBjaGFubmVsDQo+ID4gaGFzIGludGVycnVwdCBwcm9wZXJ0eS4gQnV0
LCBpdCBpcyBub3QgZ29vZCBiZWNhdXNlOg0KPiA+ICAgLSBCYXR0ZXJ5IGNoYXJnaW5nIGZlYXR1
cmUgYWxzbyBuZWVkcyBpbnRlcnJ1cHQgcHJvcGVydHkuDQo+ID4gICAtIFNvbWUgUi1DYXIgR2Vu
MyBTb0NzIChlLmcuIFItQ2FyIEQzKSBkb2Vzbid0IGhhdmUgT1RHIGNhcGFiaWxpdHkuDQo+IA0K
PiAgICAgRG9uJ3QuDQoNClRoYW5rIHlvdSBmb3IgdGhlIHBvaW50LiBJIHdpbGwgcmV2aXNlIGl0
Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+ID4gU28sIHRoaXMgcGF0
Y2ggY2hlY2tzIHdoZXRoZXIgdXNiIDIuMCBob3N0IG5vZGUgaGFzIGRyX21vZGUgcHJvcGVydHkg
b3INCj4gPiBub3QuIElmIGl0IGhhcyAnZHJfbW9kZSA9ICJvdGciOycsIHRoaXMgZHJpdmVyIGVu
YWJsZXMgb3RnIGNhcGFiaWxpdHkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8g
U2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IFsuLi5dDQo+IA0K
PiBNQlIsIFNlcmdlaQ0K
