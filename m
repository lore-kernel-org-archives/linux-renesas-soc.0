Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:40901 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726670AbeIKQJt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 12:09:49 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 10/10] cpufreq: dt: Add support for r8a7744
Date: Tue, 11 Sep 2018 11:10:51 +0000
Message-ID: <OSBPR01MB2103890901C983870042C9A6B8040@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
 <1536660771-32278-11-git-send-email-biju.das@bp.renesas.com>
 <CAJZ5v0j_oiTuuGvZDH=GRvtbW+KAUu4BC-3bRNFKGtJ7SDhnQg@mail.gmail.com>
In-Reply-To: <CAJZ5v0j_oiTuuGvZDH=GRvtbW+KAUu4BC-3bRNFKGtJ7SDhnQg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgUmFmYWVsLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5v
cmc+DQo+IFNlbnQ6IDExIFNlcHRlbWJlciAyMDE4IDExOjU5DQo+IFRvOiBCaWp1IERhcyA8Ymlq
dS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IENjOiBSYWZhZWwgSi4gV3lzb2NraSA8cmp3QHJqd3lz
b2NraS5uZXQ+OyBWaXJlc2ggS3VtYXINCj4gPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPjsgTGlu
dXggUE0gPGxpbnV4LXBtQHZnZXIua2VybmVsLm9yZz47IFNpbW9uDQo+IEhvcm1hbiA8aG9ybXNA
dmVyZ2UubmV0LmF1PjsgR2VlcnQgVXl0dGVyaG9ldmVuDQo+IDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT47IENocmlzIFBhdGVyc29uDQo+IDxDaHJpcy5QYXRlcnNvbjJAcmVuZXNhcy5jb20+OyBG
YWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT47IExpbnV4
LVJlbmVzYXMgPGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMTAvMTBdIGNwdWZyZXE6IGR0OiBBZGQgc3VwcG9ydCBmb3IgcjhhNzc0
NA0KPg0KPiBPbiBUdWUsIFNlcCAxMSwgMjAxOCBhdCAxMjoyMCBQTSBCaWp1IERhcyA8YmlqdS5k
YXNAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gQWRkIHRoZSBjb21wYXRpYmxl
IHN0cmluZ3MgZm9yIHN1cHBvcnRpbmcgdGhlIGdlbmVyaWMgY3B1ZnJlcSBkcml2ZXINCj4gPiBv
biB0aGUgUmVuZXNhcyBSWi9HMU4gKFI4QTc3NDQpIFNvQy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTog
RmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLWR0LXBsYXRkZXYuYyB8IDEgKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2NwdWZyZXEvY3B1ZnJlcS1kdC1wbGF0ZGV2LmMNCj4gPiBiL2RyaXZlcnMvY3B1ZnJlcS9j
cHVmcmVxLWR0LXBsYXRkZXYuYw0KPiA+IGluZGV4IGZlMTRjNTcuLjgwNWY4YTAgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEtZHQtcGxhdGRldi5jDQo+ID4gKysrIGIv
ZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEtZHQtcGxhdGRldi5jDQo+ID4gQEAgLTU4LDYgKzU4LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgd2hpdGVsaXN0W10gX19pbml0Y29u
c3QNCj4gPSB7DQo+ID4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzNhNCIs
IH0sDQo+ID4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc0MCIsIH0sDQo+
ID4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc0MyIsIH0sDQo+ID4gKyAg
ICAgICB7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc0NCIsIH0sDQo+ID4gICAgICAgICB7
IC5jb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc0NSIsIH0sDQo+ID4gICAgICAgICB7IC5jb21w
YXRpYmxlID0gInJlbmVzYXMscjhhNzc3OCIsIH0sDQo+ID4gICAgICAgICB7IC5jb21wYXRpYmxl
ID0gInJlbmVzYXMscjhhNzc3OSIsIH0sDQo+ID4gLS0NCj4NCj4gU2luY2UgdGhpcyBpcyB0aGUg
bGFzdCBwYXRjaCBpbiBhIHNlcmllcyBvZiAxMCwgZG8geW91IHdhbnQgbWUgdG8gYXBwbHkgaXQg
b3INCj4gc2hvdWxkIGl0IGdvIGluIGFsb25nIHdpdGggdGhlIHJlc3Q/DQoNClBsZWFzZSBhcHBs
eSB0aGUgcGF0Y2guIEFscmVhZHkgYmluZGluZyBwYXRjaCBpcyBhdmFpbGFibGUgd2l0aCBjZmI5
ZjkzNDM3ZWIgKCJBUk06IHNobW9iaWxlOiBEb2N1bWVudCBSWi9HMU4gU29DIERUIGJpbmRpbmci
KS4NCg0KUmVnYXJkcywNCkJpanUNCg0KDQoNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9w
ZSBMdGQsIER1a2VzIE1lYWRvdywgTWlsbGJvYXJkIFJvYWQsIEJvdXJuZSBFbmQsIEJ1Y2tpbmdo
YW1zaGlyZSwgU0w4IDVGSCwgVUsuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCAmIFdhbGVzIHVuZGVy
IFJlZ2lzdGVyZWQgTm8uIDA0NTg2NzA5Lg0K
