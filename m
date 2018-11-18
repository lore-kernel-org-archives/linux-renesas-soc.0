Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51288 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbeKSDuO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Nov 2018 22:50:14 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/4] pinctrl: sh-pfc: r8a77990: Add CAN FD pins, groups and functions
Date: Sun, 18 Nov 2018 18:29:03 +0100
Message-Id: <20181118172903.4481-4-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181118172903.4481-1-marek.vasut+renesas@gmail.com>
References: <20181118172903.4481-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds CAN FD{0,1} pins, groups and functions to the R8A77990
SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 35 +++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index db000acc880c..96c2f4fcdb8e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1404,6 +1404,25 @@ static const unsigned int can_clk_mux[] = {
 	CAN_CLK_MARK,
 };
 
+/* - CAN FD --------------------------------------------------------------- */
+static const unsigned int canfd0_data_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+};
+
+static const unsigned int canfd0_data_mux[] = {
+	CANFD0_TX_MARK, CANFD0_RX_MARK,
+};
+
+static const unsigned int canfd1_data_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 7),
+};
+
+static const unsigned int canfd1_data_mux[] = {
+	CANFD1_TX_MARK, CANFD1_RX_MARK,
+};
+
 /* - DU --------------------------------------------------------------------- */
 static const unsigned int du_rgb666_pins[] = {
 	/* R[7:2], G[7:2], B[7:2] */
@@ -2635,7 +2654,7 @@ static const unsigned int usb30_id_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[143];
+	struct sh_pfc_pin_group common[145];
 	struct sh_pfc_pin_group automotive[0];
 } pinmux_groups = {
 	.common = {
@@ -2649,6 +2668,8 @@ static const struct {
 		SH_PFC_PIN_GROUP(can0_data),
 		SH_PFC_PIN_GROUP(can1_data),
 		SH_PFC_PIN_GROUP(can_clk),
+		SH_PFC_PIN_GROUP(canfd0_data),
+		SH_PFC_PIN_GROUP(canfd1_data),
 		SH_PFC_PIN_GROUP(du_rgb666),
 		SH_PFC_PIN_GROUP(du_rgb888),
 		SH_PFC_PIN_GROUP(du_clk_in_0),
@@ -2807,6 +2828,14 @@ static const char * const can_clk_groups[] = {
 	"can_clk",
 };
 
+static const char * const canfd0_groups[] = {
+	"canfd0_data",
+};
+
+static const char * const canfd1_groups[] = {
+	"canfd1_data",
+};
+
 static const char * const du_groups[] = {
 	"du_rgb666",
 	"du_rgb888",
@@ -3034,7 +3063,7 @@ static const char * const usb30_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[35];
+	struct sh_pfc_function common[37];
 	struct sh_pfc_function automotive[0];
 } pinmux_functions = {
 	.common = {
@@ -3042,6 +3071,8 @@ static const struct {
 		SH_PFC_FUNCTION(can0),
 		SH_PFC_FUNCTION(can1),
 		SH_PFC_FUNCTION(can_clk),
+		SH_PFC_FUNCTION(canfd0),
+		SH_PFC_FUNCTION(canfd1),
 		SH_PFC_FUNCTION(du),
 		SH_PFC_FUNCTION(i2c1),
 		SH_PFC_FUNCTION(i2c2),
-- 
2.18.0
