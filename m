Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:42307 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752034AbcICGHZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Sep 2016 02:07:25 -0400
From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
To: "geert+renesas@glider.be" <geert+renesas@glider.be>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Toru Oishi <toru.oishi.zj@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Khiem Nguyen" <khiem.nguyen.xt@renesas.com>
Subject: [PATCH] clk: renesas: r8a7796: Add THS/TSC clock
Date: Sat, 3 Sep 2016 06:06:49 +0000
Message-ID: <SIXPR06MB0906B1BEEF43FD0D22E14485A8E40@SIXPR06MB0906.apcprd06.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DQpTaWduZWQtb2ZmLWJ5OiBLaGllbSBOZ3V5ZW4gPGtoaWVtLm5ndXllbi54dEByZW5lc2FzLmNv
bT4NCi0tLQ0KIGRyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5Ni1jcGctbXNzci5jIHwgMSArDQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9yZW5lc2FzL3I4YTc3OTYtY3BnLW1zc3IuYyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5
Ni1jcGctbXNzci5jDQppbmRleCA4OTFiMzUzLi4yNzFmYzNiIDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9jbGsvcmVuZXNhcy9yOGE3Nzk2LWNwZy1tc3NyLmMNCisrKyBiL2RyaXZlcnMvY2xrL3JlbmVz
YXMvcjhhNzc5Ni1jcGctbXNzci5jDQpAQCAtMTE2LDYgKzExNiw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbXNzcl9tb2RfY2xrIHI4YTc3OTZfbW9kX2Nsa3NbXSBfX2luaXRjb25zdCA9IHsNCiAJ
REVGX01PRCgic2RpZjAiLAkJIDMxNCwJUjhBNzc5Nl9DTEtfU0QwKSwNCiAJREVGX01PRCgicndk
dDAiLAkJIDQwMiwJUjhBNzc5Nl9DTEtfUiksDQogCURFRl9NT0QoImludGMtYXAiLAkJIDQwOCwJ
UjhBNzc5Nl9DTEtfUzNEMSksDQorCURFRl9NT0QoInRoZXJtYWwiLAkJIDUyMiwJUjhBNzc5Nl9D
TEtfQ1ApLA0KIAlERUZfTU9EKCJncGlvNyIsCQkgOTA1LAlSOEE3Nzk2X0NMS19TM0Q0KSwNCiAJ
REVGX01PRCgiZ3BpbzYiLAkJIDkwNiwJUjhBNzc5Nl9DTEtfUzNENCksDQogCURFRl9NT0QoImdw
aW81IiwJCSA5MDcsCVI4QTc3OTZfQ0xLX1MzRDQpLA0KLS0gDQoxLjkuMQ0KDQo=
