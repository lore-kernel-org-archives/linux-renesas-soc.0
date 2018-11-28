Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1400122.outbound.protection.outlook.com ([40.107.140.122]:6466
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727552AbeK1UF5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Nov 2018 15:05:57 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] iommu/ipmmu-vmsa: Modify ipmmu_slave_whitelist() to
 check SoC revisions
Date: Wed, 28 Nov 2018 09:04:59 +0000
Message-ID: <OSBPR01MB22935659EE48F4706C379FF9D8D10@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1543385279-1584-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1543385279-1584-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVfQgsAgUVBpApjuL=Nv16L=SfCd8vDtFwvR3F4qYpfUg@mail.gmail.com>
In-Reply-To: <CAMuHMdVfQgsAgUVBpApjuL=Nv16L=SfCd8vDtFwvR3F4qYpfUg@mail.gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVz
ZGF5LCBOb3ZlbWJlciAyOCwgMjAxOCA1OjQ3IFBNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4g
DQo+IE9uIFdlZCwgTm92IDI4LCAyMDE4IGF0IDc6MTAgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4g
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBTb21lIFItQ2Fy
IEdlbjMgU29DcyBoYXMgaGFyZHdhcmUgcmVzdHJpY3Rpb25zIG9uIHRoZSBJUE1NVS4gU28sDQo+
ID4gdG8gY2hlY2sgd2hldGhlciB0aGlzIFItQ2FyIEdlbjMgU29DIGNhbiB1c2UgdGhlIElQTU1V
IGNvcnJlY3RseSwNCj4gPiB0aGlzIHBhdGNoIG1vZGlmaWVzIHRoZSBpcG1tdV9zbGF2ZV93aGl0
ZWxpc3QoKS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3No
aWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KDQpUaGFuayB5b3UgZm9yIHRo
ZSByZXZpZXchDQoNCj4gT25lIHF1ZXN0aW9uIGJlbG93Lg0KPiANCj4gPiAtLS0gYS9kcml2ZXJz
L2lvbW11L2lwbW11LXZtc2EuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvaXBtbXUtdm1zYS5j
DQo+IA0KPiA+IEBAIC03NzEsMTEgKzc2NSwzNSBAQCBzdGF0aWMgYm9vbCBpcG1tdV9zbGF2ZV93
aGl0ZWxpc3Qoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICAgICAgICAgeyAvKiBzZW50aW5lbCAq
LyB9DQo+ID4gIH07DQo+ID4NCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzb2NfZGV2aWNlX2F0
dHJpYnV0ZSBzb2NfcmNhcl9nZW4zX3doaXRlbGlzdFtdID0gew0KPiA+ICsgICAgICAgeyAuc29j
X2lkID0gInI4YTc3OTUiLCAucmV2aXNpb24gPSAiRVMzLjAiIH0sDQo+IA0KPiBEb24ndCB5b3Ug
d2FudCAiRVMzLioiPw0KDQpJbmRlZWQgKEkgd2FudCAiRVMzLioiKS4gU28sIEknbGwgc3VibWl0
IHYyIHBhdGNoIHRvIGZpeCBpdC4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGEN
Cg0KPiA+ICsgICAgICAgeyAuc29jX2lkID0gInI4YTc3OTY1IiwgfSwNCj4gPiArICAgICAgIHsg
LnNvY19pZCA9ICJyOGE3Nzk5MCIsIH0sDQo+ID4gKyAgICAgICB7IC5zb2NfaWQgPSAicjhhNzc5
OTUiLCB9LA0KPiA+ICsgICAgICAgeyAvKiBzZW50aW5lbCAqLyB9DQo+ID4gK307DQo+IA0KPiBH
cntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+
IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
