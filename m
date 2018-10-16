Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:54934 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbeJPVPZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 17:15:25 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: Reduce kernel size for narrow VIN channels
Date: Tue, 16 Oct 2018 14:00:36 +0200
Message-Id: <20181016120036.13041-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Some VIN channels support less than 24 lanes.  As union vin_data always
consumes space for 24 lanes, this wastes memory.

Hence introduce new smaller unions vin_data12 and vin_data16, to
accommodate VIN channels with only 12 or 16 lanes.

This reduces the static pin controller driver size by 320 bytes for
R-Car V2H, and by 96 bytes for R-Car E2.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v4.21.

 drivers/pinctrl/sh-pfc/pfc-r8a7792.c | 16 ++++++++--------
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c |  4 ++--
 drivers/pinctrl/sh-pfc/sh_pfc.h      | 17 +++++++++++++++--
 3 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c b/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
index bf0681b381819a4b..e977121b433b773c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
@@ -1474,7 +1474,7 @@ static const unsigned int vin1_clk_mux[] = {
 	VI1_CLK_MARK,
 };
 /* - VIN2 ------------------------------------------------------------------- */
-static const union vin_data vin2_data_pins = {
+static const union vin_data16 vin2_data_pins = {
 	.data16 = {
 		RCAR_GP_PIN(6, 4), RCAR_GP_PIN(6, 5),
 		RCAR_GP_PIN(6, 6), RCAR_GP_PIN(6, 7),
@@ -1486,7 +1486,7 @@ static const union vin_data vin2_data_pins = {
 		RCAR_GP_PIN(8, 11), RCAR_GP_PIN(8, 12),
 	},
 };
-static const union vin_data vin2_data_mux = {
+static const union vin_data16 vin2_data_mux = {
 	.data16 = {
 		VI2_D0_C0_MARK, VI2_D1_C1_MARK,
 		VI2_D2_C2_MARK,	VI2_D3_C3_MARK,
@@ -1524,7 +1524,7 @@ static const unsigned int vin2_clk_mux[] = {
 	VI2_CLK_MARK,
 };
 /* - VIN3 ------------------------------------------------------------------- */
-static const union vin_data vin3_data_pins = {
+static const union vin_data16 vin3_data_pins = {
 	.data16 = {
 		RCAR_GP_PIN(7, 4), RCAR_GP_PIN(7, 5),
 		RCAR_GP_PIN(7, 6), RCAR_GP_PIN(7, 7),
@@ -1536,7 +1536,7 @@ static const union vin_data vin3_data_pins = {
 		RCAR_GP_PIN(8, 15), RCAR_GP_PIN(8, 16),
 	},
 };
-static const union vin_data vin3_data_mux = {
+static const union vin_data16 vin3_data_mux = {
 	.data16 = {
 		VI3_D0_C0_MARK, VI3_D1_C1_MARK,
 		VI3_D2_C2_MARK,	VI3_D3_C3_MARK,
@@ -1574,7 +1574,7 @@ static const unsigned int vin3_clk_mux[] = {
 	VI3_CLK_MARK,
 };
 /* - VIN4 ------------------------------------------------------------------- */
-static const union vin_data vin4_data_pins = {
+static const union vin_data12 vin4_data_pins = {
 	.data12 = {
 		RCAR_GP_PIN(8, 4), RCAR_GP_PIN(8, 5),
 		RCAR_GP_PIN(8, 6), RCAR_GP_PIN(8, 7),
@@ -1584,7 +1584,7 @@ static const union vin_data vin4_data_pins = {
 		RCAR_GP_PIN(8, 14), RCAR_GP_PIN(8, 15),
 	},
 };
-static const union vin_data vin4_data_mux = {
+static const union vin_data12 vin4_data_mux = {
 	.data12 = {
 		VI4_D0_C0_MARK, VI4_D1_C1_MARK,
 		VI4_D2_C2_MARK, VI4_D3_C3_MARK,
@@ -1620,7 +1620,7 @@ static const unsigned int vin4_clk_mux[] = {
 	VI4_CLK_MARK,
 };
 /* - VIN5 ------------------------------------------------------------------- */
-static const union vin_data vin5_data_pins = {
+static const union vin_data12 vin5_data_pins = {
 	.data12 = {
 		RCAR_GP_PIN(9, 4), RCAR_GP_PIN(9, 5),
 		RCAR_GP_PIN(9, 6), RCAR_GP_PIN(9, 7),
@@ -1630,7 +1630,7 @@ static const union vin_data vin5_data_pins = {
 		RCAR_GP_PIN(9, 14), RCAR_GP_PIN(9, 15),
 	},
 };
-static const union vin_data vin5_data_mux = {
+static const union vin_data12 vin5_data_mux = {
 	.data12 = {
 		VI5_D0_C0_MARK, VI5_D1_C1_MARK,
 		VI5_D2_C2_MARK, VI5_D3_C3_MARK,
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
index 6d1e5fdc03f84554..b96a3cc79084ddcc 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -3704,7 +3704,7 @@ static const unsigned int vin0_clk_mux[] = {
 	VI0_CLK_MARK,
 };
 /* - VIN1 ------------------------------------------------------------------- */
-static const union vin_data vin1_data_pins = {
+static const union vin_data12 vin1_data_pins = {
 	.data12 = {
 		RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 13),
 		RCAR_GP_PIN(5, 14), RCAR_GP_PIN(5, 15),
@@ -3714,7 +3714,7 @@ static const union vin_data vin1_data_pins = {
 		RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
 	},
 };
-static const union vin_data vin1_data_mux = {
+static const union vin_data12 vin1_data_mux = {
 	.data12 = {
 		VI1_DATA0_MARK, VI1_DATA1_MARK,
 		VI1_DATA2_MARK, VI1_DATA3_MARK,
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 458ae0a6b5404631..1fc13366869abd4c 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -53,8 +53,8 @@ struct sh_pfc_pin_group {
 };
 
 /*
- * Using union vin_data saves memory occupied by the VIN data pins.
- * VIN_DATA_PIN_GROUP() is  a macro  used  to describe the VIN pin groups
+ * Using union vin_data{,12,16} saves memory occupied by the VIN data pins.
+ * VIN_DATA_PIN_GROUP() is a macro used to describe the VIN pin groups
  * in this case.
  */
 #define VIN_DATA_PIN_GROUP(n, s)				\
@@ -65,6 +65,19 @@ struct sh_pfc_pin_group {
 		.nr_pins = ARRAY_SIZE(n##_pins.data##s),	\
 	}
 
+union vin_data12 {
+	unsigned int data12[12];
+	unsigned int data10[10];
+	unsigned int data8[8];
+};
+
+union vin_data16 {
+	unsigned int data16[16];
+	unsigned int data12[12];
+	unsigned int data10[10];
+	unsigned int data8[8];
+};
+
 union vin_data {
 	unsigned int data24[24];
 	unsigned int data20[20];
-- 
2.17.1
