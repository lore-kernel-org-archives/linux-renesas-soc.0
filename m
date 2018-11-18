Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46173 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbeKSDuL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Nov 2018 22:50:11 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/4] pinctrl: sh-pfc: r8a77965: Add CAN FD pins, groups and functions
Date: Sun, 18 Nov 2018 18:29:01 +0100
Message-Id: <20181118172903.4481-2-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181118172903.4481-1-marek.vasut+renesas@gmail.com>
References: <20181118172903.4481-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds CAN FD{0,1} pins, groups and functions to the R8A77965
SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 42 +++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 759b10e91d74..e26d101fe51c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -1822,6 +1822,34 @@ static const unsigned int can_clk_mux[] = {
 	CAN_CLK_MARK,
 };
 
+/* - CAN FD --------------------------------------------------------------- */
+static const unsigned int canfd0_data_a_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(1, 23),     RCAR_GP_PIN(1, 24),
+};
+
+static const unsigned int canfd0_data_a_mux[] = {
+	CANFD0_TX_A_MARK,       CANFD0_RX_A_MARK,
+};
+
+static const unsigned int canfd0_data_b_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(2, 0),      RCAR_GP_PIN(2, 1),
+};
+
+static const unsigned int canfd0_data_b_mux[] = {
+	CANFD0_TX_B_MARK,       CANFD0_RX_B_MARK,
+};
+
+static const unsigned int canfd1_data_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(1, 22),     RCAR_GP_PIN(1, 26),
+};
+
+static const unsigned int canfd1_data_mux[] = {
+	CANFD1_TX_MARK,         CANFD1_RX_MARK,
+};
+
 /* - DU --------------------------------------------------------------------- */
 static const unsigned int du_rgb666_pins[] = {
 	/* R[7:2], G[7:2], B[7:2] */
@@ -3796,6 +3824,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(can0_data_b),
 	SH_PFC_PIN_GROUP(can1_data),
 	SH_PFC_PIN_GROUP(can_clk),
+	SH_PFC_PIN_GROUP(canfd0_data_a),
+	SH_PFC_PIN_GROUP(canfd0_data_b),
+	SH_PFC_PIN_GROUP(canfd1_data),
 	SH_PFC_PIN_GROUP(du_rgb666),
 	SH_PFC_PIN_GROUP(du_rgb888),
 	SH_PFC_PIN_GROUP(du_clk_out_0),
@@ -4091,6 +4122,15 @@ static const char * const can_clk_groups[] = {
 	"can_clk",
 };
 
+static const char * const canfd0_groups[] = {
+	"canfd0_data_a",
+	"canfd0_data_b",
+};
+
+static const char * const canfd1_groups[] = {
+	"canfd1_data",
+};
+
 static const char * const du_groups[] = {
 	"du_rgb666",
 	"du_rgb888",
@@ -4453,6 +4493,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(can0),
 	SH_PFC_FUNCTION(can1),
 	SH_PFC_FUNCTION(can_clk),
+	SH_PFC_FUNCTION(canfd0),
+	SH_PFC_FUNCTION(canfd1),
 	SH_PFC_FUNCTION(du),
 	SH_PFC_FUNCTION(hscif0),
 	SH_PFC_FUNCTION(hscif1),
-- 
2.18.0
