Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:38425 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729605AbeKFUA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 15:00:26 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: geert+renesas@glider.be, horms@verge.net.au,
        laurent.pinchart@ideasonboard.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linus.walleij@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v4 2/4] pinctrl: sh-pfc: Fix VIN versioned groups name
Date: Tue,  6 Nov 2018 11:35:31 +0100
Message-Id: <1541500533-21843-3-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Versioned VIN groups can appear on different sets of pins. Using the
VIN_DATA_PIN_GROUP macro now supports proper naming of said groups through
an optional 'version' argument.

Use the 'version' argument for said macro to fix naming of versioned
groups for R-Car SoCs that defines them.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c |  6 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 24 ++++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 24 ++++++++++++------------
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c b/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
index bf0681b..a8a110d 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
@@ -1744,10 +1744,10 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	VIN_DATA_PIN_GROUP(vin1_data, 12),
 	VIN_DATA_PIN_GROUP(vin1_data, 10),
 	VIN_DATA_PIN_GROUP(vin1_data, 8),
-	VIN_DATA_PIN_GROUP(vin1_data_b, 24),
-	VIN_DATA_PIN_GROUP(vin1_data_b, 20),
+	VIN_DATA_PIN_GROUP(vin1_data, 24, _b),
+	VIN_DATA_PIN_GROUP(vin1_data, 20, _b),
 	SH_PFC_PIN_GROUP(vin1_data18_b),
-	VIN_DATA_PIN_GROUP(vin1_data_b, 16),
+	VIN_DATA_PIN_GROUP(vin1_data, 16, _b),
 	SH_PFC_PIN_GROUP(vin1_sync),
 	SH_PFC_PIN_GROUP(vin1_field),
 	SH_PFC_PIN_GROUP(vin1_clkenb),
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 0af737d..20fac0f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -4474,20 +4474,20 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(usb2),
 	SH_PFC_PIN_GROUP(usb2_ch3),
 	SH_PFC_PIN_GROUP(usb30),
-	VIN_DATA_PIN_GROUP(vin4_data_a, 8),
-	VIN_DATA_PIN_GROUP(vin4_data_a, 10),
-	VIN_DATA_PIN_GROUP(vin4_data_a, 12),
-	VIN_DATA_PIN_GROUP(vin4_data_a, 16),
+	VIN_DATA_PIN_GROUP(vin4_data, 8, _a),
+	VIN_DATA_PIN_GROUP(vin4_data, 10, _a),
+	VIN_DATA_PIN_GROUP(vin4_data, 12, _a),
+	VIN_DATA_PIN_GROUP(vin4_data, 16, _a),
 	SH_PFC_PIN_GROUP(vin4_data18_a),
-	VIN_DATA_PIN_GROUP(vin4_data_a, 20),
-	VIN_DATA_PIN_GROUP(vin4_data_a, 24),
-	VIN_DATA_PIN_GROUP(vin4_data_b, 8),
-	VIN_DATA_PIN_GROUP(vin4_data_b, 10),
-	VIN_DATA_PIN_GROUP(vin4_data_b, 12),
-	VIN_DATA_PIN_GROUP(vin4_data_b, 16),
+	VIN_DATA_PIN_GROUP(vin4_data, 20, _a),
+	VIN_DATA_PIN_GROUP(vin4_data, 24, _a),
+	VIN_DATA_PIN_GROUP(vin4_data, 8, _b),
+	VIN_DATA_PIN_GROUP(vin4_data, 10, _b),
+	VIN_DATA_PIN_GROUP(vin4_data, 12, _b),
+	VIN_DATA_PIN_GROUP(vin4_data, 16, _b),
 	SH_PFC_PIN_GROUP(vin4_data18_b),
-	VIN_DATA_PIN_GROUP(vin4_data_b, 20),
-	VIN_DATA_PIN_GROUP(vin4_data_b, 24),
+	VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
+	VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
 	SH_PFC_PIN_GROUP(vin4_sync),
 	SH_PFC_PIN_GROUP(vin4_field),
 	SH_PFC_PIN_GROUP(vin4_clkenb),
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 3a6d21d..b003abd 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -4409,20 +4409,20 @@ static const struct {
 		SH_PFC_PIN_GROUP(usb0),
 		SH_PFC_PIN_GROUP(usb1),
 		SH_PFC_PIN_GROUP(usb30),
-		VIN_DATA_PIN_GROUP(vin4_data_a, 8),
-		VIN_DATA_PIN_GROUP(vin4_data_a, 10),
-		VIN_DATA_PIN_GROUP(vin4_data_a, 12),
-		VIN_DATA_PIN_GROUP(vin4_data_a, 16),
+		VIN_DATA_PIN_GROUP(vin4_data, 8, _a),
+		VIN_DATA_PIN_GROUP(vin4_data, 10, _a),
+		VIN_DATA_PIN_GROUP(vin4_data, 12, _a),
+		VIN_DATA_PIN_GROUP(vin4_data, 16, _a),
 		SH_PFC_PIN_GROUP(vin4_data18_a),
-		VIN_DATA_PIN_GROUP(vin4_data_a, 20),
-		VIN_DATA_PIN_GROUP(vin4_data_a, 24),
-		VIN_DATA_PIN_GROUP(vin4_data_b, 8),
-		VIN_DATA_PIN_GROUP(vin4_data_b, 10),
-		VIN_DATA_PIN_GROUP(vin4_data_b, 12),
-		VIN_DATA_PIN_GROUP(vin4_data_b, 16),
+		VIN_DATA_PIN_GROUP(vin4_data, 20, _a),
+		VIN_DATA_PIN_GROUP(vin4_data, 24, _a),
+		VIN_DATA_PIN_GROUP(vin4_data, 8, _b),
+		VIN_DATA_PIN_GROUP(vin4_data, 10, _b),
+		VIN_DATA_PIN_GROUP(vin4_data, 12, _b),
+		VIN_DATA_PIN_GROUP(vin4_data, 16, _b),
 		SH_PFC_PIN_GROUP(vin4_data18_b),
-		VIN_DATA_PIN_GROUP(vin4_data_b, 20),
-		VIN_DATA_PIN_GROUP(vin4_data_b, 24),
+		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
+		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
 		SH_PFC_PIN_GROUP(vin4_sync),
 		SH_PFC_PIN_GROUP(vin4_field),
 		SH_PFC_PIN_GROUP(vin4_clkenb),
-- 
2.7.4
