Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:31666 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726193AbeJHQlZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Oct 2018 12:41:25 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 4/4] pinctrl: sh-pfc: r8a77470: Add QSPI1 pin groups
Date: Mon,  8 Oct 2018 10:30:19 +0100
Message-Id: <1538991019-18577-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1538991019-18577-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1538991019-18577-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add QSPI1 pin groups and function to the RZ/G1C (a.k.a. R8A77470)
pinctrl driver.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
index 726e3da..d9c6a03 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
@@ -1635,6 +1635,29 @@ static const unsigned int qspi0_data4_mux[] = {
 	QSPI0_MOSI_QSPI0_IO0_MARK, QSPI0_MISO_QSPI0_IO1_MARK,
 	QSPI0_IO2_MARK, QSPI0_IO3_MARK,
 };
+static const unsigned int qspi1_ctrl_pins[] = {
+	/* SPCLK, SSL */
+	RCAR_GP_PIN(4, 6), RCAR_GP_PIN(4, 9),
+};
+static const unsigned int qspi1_ctrl_mux[] = {
+	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
+};
+static const unsigned int qspi1_data2_pins[] = {
+	/* MOSI_IO0, MISO_IO1 */
+	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
+};
+static const unsigned int qspi1_data2_mux[] = {
+	QSPI1_MOSI_QSPI1_IO0_MARK, QSPI1_MISO_QSPI1_IO1_MARK,
+};
+static const unsigned int qspi1_data4_pins[] = {
+	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
+	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5), RCAR_GP_PIN(4, 7),
+	RCAR_GP_PIN(4, 8),
+};
+static const unsigned int qspi1_data4_mux[] = {
+	QSPI1_MOSI_QSPI1_IO0_MARK, QSPI1_MISO_QSPI1_IO1_MARK,
+	QSPI1_IO2_MARK, QSPI1_IO3_MARK,
+};
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_a_pins[] = {
 	/* RX, TX */
@@ -2207,6 +2230,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(qspi0_ctrl),
 	SH_PFC_PIN_GROUP(qspi0_data2),
 	SH_PFC_PIN_GROUP(qspi0_data4),
+	SH_PFC_PIN_GROUP(qspi1_ctrl),
+	SH_PFC_PIN_GROUP(qspi1_data2),
+	SH_PFC_PIN_GROUP(qspi1_data4),
 	SH_PFC_PIN_GROUP(scif0_data_a),
 	SH_PFC_PIN_GROUP(scif0_data_b),
 	SH_PFC_PIN_GROUP(scif0_data_c),
@@ -2369,6 +2395,12 @@ static const char * const qspi0_groups[] = {
 	"qspi0_data4",
 };
 
+static const char * const qspi1_groups[] = {
+	"qspi1_ctrl",
+	"qspi1_data2",
+	"qspi1_data4",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data_a",
 	"scif0_data_b",
@@ -2490,6 +2522,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(i2c4),
 	SH_PFC_FUNCTION(mmc),
 	SH_PFC_FUNCTION(qspi0),
+	SH_PFC_FUNCTION(qspi1),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
2.7.4
