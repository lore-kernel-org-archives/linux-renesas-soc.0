Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54580 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387580AbeKFHCB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 02:02:01 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a77990: Add SDHI pins, groups and functions
Date: Mon,  5 Nov 2018 22:40:11 +0100
Message-Id: <20181105214012.11626-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds SDHI{0,1,3} pins, groups and functions to the R8A77990
SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 218 +++++++++++++++++++++++++-
 1 file changed, 216 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 1fdafa48479c..97aba270a515 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -2386,6 +2386,174 @@ static const unsigned int scif_clk_b_mux[] = {
 	SCIF_CLK_B_MARK,
 };
 
+/* - SDHI0 ------------------------------------------------------------------ */
+static const unsigned int sdhi0_data1_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(3, 2),
+};
+
+static const unsigned int sdhi0_data1_mux[] = {
+	SD0_DAT0_MARK,
+};
+
+static const unsigned int sdhi0_data4_pins[] = {
+	/* D[0:3] */
+	RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3),
+	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
+};
+
+static const unsigned int sdhi0_data4_mux[] = {
+	SD0_DAT0_MARK, SD0_DAT1_MARK,
+	SD0_DAT2_MARK, SD0_DAT3_MARK,
+};
+
+static const unsigned int sdhi0_ctrl_pins[] = {
+	/* CLK, CMD */
+	RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
+};
+
+static const unsigned int sdhi0_ctrl_mux[] = {
+	SD0_CLK_MARK, SD0_CMD_MARK,
+};
+
+static const unsigned int sdhi0_cd_pins[] = {
+	/* CD */
+	RCAR_GP_PIN(3, 12),
+};
+
+static const unsigned int sdhi0_cd_mux[] = {
+	SD0_CD_MARK,
+};
+
+static const unsigned int sdhi0_wp_pins[] = {
+	/* WP */
+	RCAR_GP_PIN(3, 13),
+};
+
+static const unsigned int sdhi0_wp_mux[] = {
+	SD0_WP_MARK,
+};
+
+/* - SDHI1 ------------------------------------------------------------------ */
+static const unsigned int sdhi1_data1_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(3, 8),
+};
+
+static const unsigned int sdhi1_data1_mux[] = {
+	SD1_DAT0_MARK,
+};
+
+static const unsigned int sdhi1_data4_pins[] = {
+	/* D[0:3] */
+	RCAR_GP_PIN(3, 8),  RCAR_GP_PIN(3, 9),
+	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
+};
+
+static const unsigned int sdhi1_data4_mux[] = {
+	SD1_DAT0_MARK, SD1_DAT1_MARK,
+	SD1_DAT2_MARK, SD1_DAT3_MARK,
+};
+
+static const unsigned int sdhi1_ctrl_pins[] = {
+	/* CLK, CMD */
+	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
+};
+
+static const unsigned int sdhi1_ctrl_mux[] = {
+	SD1_CLK_MARK, SD1_CMD_MARK,
+};
+
+static const unsigned int sdhi1_cd_pins[] = {
+	/* CD */
+	RCAR_GP_PIN(3, 14),
+};
+
+static const unsigned int sdhi1_cd_mux[] = {
+	SD1_CD_MARK,
+};
+
+static const unsigned int sdhi1_wp_pins[] = {
+	/* WP */
+	RCAR_GP_PIN(3, 15),
+};
+
+static const unsigned int sdhi1_wp_mux[] = {
+	SD1_WP_MARK,
+};
+
+/* - SDHI3 ------------------------------------------------------------------ */
+static const unsigned int sdhi3_data1_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(4, 2),
+};
+
+static const unsigned int sdhi3_data1_mux[] = {
+	SD3_DAT0_MARK,
+};
+
+static const unsigned int sdhi3_data4_pins[] = {
+	/* D[0:3] */
+	RCAR_GP_PIN(4, 2), RCAR_GP_PIN(4, 3),
+	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
+};
+
+static const unsigned int sdhi3_data4_mux[] = {
+	SD3_DAT0_MARK, SD3_DAT1_MARK,
+	SD3_DAT2_MARK, SD3_DAT3_MARK,
+};
+
+static const unsigned int sdhi3_data8_pins[] = {
+	/* D[0:7] */
+	RCAR_GP_PIN(4, 2), RCAR_GP_PIN(4, 3),
+	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
+	RCAR_GP_PIN(4, 6), RCAR_GP_PIN(4, 7),
+	RCAR_GP_PIN(4, 8), RCAR_GP_PIN(4, 9),
+};
+
+static const unsigned int sdhi3_data8_mux[] = {
+	SD3_DAT0_MARK, SD3_DAT1_MARK,
+	SD3_DAT2_MARK, SD3_DAT3_MARK,
+	SD3_DAT4_MARK, SD3_DAT5_MARK,
+	SD3_DAT6_MARK, SD3_DAT7_MARK,
+};
+
+static const unsigned int sdhi3_ctrl_pins[] = {
+	/* CLK, CMD */
+	RCAR_GP_PIN(4, 0), RCAR_GP_PIN(4, 1),
+};
+
+static const unsigned int sdhi3_ctrl_mux[] = {
+	SD3_CLK_MARK, SD3_CMD_MARK,
+};
+
+static const unsigned int sdhi3_cd_pins[] = {
+	/* CD */
+	RCAR_GP_PIN(3, 12),
+};
+
+static const unsigned int sdhi3_cd_mux[] = {
+	SD3_CD_MARK,
+};
+
+static const unsigned int sdhi3_wp_pins[] = {
+	/* WP */
+	RCAR_GP_PIN(3, 13),
+};
+
+static const unsigned int sdhi3_wp_mux[] = {
+	SD3_WP_MARK,
+};
+
+static const unsigned int sdhi3_ds_pins[] = {
+	/* DS */
+	RCAR_GP_PIN(4, 10),
+};
+
+static const unsigned int sdhi3_ds_mux[] = {
+	SD3_DS_MARK,
+};
+
 /* - USB0 ------------------------------------------------------------------- */
 static const unsigned int usb0_a_pins[] = {
 	/* PWEN, OVC */
@@ -2434,7 +2602,7 @@ static const unsigned int usb30_id_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[123];
+	struct sh_pfc_pin_group common[140];
 	struct sh_pfc_pin_group automotive[0];
 } pinmux_groups = {
 	.common = {
@@ -2556,6 +2724,23 @@ static const struct {
 		SH_PFC_PIN_GROUP(scif5_data_c),
 		SH_PFC_PIN_GROUP(scif_clk_a),
 		SH_PFC_PIN_GROUP(scif_clk_b),
+		SH_PFC_PIN_GROUP(sdhi0_data1),
+		SH_PFC_PIN_GROUP(sdhi0_data4),
+		SH_PFC_PIN_GROUP(sdhi0_ctrl),
+		SH_PFC_PIN_GROUP(sdhi0_cd),
+		SH_PFC_PIN_GROUP(sdhi0_wp),
+		SH_PFC_PIN_GROUP(sdhi1_data1),
+		SH_PFC_PIN_GROUP(sdhi1_data4),
+		SH_PFC_PIN_GROUP(sdhi1_ctrl),
+		SH_PFC_PIN_GROUP(sdhi1_cd),
+		SH_PFC_PIN_GROUP(sdhi1_wp),
+		SH_PFC_PIN_GROUP(sdhi3_data1),
+		SH_PFC_PIN_GROUP(sdhi3_data4),
+		SH_PFC_PIN_GROUP(sdhi3_data8),
+		SH_PFC_PIN_GROUP(sdhi3_ctrl),
+		SH_PFC_PIN_GROUP(sdhi3_cd),
+		SH_PFC_PIN_GROUP(sdhi3_wp),
+		SH_PFC_PIN_GROUP(sdhi3_ds),
 		SH_PFC_PIN_GROUP(usb0_a),
 		SH_PFC_PIN_GROUP(usb0_b),
 		SH_PFC_PIN_GROUP(usb0_id),
@@ -2763,6 +2948,32 @@ static const char * const scif_clk_groups[] = {
 	"scif_clk_b",
 };
 
+static const char * const sdhi0_groups[] = {
+	"sdhi0_data1",
+	"sdhi0_data4",
+	"sdhi0_ctrl",
+	"sdhi0_cd",
+	"sdhi0_wp",
+};
+
+static const char * const sdhi1_groups[] = {
+	"sdhi1_data1",
+	"sdhi1_data4",
+	"sdhi1_ctrl",
+	"sdhi1_cd",
+	"sdhi1_wp",
+};
+
+static const char * const sdhi3_groups[] = {
+	"sdhi3_data1",
+	"sdhi3_data4",
+	"sdhi3_data8",
+	"sdhi3_ctrl",
+	"sdhi3_cd",
+	"sdhi3_wp",
+	"sdhi3_ds",
+};
+
 static const char * const usb0_groups[] = {
 	"usb0_a",
 	"usb0_b",
@@ -2775,7 +2986,7 @@ static const char * const usb30_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[29];
+	struct sh_pfc_function common[32];
 	struct sh_pfc_function automotive[0];
 } pinmux_functions = {
 	.common = {
@@ -2806,6 +3017,9 @@ static const struct {
 		SH_PFC_FUNCTION(scif4),
 		SH_PFC_FUNCTION(scif5),
 		SH_PFC_FUNCTION(scif_clk),
+		SH_PFC_FUNCTION(sdhi0),
+		SH_PFC_FUNCTION(sdhi1),
+		SH_PFC_FUNCTION(sdhi3),
 		SH_PFC_FUNCTION(usb0),
 		SH_PFC_FUNCTION(usb30),
 	}
-- 
2.18.0
