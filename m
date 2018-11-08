Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay10.mail.gandi.net ([217.70.178.230]:34483 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbeKIBnu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 20:43:50 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: geert+renesas@glider.be, horms@verge.net.au,
        laurent.pinchart@ideasonboard.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linus.walleij@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v5 1/6] pinctrl: sh-pfc: Add optional arg to VIN_DATA_PIN_GROUP
Date: Thu,  8 Nov 2018 17:07:22 +0100
Message-Id: <1541693247-15599-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541693247-15599-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1541693247-15599-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

VIN data groups may appear on different sets of pins, usually named
"vinX_data_[a|b]". The existing VIN_DATA_PIN_GROUP() does not support
appending the '_a' or '_b' suffix, leading to the definition of group
names not consistent with the ones defined using the SH_PFC_PIN_GROUP()
macro.

Fix this by making the VIN_DATA_PIN_GROUP macro a variadic one,
which accepts an optional 'version' argument.

Fixes: 423caa52534f ("pinctrl: sh-pfc: r8a779[01]: Move 'union vin_data' to shared header file")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---
v4 -> v5:
- Rebased on sh-pfc-for-v4.21
- Add fixes tag

---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 1fc13366869a..4ef485cfe08d 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -55,14 +55,15 @@ struct sh_pfc_pin_group {
 /*
  * Using union vin_data{,12,16} saves memory occupied by the VIN data pins.
  * VIN_DATA_PIN_GROUP() is a macro used to describe the VIN pin groups
- * in this case.
+ * in this case. It accepts an optional 'version' argument used when the
+ * same group can appear on a different set of pins.
  */
-#define VIN_DATA_PIN_GROUP(n, s)				\
-	{							\
-		.name = #n#s,					\
-		.pins = n##_pins.data##s,			\
-		.mux = n##_mux.data##s,				\
-		.nr_pins = ARRAY_SIZE(n##_pins.data##s),	\
+#define VIN_DATA_PIN_GROUP(n, s, ...)					\
+	{								\
+		.name = #n#s#__VA_ARGS__,				\
+		.pins = n##__VA_ARGS__##_pins.data##s,			\
+		.mux = n##__VA_ARGS__##_mux.data##s,			\
+		.nr_pins = ARRAY_SIZE(n##__VA_ARGS__##_pins.data##s),	\
 	}

 union vin_data12 {
--
2.7.4
