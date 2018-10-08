Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:26890 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726193AbeJHQlU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Oct 2018 12:41:20 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/4] pinctrl: sh-pfc: r8a77470: Add DU1 pin groups
Date: Mon,  8 Oct 2018 10:30:17 +0100
Message-Id: <1538991019-18577-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1538991019-18577-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1538991019-18577-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add DU1 pin groups and function to the RZ/G1C (a.k.a. R8A77470)
pinctrl driver.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c | 108 ++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
index b321a7a..64f542c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
@@ -1315,6 +1315,92 @@ static const unsigned int du0_disp_pins[] = {
 static const unsigned int du0_disp_mux[] = {
 	DU0_DISP_MARK
 };
+static const unsigned int du1_rgb666_pins[] = {
+	/* R[7:2], G[7:2], B[7:2] */
+	RCAR_GP_PIN(4, 9),  RCAR_GP_PIN(4, 8),  RCAR_GP_PIN(4, 7),
+	RCAR_GP_PIN(4, 6),  RCAR_GP_PIN(4, 5),  RCAR_GP_PIN(4, 4),
+	RCAR_GP_PIN(4, 17), RCAR_GP_PIN(4, 16), RCAR_GP_PIN(4, 15),
+	RCAR_GP_PIN(4, 14), RCAR_GP_PIN(4, 13), RCAR_GP_PIN(4, 12),
+	RCAR_GP_PIN(4, 25), RCAR_GP_PIN(4, 24), RCAR_GP_PIN(4, 23),
+	RCAR_GP_PIN(4, 22), RCAR_GP_PIN(4, 21), RCAR_GP_PIN(4, 20),
+};
+static const unsigned int du1_rgb666_mux[] = {
+	DU1_DR7_MARK, DU1_DR6_MARK, DU1_DR5_MARK, DU1_DR4_MARK,
+	DU1_DR3_MARK, DU1_DR2_MARK,
+	DU1_DG7_MARK, DU1_DG6_MARK, DU1_DG5_MARK, DU1_DG4_MARK,
+	DU1_DG3_MARK, DU1_DG2_MARK,
+	DU1_DB7_MARK, DU1_DB6_MARK, DU1_DB5_MARK, DU1_DB4_MARK,
+	DU1_DB3_MARK, DU1_DB2_MARK,
+};
+static const unsigned int du1_rgb888_pins[] = {
+	/* R[7:0], G[7:0], B[7:0] */
+	RCAR_GP_PIN(4, 9),  RCAR_GP_PIN(4, 8),  RCAR_GP_PIN(4, 7),
+	RCAR_GP_PIN(4, 6),  RCAR_GP_PIN(4, 5),  RCAR_GP_PIN(4, 4),
+	RCAR_GP_PIN(4, 3),  RCAR_GP_PIN(4, 2),
+	RCAR_GP_PIN(4, 17), RCAR_GP_PIN(4, 16), RCAR_GP_PIN(4, 15),
+	RCAR_GP_PIN(4, 14), RCAR_GP_PIN(4, 13), RCAR_GP_PIN(4, 12),
+	RCAR_GP_PIN(4, 11), RCAR_GP_PIN(4, 10),
+	RCAR_GP_PIN(4, 25), RCAR_GP_PIN(4, 24), RCAR_GP_PIN(4, 23),
+	RCAR_GP_PIN(4, 22), RCAR_GP_PIN(4, 21), RCAR_GP_PIN(4, 20),
+	RCAR_GP_PIN(4, 19), RCAR_GP_PIN(4, 18),
+};
+static const unsigned int du1_rgb888_mux[] = {
+	DU1_DR7_MARK, DU1_DR6_MARK, DU1_DR5_MARK, DU1_DR4_MARK,
+	DU1_DR3_MARK, DU1_DR2_MARK, DU1_DR1_MARK, DU1_DR0_MARK,
+	DU1_DG7_MARK, DU1_DG6_MARK, DU1_DG5_MARK, DU1_DG4_MARK,
+	DU1_DG3_MARK, DU1_DG2_MARK, DU1_DG1_MARK, DU1_DG0_MARK,
+	DU1_DB7_MARK, DU1_DB6_MARK, DU1_DB5_MARK, DU1_DB4_MARK,
+	DU1_DB3_MARK, DU1_DB2_MARK, DU1_DB1_MARK, DU1_DB0_MARK,
+};
+static const unsigned int du1_clk0_out_pins[] = {
+	/* DOTCLKOUT0 */
+	RCAR_GP_PIN(5, 2),
+};
+static const unsigned int du1_clk0_out_mux[] = {
+	DU1_DOTCLKOUT0_MARK
+};
+static const unsigned int du1_clk1_out_pins[] = {
+	/* DOTCLKOUT1 */
+	RCAR_GP_PIN(5, 0),
+};
+static const unsigned int du1_clk1_out_mux[] = {
+	DU1_DOTCLKOUT1_MARK
+};
+static const unsigned int du1_clk_in_pins[] = {
+	/* DOTCLKIN */
+	RCAR_GP_PIN(5, 1),
+};
+static const unsigned int du1_clk_in_mux[] = {
+	DU1_DOTCLKIN_MARK
+};
+static const unsigned int du1_sync_pins[] = {
+	/* EXVSYNC/VSYNC, EXHSYNC/HSYNC */
+	RCAR_GP_PIN(5, 5), RCAR_GP_PIN(5, 4),
+};
+static const unsigned int du1_sync_mux[] = {
+	DU1_EXVSYNC_DU1_VSYNC_MARK, DU1_EXHSYNC_DU1_HSYNC_MARK
+};
+static const unsigned int du1_oddf_pins[] = {
+	/* EXODDF/ODDF/DISP/CDE */
+	RCAR_GP_PIN(5, 3),
+};
+static const unsigned int du1_oddf_mux[] = {
+	DU1_EXODDF_DU1_ODDF_DISP_CDE_MARK,
+};
+static const unsigned int du1_cde_pins[] = {
+	/* CDE */
+	RCAR_GP_PIN(5, 7),
+};
+static const unsigned int du1_cde_mux[] = {
+	DU1_CDE_MARK
+};
+static const unsigned int du1_disp_pins[] = {
+	/* DISP */
+	RCAR_GP_PIN(5, 6),
+};
+static const unsigned int du1_disp_mux[] = {
+	DU1_DISP_MARK
+};
 /* - I2C0 ------------------------------------------------------------------- */
 static const unsigned int i2c0_a_pins[] = {
 	/* SCL, SDA */
@@ -1941,6 +2027,15 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(du0_oddf),
 	SH_PFC_PIN_GROUP(du0_cde),
 	SH_PFC_PIN_GROUP(du0_disp),
+	SH_PFC_PIN_GROUP(du1_rgb666),
+	SH_PFC_PIN_GROUP(du1_rgb888),
+	SH_PFC_PIN_GROUP(du1_clk0_out),
+	SH_PFC_PIN_GROUP(du1_clk1_out),
+	SH_PFC_PIN_GROUP(du1_clk_in),
+	SH_PFC_PIN_GROUP(du1_sync),
+	SH_PFC_PIN_GROUP(du1_oddf),
+	SH_PFC_PIN_GROUP(du1_cde),
+	SH_PFC_PIN_GROUP(du1_disp),
 	SH_PFC_PIN_GROUP(i2c0_a),
 	SH_PFC_PIN_GROUP(i2c0_b),
 	SH_PFC_PIN_GROUP(i2c0_c),
@@ -2052,6 +2147,18 @@ static const char * const du0_groups[] = {
 	"du0_disp",
 };
 
+static const char * const du1_groups[] = {
+	"du1_rgb666",
+	"du1_rgb888",
+	"du1_clk0_out",
+	"du1_clk1_out",
+	"du1_clk_in",
+	"du1_sync",
+	"du1_oddf",
+	"du1_cde",
+	"du1_disp",
+};
+
 static const char * const i2c0_groups[] = {
 	"i2c0_a",
 	"i2c0_b",
@@ -2193,6 +2300,7 @@ static const char * const usb1_groups[] = {
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(du0),
+	SH_PFC_FUNCTION(du1),
 	SH_PFC_FUNCTION(i2c0),
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
-- 
2.7.4
