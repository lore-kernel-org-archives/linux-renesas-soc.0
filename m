Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:51532 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726738AbeIJOtk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 10:49:40 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774a1: Add CAN nodes
Date: Mon, 10 Sep 2018 09:56:18 +0000
Message-ID: <TY1PR01MB17706300DDF78B3067DC779DC0050@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1535034166-24798-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUL0Ck=6er8rvx_kCSi7KR9kjBqjNRiLOL41nxeJXQG-w@mail.gmail.com>
In-Reply-To: <CAMuHMdUL0Ck=6er8rvx_kCSi7KR9kjBqjNRiLOL41nxeJXQG-w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjay4NCg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiByZW5lc2FzOiByOGE3NzRhMTogQWRkIENBTiBub2Rl
cw0KPg0KPiBIaSBGYWJyaXppbywNCj4NCj4gT24gVGh1LCBBdWcgMjMsIDIwMTggYXQgNDoyMiBQ
TSBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4gd3Jv
dGU6DQo+ID4gRnJvbTogQ2hyaXMgUGF0ZXJzb24gPGNocmlzLnBhdGVyc29uMkByZW5lc2FzLmNv
bT4NCj4gPg0KPiA+IEFkZCB0aGUgZGV2aWNlIG5vZGVzIGZvciBib3RoIFJaL0cyTSBDQU4gY2hh
bm5lbHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYXRlcnNvbiA8Y2hyaXMucGF0
ZXJzb24yQHJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNA
YnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4NCj4gPiBUaGlzIHBhdGNoIGRlcGVuZHMgb246
DQo+ID4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvOC8yMy8xMDQ5DQo+ID4gaHR0cHM6Ly93
d3cubWFpbC1hcmNoaXZlLmNvbS9saW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcvbXNn
MzA1NTAuaHRtbA0KPiA+DQo+ID4NCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4
YTc3NGExLmR0c2kgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDI0IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOGE3NzRhMS5kdHNpDQo+ID4gaW5kZXggNWQwMTA5YS4uY2QyMDRmNSAxMDA2NDQNCj4g
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEuZHRzaQ0KPiA+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRhMS5kdHNpDQo+ID4gQEAgLTgx
Niw2ICs4MTYsMzAgQEANCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlz
YWJsZWQiOw0KPiA+ICAgICAgICAgICAgICAgICB9Ow0KPiA+DQo+ID4gKyAgICAgICAgICAgICAg
IGNhbjA6IGNhbkBlNmMzMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJyZW5lc2FzLGNhbi1yOGE3NzRhMSIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJyZW5lc2FzLHJ6Zy1nZW4yLWNhbiI7DQo+DQo+IFBsZWFzZSBkb24n
dCBpbnRyb2R1Y2UgInJlbmVzYXMscnpnLWdlbjItY2FuIiwgY2ZyLiBteSBjb21tZW50cyBpbg0K
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBTXVITWRXUHVxZlhPZ2hfLXFwOHE2d0FU
VTNMal9XcFgwYkFPeFBCWDc2U0t2eVhDUUBtYWlsLmdtYWlsLmNvbS8NCg0KQWdyZWVkLCB3aWxs
IHNlbmQgYSB2Mi4NCg0KVGhhbmtzLA0KRmFiDQoNCj4NCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+DQo+IC0tDQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcNCj4NCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtl
IHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFs
ZHMNCg0KDQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVhZG93LCBN
aWxsYm9hcmQgUm9hZCwgQm91cm5lIEVuZCwgQnVja2luZ2hhbXNoaXJlLCBTTDggNUZILCBVSy4g
UmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYgV2FsZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4gMDQ1ODY3
MDkuDQo=
