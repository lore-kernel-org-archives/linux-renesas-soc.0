Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33390 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731206AbeISR4D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 13:56:03 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77990: Add PWM pins, groups and functions
Date: Wed, 19 Sep 2018 15:18:31 +0300
Message-Id: <20180919121831.313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R8A77990 (E3) SoC has 7 PWM outputs, add pins, groups and functions
for all of them.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 180 ++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index bb9c943e2b37..eca3e678544f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1595,6 +1595,126 @@ static const unsigned int i2c7_b_mux[] = {
 	SCL7_B_MARK, SDA7_B_MARK,
 };
 
+/* - PWM0 --------------------------------------------------------------------*/
+static const unsigned int pwm0_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 22),
+};
+static const unsigned int pwm0_a_mux[] = {
+	PWM0_A_MARK,
+};
+static const unsigned int pwm0_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(6, 3),
+};
+static const unsigned int pwm0_b_mux[] = {
+	PWM0_B_MARK,
+};
+/* - PWM1 --------------------------------------------------------------------*/
+static const unsigned int pwm1_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 23),
+};
+static const unsigned int pwm1_a_mux[] = {
+	PWM1_A_MARK,
+};
+static const unsigned int pwm1_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(6, 4),
+};
+static const unsigned int pwm1_b_mux[] = {
+	PWM1_B_MARK,
+};
+/* - PWM2 --------------------------------------------------------------------*/
+static const unsigned int pwm2_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 0),
+};
+static const unsigned int pwm2_a_mux[] = {
+	PWM2_A_MARK,
+};
+static const unsigned int pwm2_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 4),
+};
+static const unsigned int pwm2_b_mux[] = {
+	PWM2_B_MARK,
+};
+static const unsigned int pwm2_c_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(6, 5),
+};
+static const unsigned int pwm2_c_mux[] = {
+	PWM2_C_MARK,
+};
+/* - PWM3 --------------------------------------------------------------------*/
+static const unsigned int pwm3_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 1),
+};
+static const unsigned int pwm3_a_mux[] = {
+	PWM3_A_MARK,
+};
+static const unsigned int pwm3_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 5),
+};
+static const unsigned int pwm3_b_mux[] = {
+	PWM3_B_MARK,
+};
+static const unsigned int pwm3_c_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(6, 6),
+};
+static const unsigned int pwm3_c_mux[] = {
+	PWM3_C_MARK,
+};
+/* - PWM4 --------------------------------------------------------------------*/
+static const unsigned int pwm4_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 3),
+};
+static const unsigned int pwm4_a_mux[] = {
+	PWM4_A_MARK,
+};
+static const unsigned int pwm4_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(6, 7),
+};
+static const unsigned int pwm4_b_mux[] = {
+	PWM4_B_MARK,
+};
+/* - PWM5 --------------------------------------------------------------------*/
+static const unsigned int pwm5_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 24),
+};
+static const unsigned int pwm5_a_mux[] = {
+	PWM5_A_MARK,
+};
+static const unsigned int pwm5_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(6, 10),
+};
+static const unsigned int pwm5_b_mux[] = {
+	PWM5_B_MARK,
+};
+/* - PWM6 --------------------------------------------------------------------*/
+static const unsigned int pwm6_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 25),
+};
+static const unsigned int pwm6_a_mux[] = {
+	PWM6_A_MARK,
+};
+static const unsigned int pwm6_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(6, 11),
+};
+static const unsigned int pwm6_b_mux[] = {
+	PWM6_B_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_a_pins[] = {
 	/* RX, TX */
@@ -1951,6 +2071,22 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(i2c6_b),
 	SH_PFC_PIN_GROUP(i2c7_a),
 	SH_PFC_PIN_GROUP(i2c7_b),
+	SH_PFC_PIN_GROUP(pwm0_a),
+	SH_PFC_PIN_GROUP(pwm0_b),
+	SH_PFC_PIN_GROUP(pwm1_a),
+	SH_PFC_PIN_GROUP(pwm1_b),
+	SH_PFC_PIN_GROUP(pwm2_a),
+	SH_PFC_PIN_GROUP(pwm2_b),
+	SH_PFC_PIN_GROUP(pwm2_c),
+	SH_PFC_PIN_GROUP(pwm3_a),
+	SH_PFC_PIN_GROUP(pwm3_b),
+	SH_PFC_PIN_GROUP(pwm3_c),
+	SH_PFC_PIN_GROUP(pwm4_a),
+	SH_PFC_PIN_GROUP(pwm4_b),
+	SH_PFC_PIN_GROUP(pwm5_a),
+	SH_PFC_PIN_GROUP(pwm5_b),
+	SH_PFC_PIN_GROUP(pwm6_a),
+	SH_PFC_PIN_GROUP(pwm6_b),
 	SH_PFC_PIN_GROUP(scif0_data_a),
 	SH_PFC_PIN_GROUP(scif0_clk_a),
 	SH_PFC_PIN_GROUP(scif0_ctrl_a),
@@ -2043,6 +2179,43 @@ static const char * const i2c7_groups[] = {
 	"i2c7_b",
 };
 
+static const char * const pwm0_groups[] = {
+	"pwm0_a",
+	"pwm0_b",
+};
+
+static const char * const pwm1_groups[] = {
+	"pwm1_a",
+	"pwm1_b",
+};
+
+static const char * const pwm2_groups[] = {
+	"pwm2_a",
+	"pwm2_b",
+	"pwm2_c",
+};
+
+static const char * const pwm3_groups[] = {
+	"pwm3_a",
+	"pwm3_b",
+	"pwm3_c",
+};
+
+static const char * const pwm4_groups[] = {
+	"pwm4_a",
+	"pwm4_b",
+};
+
+static const char * const pwm5_groups[] = {
+	"pwm5_a",
+	"pwm5_b",
+};
+
+static const char * const pwm6_groups[] = {
+	"pwm6_a",
+	"pwm6_b",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data_a",
 	"scif0_clk_a",
@@ -2114,6 +2287,13 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(i2c5),
 	SH_PFC_FUNCTION(i2c6),
 	SH_PFC_FUNCTION(i2c7),
+	SH_PFC_FUNCTION(pwm0),
+	SH_PFC_FUNCTION(pwm1),
+	SH_PFC_FUNCTION(pwm2),
+	SH_PFC_FUNCTION(pwm3),
+	SH_PFC_FUNCTION(pwm4),
+	SH_PFC_FUNCTION(pwm5),
+	SH_PFC_FUNCTION(pwm6),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
Regards,

Laurent Pinchart
