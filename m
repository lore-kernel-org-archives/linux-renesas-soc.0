Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:46877 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729605AbeKFUAY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 15:00:24 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: geert+renesas@glider.be, horms@verge.net.au,
        laurent.pinchart@ideasonboard.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linus.walleij@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v4 1/4] pinctrl: sh-pfc: Add optional arg to VIN_DATA_PIN_GROUP
Date: Tue,  6 Nov 2018 11:35:30 +0100
Message-Id: <1541500533-21843-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

VIN data groups may appear on different sets of pins, usually named
"vinX_data_[a|b]". The existing VIN_DATA_PIN_GROUP() does not support
appending the '_a' or '_b' suffix, leading to the definition of groups
names not consistent with the ones defined using SH_PFC_PIN_GROUP() macro.

Fix this by adding making the VIN_DATA_PIN_GROUP macro a variadic one,
which accepts an optional 'version' argument.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 458ae0a..0e0b4cc 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -54,15 +54,16 @@ struct sh_pfc_pin_group {
 
 /*
  * Using union vin_data saves memory occupied by the VIN data pins.
- * VIN_DATA_PIN_GROUP() is  a macro  used  to describe the VIN pin groups
- * in this case.
+ * VIN_DATA_PIN_GROUP() is a macro used to describe the VIN pin groups
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
 
 union vin_data {
-- 
2.7.4
