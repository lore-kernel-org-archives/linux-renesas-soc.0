Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:49848 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbeHWKhX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 06:37:23 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77990: Add DU pins, groups and function
Date: Thu, 23 Aug 2018 10:09:03 +0300
Message-Id: <20180823070903.4380-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds DU pins, groups and function for the R8A77990 (E3) SoC.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 101 ++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index b81c807ac54d..00769ec9635e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1371,6 +1371,87 @@ static const unsigned int avb_avtp_capture_a_mux[] = {
 	AVB_AVTP_CAPTURE_A_MARK,
 };
 
+/* - DU --------------------------------------------------------------------- */
+static const unsigned int du_rgb666_pins[] = {
+	/* R[7:2], G[7:2], B[7:2] */
+	RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 6),  RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 3),  RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 0),
+	RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 1),  RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 16),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
+};
+static const unsigned int du_rgb666_mux[] = {
+	DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK, DU_DR4_MARK,
+	DU_DR3_MARK, DU_DR2_MARK,
+	DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK, DU_DG4_MARK,
+	DU_DG3_MARK, DU_DG2_MARK,
+	DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK, DU_DB4_MARK,
+	DU_DB3_MARK, DU_DB2_MARK,
+};
+static const unsigned int du_rgb888_pins[] = {
+	/* R[7:0], G[7:0], B[7:0] */
+	RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 6),  RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 3),  RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 0),
+	RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 21),
+	RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 1),  RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 16),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 18),
+};
+static const unsigned int du_rgb888_mux[] = {
+	DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK, DU_DR4_MARK,
+	DU_DR3_MARK, DU_DR2_MARK, DU_DR1_MARK, DU_DR0_MARK,
+	DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK, DU_DG4_MARK,
+	DU_DG3_MARK, DU_DG2_MARK, DU_DG1_MARK, DU_DG0_MARK,
+	DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK, DU_DB4_MARK,
+	DU_DB3_MARK, DU_DB2_MARK, DU_DB1_MARK, DU_DB0_MARK,
+};
+static const unsigned int du_clk_in_1_pins[] = {
+	/* CLKIN */
+	RCAR_GP_PIN(1, 1),
+};
+static const unsigned int du_clk_in_1_mux[] = {
+	DU_DOTCLKIN1_MARK
+};
+static const unsigned int du_clk_out_0_pins[] = {
+	/* CLKOUT */
+	RCAR_GP_PIN(1, 3),
+};
+static const unsigned int du_clk_out_0_mux[] = {
+	DU_DOTCLKOUT0_MARK
+};
+static const unsigned int du_sync_pins[] = {
+	/* VSYNC, HSYNC */
+	RCAR_GP_PIN(1, 11), RCAR_GP_PIN(1, 8),
+};
+static const unsigned int du_sync_mux[] = {
+	DU_VSYNC_MARK, DU_HSYNC_MARK
+};
+static const unsigned int du_disp_cde_pins[] = {
+	/* DISP_CDE */
+	RCAR_GP_PIN(1, 1),
+};
+static const unsigned int du_disp_cde_mux[] = {
+	DU_DISP_CDE_MARK,
+};
+static const unsigned int du_cde_pins[] = {
+	/* CDE */
+	RCAR_GP_PIN(1, 0),
+};
+static const unsigned int du_cde_mux[] = {
+	DU_CDE_MARK,
+};
+static const unsigned int du_disp_pins[] = {
+	/* DISP */
+	RCAR_GP_PIN(1, 2),
+};
+static const unsigned int du_disp_mux[] = {
+	DU_DISP_MARK,
+};
+
 /* - I2C -------------------------------------------------------------------- */
 static const unsigned int i2c1_a_pins[] = {
 	/* SCL, SDA */
@@ -1839,6 +1920,14 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_avtp_pps),
 	SH_PFC_PIN_GROUP(avb_avtp_match_a),
 	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
+	SH_PFC_PIN_GROUP(du_rgb666),
+	SH_PFC_PIN_GROUP(du_rgb888),
+	SH_PFC_PIN_GROUP(du_clk_in_1),
+	SH_PFC_PIN_GROUP(du_clk_out_0),
+	SH_PFC_PIN_GROUP(du_sync),
+	SH_PFC_PIN_GROUP(du_disp_cde),
+	SH_PFC_PIN_GROUP(du_cde),
+	SH_PFC_PIN_GROUP(du_disp),
 	SH_PFC_PIN_GROUP(i2c1_a),
 	SH_PFC_PIN_GROUP(i2c1_b),
 	SH_PFC_PIN_GROUP(i2c1_c),
@@ -1901,6 +1990,17 @@ static const char * const avb_groups[] = {
 	"avb_avtp_capture_a",
 };
 
+static const char * const du_groups[] = {
+	"du_rgb666",
+	"du_rgb888",
+	"du_clk_in_1",
+	"du_clk_out_0",
+	"du_sync",
+	"du_disp_cde",
+	"du_cde",
+	"du_disp",
+};
+
 static const char * const i2c1_groups[] = {
 	"i2c1_a",
 	"i2c1_b",
@@ -1998,6 +2098,7 @@ static const char * const usb30_groups[] = {
 
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
+	SH_PFC_FUNCTION(du),
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
 	SH_PFC_FUNCTION(i2c4),
-- 
Regards,

Laurent Pinchart
