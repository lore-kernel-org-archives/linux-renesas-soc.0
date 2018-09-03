Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:34850 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731235AbeICVxn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Sep 2018 17:53:43 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77990: Add MSIOF pins, groups and functions
Date: Mon,  3 Sep 2018 19:32:30 +0200
Message-Id: <20180903173230.7245-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds MSIOF{0,1,2,3} pins, groups and functions to
the R8A77990 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v4.20.

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 405 ++++++++++++++++++++++++++
 1 file changed, 405 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 6e9a8bc336452995..97becb2955a93567 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1595,6 +1595,325 @@ static const unsigned int i2c7_b_mux[] = {
 	SCL7_B_MARK, SDA7_B_MARK,
 };
 
+/* - MSIOF0 ----------------------------------------------------------------- */
+static const unsigned int msiof0_clk_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(5, 10),
+};
+
+static const unsigned int msiof0_clk_mux[] = {
+	MSIOF0_SCK_MARK,
+};
+
+static const unsigned int msiof0_sync_pins[] = {
+	/* SYNC */
+	RCAR_GP_PIN(5, 13),
+};
+
+static const unsigned int msiof0_sync_mux[] = {
+	MSIOF0_SYNC_MARK,
+};
+
+static const unsigned int msiof0_ss1_pins[] = {
+	/* SS1 */
+	RCAR_GP_PIN(5, 14),
+};
+
+static const unsigned int msiof0_ss1_mux[] = {
+	MSIOF0_SS1_MARK,
+};
+
+static const unsigned int msiof0_ss2_pins[] = {
+	/* SS2 */
+	RCAR_GP_PIN(5, 15),
+};
+
+static const unsigned int msiof0_ss2_mux[] = {
+	MSIOF0_SS2_MARK,
+};
+
+static const unsigned int msiof0_txd_pins[] = {
+	/* TXD */
+	RCAR_GP_PIN(5, 12),
+};
+
+static const unsigned int msiof0_txd_mux[] = {
+	MSIOF0_TXD_MARK,
+};
+
+static const unsigned int msiof0_rxd_pins[] = {
+	/* RXD */
+	RCAR_GP_PIN(5, 11),
+};
+
+static const unsigned int msiof0_rxd_mux[] = {
+	MSIOF0_RXD_MARK,
+};
+
+/* - MSIOF1 ----------------------------------------------------------------- */
+static const unsigned int msiof1_clk_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(1, 19),
+};
+
+static const unsigned int msiof1_clk_mux[] = {
+	MSIOF1_SCK_MARK,
+};
+
+static const unsigned int msiof1_sync_pins[] = {
+	/* SYNC */
+	RCAR_GP_PIN(1, 16),
+};
+
+static const unsigned int msiof1_sync_mux[] = {
+	MSIOF1_SYNC_MARK,
+};
+
+static const unsigned int msiof1_ss1_pins[] = {
+	/* SS1 */
+	RCAR_GP_PIN(1, 14),
+};
+
+static const unsigned int msiof1_ss1_mux[] = {
+	MSIOF1_SS1_MARK,
+};
+
+static const unsigned int msiof1_ss2_pins[] = {
+	/* SS2 */
+	RCAR_GP_PIN(1, 15),
+};
+
+static const unsigned int msiof1_ss2_mux[] = {
+	MSIOF1_SS2_MARK,
+};
+
+static const unsigned int msiof1_txd_pins[] = {
+	/* TXD */
+	RCAR_GP_PIN(1, 18),
+};
+
+static const unsigned int msiof1_txd_mux[] = {
+	MSIOF1_TXD_MARK,
+};
+
+static const unsigned int msiof1_rxd_pins[] = {
+	/* RXD */
+	RCAR_GP_PIN(1, 17),
+};
+
+static const unsigned int msiof1_rxd_mux[] = {
+	MSIOF1_RXD_MARK,
+};
+
+/* - MSIOF2 ----------------------------------------------------------------- */
+static const unsigned int msiof2_clk_a_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(0, 8),
+};
+
+static const unsigned int msiof2_clk_a_mux[] = {
+	MSIOF2_SCK_A_MARK,
+};
+
+static const unsigned int msiof2_sync_a_pins[] = {
+	/* SYNC */
+	RCAR_GP_PIN(0, 9),
+};
+
+static const unsigned int msiof2_sync_a_mux[] = {
+	MSIOF2_SYNC_A_MARK,
+};
+
+static const unsigned int msiof2_ss1_a_pins[] = {
+	/* SS1 */
+	RCAR_GP_PIN(0, 15),
+};
+
+static const unsigned int msiof2_ss1_a_mux[] = {
+	MSIOF2_SS1_A_MARK,
+};
+
+static const unsigned int msiof2_ss2_a_pins[] = {
+	/* SS2 */
+	RCAR_GP_PIN(0, 14),
+};
+
+static const unsigned int msiof2_ss2_a_mux[] = {
+	MSIOF2_SS2_A_MARK,
+};
+
+static const unsigned int msiof2_txd_a_pins[] = {
+	/* TXD */
+	RCAR_GP_PIN(0, 11),
+};
+
+static const unsigned int msiof2_txd_a_mux[] = {
+	MSIOF2_TXD_A_MARK,
+};
+
+static const unsigned int msiof2_rxd_a_pins[] = {
+	/* RXD */
+	RCAR_GP_PIN(0, 10),
+};
+
+static const unsigned int msiof2_rxd_a_mux[] = {
+	MSIOF2_RXD_A_MARK,
+};
+
+static const unsigned int msiof2_clk_b_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(1, 13),
+};
+
+static const unsigned int msiof2_clk_b_mux[] = {
+	MSIOF2_SCK_B_MARK,
+};
+
+static const unsigned int msiof2_sync_b_pins[] = {
+	/* SYNC */
+	RCAR_GP_PIN(1, 10),
+};
+
+static const unsigned int msiof2_sync_b_mux[] = {
+	MSIOF2_SYNC_B_MARK,
+};
+
+static const unsigned int msiof2_ss1_b_pins[] = {
+	/* SS1 */
+	RCAR_GP_PIN(1, 16),
+};
+
+static const unsigned int msiof2_ss1_b_mux[] = {
+	MSIOF2_SS1_B_MARK,
+};
+
+static const unsigned int msiof2_ss2_b_pins[] = {
+	/* SS2 */
+	RCAR_GP_PIN(1, 12),
+};
+
+static const unsigned int msiof2_ss2_b_mux[] = {
+	MSIOF2_SS2_B_MARK,
+};
+
+static const unsigned int msiof2_txd_b_pins[] = {
+	/* TXD */
+	RCAR_GP_PIN(1, 15),
+};
+
+static const unsigned int msiof2_txd_b_mux[] = {
+	MSIOF2_TXD_B_MARK,
+};
+
+static const unsigned int msiof2_rxd_b_pins[] = {
+	/* RXD */
+	RCAR_GP_PIN(1, 14),
+};
+
+static const unsigned int msiof2_rxd_b_mux[] = {
+	MSIOF2_RXD_B_MARK,
+};
+
+/* - MSIOF3 ----------------------------------------------------------------- */
+static const unsigned int msiof3_clk_a_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(0, 0),
+};
+
+static const unsigned int msiof3_clk_a_mux[] = {
+	MSIOF3_SCK_A_MARK,
+};
+
+static const unsigned int msiof3_sync_a_pins[] = {
+	/* SYNC */
+	RCAR_GP_PIN(0, 1),
+};
+
+static const unsigned int msiof3_sync_a_mux[] = {
+	MSIOF3_SYNC_A_MARK,
+};
+
+static const unsigned int msiof3_ss1_a_pins[] = {
+	/* SS1 */
+	RCAR_GP_PIN(0, 15),
+};
+
+static const unsigned int msiof3_ss1_a_mux[] = {
+	MSIOF3_SS1_A_MARK,
+};
+
+static const unsigned int msiof3_ss2_a_pins[] = {
+	/* SS2 */
+	RCAR_GP_PIN(0, 4),
+};
+
+static const unsigned int msiof3_ss2_a_mux[] = {
+	MSIOF3_SS2_A_MARK,
+};
+
+static const unsigned int msiof3_txd_a_pins[] = {
+	/* TXD */
+	RCAR_GP_PIN(0, 3),
+};
+
+static const unsigned int msiof3_txd_a_mux[] = {
+	MSIOF3_TXD_A_MARK,
+};
+
+static const unsigned int msiof3_rxd_a_pins[] = {
+	/* RXD */
+	RCAR_GP_PIN(0, 2),
+};
+
+static const unsigned int msiof3_rxd_a_mux[] = {
+	MSIOF3_RXD_A_MARK,
+};
+
+static const unsigned int msiof3_clk_b_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(1, 5),
+};
+
+static const unsigned int msiof3_clk_b_mux[] = {
+	MSIOF3_SCK_B_MARK,
+};
+
+static const unsigned int msiof3_sync_b_pins[] = {
+	/* SYNC */
+	RCAR_GP_PIN(1, 4),
+};
+
+static const unsigned int msiof3_sync_b_mux[] = {
+	MSIOF3_SYNC_B_MARK,
+};
+
+static const unsigned int msiof3_ss1_b_pins[] = {
+	/* SS1 */
+	RCAR_GP_PIN(1, 0),
+};
+
+static const unsigned int msiof3_ss1_b_mux[] = {
+	MSIOF3_SS1_B_MARK,
+};
+
+static const unsigned int msiof3_txd_b_pins[] = {
+	/* TXD */
+	RCAR_GP_PIN(1, 7),
+};
+
+static const unsigned int msiof3_txd_b_mux[] = {
+	MSIOF3_TXD_B_MARK,
+};
+
+static const unsigned int msiof3_rxd_b_pins[] = {
+	/* RXD */
+	RCAR_GP_PIN(1, 6),
+};
+
+static const unsigned int msiof3_rxd_b_mux[] = {
+	MSIOF3_RXD_B_MARK,
+};
+
 /* - PWM0 --------------------------------------------------------------------*/
 static const unsigned int pwm0_a_pins[] = {
 	/* PWM */
@@ -2102,6 +2421,41 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(i2c6_b),
 	SH_PFC_PIN_GROUP(i2c7_a),
 	SH_PFC_PIN_GROUP(i2c7_b),
+	SH_PFC_PIN_GROUP(msiof0_clk),
+	SH_PFC_PIN_GROUP(msiof0_sync),
+	SH_PFC_PIN_GROUP(msiof0_ss1),
+	SH_PFC_PIN_GROUP(msiof0_ss2),
+	SH_PFC_PIN_GROUP(msiof0_txd),
+	SH_PFC_PIN_GROUP(msiof0_rxd),
+	SH_PFC_PIN_GROUP(msiof1_clk),
+	SH_PFC_PIN_GROUP(msiof1_sync),
+	SH_PFC_PIN_GROUP(msiof1_ss1),
+	SH_PFC_PIN_GROUP(msiof1_ss2),
+	SH_PFC_PIN_GROUP(msiof1_txd),
+	SH_PFC_PIN_GROUP(msiof1_rxd),
+	SH_PFC_PIN_GROUP(msiof2_clk_a),
+	SH_PFC_PIN_GROUP(msiof2_sync_a),
+	SH_PFC_PIN_GROUP(msiof2_ss1_a),
+	SH_PFC_PIN_GROUP(msiof2_ss2_a),
+	SH_PFC_PIN_GROUP(msiof2_txd_a),
+	SH_PFC_PIN_GROUP(msiof2_rxd_a),
+	SH_PFC_PIN_GROUP(msiof2_clk_b),
+	SH_PFC_PIN_GROUP(msiof2_sync_b),
+	SH_PFC_PIN_GROUP(msiof2_ss1_b),
+	SH_PFC_PIN_GROUP(msiof2_ss2_b),
+	SH_PFC_PIN_GROUP(msiof2_txd_b),
+	SH_PFC_PIN_GROUP(msiof2_rxd_b),
+	SH_PFC_PIN_GROUP(msiof3_clk_a),
+	SH_PFC_PIN_GROUP(msiof3_sync_a),
+	SH_PFC_PIN_GROUP(msiof3_ss1_a),
+	SH_PFC_PIN_GROUP(msiof3_ss2_a),
+	SH_PFC_PIN_GROUP(msiof3_txd_a),
+	SH_PFC_PIN_GROUP(msiof3_rxd_a),
+	SH_PFC_PIN_GROUP(msiof3_clk_b),
+	SH_PFC_PIN_GROUP(msiof3_sync_b),
+	SH_PFC_PIN_GROUP(msiof3_ss1_b),
+	SH_PFC_PIN_GROUP(msiof3_txd_b),
+	SH_PFC_PIN_GROUP(msiof3_rxd_b),
 	SH_PFC_PIN_GROUP(pwm0_a),
 	SH_PFC_PIN_GROUP(pwm0_b),
 	SH_PFC_PIN_GROUP(pwm1_a),
@@ -2210,6 +2564,53 @@ static const char * const i2c7_groups[] = {
 	"i2c7_b",
 };
 
+static const char * const msiof0_groups[] = {
+	"msiof0_clk",
+	"msiof0_sync",
+	"msiof0_ss1",
+	"msiof0_ss2",
+	"msiof0_txd",
+	"msiof0_rxd",
+};
+
+static const char * const msiof1_groups[] = {
+	"msiof1_clk",
+	"msiof1_sync",
+	"msiof1_ss1",
+	"msiof1_ss2",
+	"msiof1_txd",
+	"msiof1_rxd",
+};
+
+static const char * const msiof2_groups[] = {
+	"msiof2_clk_a",
+	"msiof2_sync_a",
+	"msiof2_ss1_a",
+	"msiof2_ss2_a",
+	"msiof2_txd_a",
+	"msiof2_rxd_a",
+	"msiof2_clk_b",
+	"msiof2_sync_b",
+	"msiof2_ss1_b",
+	"msiof2_ss2_b",
+	"msiof2_txd_b",
+	"msiof2_rxd_b",
+};
+
+static const char * const msiof3_groups[] = {
+	"msiof3_clk_a",
+	"msiof3_sync_a",
+	"msiof3_ss1_a",
+	"msiof3_ss2_a",
+	"msiof3_txd_a",
+	"msiof3_rxd_a",
+	"msiof3_clk_b",
+	"msiof3_sync_b",
+	"msiof3_ss1_b",
+	"msiof3_txd_b",
+	"msiof3_rxd_b",
+};
+
 static const char * const pwm0_groups[] = {
 	"pwm0_a",
 	"pwm0_b",
@@ -2318,6 +2719,10 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(i2c5),
 	SH_PFC_FUNCTION(i2c6),
 	SH_PFC_FUNCTION(i2c7),
+	SH_PFC_FUNCTION(msiof0),
+	SH_PFC_FUNCTION(msiof1),
+	SH_PFC_FUNCTION(msiof2),
+	SH_PFC_FUNCTION(msiof3),
 	SH_PFC_FUNCTION(pwm0),
 	SH_PFC_FUNCTION(pwm1),
 	SH_PFC_FUNCTION(pwm2),
-- 
2.17.1
