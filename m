Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:32303 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729877AbeIRTVM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 15:21:12 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 3/5] pinctrl: sh-pfc: r8a77470: Add QSPI0 pin groups
Date: Tue, 18 Sep 2018 14:47:56 +0100
Message-Id: <1537278478-1744-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1537278478-1744-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1537278478-1744-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add QSPI0 pin groups and function to the R8A77470 SoC.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
index a16a010..33661f8 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
@@ -1357,6 +1357,30 @@ static const unsigned int mmc_ctrl_pins[] = {
 static const unsigned int mmc_ctrl_mux[] = {
 	MMC0_CLK_SDHI1_CLK_MARK, MMC0_CMD_SDHI1_CMD_MARK,
 };
+/* - QSPI ------------------------------------------------------------------- */
+static const unsigned int qspi0_ctrl_pins[] = {
+	/* SPCLK, SSL */
+	RCAR_GP_PIN(1, 16), RCAR_GP_PIN(1, 21),
+};
+static const unsigned int qspi0_ctrl_mux[] = {
+	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
+};
+static const unsigned int qspi0_data2_pins[] = {
+	/* MOSI_IO0, MISO_IO1 */
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
+};
+static const unsigned int qspi0_data2_mux[] = {
+	QSPI0_MOSI_QSPI0_IO0_MARK, QSPI0_MISO_QSPI0_IO1_MARK,
+};
+static const unsigned int qspi0_data4_pins[] = {
+	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18), RCAR_GP_PIN(1, 19),
+	RCAR_GP_PIN(1, 20),
+};
+static const unsigned int qspi0_data4_mux[] = {
+	QSPI0_MOSI_QSPI0_IO0_MARK, QSPI0_MISO_QSPI0_IO1_MARK,
+	QSPI0_IO2_MARK, QSPI0_IO3_MARK,
+};
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_a_pins[] = {
 	/* RX, TX */
@@ -1628,6 +1652,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(mmc_data4),
 	SH_PFC_PIN_GROUP(mmc_data8),
 	SH_PFC_PIN_GROUP(mmc_ctrl),
+	SH_PFC_PIN_GROUP(qspi0_ctrl),
+	SH_PFC_PIN_GROUP(qspi0_data2),
+	SH_PFC_PIN_GROUP(qspi0_data4),
 	SH_PFC_PIN_GROUP(scif0_data_a),
 	SH_PFC_PIN_GROUP(scif0_data_b),
 	SH_PFC_PIN_GROUP(scif0_data_c),
@@ -1706,6 +1733,12 @@ static const char * const mmc_groups[] = {
 	"mmc_ctrl",
 };
 
+static const char * const qspi0_groups[] = {
+	"qspi0_ctrl",
+	"qspi0_data2",
+	"qspi0_data4",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data_a",
 	"scif0_data_b",
@@ -1765,6 +1798,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(du0),
 	SH_PFC_FUNCTION(i2c4),
 	SH_PFC_FUNCTION(mmc),
+	SH_PFC_FUNCTION(qspi0),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
2.7.4
