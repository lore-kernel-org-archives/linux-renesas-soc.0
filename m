Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:56804 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751846AbdLEDXN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 22:23:13 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "USB list" <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: RE: [PATCH] PM / runtime: Drop children check from
 __pm_runtime_set_status()
Date: Tue, 5 Dec 2017 03:23:06 +0000
Message-ID: <TY1PR06MB0992214C75585618A1400A1CD83D0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1713438.irjm9MTSvo@aspire.rjw.lan>
 <CAMuHMdV4LV2Uzh2oGdaPiS4W4dfsZ-pn3rGcJNiZLStfo39How@mail.gmail.com>
 <TY1PR06MB09928D43D4E5E5752A6A604ED83A0@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAPDyKFoF0WMSTuK4AAyDzerpVpnfEq=Hn1n9kDJM0fYMkFL_wA@mail.gmail.com>
 <TY1PR06MB09924E4F66C6FCF131EE71CFD83B0@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAPDyKFoG2-mVGDtzPyg2FDVbXnsWGy543craKqeBVE_awKpf8Q@mail.gmail.com>
 <CAMuHMdViD3vqzits=th52+01d5y3p5iwbAg0jbUBcoGvYfULuA@mail.gmail.com>
 <CAPDyKFpRrQr3LRXH_CoLSYe2a=2PnUqvuNWUYSuh0wm+rBJ0dw@mail.gmail.com>
 <TY1PR06MB09928B145D35E52444F8D462D8380@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAPDyKFr8D4jL2vwO5tdBJnNVP=DoAD6H_K=4SQbu7rFAZFd3Xg@mail.gmail.com>
 <TY1PR06MB09929CD76E67B64FDE54B170D8390@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAPDyKFr4=Vct_-w1euOsEnb3WdeBvH9mz12zNTUfX7Z6nEwRuw@mail.gmail.com>
In-Reply-To: <CAPDyKFr4=Vct_-w1euOsEnb3WdeBvH9mz12zNTUfX7Z6nEwRuw@mail.gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGksDQoNCj4gRnJvbTogVWxmIEhhbnNzb24sIFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgNCwgMjAx
NyA3OjQxIFBNDQo+IA0KPiBPbiAxIERlY2VtYmVyIDIwMTcgYXQgMTI6MDMsIFlvc2hpaGlybyBT
aGltb2RhDQo+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo8c25p
cD4NCj4gPiBTdXJlISBJIHRlc3RlZCB5b3VyIHBhdGNoLCBhbmQgdGhlbiB0aGUgZm9sbG93aW5n
IG1lc3NhZ2UgZGlzYXBwZWFyZWQhDQo+ID4NCj4gPiAgICBFbmFibGluZyBydW50aW1lIFBNIGZv
ciBpbmFjdGl2ZSBkZXZpY2UgKGVlMDgwMjAwLnVzYi1waHkpIHdpdGggYWN0aXZlIGNoaWxkcmVu
DQo+IA0KPiBHcmVhdCwgdGhhdCBjb25maXJtcyBteSB0aGVvcnkuDQo+IA0KPiBJIHdpbGwgcmUt
d29yayB0aGUgcGF0Y2ggYW5kIHJlLXBvc3QgaXQgdG8gc2VlIHdoYXQgcGVvcGxlIHRoaW5rcyBh
Ym91dCBpdC4NCg0KVGhhbmsgeW91IQ0KDQo+ID4NCj4gPiBIb3dldmVyLCB0aGUgZm9sbG93aW5n
IG1lc3NhZ2Ugc3RpbGwgZXhpc3RzLg0KPiA+DQo+ID4gICAgRW5hYmxpbmcgcnVudGltZSBQTSBm
b3IgaW5hY3RpdmUgZGV2aWNlIChlZTA4MDAwMC51c2IpIHdpdGggYWN0aXZlIGNoaWxkcmVuDQo+
ID4NCj4gPiBTbywgSSBndWVzcyBvaGNpLXBsYXRmb3JtLmMgYWxzbyBoYXMgc2ltaWxhciBpc3N1
ZS4NCj4gDQo+IFllcywgdmVyeSBsaWtlbHkhDQo+IA0KPiBIb3dldmVyLCBJIG5lZWQgc29tZSBt
b3JlIHRpbWUgdG8gbG9vayBpbnRvIHRoaXMgdG8gYmUgYWJsZSB0byBzdWdnZXN0DQo+IGEgc29s
dXRpb24uDQoNCkkgZm91bmQgYSBzb2x1dGlvbiBhbmQgc2VudCBhIHJlcG9ydCBhcyBiZWxvdzoN
Cmh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zy9tc2cxNTUxMTQ2Lmh0bWwNCg0KV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdXNpbmcgcG1fcnVu
dGltZV9mb3JiaWQoKT8NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
