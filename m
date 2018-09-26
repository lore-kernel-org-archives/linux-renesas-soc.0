Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:34722 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727157AbeIZT50 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 15:57:26 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: Rename automotive-only arrays to automotive
Date: Wed, 26 Sep 2018 15:44:14 +0200
Message-Id: <20180926134414.2733-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas RZ/G SoCs are pin compatible with R-Car SoCs, but lack several
automotive-specific peripherals.

Currently pin groups and functions for automotive-specific peripherals
are grouped in arrays named after the automative SoC part numbers.
Rename them to "automotive" for clarity and consistency.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v4.20.

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c  | 16 ++++++++--------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c  | 12 ++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c |  8 ++++----
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index 5c6c9cd0dcc8db9e..209f74a6e6ce5a6f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -4455,7 +4455,7 @@ static const unsigned int vin2_clk_mux[] = {
 
 static const struct {
 	struct sh_pfc_pin_group common[346];
-	struct sh_pfc_pin_group r8a779x[9];
+	struct sh_pfc_pin_group automotive[9];
 } pinmux_groups = {
 	.common = {
 		SH_PFC_PIN_GROUP(audio_clk_a),
@@ -4805,7 +4805,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin2_clkenb),
 		SH_PFC_PIN_GROUP(vin2_clk),
 	},
-	.r8a779x = {
+	.automotive = {
 		SH_PFC_PIN_GROUP(adi_common),
 		SH_PFC_PIN_GROUP(adi_chsel0),
 		SH_PFC_PIN_GROUP(adi_chsel1),
@@ -5362,7 +5362,7 @@ static const char * const vin2_groups[] = {
 
 static const struct {
 	struct sh_pfc_function common[58];
-	struct sh_pfc_function r8a779x[2];
+	struct sh_pfc_function automotive[2];
 } pinmux_functions = {
 	.common = {
 		SH_PFC_FUNCTION(audio_clk),
@@ -5424,7 +5424,7 @@ static const struct {
 		SH_PFC_FUNCTION(vin1),
 		SH_PFC_FUNCTION(vin2),
 	},
-	.r8a779x = {
+	.automotive = {
 		SH_PFC_FUNCTION(adi),
 		SH_PFC_FUNCTION(mlb),
 	}
@@ -6665,10 +6665,10 @@ const struct sh_pfc_soc_info r8a7791_pinmux_info = {
 	.nr_pins = ARRAY_SIZE(pinmux_pins),
 	.groups = pinmux_groups.common,
 	.nr_groups = ARRAY_SIZE(pinmux_groups.common) +
-		     ARRAY_SIZE(pinmux_groups.r8a779x),
+		     ARRAY_SIZE(pinmux_groups.automotive),
 	.functions = pinmux_functions.common,
 	.nr_functions = ARRAY_SIZE(pinmux_functions.common) +
-			ARRAY_SIZE(pinmux_functions.r8a779x),
+			ARRAY_SIZE(pinmux_functions.automotive),
 
 	.cfg_regs = pinmux_config_regs,
 
@@ -6689,10 +6689,10 @@ const struct sh_pfc_soc_info r8a7793_pinmux_info = {
 	.nr_pins = ARRAY_SIZE(pinmux_pins),
 	.groups = pinmux_groups.common,
 	.nr_groups = ARRAY_SIZE(pinmux_groups.common) +
-		     ARRAY_SIZE(pinmux_groups.r8a779x),
+		     ARRAY_SIZE(pinmux_groups.automotive),
 	.functions = pinmux_functions.common,
 	.nr_functions = ARRAY_SIZE(pinmux_functions.common) +
-			ARRAY_SIZE(pinmux_functions.r8a779x),
+			ARRAY_SIZE(pinmux_functions.automotive),
 
 	.cfg_regs = pinmux_config_regs,
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index c896e99d986a453e..3a6d21d871070b92 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -4125,7 +4125,7 @@ static const unsigned int vin5_clk_mux[] = {
 
 static const struct {
 	struct sh_pfc_pin_group common[307];
-	struct sh_pfc_pin_group r8a779x[33];
+	struct sh_pfc_pin_group automotive[33];
 } pinmux_groups = {
 	.common = {
 		SH_PFC_PIN_GROUP(audio_clk_a_a),
@@ -4436,7 +4436,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin5_clkenb),
 		SH_PFC_PIN_GROUP(vin5_clk),
 	},
-	.r8a779x = {
+	.automotive = {
 		SH_PFC_PIN_GROUP(canfd0_data_a),
 		SH_PFC_PIN_GROUP(canfd0_data_b),
 		SH_PFC_PIN_GROUP(canfd1_data),
@@ -4968,7 +4968,7 @@ static const char * const vin5_groups[] = {
 
 static const struct {
 	struct sh_pfc_function common[45];
-	struct sh_pfc_function r8a779x[6];
+	struct sh_pfc_function automotive[6];
 } pinmux_functions = {
 	.common = {
 		SH_PFC_FUNCTION(audio_clk),
@@ -5017,7 +5017,7 @@ static const struct {
 		SH_PFC_FUNCTION(vin4),
 		SH_PFC_FUNCTION(vin5),
 	},
-	.r8a779x = {
+	.automotive = {
 		SH_PFC_FUNCTION(canfd0),
 		SH_PFC_FUNCTION(canfd1),
 		SH_PFC_FUNCTION(drif0),
@@ -6185,10 +6185,10 @@ const struct sh_pfc_soc_info r8a7796_pinmux_info = {
 	.nr_pins = ARRAY_SIZE(pinmux_pins),
 	.groups = pinmux_groups.common,
 	.nr_groups = ARRAY_SIZE(pinmux_groups.common) +
-		ARRAY_SIZE(pinmux_groups.r8a779x),
+		ARRAY_SIZE(pinmux_groups.automotive),
 	.functions = pinmux_functions.common,
 	.nr_functions = ARRAY_SIZE(pinmux_functions.common) +
-		ARRAY_SIZE(pinmux_functions.r8a779x),
+		ARRAY_SIZE(pinmux_functions.automotive),
 
 	.cfg_regs = pinmux_config_regs,
 	.drive_regs = pinmux_drive_regs,
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 76ac77af5dba71a5..663b8ce5781bb376 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -2391,7 +2391,7 @@ static const unsigned int usb30_id_mux[] = {
 
 static const struct {
 	struct sh_pfc_pin_group common[117];
-	struct sh_pfc_pin_group r8a77990[0];
+	struct sh_pfc_pin_group automotive[0];
 } pinmux_groups = {
 	.common = {
 		SH_PFC_PIN_GROUP(avb_link),
@@ -2717,7 +2717,7 @@ static const char * const usb30_groups[] = {
 
 static const struct {
 	struct sh_pfc_function common[28];
-	struct sh_pfc_function r8a77990[0];
+	struct sh_pfc_function automotive[0];
 } pinmux_functions = {
 	.common = {
 		SH_PFC_FUNCTION(avb),
@@ -3509,10 +3509,10 @@ const struct sh_pfc_soc_info r8a77990_pinmux_info = {
 	.nr_pins = ARRAY_SIZE(pinmux_pins),
 	.groups = pinmux_groups.common,
 	.nr_groups = ARRAY_SIZE(pinmux_groups.common) +
-		ARRAY_SIZE(pinmux_groups.r8a77990),
+		ARRAY_SIZE(pinmux_groups.automotive),
 	.functions = pinmux_functions.common,
 	.nr_functions = ARRAY_SIZE(pinmux_functions.common) +
-		ARRAY_SIZE(pinmux_functions.r8a77990),
+		ARRAY_SIZE(pinmux_functions.automotive),
 
 	.cfg_regs = pinmux_config_regs,
 	.bias_regs = pinmux_bias_regs,
-- 
2.17.1
