Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:60906 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750949AbeEMLfg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 May 2018 07:35:36 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] pinctrl: sh-pfc: r8a77965: Add I2C pin support
Date: Sun, 13 May 2018 13:35:05 +0200
Message-Id: <20180513113505.4880-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 77 +++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index cea9d0599c1281a7..0c786fd78011376a 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -1662,6 +1662,57 @@ static const unsigned int avb_avtp_capture_b_mux[] = {
 	AVB_AVTP_CAPTURE_B_MARK,
 };
 
+/* - I2C -------------------------------------------------------------------- */
+static const unsigned int i2c1_a_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(5, 11), RCAR_GP_PIN(5, 10),
+};
+static const unsigned int i2c1_a_mux[] = {
+	SDA1_A_MARK, SCL1_A_MARK,
+};
+static const unsigned int i2c1_b_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 23),
+};
+static const unsigned int i2c1_b_mux[] = {
+	SDA1_B_MARK, SCL1_B_MARK,
+};
+static const unsigned int i2c2_a_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 4),
+};
+static const unsigned int i2c2_a_mux[] = {
+	SDA2_A_MARK, SCL2_A_MARK,
+};
+static const unsigned int i2c2_b_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 12),
+};
+static const unsigned int i2c2_b_mux[] = {
+	SDA2_B_MARK, SCL2_B_MARK,
+};
+static const unsigned int i2c6_a_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 11),
+};
+static const unsigned int i2c6_a_mux[] = {
+	SDA6_A_MARK, SCL6_A_MARK,
+};
+static const unsigned int i2c6_b_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
+};
+static const unsigned int i2c6_b_mux[] = {
+	SDA6_B_MARK, SCL6_B_MARK,
+};
+static const unsigned int i2c6_c_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
+};
+static const unsigned int i2c6_c_mux[] = {
+	SDA6_C_MARK, SCL6_C_MARK,
+};
+
 /* - INTC-EX ---------------------------------------------------------------- */
 static const unsigned int intc_ex_irq0_pins[] = {
 	/* IRQ0 */
@@ -1959,6 +2010,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
 	SH_PFC_PIN_GROUP(avb_avtp_match_b),
 	SH_PFC_PIN_GROUP(avb_avtp_capture_b),
+	SH_PFC_PIN_GROUP(i2c1_a),
+	SH_PFC_PIN_GROUP(i2c1_b),
+	SH_PFC_PIN_GROUP(i2c2_a),
+	SH_PFC_PIN_GROUP(i2c2_b),
+	SH_PFC_PIN_GROUP(i2c6_a),
+	SH_PFC_PIN_GROUP(i2c6_b),
+	SH_PFC_PIN_GROUP(i2c6_c),
 	SH_PFC_PIN_GROUP(intc_ex_irq0),
 	SH_PFC_PIN_GROUP(intc_ex_irq1),
 	SH_PFC_PIN_GROUP(intc_ex_irq2),
@@ -2013,6 +2071,22 @@ static const char * const avb_groups[] = {
 	"avb_avtp_capture_b",
 };
 
+static const char * const i2c1_groups[] = {
+	"i2c1_a",
+	"i2c1_b",
+};
+
+static const char * const i2c2_groups[] = {
+	"i2c2_a",
+	"i2c2_b",
+};
+
+static const char * const i2c6_groups[] = {
+	"i2c6_a",
+	"i2c6_b",
+	"i2c6_c",
+};
+
 static const char * const intc_ex_groups[] = {
 	"intc_ex_irq0",
 	"intc_ex_irq1",
@@ -2085,6 +2159,9 @@ static const char * const usb30_groups[] = {
 
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
+	SH_PFC_FUNCTION(i2c1),
+	SH_PFC_FUNCTION(i2c2),
+	SH_PFC_FUNCTION(i2c6),
 	SH_PFC_FUNCTION(intc_ex),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
-- 
2.17.0
