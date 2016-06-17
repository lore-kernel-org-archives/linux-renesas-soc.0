Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:26643 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751386AbcFQM0k (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 08:26:40 -0400
From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
To: geert+renesas@glider.be
Cc: linux-renesas-soc@vger.kernel.org, chris.paterson2@renesas.com,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: Add DRIF support
Date: Fri, 17 Jun 2016 13:19:41 +0100
Message-Id: <1466165981-65284-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds DRIF[0-3] pinmux support for r8a7795 SoC.

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 121 +++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 33be5d56..6f246ec 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1658,6 +1658,91 @@ static const unsigned int canfd1_data_mux[] = {
 	CANFD1_TX_MARK,         CANFD1_RX_MARK,
 };
 
+/* - DRIF --------------------------------------------------------------- */
+static const unsigned int drif0_data_a_pins[] = {
+	/* CLK, SYNC, D0, D1 */
+	RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9), RCAR_GP_PIN(6, 10),
+	RCAR_GP_PIN(6, 7),
+};
+static const unsigned int drif0_data_a_mux[] = {
+	RIF0_CLK_A_MARK, RIF0_SYNC_A_MARK, RIF0_D0_A_MARK, RIF0_D1_A_MARK,
+};
+static const unsigned int drif0_data_b_pins[] = {
+	/* CLK, SYNC, D0, D1 */
+	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 1),
+	RCAR_GP_PIN(5, 2),
+};
+static const unsigned int drif0_data_b_mux[] = {
+	RIF0_CLK_B_MARK, RIF0_SYNC_B_MARK, RIF0_D0_B_MARK, RIF0_D1_B_MARK,
+};
+static const unsigned int drif0_data_c_pins[] = {
+	/* CLK, SYNC, D0, D1 */
+	RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 15), RCAR_GP_PIN(5, 13),
+	RCAR_GP_PIN(5, 14),
+};
+static const unsigned int drif0_data_c_mux[] = {
+	RIF0_CLK_C_MARK, RIF0_SYNC_C_MARK, RIF0_D0_C_MARK, RIF0_D1_C_MARK,
+};
+
+static const unsigned int drif1_data_a_pins[] = {
+	/* CLK, SYNC, D0, D1 */
+	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 19),
+	RCAR_GP_PIN(6, 20),
+};
+static const unsigned int drif1_data_a_mux[] = {
+	RIF1_CLK_A_MARK, RIF1_SYNC_A_MARK, RIF1_D0_A_MARK, RIF1_D1_A_MARK,
+};
+static const unsigned int drif1_data_b_pins[] = {
+	/* CLK, SYNC, D0, D1 */
+	RCAR_GP_PIN(5, 9), RCAR_GP_PIN(5, 3), RCAR_GP_PIN(5, 7),
+	RCAR_GP_PIN(5, 8),
+};
+static const unsigned int drif1_data_b_mux[] = {
+	RIF1_CLK_B_MARK, RIF1_SYNC_B_MARK, RIF1_D0_B_MARK, RIF1_D1_B_MARK,
+};
+static const unsigned int drif1_data_c_pins[] = {
+	/* CLK, SYNC, D0, D1 */
+	RCAR_GP_PIN(5, 5), RCAR_GP_PIN(5, 11), RCAR_GP_PIN(5, 6),
+	RCAR_GP_PIN(5, 10),
+};
+static const unsigned int drif1_data_c_mux[] = {
+	RIF1_CLK_C_MARK, RIF1_SYNC_C_MARK, RIF1_D0_C_MARK, RIF1_D1_C_MARK,
+};
+
+static const unsigned int drif2_data_a_pins[] = {
+	/* CLK, SYNC, D0, D1 */
+	RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9), RCAR_GP_PIN(6, 7),
+	RCAR_GP_PIN(6, 10),
+};
+static const unsigned int drif2_data_a_mux[] = {
+	RIF2_CLK_A_MARK, RIF2_SYNC_A_MARK, RIF2_D0_A_MARK, RIF2_D1_A_MARK,
+};
+static const unsigned int drif2_data_b_pins[] = {
+	/* CLK, SYNC, D0, D1 */
+	RCAR_GP_PIN(6, 26), RCAR_GP_PIN(6, 27), RCAR_GP_PIN(6, 30),
+	RCAR_GP_PIN(6, 31),
+};
+static const unsigned int drif2_data_b_mux[] = {
+	RIF2_CLK_B_MARK, RIF2_SYNC_B_MARK, RIF2_D0_B_MARK, RIF2_D1_B_MARK,
+};
+
+static const unsigned int drif3_data_a_pins[] = {
+	/* CLK, SYNC, D0, D1 */
+	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 19),
+	RCAR_GP_PIN(6, 10),
+};
+static const unsigned int drif3_data_a_mux[] = {
+	RIF3_CLK_A_MARK, RIF3_SYNC_A_MARK, RIF3_D0_A_MARK, RIF3_D1_A_MARK,
+};
+static const unsigned int drif3_data_b_pins[] = {
+	/* CLK, SYNC, D0, D1 */
+	RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25), RCAR_GP_PIN(6, 28),
+	RCAR_GP_PIN(6, 29),
+};
+static const unsigned int drif3_data_b_mux[] = {
+	RIF3_CLK_B_MARK, RIF3_SYNC_B_MARK, RIF3_D0_B_MARK, RIF3_D1_B_MARK,
+};
+
 /* - HSCIF0 ----------------------------------------------------------------- */
 static const unsigned int hscif0_data_pins[] = {
 	/* RX, TX */
@@ -3350,6 +3435,16 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(canfd0_data_a),
 	SH_PFC_PIN_GROUP(canfd0_data_b),
 	SH_PFC_PIN_GROUP(canfd1_data),
+	SH_PFC_PIN_GROUP(drif0_data_a),
+	SH_PFC_PIN_GROUP(drif0_data_b),
+	SH_PFC_PIN_GROUP(drif0_data_c),
+	SH_PFC_PIN_GROUP(drif1_data_a),
+	SH_PFC_PIN_GROUP(drif1_data_b),
+	SH_PFC_PIN_GROUP(drif1_data_c),
+	SH_PFC_PIN_GROUP(drif2_data_a),
+	SH_PFC_PIN_GROUP(drif2_data_b),
+	SH_PFC_PIN_GROUP(drif3_data_a),
+	SH_PFC_PIN_GROUP(drif3_data_b),
 	SH_PFC_PIN_GROUP(hscif0_data),
 	SH_PFC_PIN_GROUP(hscif0_clk),
 	SH_PFC_PIN_GROUP(hscif0_ctrl),
@@ -3633,6 +3728,28 @@ static const char * const canfd1_groups[] = {
 	"canfd1_data",
 };
 
+static const char * const drif0_groups[] = {
+	"drif0_data_a",
+	"drif0_data_b",
+	"drif0_data_c",
+};
+
+static const char * const drif1_groups[] = {
+	"drif1_data_a",
+	"drif1_data_b",
+	"drif1_data_c",
+};
+
+static const char * const drif2_groups[] = {
+	"drif2_data_a",
+	"drif2_data_b",
+};
+
+static const char * const drif3_groups[] = {
+	"drif3_data_a",
+	"drif3_data_b",
+};
+
 static const char * const hscif0_groups[] = {
 	"hscif0_data",
 	"hscif0_clk",
@@ -3976,6 +4093,10 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(can_clk),
 	SH_PFC_FUNCTION(canfd0),
 	SH_PFC_FUNCTION(canfd1),
+	SH_PFC_FUNCTION(drif0),
+	SH_PFC_FUNCTION(drif1),
+	SH_PFC_FUNCTION(drif2),
+	SH_PFC_FUNCTION(drif3),
 	SH_PFC_FUNCTION(hscif0),
 	SH_PFC_FUNCTION(hscif1),
 	SH_PFC_FUNCTION(hscif2),
-- 
1.9.1
