Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41781 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbeJORnK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Oct 2018 13:43:10 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a77990: Add Audio clock pins, groups and functions
Date: Mon, 15 Oct 2018 11:58:26 +0200
Message-Id: <20181015095827.25592-2-horms+renesas@verge.net.au>
In-Reply-To: <20181015095827.25592-1-horms+renesas@verge.net.au>
References: <20181015095827.25592-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds AUDIO_CLK{A,B,C}, AUDIO_CLKOUT, AUDIO_CLKOUT{1,2,3}
pins, groups and functions to the R8A77990 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[simon: rebase]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 207 +++++++++++++++++++++++++++++++++-
 1 file changed, 205 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 1fdafa48479c..4e37222e732d 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1299,6 +1299,169 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 3, PRESETOUT_N, CFG_FLAGS),
 };
 
+/* - AUDIO CLOCK ------------------------------------------------------------ */
+static const unsigned int audio_clk_a_pins[] = {
+	/* CLK A */
+	RCAR_GP_PIN(6, 8),
+};
+
+static const unsigned int audio_clk_a_mux[] = {
+	AUDIO_CLKA_MARK,
+};
+
+static const unsigned int audio_clk_b_a_pins[] = {
+	/* CLK B_A */
+	RCAR_GP_PIN(5, 7),
+};
+
+static const unsigned int audio_clk_b_a_mux[] = {
+	AUDIO_CLKB_A_MARK,
+};
+
+static const unsigned int audio_clk_b_b_pins[] = {
+	/* CLK B_B */
+	RCAR_GP_PIN(6, 7),
+};
+
+static const unsigned int audio_clk_b_b_mux[] = {
+	AUDIO_CLKB_B_MARK,
+};
+
+static const unsigned int audio_clk_b_c_pins[] = {
+	/* CLK B_C */
+	RCAR_GP_PIN(6, 13),
+};
+
+static const unsigned int audio_clk_b_c_mux[] = {
+	AUDIO_CLKB_C_MARK,
+};
+
+static const unsigned int audio_clk_c_a_pins[] = {
+	/* CLK C_A */
+	RCAR_GP_PIN(5, 16),
+};
+
+static const unsigned int audio_clk_c_a_mux[] = {
+	AUDIO_CLKC_A_MARK,
+};
+
+static const unsigned int audio_clk_c_b_pins[] = {
+	/* CLK C_B */
+	RCAR_GP_PIN(6, 3),
+};
+
+static const unsigned int audio_clk_c_b_mux[] = {
+	AUDIO_CLKC_B_MARK,
+};
+
+static const unsigned int audio_clk_c_c_pins[] = {
+	/* CLK C_C */
+	RCAR_GP_PIN(6, 14),
+};
+
+static const unsigned int audio_clk_c_c_mux[] = {
+	AUDIO_CLKC_C_MARK,
+};
+
+static const unsigned int audio_clkout_a_pins[] = {
+	/* CLKOUT_A */
+	RCAR_GP_PIN(5, 3),
+};
+
+static const unsigned int audio_clkout_a_mux[] = {
+	AUDIO_CLKOUT_A_MARK,
+};
+
+static const unsigned int audio_clkout_b_pins[] = {
+	/* CLKOUT_B */
+	RCAR_GP_PIN(5, 13),
+};
+
+static const unsigned int audio_clkout_b_mux[] = {
+	AUDIO_CLKOUT_B_MARK,
+};
+
+static const unsigned int audio_clkout1_a_pins[] = {
+	/* CLKOUT1_A */
+	RCAR_GP_PIN(5, 4),
+};
+
+static const unsigned int audio_clkout1_a_mux[] = {
+	AUDIO_CLKOUT1_A_MARK,
+};
+
+static const unsigned int audio_clkout1_b_pins[] = {
+	/* CLKOUT1_B */
+	RCAR_GP_PIN(5, 5),
+};
+
+static const unsigned int audio_clkout1_b_mux[] = {
+	AUDIO_CLKOUT1_B_MARK,
+};
+
+static const unsigned int audio_clkout1_c_pins[] = {
+	/* CLKOUT1_C */
+	RCAR_GP_PIN(6, 7),
+};
+
+static const unsigned int audio_clkout1_c_mux[] = {
+	AUDIO_CLKOUT1_C_MARK,
+};
+
+static const unsigned int audio_clkout2_a_pins[] = {
+	/* CLKOUT2_A */
+	RCAR_GP_PIN(5, 8),
+};
+
+static const unsigned int audio_clkout2_a_mux[] = {
+	AUDIO_CLKOUT2_A_MARK,
+};
+
+static const unsigned int audio_clkout2_b_pins[] = {
+	/* CLKOUT2_B */
+	RCAR_GP_PIN(6, 4),
+};
+
+static const unsigned int audio_clkout2_b_mux[] = {
+	AUDIO_CLKOUT2_B_MARK,
+};
+
+static const unsigned int audio_clkout2_c_pins[] = {
+	/* CLKOUT2_C */
+	RCAR_GP_PIN(6, 15),
+};
+
+static const unsigned int audio_clkout2_c_mux[] = {
+	AUDIO_CLKOUT2_C_MARK,
+};
+
+static const unsigned int audio_clkout3_a_pins[] = {
+	/* CLKOUT3_A */
+	RCAR_GP_PIN(5, 9),
+};
+
+static const unsigned int audio_clkout3_a_mux[] = {
+	AUDIO_CLKOUT3_A_MARK,
+};
+
+static const unsigned int audio_clkout3_b_pins[] = {
+	/* CLKOUT3_B */
+	RCAR_GP_PIN(5, 6),
+};
+
+static const unsigned int audio_clkout3_b_mux[] = {
+	AUDIO_CLKOUT3_B_MARK,
+};
+
+static const unsigned int audio_clkout3_c_pins[] = {
+	/* CLKOUT3_C */
+	RCAR_GP_PIN(6, 16),
+};
+
+static const unsigned int audio_clkout3_c_mux[] = {
+	AUDIO_CLKOUT3_C_MARK,
+};
+
 /* - EtherAVB --------------------------------------------------------------- */
 static const unsigned int avb_link_pins[] = {
 	/* AVB_LINK */
@@ -2434,10 +2597,28 @@ static const unsigned int usb30_id_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[123];
+	struct sh_pfc_pin_group common[141];
 	struct sh_pfc_pin_group automotive[0];
 } pinmux_groups = {
 	.common = {
+		SH_PFC_PIN_GROUP(audio_clk_a),
+		SH_PFC_PIN_GROUP(audio_clk_b_a),
+		SH_PFC_PIN_GROUP(audio_clk_b_b),
+		SH_PFC_PIN_GROUP(audio_clk_b_c),
+		SH_PFC_PIN_GROUP(audio_clk_c_a),
+		SH_PFC_PIN_GROUP(audio_clk_c_b),
+		SH_PFC_PIN_GROUP(audio_clk_c_c),
+		SH_PFC_PIN_GROUP(audio_clkout_a),
+		SH_PFC_PIN_GROUP(audio_clkout_b),
+		SH_PFC_PIN_GROUP(audio_clkout1_a),
+		SH_PFC_PIN_GROUP(audio_clkout1_b),
+		SH_PFC_PIN_GROUP(audio_clkout1_c),
+		SH_PFC_PIN_GROUP(audio_clkout2_a),
+		SH_PFC_PIN_GROUP(audio_clkout2_b),
+		SH_PFC_PIN_GROUP(audio_clkout2_c),
+		SH_PFC_PIN_GROUP(audio_clkout3_a),
+		SH_PFC_PIN_GROUP(audio_clkout3_b),
+		SH_PFC_PIN_GROUP(audio_clkout3_c),
 		SH_PFC_PIN_GROUP(avb_link),
 		SH_PFC_PIN_GROUP(avb_magic),
 		SH_PFC_PIN_GROUP(avb_phy_int),
@@ -2564,6 +2745,27 @@ static const struct {
 	}
 };
 
+static const char * const audio_clk_groups[] = {
+	"audio_clk_a",
+	"audio_clk_b_a",
+	"audio_clk_b_b",
+	"audio_clk_b_c",
+	"audio_clk_c_a",
+	"audio_clk_c_b",
+	"audio_clk_c_c",
+	"audio_clkout_a",
+	"audio_clkout_b",
+	"audio_clkout1_a",
+	"audio_clkout1_b",
+	"audio_clkout1_c",
+	"audio_clkout2_a",
+	"audio_clkout2_b",
+	"audio_clkout2_c",
+	"audio_clkout3_a",
+	"audio_clkout3_b",
+	"audio_clkout3_c",
+};
+
 static const char * const avb_groups[] = {
 	"avb_link",
 	"avb_magic",
@@ -2775,10 +2977,11 @@ static const char * const usb30_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[29];
+	struct sh_pfc_function common[30];
 	struct sh_pfc_function automotive[0];
 } pinmux_functions = {
 	.common = {
+		SH_PFC_FUNCTION(audio_clk),
 		SH_PFC_FUNCTION(avb),
 		SH_PFC_FUNCTION(du),
 		SH_PFC_FUNCTION(i2c1),
-- 
2.11.0
