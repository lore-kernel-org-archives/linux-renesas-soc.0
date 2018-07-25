Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38068 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729354AbeGYU2z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 16:28:55 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a77965: Add SATA pins, groups and functions
Date: Wed, 25 Jul 2018 21:15:46 +0200
Message-Id: <20180725191546.3416-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds SATA0 pin, group and function to the R8A77965 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[wsa: rebased to upstream base]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index cfd7de67e3e3..e43a5b39784c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -2907,6 +2907,25 @@ static const unsigned int pwm6_b_mux[] = {
 	PWM6_B_MARK,
 };
 
+/* - SATA --------------------------------------------------------------------*/
+static const unsigned int sata0_devslp_a_pins[] = {
+	/* DEVSLP */
+	RCAR_GP_PIN(6, 16),
+};
+
+static const unsigned int sata0_devslp_a_mux[] = {
+	SATA_DEVSLP_A_MARK,
+};
+
+static const unsigned int sata0_devslp_b_pins[] = {
+	/* DEVSLP */
+	RCAR_GP_PIN(4, 6),
+};
+
+static const unsigned int sata0_devslp_b_mux[] = {
+	SATA_DEVSLP_B_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX, TX */
@@ -3579,6 +3598,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(pwm5_b),
 	SH_PFC_PIN_GROUP(pwm6_a),
 	SH_PFC_PIN_GROUP(pwm6_b),
+	SH_PFC_PIN_GROUP(sata0_devslp_a),
+	SH_PFC_PIN_GROUP(sata0_devslp_b),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -3664,6 +3685,11 @@ static const char * const du_groups[] = {
 	"du_disp",
 };
 
+static const char * const sata0_groups[] = {
+	"sata0_devslp_a",
+	"sata0_devslp_b",
+};
+
 static const char * const hscif0_groups[] = {
 	"hscif0_data",
 	"hscif0_clk",
@@ -3999,6 +4025,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(pwm4),
 	SH_PFC_FUNCTION(pwm5),
 	SH_PFC_FUNCTION(pwm6),
+	SH_PFC_FUNCTION(sata0),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
2.11.0
