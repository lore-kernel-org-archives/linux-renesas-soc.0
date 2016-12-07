Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34662 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753112AbcLGQo5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 11:44:57 -0500
Received: by mail-wm0-f67.google.com with SMTP id g23so28995721wme.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Dec 2016 08:44:56 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
Cc: magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 2/4] pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups, and functions
Date: Wed,  7 Dec 2016 17:44:46 +0100
Message-Id: <1481129088-22026-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1481129088-22026-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1481129088-22026-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 283 +++++++++++++++++++++++++++++++++++
 1 file changed, 283 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index dc9b671..ed4a877 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1490,6 +1490,213 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - HSCIF0 ----------------------------------------------------------------- */
+static const unsigned int hscif0_data_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(5, 13), RCAR_GP_PIN(5, 14),
+};
+static const unsigned int hscif0_data_mux[] = {
+	HRX0_MARK, HTX0_MARK,
+};
+static const unsigned int hscif0_clk_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(5, 12),
+};
+static const unsigned int hscif0_clk_mux[] = {
+	HSCK0_MARK,
+};
+static const unsigned int hscif0_ctrl_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(5, 16), RCAR_GP_PIN(5, 15),
+};
+static const unsigned int hscif0_ctrl_mux[] = {
+	HRTS0_N_MARK, HCTS0_N_MARK,
+};
+/* - HSCIF1 ----------------------------------------------------------------- */
+static const unsigned int hscif1_data_a_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(5, 5), RCAR_GP_PIN(5, 6),
+};
+static const unsigned int hscif1_data_a_mux[] = {
+	HRX1_A_MARK, HTX1_A_MARK,
+};
+static const unsigned int hscif1_clk_a_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(6, 21),
+};
+static const unsigned int hscif1_clk_a_mux[] = {
+	HSCK1_A_MARK,
+};
+static const unsigned int hscif1_ctrl_a_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(5, 8), RCAR_GP_PIN(5, 7),
+};
+static const unsigned int hscif1_ctrl_a_mux[] = {
+	HRTS1_N_A_MARK, HCTS1_N_A_MARK,
+};
+
+static const unsigned int hscif1_data_b_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(5, 1), RCAR_GP_PIN(5, 2),
+};
+static const unsigned int hscif1_data_b_mux[] = {
+	HRX1_B_MARK, HTX1_B_MARK,
+};
+static const unsigned int hscif1_clk_b_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(5, 0),
+};
+static const unsigned int hscif1_clk_b_mux[] = {
+	HSCK1_B_MARK,
+};
+static const unsigned int hscif1_ctrl_b_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 3),
+};
+static const unsigned int hscif1_ctrl_b_mux[] = {
+	HRTS1_N_B_MARK, HCTS1_N_B_MARK,
+};
+/* - HSCIF2 ----------------------------------------------------------------- */
+static const unsigned int hscif2_data_a_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9),
+};
+static const unsigned int hscif2_data_a_mux[] = {
+	HRX2_A_MARK, HTX2_A_MARK,
+};
+static const unsigned int hscif2_clk_a_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(6, 10),
+};
+static const unsigned int hscif2_clk_a_mux[] = {
+	HSCK2_A_MARK,
+};
+static const unsigned int hscif2_ctrl_a_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(6, 7), RCAR_GP_PIN(6, 6),
+};
+static const unsigned int hscif2_ctrl_a_mux[] = {
+	HRTS2_N_A_MARK, HCTS2_N_A_MARK,
+};
+
+static const unsigned int hscif2_data_b_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 18),
+};
+static const unsigned int hscif2_data_b_mux[] = {
+	HRX2_B_MARK, HTX2_B_MARK,
+};
+static const unsigned int hscif2_clk_b_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(6, 21),
+};
+static const unsigned int hscif2_clk_b_mux[] = {
+	HSCK1_B_MARK,
+};
+static const unsigned int hscif2_ctrl_b_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(6, 20), RCAR_GP_PIN(6, 19),
+};
+static const unsigned int hscif2_ctrl_b_mux[] = {
+	HRTS2_N_B_MARK, HCTS2_N_B_MARK,
+};
+
+static const unsigned int hscif2_data_c_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(6, 25), RCAR_GP_PIN(6, 26),
+};
+static const unsigned int hscif2_data_c_mux[] = {
+	HRX2_C_MARK, HTX2_C_MARK,
+};
+static const unsigned int hscif2_clk_c_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(6, 24),
+};
+static const unsigned int hscif2_clk_c_mux[] = {
+	HSCK1_C_MARK,
+};
+static const unsigned int hscif2_ctrl_c_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(6, 28), RCAR_GP_PIN(6, 27),
+};
+static const unsigned int hscif2_ctrl_c_mux[] = {
+	HRTS2_N_C_MARK, HCTS2_N_C_MARK,
+};
+/* - HSCIF3 ----------------------------------------------------------------- */
+static const unsigned int hscif3_data_a_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(1, 23), RCAR_GP_PIN(1, 24),
+};
+static const unsigned int hscif3_data_a_mux[] = {
+	HRX3_A_MARK, HTX3_A_MARK,
+};
+static const unsigned int hscif3_clk_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(1, 22),
+};
+static const unsigned int hscif3_clk_mux[] = {
+	HSCK3_MARK,
+};
+static const unsigned int hscif3_ctrl_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
+};
+static const unsigned int hscif3_ctrl_mux[] = {
+	HRTS3_N_MARK, HCTS3_N_MARK,
+};
+
+static const unsigned int hscif3_data_b_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+};
+static const unsigned int hscif3_data_b_mux[] = {
+	HRX3_B_MARK, HTX3_B_MARK,
+};
+static const unsigned int hscif3_data_c_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+};
+static const unsigned int hscif3_data_c_mux[] = {
+	HRX3_C_MARK, HTX3_C_MARK,
+};
+static const unsigned int hscif3_data_d_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
+};
+static const unsigned int hscif3_data_d_mux[] = {
+	HRX3_D_MARK, HTX3_D_MARK,
+};
+/* - HSCIF4 ----------------------------------------------------------------- */
+static const unsigned int hscif4_data_a_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+};
+static const unsigned int hscif4_data_a_mux[] = {
+	HRX4_A_MARK, HTX4_A_MARK,
+};
+static const unsigned int hscif4_clk_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(1, 11),
+};
+static const unsigned int hscif4_clk_mux[] = {
+	HSCK4_MARK,
+};
+static const unsigned int hscif4_ctrl_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14),
+};
+static const unsigned int hscif4_ctrl_mux[] = {
+	HRTS4_N_MARK, HCTS3_N_MARK,
+};
+
+static const unsigned int hscif4_data_b_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 11),
+};
+static const unsigned int hscif4_data_b_mux[] = {
+	HRX4_B_MARK, HTX4_B_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX, TX */
@@ -1912,6 +2119,34 @@ static const unsigned int sdhi3_ds_mux[] = {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(hscif0_data),
+	SH_PFC_PIN_GROUP(hscif0_clk),
+	SH_PFC_PIN_GROUP(hscif0_ctrl),
+	SH_PFC_PIN_GROUP(hscif1_data_a),
+	SH_PFC_PIN_GROUP(hscif1_clk_a),
+	SH_PFC_PIN_GROUP(hscif1_ctrl_a),
+	SH_PFC_PIN_GROUP(hscif1_data_b),
+	SH_PFC_PIN_GROUP(hscif1_clk_b),
+	SH_PFC_PIN_GROUP(hscif1_ctrl_b),
+	SH_PFC_PIN_GROUP(hscif2_data_a),
+	SH_PFC_PIN_GROUP(hscif2_clk_a),
+	SH_PFC_PIN_GROUP(hscif2_ctrl_a),
+	SH_PFC_PIN_GROUP(hscif2_data_b),
+	SH_PFC_PIN_GROUP(hscif2_clk_b),
+	SH_PFC_PIN_GROUP(hscif2_ctrl_b),
+	SH_PFC_PIN_GROUP(hscif2_data_c),
+	SH_PFC_PIN_GROUP(hscif2_clk_c),
+	SH_PFC_PIN_GROUP(hscif2_ctrl_c),
+	SH_PFC_PIN_GROUP(hscif3_data_a),
+	SH_PFC_PIN_GROUP(hscif3_clk),
+	SH_PFC_PIN_GROUP(hscif3_ctrl),
+	SH_PFC_PIN_GROUP(hscif3_data_b),
+	SH_PFC_PIN_GROUP(hscif3_data_c),
+	SH_PFC_PIN_GROUP(hscif3_data_d),
+	SH_PFC_PIN_GROUP(hscif4_data_a),
+	SH_PFC_PIN_GROUP(hscif4_clk),
+	SH_PFC_PIN_GROUP(hscif4_ctrl),
+	SH_PFC_PIN_GROUP(hscif4_data_b),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -1969,6 +2204,49 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(sdhi3_ds),
 };
 
+static const char * const hscif0_groups[] = {
+	"hscif0_data",
+	"hscif0_clk",
+	"hscif0_ctrl",
+};
+
+static const char * const hscif1_groups[] = {
+	"hscif1_data_a",
+	"hscif1_clk_a",
+	"hscif1_ctrl_a",
+	"hscif1_data_b",
+	"hscif1_clk_b",
+	"hscif1_ctrl_b",
+};
+
+static const char * const hscif2_groups[] = {
+	"hscif2_data_a",
+	"hscif2_clk_a",
+	"hscif2_ctrl_a",
+	"hscif2_data_b",
+	"hscif2_clk_b",
+	"hscif2_ctrl_b",
+	"hscif2_data_c",
+	"hscif2_clk_c",
+	"hscif2_ctrl_c",
+};
+
+static const char * const hscif3_groups[] = {
+	"hscif3_data_a",
+	"hscif3_clk",
+	"hscif3_ctrl",
+	"hscif3_data_b",
+	"hscif3_data_c",
+	"hscif3_data_d",
+};
+
+static const char * const hscif4_groups[] = {
+	"hscif4_data_a",
+	"hscif4_clk",
+	"hscif4_ctrl",
+	"hscif4_data_b",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -2058,6 +2336,11 @@ static const char * const sdhi3_groups[] = {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(hscif0),
+	SH_PFC_FUNCTION(hscif1),
+	SH_PFC_FUNCTION(hscif2),
+	SH_PFC_FUNCTION(hscif3),
+	SH_PFC_FUNCTION(hscif4),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
2.7.4
