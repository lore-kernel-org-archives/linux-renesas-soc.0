Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay10.mail.gandi.net ([217.70.178.230]:45285 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbeKIBnz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 20:43:55 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: geert+renesas@glider.be, horms@verge.net.au,
        laurent.pinchart@ideasonboard.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linus.walleij@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v5 5/6] pinctrl: sh-pfc: r8a7795: Fix VIN versioned groups
Date: Thu,  8 Nov 2018 17:07:26 +0100
Message-Id: <1541693247-15599-6-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541693247-15599-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1541693247-15599-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Versioned VIN groups can appear on different sets of pins. Use of the
VIN_DATA_PIN_GROUP macro fix naming of said groups through an optional
'version' argument.

Use the 'version' argument for said macro to fix naming of versioned
groups for R-Car H3 R8A7795 SoC.

Fixes: 9942a5b52990 ("pinctrl: sh-pfc: r8a7795: Deduplicate VIN4 pin definitions")
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---
v4 -> v5:
- Broke out r8a7795 from single patch

---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 0af737d11403..20fac0fde91a 100644
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
--
2.7.4
