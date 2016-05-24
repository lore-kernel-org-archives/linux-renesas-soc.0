Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:34109 "EHLO
	relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752087AbcEXHpo (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 24 May 2016 03:45:44 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	"Mark Rutland" <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/4] arm64: dts: r8a7795: Add HSUSB device node
Date: Tue, 24 May 2016 07:45:37 +0000
Message-ID: <SG2PR06MB09195416838B4E05464AF7B3D84F0@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1464065860-3948-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1464065860-3948-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWMTHWwDyxqaJxptfhTG_WEWCqDRhBJR06d-=zOgTiMow@mail.gmail.com>
In-Reply-To: <CAMuHMdWMTHWwDyxqaJxptfhTG_WEWCqDRhBJR06d-=zOgTiMow@mail.gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IGdlZXJ0LnV5dHRlcmhvZXZlbkBnbWFpbC5jb20gW21h
aWx0bzpnZWVydC51eXR0ZXJob2V2ZW5AZ21haWwuY29tXSBPbiBCZWhhbGYgT2YgR2VlcnQgVXl0
dGVyaG9ldmVuDQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAyNCwgMjAxNiA0OjEwIFBNDQo+IA0KPiBI
aSBTaGltb2RhLXNhbiwNCj4gDQo+IE9uIFR1ZSwgTWF5IDI0LCAyMDE2IGF0IDY6NTcgQU0sIFlv
c2hpaGlybyBTaGltb2RhDQo+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3Jv
dGU6DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGlt
b2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc5NS5kdHNpIHwgMTcgKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDE3IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I4YTc3OTUuZHRzaQ0KPiA+IGluZGV4IDI2ZGYzMDAuLjNmN2Q3YzQgMTAwNjQ0DQo+ID4g
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRzaQ0KPiA+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk1LmR0c2kNCj4gPiBAQCAtMTMzOSw2
ICsxMzM5LDIzIEBADQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9
IDwmc3lzYyBSOEE3Nzk1X1BEX0FMV0FZU19PTj47DQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiAgICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+
ID4gKyAgICAgICAgICAgICAgIGhzdXNiOiB1c2JAZTY1OTAwMDAgew0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyx1c2Jocy1yOGE3Nzk1IiwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInJlbmVzYXMscmNhci1nZW4yLXVz
YmhzIjsNCj4gDQo+IHJlbmVzYXMscmNhci1nZW4zLXVzYmhzDQoNCk9vcHMhIEkgd2lsbCBmaXgg
aXQuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gR3J7b2V0amUsZWV0
aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4g
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMNCg==
