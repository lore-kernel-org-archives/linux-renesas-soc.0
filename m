Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:45908 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754230AbcKCPey (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2016 11:34:54 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] pinctrl: sh-pfc: Do not unconditionally support PIN_CONFIG_BIAS_DISABLE
Date: Thu,  3 Nov 2016 16:34:20 +0100
Message-Id: <20161103153421.15527-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20161103153421.15527-1-niklas.soderlund+renesas@ragnatech.se>
References: <20161103153421.15527-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Always stating PIN_CONFIG_BIAS_DISABLE is supported gives untrue output
when examining /sys/kernel/debug/pinctrl/e6060000.pfc/pinconf-pins if
the operation get_bias() are implemented but the pin are not handled by
the get_bias() implementation. In that case the output will state that
"input bias disabled" indicating that this pin have bias control
support.

Make support for PIN_CONFIG_BIAS_DISABLE depend on that the pin either
support SH_PFC_PIN_CFG_PULL_UP or SH_PFC_PIN_CFG_PULL_DOWN. This also
solves the issue where SoC specific implementations print error messages
if there particular implementation of {set,get}_bias() is called with a
pin it do not know about.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index c577258..fcacfa7 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -570,7 +570,8 @@ static bool sh_pfc_pinconf_validate(struct sh_pfc *pfc, unsigned int _pin,
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-		return true;
+		return pin->configs &
+			(SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN);
 
 	case PIN_CONFIG_BIAS_PULL_UP:
 		return pin->configs & SH_PFC_PIN_CFG_PULL_UP;
-- 
2.10.2
