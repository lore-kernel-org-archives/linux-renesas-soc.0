Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:40549 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932115AbcJZOOY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2016 10:14:24 -0400
Received: by mail-wm0-f68.google.com with SMTP id b80so3675732wme.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Oct 2016 07:14:23 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au
Cc: geert@linux-m68k.org, magnus.damm@gmail.com, wsa@the-dreams.de,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 2/5] pinctrl: sh-pfc: r8a7796: add I2C pin support
Date: Wed, 26 Oct 2016 16:14:06 +0200
Message-Id: <1477491249-2976-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index dc9b671..42db745 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1490,6 +1490,57 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - I2C -------------------------------------------------------------------- */
+static const unsigned int i2c1_a_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(5, 11), RCAR_GP_PIN(5, 10),
+};
+static const unsigned int i2c1_a_mux[] = {
+	SDA1_A_MARK, SCL1_A_MARK,
+};
+static const unsigned int i2c1_b_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 23),
+};
+static const unsigned int i2c1_b_mux[] = {
+	SDA1_B_MARK, SCL1_B_MARK,
+};
+static const unsigned int i2c2_a_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 4),
+};
+static const unsigned int i2c2_a_mux[] = {
+	SDA2_A_MARK, SCL2_A_MARK,
+};
+static const unsigned int i2c2_b_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 12),
+};
+static const unsigned int i2c2_b_mux[] = {
+	SDA2_B_MARK, SCL2_B_MARK,
+};
+static const unsigned int i2c6_a_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 11),
+};
+static const unsigned int i2c6_a_mux[] = {
+	SDA6_A_MARK, SCL6_A_MARK,
+};
+static const unsigned int i2c6_b_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
+};
+static const unsigned int i2c6_b_mux[] = {
+	SDA6_B_MARK, SCL6_B_MARK,
+};
+static const unsigned int i2c6_c_pins[] = {
+	/* SDA, SCL */
+	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
+};
+static const unsigned int i2c6_c_mux[] = {
+	SDA6_C_MARK, SCL6_C_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX, TX */
@@ -1912,6 +1963,13 @@ static const unsigned int sdhi3_ds_mux[] = {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(i2c1_a),
+	SH_PFC_PIN_GROUP(i2c1_b),
+	SH_PFC_PIN_GROUP(i2c2_a),
+	SH_PFC_PIN_GROUP(i2c2_b),
+	SH_PFC_PIN_GROUP(i2c6_a),
+	SH_PFC_PIN_GROUP(i2c6_b),
+	SH_PFC_PIN_GROUP(i2c6_c),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -1969,6 +2027,22 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(sdhi3_ds),
 };
 
+static const char * const i2c1_groups[] = {
+	"i2c1_a",
+	"i2c1_b",
+};
+
+static const char * const i2c2_groups[] = {
+	"i2c2_a",
+	"i2c2_b",
+};
+
+static const char * const i2c6_groups[] = {
+	"i2c6_a",
+	"i2c6_b",
+	"i2c6_c",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -2058,6 +2132,9 @@ static const char * const sdhi3_groups[] = {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(i2c1),
+	SH_PFC_FUNCTION(i2c2),
+	SH_PFC_FUNCTION(i2c6),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
2.7.4
