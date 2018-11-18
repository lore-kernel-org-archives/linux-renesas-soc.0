Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45212 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbeKSDuN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Nov 2018 22:50:13 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] pinctrl: sh-pfc: r8a77990: Add CAN pins, groups and functions
Date: Sun, 18 Nov 2018 18:29:02 +0100
Message-Id: <20181118172903.4481-3-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181118172903.4481-1-marek.vasut+renesas@gmail.com>
References: <20181118172903.4481-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds CAN{0,1} pins, groups and functions to the R8A77990 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 51 +++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 95d478353627..db000acc880c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1375,6 +1375,35 @@ static const unsigned int avb_avtp_capture_a_mux[] = {
 	AVB_AVTP_CAPTURE_A_MARK,
 };
 
+/* - CAN ------------------------------------------------------------------ */
+static const unsigned int can0_data_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+};
+
+static const unsigned int can0_data_mux[] = {
+	CAN0_TX_MARK, CAN0_RX_MARK,
+};
+
+static const unsigned int can1_data_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 7),
+};
+
+static const unsigned int can1_data_mux[] = {
+	CAN1_TX_MARK, CAN1_RX_MARK,
+};
+
+/* - CAN Clock -------------------------------------------------------------- */
+static const unsigned int can_clk_pins[] = {
+	/* CLK */
+	RCAR_GP_PIN(0, 14),
+};
+
+static const unsigned int can_clk_mux[] = {
+	CAN_CLK_MARK,
+};
+
 /* - DU --------------------------------------------------------------------- */
 static const unsigned int du_rgb666_pins[] = {
 	/* R[7:2], G[7:2], B[7:2] */
@@ -2606,7 +2635,7 @@ static const unsigned int usb30_id_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[140];
+	struct sh_pfc_pin_group common[143];
 	struct sh_pfc_pin_group automotive[0];
 } pinmux_groups = {
 	.common = {
@@ -2617,6 +2646,9 @@ static const struct {
 		SH_PFC_PIN_GROUP(avb_avtp_pps),
 		SH_PFC_PIN_GROUP(avb_avtp_match_a),
 		SH_PFC_PIN_GROUP(avb_avtp_capture_a),
+		SH_PFC_PIN_GROUP(can0_data),
+		SH_PFC_PIN_GROUP(can1_data),
+		SH_PFC_PIN_GROUP(can_clk),
 		SH_PFC_PIN_GROUP(du_rgb666),
 		SH_PFC_PIN_GROUP(du_rgb888),
 		SH_PFC_PIN_GROUP(du_clk_in_0),
@@ -2763,6 +2795,18 @@ static const char * const avb_groups[] = {
 	"avb_avtp_capture_a",
 };
 
+static const char * const can0_groups[] = {
+	"can0_data",
+};
+
+static const char * const can1_groups[] = {
+	"can1_data",
+};
+
+static const char * const can_clk_groups[] = {
+	"can_clk",
+};
+
 static const char * const du_groups[] = {
 	"du_rgb666",
 	"du_rgb888",
@@ -2990,11 +3034,14 @@ static const char * const usb30_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[32];
+	struct sh_pfc_function common[35];
 	struct sh_pfc_function automotive[0];
 } pinmux_functions = {
 	.common = {
 		SH_PFC_FUNCTION(avb),
+		SH_PFC_FUNCTION(can0),
+		SH_PFC_FUNCTION(can1),
+		SH_PFC_FUNCTION(can_clk),
 		SH_PFC_FUNCTION(du),
 		SH_PFC_FUNCTION(i2c1),
 		SH_PFC_FUNCTION(i2c2),
-- 
2.18.0
