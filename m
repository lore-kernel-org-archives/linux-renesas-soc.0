Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:5887 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754388AbeCWLb5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Mar 2018 07:31:57 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a77965: Add PWM pins, groups and functions
Date: Fri, 23 Mar 2018 20:31:46 +0900
Message-Id: <1521804706-27666-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds PWM{0,1,2,3,4,5,6} pins, groups and functions to
R8A77965 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 153 ++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index cea9d05..3e3d290 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -1706,6 +1706,105 @@ enum {
 	IRQ5_MARK,
 };
 
+/* - PWM0 --------------------------------------------------------------------*/
+static const unsigned int pwm0_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 6),
+};
+static const unsigned int pwm0_mux[] = {
+	PWM0_MARK,
+};
+/* - PWM1 --------------------------------------------------------------------*/
+static const unsigned int pwm1_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 7),
+};
+static const unsigned int pwm1_a_mux[] = {
+	PWM1_A_MARK,
+};
+static const unsigned int pwm1_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 8),
+};
+static const unsigned int pwm1_b_mux[] = {
+	PWM1_B_MARK,
+};
+/* - PWM2 --------------------------------------------------------------------*/
+static const unsigned int pwm2_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 8),
+};
+static const unsigned int pwm2_a_mux[] = {
+	PWM2_A_MARK,
+};
+static const unsigned int pwm2_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 11),
+};
+static const unsigned int pwm2_b_mux[] = {
+	PWM2_B_MARK,
+};
+/* - PWM3 --------------------------------------------------------------------*/
+static const unsigned int pwm3_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 0),
+};
+static const unsigned int pwm3_a_mux[] = {
+	PWM3_A_MARK,
+};
+static const unsigned int pwm3_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 2),
+};
+static const unsigned int pwm3_b_mux[] = {
+	PWM3_B_MARK,
+};
+/* - PWM4 --------------------------------------------------------------------*/
+static const unsigned int pwm4_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 1),
+};
+static const unsigned int pwm4_a_mux[] = {
+	PWM4_A_MARK,
+};
+static const unsigned int pwm4_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 3),
+};
+static const unsigned int pwm4_b_mux[] = {
+	PWM4_B_MARK,
+};
+/* - PWM5 --------------------------------------------------------------------*/
+static const unsigned int pwm5_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 2),
+};
+static const unsigned int pwm5_a_mux[] = {
+	PWM5_A_MARK,
+};
+static const unsigned int pwm5_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 4),
+};
+static const unsigned int pwm5_b_mux[] = {
+	PWM5_B_MARK,
+};
+/* - PWM6 --------------------------------------------------------------------*/
+static const unsigned int pwm6_a_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(1, 3),
+};
+static const unsigned int pwm6_a_mux[] = {
+	PWM6_A_MARK,
+};
+static const unsigned int pwm6_b_pins[] = {
+	/* PWM */
+	RCAR_GP_PIN(2, 5),
+};
+static const unsigned int pwm6_b_mux[] = {
+	PWM6_B_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX, TX */
@@ -1965,6 +2064,19 @@ enum {
 	SH_PFC_PIN_GROUP(intc_ex_irq3),
 	SH_PFC_PIN_GROUP(intc_ex_irq4),
 	SH_PFC_PIN_GROUP(intc_ex_irq5),
+	SH_PFC_PIN_GROUP(pwm0),
+	SH_PFC_PIN_GROUP(pwm1_a),
+	SH_PFC_PIN_GROUP(pwm1_b),
+	SH_PFC_PIN_GROUP(pwm2_a),
+	SH_PFC_PIN_GROUP(pwm2_b),
+	SH_PFC_PIN_GROUP(pwm3_a),
+	SH_PFC_PIN_GROUP(pwm3_b),
+	SH_PFC_PIN_GROUP(pwm4_a),
+	SH_PFC_PIN_GROUP(pwm4_b),
+	SH_PFC_PIN_GROUP(pwm5_a),
+	SH_PFC_PIN_GROUP(pwm5_b),
+	SH_PFC_PIN_GROUP(pwm6_a),
+	SH_PFC_PIN_GROUP(pwm6_b),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -2022,6 +2134,40 @@ enum {
 	"intc_ex_irq5",
 };
 
+static const char * const pwm0_groups[] = {
+	"pwm0",
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
+};
+
+static const char * const pwm3_groups[] = {
+	"pwm3_a",
+	"pwm3_b",
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
 	"scif0_data",
 	"scif0_clk",
@@ -2086,6 +2232,13 @@ enum {
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(intc_ex),
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
1.9.1
