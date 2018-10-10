Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:53642 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726515AbeJJRLn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Oct 2018 13:11:43 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] clocksource/drivers/sh_cmt: wait for CMCNT on init
Date: Wed, 10 Oct 2018 09:50:15 +0000
Message-ID: <OSBPR01MB2103F030C3C503773FF99EAFB8E00@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1528474785-11778-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdX=Ys8aq0ehqu9gZchC9bKtgzF9-Tg6-DoTrzMX68SwTg@mail.gmail.com>
 <OSBPR01MB2103F004406C18F6630CD91BB8780@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdUHQ=AHPctY=b7sa0TVUwohP0-d4E2wSMXJ55EQfrLbYA@mail.gmail.com>
 <OSBPR01MB21036654864AE07375A91023B8780@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <OSBPR01MB2103489A3F5C679650B3436BB8E70@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdVq3XqkEECzM+xG37o5zqQquu2n6w_-J8mQxU+Dcs+7Kg@mail.gmail.com>
In-Reply-To: <CAMuHMdVq3XqkEECzM+xG37o5zqQquu2n6w_-J8mQxU+Dcs+7Kg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGNsb2Nrc291cmNlL2RyaXZlcnMvc2hfY210OiB3YWl0IGZvciBDTUNOVCBvbiBpbml0
DQo+DQo+ID4gV2hhdCBzaG91bGQgd2UgZG8gbmV4dCBmb3IgZml4aW5nIHRoaXMgZXJyb3I/ICBB
ZGRpbmcgdW5jb25kaXRpb25hbCBkZWxheXMNCj4gYWxzbyBmaXhlcyB0aGUgaXNzdWUuDQo+DQo+
IEknZCBhZGQgNTAgwrVzIGRlbGF5cyBhZnRlciB0aGUgdGhyZWUgcmVnaXN0ZXIgd3JpdGVzLg0K
DQpJdCBtYWtlIHNlbnNlIHRvIG1lIGFzIHdlbGwsIHNpbmNlIHRoZSBoYXJkd2FyZSBtYW51YWwg
aXMgbWVudGlvbmluZyBhYm91dCBpbnNlcnRpbmcgZGVsYXlzDQpmb3IgdGhlIHJlbGlhYmxlIGNv
dW50ZXIgb3BlcmF0aW9uLg0KDQo+ID4gQnV0IEkgZG8gbm90IGhhdmUgdGhlIHNldHVwIHRvIHZl
cmlmeSB0aGlzIG9uIGdlbjEvZ2VuMi9nZW4zIHZhcmlhbnRzLg0KPiA+DQo+ID4gSSBoYXZlIGVu
YWJsZWQgQ01UMC8xLzIvMyBvbiBSLUNhciBNMy1XIFNhbHZhdG9yLVhTIGJvYXJkIGFuZCB0aGlz
IGlzc3VlDQo+IGlzIG5vdCBzZWVuIHdpdGggb3JpZ2luYWwgY29kZS4NCj4gPg0KPiA+IE9ubHkg
b24gUi1DYXIgR2VuMi8gUlovRzEsIHdlIGFyZSBzZWVpbmcgdGhpcyBpc3N1ZS4NCj4NCj4gQXMg
eW91IGNhbiB0ZXN0IG9uIEtvZWxzY2gsIE0zLVcgU2FsdmF0b3ItWFMsIGFuZCBSWi9HMSwgdGhh
dCBzaG91bGQgY292ZXINCj4gbW9zdCB2YXJpYW50cyB3ZSBjYXJlIGFib3V0Lg0KDQpJIHdpbGwg
c2VuZCBhIHBhdGNoICBWMiwgYWZ0ZXIgdGVzdGluZyBvbiBhbGwgdGhlc2UgdmFyaWFudHMuDQoN
Cj4gQ01UIGRvZXMgbm90IHNlZW0gdG8gYmUgZW5hYmxlZCBvbiBSLUNhciBNMUEgYW5kIEgxLg0K
PiBJJ2wgZG8gYm9vdCB0ZXN0cyBvbiBvbGRlciBTSC9SLU1vYmlsZSBTb0NzIGFzIHBhcnQgb2Yg
bXkgZ2VuZXJhbCB0ZXN0aW5nLg0KPg0KPiA+IE5vdGU6LQ0KPiA+DQo+ID4gRm9yIFItQ2FyIE0z
LVcgYm9hcmQsIGluY29uc2lzdGVuY3ktY2hlY2sgYW5kIG5hbm9zbGVlcCB0ZXN0cyBhcmUNCj4g
d29ya2luZyBmaW5lLg0KPiA+DQo+ID4gSG93ZXZlciAgdGhlcmUgaXMgYSBmYWlsdXJlIHdpdGgg
Y2xvY2tzb3VyY2Vfc3dpdGNoICAiYXN5bmNocm9ub3VzIiAgdGVzdC4NCj4gPiBUaGUgaW5jb25z
aXN0ZW5jeS1jaGVjayBpcyBmYWlsaW5nICBmb3IgImFyY2hfc3lzX2NvdW50ZXIiIGFmdGVyIHNv
bWUNCj4gPiBjbG9ja3NvdXJjZV9zd2l0Y2ggb3BlcmF0aW9ucw0KPiA+DQo+ID4gU28gSSBza2lw
cGVkIHRoZSAiY2xvY2tzb3VyY2Vfc3dpdGNoaW5nIiAgZm9yICBhcmNoX3N5c19jb3VudGVyICBh
bmQNCj4gPiB0aGUgYXN5bmNocm9ub3VzIHRlc3QgaXMgcGFzc2luZyBmb3INCj4gPiBDTVQwLzEv
Mi8zIHRpbWVycy4NCj4NCj4gU29ycnksIGJlaW5nIG5vIHRpbWVyIGV4cGVydCwgSSBkb24ndCB1
bmRlcnN0YW5kIHRoZSBpbXBhY3Qgb2YgdGhlIGFib3ZlDQo+IHBhcmFncmFwaC4NCg0KV2UgbWF5
IHN0YXJ0IGEgZGlzY3Vzc2lvbiBvbiB0aGlzLCB3aGVuIHdlIHN0YXJ0IHVwc3RyZWFtaW5nIENN
VCBmb3IgUi1DYXIgTTMtVyBkZXZpY2VzLg0KDQpCYXNpY2FsbHkgY2xvY2tzb3VyY2Vfc3dpdGNo
ICB0ZXN0IGluICJzZWxmdGVzdHMgInVzZXMgMiB0aHJlYWRzLA0KSW4gMSB0aHJlYWQgaXQgZXhl
Y3V0ZXMgaW5jb25zaXN0ZW5jeS1jaGVjayB0ZXN0IGZvbGxvd2VkIGJ5IG5hbm8gc2xlZXAgdGVz
dA0KYW5kIG9uIHRoZSAgc2Vjb25kIHRocmVhZCBpdCBrZWVwIGNoYW5naW5nIGNsb2NrIHNvdXJj
ZSBvbmUgYWZ0ZXIgdGhlIGFub3RoZXIuDQoNClRoaXMgdGVzdCBhbHdheXMgZmFpbHMgIG9uIFIt
Q2FyIE0zLVcgd2hpY2ggaXMgYmFzZWQgb24gYXJtNjQuDQoNClJlZ2FyZHMsDQpCaWp1DQoNCg0K
DQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBMdGQsIER1a2VzIE1lYWRvdywgTWlsbGJvYXJk
IFJvYWQsIEJvdXJuZSBFbmQsIEJ1Y2tpbmdoYW1zaGlyZSwgU0w4IDVGSCwgVUsuIFJlZ2lzdGVy
ZWQgaW4gRW5nbGFuZCAmIFdhbGVzIHVuZGVyIFJlZ2lzdGVyZWQgTm8uIDA0NTg2NzA5Lg0K
