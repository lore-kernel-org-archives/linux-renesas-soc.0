Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:25051 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750905AbdBORdw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2017 12:33:52 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/3] dt-bindings: power: reset: add document for
 renesas-reset driver
Date: Wed, 15 Feb 2017 17:33:47 +0000
Message-ID: <PS1PR06MB1162A82F35F00D18D5D22FC08A5B0@PS1PR06MB1162.apcprd06.prod.outlook.com>
References: <20170213182532.4042-1-chris.brandt@renesas.com>
 <20170213182532.4042-3-chris.brandt@renesas.com>
 <CAMuHMdWdiosERjUm3ZxZiZL90_4j+CrNm9RU9GaPft7AXbN8kA@mail.gmail.com>
In-Reply-To: <CAMuHMdWdiosERjUm3ZxZiZL90_4j+CrNm9RU9GaPft7AXbN8kA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIFR1ZXNkYXksIEZlYnJ1YXJ5IDE0LCAyMDE3LCBHZWVydCBVeXR0ZXJo
b2V2ZW4gd3JvdGU6DQo+ID4gK1JlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gKyAgLSBjb21wYXRp
YmxlOiBtdXN0IGJlIG9uZSBvciBtb3JlIG9mIHRoZSBmb2xsb3dpbmc6DQo+ID4gKyAgICAtICJy
ZW5lc2FzLHI3czcyMTAwLXJlc2V0IiBmb3IgdGhlIHI3czcyMTAwIFNvQw0KPiA+ICsgICAgLSAi
cmVuZXNhcyx3ZHQtcmVzZXQiDQo+ID4gKyAgICAgICAgICAgICAgICBUaGlzIGlzIGEgZmFsbGJh
Y2sgZm9yIHRoZSBhYm92ZSByZW5lc2FzLCotcmVzZXQNCj4gPiArZW50cmllcw0KPiANCj4gUGxl
YXNlIHVzZSAicmVuZXNhcyxyN3M3MjEwMC13ZHQiLiBEVCBkZXNjcmliZXMgdGhlIGhhcmR3YXJl
ICh3YXRjaGRvZyksDQo+IG5vdCB0aGUgc29mdHdhcmUgcG9saWN5ICh1c2UgaXQgZm9yIHJlc2V0
IG9ubHksIGFzIGEgbWF4LiB0aW1lb3V0IG9mIDEyNQ0KPiBtcyBpcyB0b28gc2hvcnQgZm9yIGEg
dXNhYmxlIHdhdGNoZG9nKS4NCg0KDQpJIGhhZCBhIGxvb2sgYXQ6DQoNCiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL3JlbmVzYXMtd2R0LnR4dA0KDQpXaGljaCBo
YXM6DQoNClJlcXVpcmVkIHByb3BlcnRpZXM6DQotIGNvbXBhdGlibGUgOiBTaG91bGQgYmUgInJl
bmVzYXMsPHNvY3R5cGU+LXdkdCIsIGFuZA0KCSAgICAgICAicmVuZXNhcyxyY2FyLWdlbjMtd2R0
IiBhcyBmYWxsYmFjay4NCgkgICAgICAgRXhhbXBsZXMgd2l0aCBzb2N0eXBlcyBhcmU6DQoJICAg
ICAgICAgLSAicmVuZXNhcyxyOGE3Nzk1LXdkdCIgKFItQ2FyIEgzKQ0KCSAgICAgICAgIC0gInJl
bmVzYXMscjhhNzc5Ni13ZHQiIChSLUNhciBNMy1XKQ0KDQoNClNvIGluIG15ICdyZW5lc2FzLXJl
c2V0LnR4dCcgc2hvdWxkIEkgZG86DQoNCkEuICJyZW5lc2FzLHI3czcyMTAwLXdkdCIsICJyZW5l
c2FzLHJ6LXdkdCINCg0KICBvciBqdXN0OiANCg0KQi4gInJlbmVzYXMscjdzNzIxMDAtd2R0IiAg
IChubyBmYWxsYmFjaywgY2hhbmdlIHRoZSBkcml2ZXIgdG8gYWRkIG5ldyBTb0NzKQ0KDQoNClRo
b3VnaHRzPz8/Pw0KDQoNClRoYW5rIHlvdSwNCkNocmlzDQoNCg0K
