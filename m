Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:32303 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729879AbeIRTVO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 15:21:14 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 4/5] pinctrl: sh-pfc: r8a77470: Add SDHI2 pin groups
Date: Tue, 18 Sep 2018 14:47:57 +0100
Message-Id: <1537278478-1744-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1537278478-1744-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1537278478-1744-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add SDHI2 pin groups and functions to the R8A77470 SoC.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
index 33661f8..43ad702 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
@@ -1619,6 +1619,43 @@ static const unsigned int scif_clk_b_pins[] = {
 static const unsigned int scif_clk_b_mux[] = {
 	SCIF_CLK_B_MARK,
 };
+/* - SDHI2 ------------------------------------------------------------------ */
+static const unsigned int sdhi2_data1_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(4, 16),
+};
+static const unsigned int sdhi2_data1_mux[] = {
+	SD2_DAT0_MARK,
+};
+static const unsigned int sdhi2_data4_pins[] = {
+	/* D[0:3] */
+	RCAR_GP_PIN(4, 16), RCAR_GP_PIN(4, 17),
+	RCAR_GP_PIN(4, 18), RCAR_GP_PIN(4, 19),
+};
+static const unsigned int sdhi2_data4_mux[] = {
+	SD2_DAT0_MARK, SD2_DAT1_MARK, SD2_DAT2_MARK, SD2_DAT3_MARK,
+};
+static const unsigned int sdhi2_ctrl_pins[] = {
+	/* CLK, CMD */
+	RCAR_GP_PIN(4, 14), RCAR_GP_PIN(4, 15),
+};
+static const unsigned int sdhi2_ctrl_mux[] = {
+	SD2_CLK_MARK, SD2_CMD_MARK,
+};
+static const unsigned int sdhi2_cd_pins[] = {
+	/* CD */
+	RCAR_GP_PIN(4, 20),
+};
+static const unsigned int sdhi2_cd_mux[] = {
+	SD2_CD_MARK,
+};
+static const unsigned int sdhi2_wp_pins[] = {
+	/* WP */
+	RCAR_GP_PIN(4, 21),
+};
+static const unsigned int sdhi2_wp_mux[] = {
+	SD2_WP_MARK,
+};
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_col),
@@ -1688,6 +1725,11 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif5_data_f),
 	SH_PFC_PIN_GROUP(scif_clk_a),
 	SH_PFC_PIN_GROUP(scif_clk_b),
+	SH_PFC_PIN_GROUP(sdhi2_data1),
+	SH_PFC_PIN_GROUP(sdhi2_data4),
+	SH_PFC_PIN_GROUP(sdhi2_ctrl),
+	SH_PFC_PIN_GROUP(sdhi2_cd),
+	SH_PFC_PIN_GROUP(sdhi2_wp),
 };
 
 static const char * const avb_groups[] = {
@@ -1793,6 +1835,14 @@ static const char * const scif_clk_groups[] = {
 	"scif_clk_b",
 };
 
+static const char * const sdhi2_groups[] = {
+	"sdhi2_data1",
+	"sdhi2_data4",
+	"sdhi2_ctrl",
+	"sdhi2_cd",
+	"sdhi2_wp",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(du0),
@@ -1806,6 +1856,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif4),
 	SH_PFC_FUNCTION(scif5),
 	SH_PFC_FUNCTION(scif_clk),
+	SH_PFC_FUNCTION(sdhi2),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.7.4
