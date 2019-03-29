Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE11C3E8A3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0819218A2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729621AbfC2P3r (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 11:29:47 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:40908 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729577AbfC2P3r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 11:29:47 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id trVj1z00X3XaVaC01rVjYZ; Fri, 29 Mar 2019 16:29:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003Rp-6N; Fri, 29 Mar 2019 16:29:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003em-5P; Fri, 29 Mar 2019 16:29:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/8] pinctrl: sh-pfc: rcar-gen3: Remove HDMI CEC pins, groups, and functions
Date:   Fri, 29 Mar 2019 16:29:38 +0100
Message-Id: <20190329152942.13995-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190329152942.13995-1-geert+renesas@glider.be>
References: <20190329152942.13995-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This reverts commit 7793ac664c5ebebdb021c4ec66ff9d174d58e98e.

The HDMI CEC function is not supported by the R-Car Gen3 Hardware Manual
Rev 1.00. Therefore, delete the corresponding pin groups and functions,
and rename the HDMI[01]_CEC definitions to match their GPIO
functionality.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Squashed several commits]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 44 +++++-------------------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 44 +++++-------------------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 27 ++++-----------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    |  8 ++---
 4 files changed, 26 insertions(+), 97 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 50d82f0fa4260530..95fa082ae4439f16 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -199,8 +199,8 @@
 #define GPSR6_0		F_(SSI_SCK01239,	IP13_23_20)
 
 /* GPSR7 */
-#define GPSR7_3		FM(HDMI1_CEC)
-#define GPSR7_2		FM(HDMI0_CEC)
+#define GPSR7_3		FM(GP7_03)
+#define GPSR7_2		FM(GP7_02)
 #define GPSR7_1		FM(AVS2)
 #define GPSR7_0		FM(AVS1)
 
@@ -577,8 +577,8 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_SINGLE(AVS1),
 	PINMUX_SINGLE(AVS2),
-	PINMUX_SINGLE(HDMI0_CEC),
-	PINMUX_SINGLE(HDMI1_CEC),
+	PINMUX_SINGLE(GP7_02),
+	PINMUX_SINGLE(GP7_03),
 	PINMUX_SINGLE(MSIOF0_RXD),
 	PINMUX_SINGLE(MSIOF0_SCK),
 	PINMUX_SINGLE(MSIOF0_TXD),
@@ -2072,22 +2072,6 @@ static const unsigned int du_disp_pins[] = {
 static const unsigned int du_disp_mux[] = {
 	DU_DISP_MARK,
 };
-/* - HDMI ------------------------------------------------------------------- */
-static const unsigned int hdmi0_cec_pins[] = {
-	/* HDMI0_CEC */
-	RCAR_GP_PIN(7, 2),
-};
-static const unsigned int hdmi0_cec_mux[] = {
-	HDMI0_CEC_MARK,
-};
-static const unsigned int hdmi1_cec_pins[] = {
-	/* HDMI1_CEC */
-	RCAR_GP_PIN(7, 3),
-};
-static const unsigned int hdmi1_cec_mux[] = {
-	HDMI1_CEC_MARK,
-};
-
 /* - HSCIF0 ----------------------------------------------------------------- */
 static const unsigned int hscif0_data_pins[] = {
 	/* RX, TX */
@@ -3945,8 +3929,6 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(du_oddf),
 	SH_PFC_PIN_GROUP(du_cde),
 	SH_PFC_PIN_GROUP(du_disp),
-	SH_PFC_PIN_GROUP(hdmi0_cec),
-	SH_PFC_PIN_GROUP(hdmi1_cec),
 	SH_PFC_PIN_GROUP(hscif0_data),
 	SH_PFC_PIN_GROUP(hscif0_clk),
 	SH_PFC_PIN_GROUP(hscif0_ctrl),
@@ -4300,14 +4282,6 @@ static const char * const du_groups[] = {
 	"du_disp",
 };
 
-static const char * const hdmi0_groups[] = {
-	"hdmi0_cec",
-};
-
-static const char * const hdmi1_groups[] = {
-	"hdmi1_cec",
-};
-
 static const char * const hscif0_groups[] = {
 	"hscif0_data",
 	"hscif0_clk",
@@ -4695,8 +4669,6 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(drif2),
 	SH_PFC_FUNCTION(drif3),
 	SH_PFC_FUNCTION(du),
-	SH_PFC_FUNCTION(hdmi0),
-	SH_PFC_FUNCTION(hdmi1),
 	SH_PFC_FUNCTION(hscif0),
 	SH_PFC_FUNCTION(hscif1),
 	SH_PFC_FUNCTION(hscif2),
@@ -5415,8 +5387,8 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(0, 15),   24, 3 },	/* D15 */
 		{ RCAR_GP_PIN(7,  0),   20, 3 },	/* AVS1 */
 		{ RCAR_GP_PIN(7,  1),   16, 3 },	/* AVS2 */
-		{ RCAR_GP_PIN(7,  2),   12, 3 },	/* HDMI0_CEC */
-		{ RCAR_GP_PIN(7,  3),    8, 3 },	/* HDMI1_CEC */
+		{ RCAR_GP_PIN(7,  2),   12, 3 },	/* GP7_02 */
+		{ RCAR_GP_PIN(7,  3),    8, 3 },	/* GP7_03 */
 		{ PIN_A_NUMBER('P', 7),  4, 2 },	/* DU_DOTCLKIN0 */
 		{ PIN_A_NUMBER('P', 8),  0, 2 },	/* DU_DOTCLKIN1 */
 	} },
@@ -5673,8 +5645,8 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[25] = RCAR_GP_PIN(0, 15),	/* D15 */
 		[26] = RCAR_GP_PIN(7,  0),	/* AVS1 */
 		[27] = RCAR_GP_PIN(7,  1),	/* AVS2 */
-		[28] = RCAR_GP_PIN(7,  2),	/* HDMI0_CEC */
-		[29] = RCAR_GP_PIN(7,  3),	/* HDMI1_CEC */
+		[28] = RCAR_GP_PIN(7,  2),	/* GP7_02 */
+		[29] = RCAR_GP_PIN(7,  3),	/* GP7_03 */
 		[30] = PIN_A_NUMBER('P', 7),	/* DU_DOTCLKIN0 */
 		[31] = PIN_A_NUMBER('P', 8),	/* DU_DOTCLKIN1 */
 	} },
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 7c19dde43e35369b..63d0eb2cd879a68f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -201,8 +201,8 @@
 #define GPSR6_0		F_(SSI_SCK01239,		IP14_23_20)
 
 /* GPSR7 */
-#define GPSR7_3		FM(HDMI1_CEC)
-#define GPSR7_2		FM(HDMI0_CEC)
+#define GPSR7_3		FM(GP7_03)
+#define GPSR7_2		FM(GP7_02)
 #define GPSR7_1		FM(AVS2)
 #define GPSR7_0		FM(AVS1)
 
@@ -591,8 +591,8 @@ static const u16 pinmux_data[] = {
 	PINMUX_SINGLE(AVS1),
 	PINMUX_SINGLE(AVS2),
 	PINMUX_SINGLE(CLKOUT),
-	PINMUX_SINGLE(HDMI0_CEC),
-	PINMUX_SINGLE(HDMI1_CEC),
+	PINMUX_SINGLE(GP7_02),
+	PINMUX_SINGLE(GP7_03),
 	PINMUX_SINGLE(MSIOF0_RXD),
 	PINMUX_SINGLE(MSIOF0_SCK),
 	PINMUX_SINGLE(MSIOF0_TXD),
@@ -2132,22 +2132,6 @@ static const unsigned int du_disp_mux[] = {
 	DU_DISP_MARK,
 };
 
-/* - HDMI ------------------------------------------------------------------- */
-static const unsigned int hdmi0_cec_pins[] = {
-	/* HDMI0_CEC */
-	RCAR_GP_PIN(7, 2),
-};
-static const unsigned int hdmi0_cec_mux[] = {
-	HDMI0_CEC_MARK,
-};
-static const unsigned int hdmi1_cec_pins[] = {
-	/* HDMI1_CEC */
-	RCAR_GP_PIN(7, 3),
-};
-static const unsigned int hdmi1_cec_mux[] = {
-	HDMI1_CEC_MARK,
-};
-
 /* - HSCIF0 ----------------------------------------------------------------- */
 static const unsigned int hscif0_data_pins[] = {
 	/* RX, TX */
@@ -4226,8 +4210,6 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(du_oddf),
 	SH_PFC_PIN_GROUP(du_cde),
 	SH_PFC_PIN_GROUP(du_disp),
-	SH_PFC_PIN_GROUP(hdmi0_cec),
-	SH_PFC_PIN_GROUP(hdmi1_cec),
 	SH_PFC_PIN_GROUP(hscif0_data),
 	SH_PFC_PIN_GROUP(hscif0_clk),
 	SH_PFC_PIN_GROUP(hscif0_ctrl),
@@ -4612,14 +4594,6 @@ static const char * const du_groups[] = {
 	"du_disp",
 };
 
-static const char * const hdmi0_groups[] = {
-	"hdmi0_cec",
-};
-
-static const char * const hdmi1_groups[] = {
-	"hdmi1_cec",
-};
-
 static const char * const hscif0_groups[] = {
 	"hscif0_data",
 	"hscif0_clk",
@@ -5038,8 +5012,6 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(drif2),
 	SH_PFC_FUNCTION(drif3),
 	SH_PFC_FUNCTION(du),
-	SH_PFC_FUNCTION(hdmi0),
-	SH_PFC_FUNCTION(hdmi1),
 	SH_PFC_FUNCTION(hscif0),
 	SH_PFC_FUNCTION(hscif1),
 	SH_PFC_FUNCTION(hscif2),
@@ -5766,8 +5738,8 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(0, 15),   24, 3 },	/* D15 */
 		{ RCAR_GP_PIN(7,  0),   20, 3 },	/* AVS1 */
 		{ RCAR_GP_PIN(7,  1),   16, 3 },	/* AVS2 */
-		{ RCAR_GP_PIN(7,  2),   12, 3 },	/* HDMI0_CEC */
-		{ RCAR_GP_PIN(7,  3),    8, 3 },	/* HDMI1_CEC */
+		{ RCAR_GP_PIN(7,  2),   12, 3 },	/* GP7_02 */
+		{ RCAR_GP_PIN(7,  3),    8, 3 },	/* GP7_03 */
 		{ PIN_A_NUMBER('P', 7),  4, 2 },	/* DU_DOTCLKIN0 */
 		{ PIN_A_NUMBER('P', 8),  0, 2 },	/* DU_DOTCLKIN1 */
 	} },
@@ -6023,8 +5995,8 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[25] = RCAR_GP_PIN(0, 15),	/* D15 */
 		[26] = RCAR_GP_PIN(7,  0),	/* AVS1 */
 		[27] = RCAR_GP_PIN(7,  1),	/* AVS2 */
-		[28] = RCAR_GP_PIN(7,  2),	/* HDMI0_CEC */
-		[29] = RCAR_GP_PIN(7,  3),	/* HDMI1_CEC */
+		[28] = RCAR_GP_PIN(7,  2),	/* GP7_02 */
+		[29] = RCAR_GP_PIN(7,  3),	/* GP7_03 */
 		[30] = PIN_A_NUMBER('P', 7),	/* DU_DOTCLKIN0 */
 		[31] = PIN_A_NUMBER('P', 8),	/* DU_DOTCLKIN1 */
 	} },
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 57faa52d06a70bcb..b463062b77fecbdb 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -207,7 +207,7 @@
 
 /* GPSR7 */
 #define GPSR7_3		FM(GP7_03)
-#define GPSR7_2		FM(HDMI0_CEC)
+#define GPSR7_2		FM(GP7_02)
 #define GPSR7_1		FM(AVS2)
 #define GPSR7_0		FM(AVS1)
 
@@ -598,7 +598,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_SINGLE(AVS2),
 	PINMUX_SINGLE(CLKOUT),
 	PINMUX_SINGLE(GP7_03),
-	PINMUX_SINGLE(HDMI0_CEC),
+	PINMUX_SINGLE(GP7_02),
 	PINMUX_SINGLE(MSIOF0_RXD),
 	PINMUX_SINGLE(MSIOF0_SCK),
 	PINMUX_SINGLE(MSIOF0_TXD),
@@ -2141,15 +2141,6 @@ static const unsigned int du_disp_mux[] = {
 	DU_DISP_MARK,
 };
 
-/* - HDMI ------------------------------------------------------------------- */
-static const unsigned int hdmi0_cec_pins[] = {
-	/* HDMI0_CEC */
-	RCAR_GP_PIN(7, 2),
-};
-static const unsigned int hdmi0_cec_mux[] = {
-	HDMI0_CEC_MARK,
-};
-
 /* - HSCIF0 ----------------------------------------------------------------- */
 static const unsigned int hscif0_data_pins[] = {
 	/* RX, TX */
@@ -4125,7 +4116,7 @@ static const unsigned int vin5_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[313];
+	struct sh_pfc_pin_group common[312];
 	struct sh_pfc_pin_group automotive[30];
 } pinmux_groups = {
 	.common = {
@@ -4172,7 +4163,6 @@ static const struct {
 		SH_PFC_PIN_GROUP(du_oddf),
 		SH_PFC_PIN_GROUP(du_cde),
 		SH_PFC_PIN_GROUP(du_disp),
-		SH_PFC_PIN_GROUP(hdmi0_cec),
 		SH_PFC_PIN_GROUP(hscif0_data),
 		SH_PFC_PIN_GROUP(hscif0_clk),
 		SH_PFC_PIN_GROUP(hscif0_ctrl),
@@ -4586,10 +4576,6 @@ static const char * const du_groups[] = {
 	"du_disp",
 };
 
-static const char * const hdmi0_groups[] = {
-	"hdmi0_cec",
-};
-
 static const char * const hscif0_groups[] = {
 	"hscif0_data",
 	"hscif0_clk",
@@ -4983,7 +4969,7 @@ static const char * const vin5_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[50];
+	struct sh_pfc_function common[49];
 	struct sh_pfc_function automotive[4];
 } pinmux_functions = {
 	.common = {
@@ -4995,7 +4981,6 @@ static const struct {
 		SH_PFC_FUNCTION(canfd0),
 		SH_PFC_FUNCTION(canfd1),
 		SH_PFC_FUNCTION(du),
-		SH_PFC_FUNCTION(hdmi0),
 		SH_PFC_FUNCTION(hscif0),
 		SH_PFC_FUNCTION(hscif1),
 		SH_PFC_FUNCTION(hscif2),
@@ -5725,7 +5710,7 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(0, 15),   24, 3 },	/* D15 */
 		{ RCAR_GP_PIN(7,  0),   20, 3 },	/* AVS1 */
 		{ RCAR_GP_PIN(7,  1),   16, 3 },	/* AVS2 */
-		{ RCAR_GP_PIN(7,  2),   12, 3 },	/* HDMI0_CEC */
+		{ RCAR_GP_PIN(7,  2),   12, 3 },	/* GP7_02 */
 		{ RCAR_GP_PIN(7,  3),    8, 3 },	/* GP7_03 */
 		{ PIN_A_NUMBER('P', 7),  4, 2 },	/* DU_DOTCLKIN0 */
 		{ PIN_A_NUMBER('P', 8),  0, 2 },	/* DU_DOTCLKIN1 */
@@ -5981,7 +5966,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[25] = RCAR_GP_PIN(0, 15),	/* D15 */
 		[26] = RCAR_GP_PIN(7,  0),	/* AVS1 */
 		[27] = RCAR_GP_PIN(7,  1),	/* AVS2 */
-		[28] = RCAR_GP_PIN(7,  2),	/* HDMI0_CEC */
+		[28] = RCAR_GP_PIN(7,  2),	/* GP7_02 */
 		[29] = RCAR_GP_PIN(7,  3),	/* GP7_03 */
 		[30] = PIN_A_NUMBER('P', 7),	/* DU_DOTCLKIN0 */
 		[31] = PIN_A_NUMBER('P', 8),	/* DU_DOTCLKIN1 */
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index d2390e3bae6738b1..396ef8335bb8cfd8 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -208,7 +208,7 @@
 
 /* GPSR7 */
 #define GPSR7_3		FM(GP7_03)
-#define GPSR7_2		FM(HDMI0_CEC)
+#define GPSR7_2		FM(GP7_02)
 #define GPSR7_1		FM(AVS2)
 #define GPSR7_0		FM(AVS1)
 
@@ -595,7 +595,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_SINGLE(AVS2),
 	PINMUX_SINGLE(CLKOUT),
 	PINMUX_SINGLE(GP7_03),
-	PINMUX_SINGLE(HDMI0_CEC),
+	PINMUX_SINGLE(GP7_02),
 	PINMUX_SINGLE(MSIOF0_RXD),
 	PINMUX_SINGLE(MSIOF0_SCK),
 	PINMUX_SINGLE(MSIOF0_TXD),
@@ -5882,7 +5882,7 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(0, 15),   24, 3 },	/* D15 */
 		{ RCAR_GP_PIN(7,  0),   20, 3 },	/* AVS1 */
 		{ RCAR_GP_PIN(7,  1),   16, 3 },	/* AVS2 */
-		{ RCAR_GP_PIN(7,  2),   12, 3 },	/* HDMI0_CEC */
+		{ RCAR_GP_PIN(7,  2),   12, 3 },	/* GP7_02 */
 		{ RCAR_GP_PIN(7,  3),    8, 3 },	/* GP7_03 */
 		{ PIN_A_NUMBER('P', 7),  4, 2 },	/* DU_DOTCLKIN0 */
 		{ PIN_A_NUMBER('P', 8),  0, 2 },	/* DU_DOTCLKIN1 */
@@ -6138,7 +6138,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[25] = RCAR_GP_PIN(0, 15),	/* D15 */
 		[26] = RCAR_GP_PIN(7,  0),	/* AVS1 */
 		[27] = RCAR_GP_PIN(7,  1),	/* AVS2 */
-		[28] = RCAR_GP_PIN(7,  2),	/* HDMI0_CEC */
+		[28] = RCAR_GP_PIN(7,  2),	/* GP7_02 */
 		[29] = RCAR_GP_PIN(7,  3),	/* GP7_03 */
 		[30] = PIN_A_NUMBER('P', 7),	/* DU_DOTCLKIN0 */
 		[31] = PIN_A_NUMBER('P', 8),	/* DU_DOTCLKIN1 */
-- 
2.17.1

