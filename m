Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:53176 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbeI1R6c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 13:58:32 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77990: Add INTC-EX pins, groups and function
Date: Fri, 28 Sep 2018 13:35:08 +0200
Message-Id: <20180928113508.17399-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add pins, groups, and function for the Interrupt Controller for
External Devices (INTC-EX) on the R-Car E3 SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v4.20 or later.

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 64 ++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 663b8ce5781bb376..1fdafa48479cc4af 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1595,6 +1595,50 @@ static const unsigned int i2c7_b_mux[] = {
 	SCL7_B_MARK, SDA7_B_MARK,
 };
 
+/* - INTC-EX ---------------------------------------------------------------- */
+static const unsigned int intc_ex_irq0_pins[] = {
+	/* IRQ0 */
+	RCAR_GP_PIN(1, 0),
+};
+static const unsigned int intc_ex_irq0_mux[] = {
+	IRQ0_MARK,
+};
+static const unsigned int intc_ex_irq1_pins[] = {
+	/* IRQ1 */
+	RCAR_GP_PIN(1, 1),
+};
+static const unsigned int intc_ex_irq1_mux[] = {
+	IRQ1_MARK,
+};
+static const unsigned int intc_ex_irq2_pins[] = {
+	/* IRQ2 */
+	RCAR_GP_PIN(1, 2),
+};
+static const unsigned int intc_ex_irq2_mux[] = {
+	IRQ2_MARK,
+};
+static const unsigned int intc_ex_irq3_pins[] = {
+	/* IRQ3 */
+	RCAR_GP_PIN(1, 9),
+};
+static const unsigned int intc_ex_irq3_mux[] = {
+	IRQ3_MARK,
+};
+static const unsigned int intc_ex_irq4_pins[] = {
+	/* IRQ4 */
+	RCAR_GP_PIN(1, 10),
+};
+static const unsigned int intc_ex_irq4_mux[] = {
+	IRQ4_MARK,
+};
+static const unsigned int intc_ex_irq5_pins[] = {
+	/* IRQ5 */
+	RCAR_GP_PIN(0, 7),
+};
+static const unsigned int intc_ex_irq5_mux[] = {
+	IRQ5_MARK,
+};
+
 /* - MSIOF0 ----------------------------------------------------------------- */
 static const unsigned int msiof0_clk_pins[] = {
 	/* SCK */
@@ -2390,7 +2434,7 @@ static const unsigned int usb30_id_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[117];
+	struct sh_pfc_pin_group common[123];
 	struct sh_pfc_pin_group automotive[0];
 } pinmux_groups = {
 	.common = {
@@ -2425,6 +2469,12 @@ static const struct {
 		SH_PFC_PIN_GROUP(i2c6_b),
 		SH_PFC_PIN_GROUP(i2c7_a),
 		SH_PFC_PIN_GROUP(i2c7_b),
+		SH_PFC_PIN_GROUP(intc_ex_irq0),
+		SH_PFC_PIN_GROUP(intc_ex_irq1),
+		SH_PFC_PIN_GROUP(intc_ex_irq2),
+		SH_PFC_PIN_GROUP(intc_ex_irq3),
+		SH_PFC_PIN_GROUP(intc_ex_irq4),
+		SH_PFC_PIN_GROUP(intc_ex_irq5),
 		SH_PFC_PIN_GROUP(msiof0_clk),
 		SH_PFC_PIN_GROUP(msiof0_sync),
 		SH_PFC_PIN_GROUP(msiof0_ss1),
@@ -2569,6 +2619,15 @@ static const char * const i2c7_groups[] = {
 	"i2c7_b",
 };
 
+static const char * const intc_ex_groups[] = {
+	"intc_ex_irq0",
+	"intc_ex_irq1",
+	"intc_ex_irq2",
+	"intc_ex_irq3",
+	"intc_ex_irq4",
+	"intc_ex_irq5",
+};
+
 static const char * const msiof0_groups[] = {
 	"msiof0_clk",
 	"msiof0_sync",
@@ -2716,7 +2775,7 @@ static const char * const usb30_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[28];
+	struct sh_pfc_function common[29];
 	struct sh_pfc_function automotive[0];
 } pinmux_functions = {
 	.common = {
@@ -2728,6 +2787,7 @@ static const struct {
 		SH_PFC_FUNCTION(i2c5),
 		SH_PFC_FUNCTION(i2c6),
 		SH_PFC_FUNCTION(i2c7),
+		SH_PFC_FUNCTION(intc_ex),
 		SH_PFC_FUNCTION(msiof0),
 		SH_PFC_FUNCTION(msiof1),
 		SH_PFC_FUNCTION(msiof2),
-- 
2.17.1
