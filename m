Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF69C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E40D0218A2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbfC2P3s (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 11:29:48 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:38764 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729593AbfC2P3s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 11:29:48 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id trVk1z00D3XaVaC01rVk2A; Fri, 29 Mar 2019 16:29:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003Ry-9f; Fri, 29 Mar 2019 16:29:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003ev-8O; Fri, 29 Mar 2019 16:29:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/8] pinctrl: sh-pfc: rcar-gen3: Rename SEL_ADG_{A,B,C} to SEL_ADG{A,B,C}
Date:   Fri, 29 Mar 2019 16:29:41 +0100
Message-Id: <20190329152942.13995-8-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190329152942.13995-1-geert+renesas@glider.be>
References: <20190329152942.13995-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev 0.80 of Dec
22, 2017, and the Errata for Rev 1.50 of Dec 25, 2018, MOD_SEL0 register
bits 3, 4, 17, and 18 are renamed from SEL_ADG_{A,B,C} to
SEL_ADG{A,B,C}.  Update the pin control drivers to reflect this.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c  | 22 +++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c  | 22 +++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 22 +++++++++++-----------
 3 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 44a0bdeaca443143..68bcb8980b1675d3 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -2,7 +2,7 @@
 /*
  * R8A7795 ES2.0+ processor support - PFC hardware block.
  *
- * Copyright (C) 2015-2017 Renesas Electronics Corporation
+ * Copyright (C) 2015-2019 Renesas Electronics Corporation
  */
 
 #include <linux/errno.h>
@@ -462,7 +462,7 @@ FM(IP16_31_28)	IP16_31_28	FM(IP17_31_28)	IP17_31_28
 #define MOD_SEL0_9_8		FM(SEL_DRIF1_0)		FM(SEL_DRIF1_1)		FM(SEL_DRIF1_2)		F_(0, 0)
 #define MOD_SEL0_7_6		FM(SEL_DRIF0_0)		FM(SEL_DRIF0_1)		FM(SEL_DRIF0_2)		F_(0, 0)
 #define MOD_SEL0_5		FM(SEL_CANFD0_0)	FM(SEL_CANFD0_1)
-#define MOD_SEL0_4_3		FM(SEL_ADG_A_0)		FM(SEL_ADG_A_1)		FM(SEL_ADG_A_2)		FM(SEL_ADG_A_3)
+#define MOD_SEL0_4_3		FM(SEL_ADGA_0)		FM(SEL_ADGA_1)		FM(SEL_ADGA_2)		FM(SEL_ADGA_3)
 
 /* MOD_SEL1 */			/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */			/* 5 */			/* 6 */			/* 7 */
 #define MOD_SEL1_31_30		FM(SEL_TSIF1_0)		FM(SEL_TSIF1_1)		FM(SEL_TSIF1_2)		FM(SEL_TSIF1_3)
@@ -498,8 +498,8 @@ FM(IP16_31_28)	IP16_31_28	FM(IP17_31_28)	IP17_31_28
 #define MOD_SEL2_21		FM(SEL_SSI2_0)		FM(SEL_SSI2_1)
 #define MOD_SEL2_20		FM(SEL_SSI9_0)		FM(SEL_SSI9_1)
 #define MOD_SEL2_19		FM(SEL_TIMER_TMU2_0)	FM(SEL_TIMER_TMU2_1)
-#define MOD_SEL2_18		FM(SEL_ADG_B_0)		FM(SEL_ADG_B_1)
-#define MOD_SEL2_17		FM(SEL_ADG_C_0)		FM(SEL_ADG_C_1)
+#define MOD_SEL2_18		FM(SEL_ADGB_0)		FM(SEL_ADGB_1)
+#define MOD_SEL2_17		FM(SEL_ADGC_0)		FM(SEL_ADGC_1)
 #define MOD_SEL2_0		FM(SEL_VIN4_0)		FM(SEL_VIN4_1)
 
 #define PINMUX_MOD_SELS	\
@@ -1130,7 +1130,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP11_27_24,	SCK0),
 	PINMUX_IPSR_MSEL(IP11_27_24,	HSCK1_B,		SEL_HSCIF1_1),
 	PINMUX_IPSR_MSEL(IP11_27_24,	MSIOF1_SS2_B,		SEL_MSIOF1_1),
-	PINMUX_IPSR_MSEL(IP11_27_24,	AUDIO_CLKC_B,		SEL_ADG_C_1),
+	PINMUX_IPSR_MSEL(IP11_27_24,	AUDIO_CLKC_B,		SEL_ADGC_1),
 	PINMUX_IPSR_MSEL(IP11_27_24,	SDA2_A,			SEL_I2C2_0),
 	PINMUX_IPSR_MSEL(IP11_27_24,	SIM0_RST_B,		SEL_SIMCARD_1),
 	PINMUX_IPSR_MSEL(IP11_27_24,	STP_OPWM_0_C,		SEL_SSP1_0_2),
@@ -1163,7 +1163,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP12_11_8,	RTS0_N),
 	PINMUX_IPSR_MSEL(IP12_11_8,	HRTS1_N_B,		SEL_HSCIF1_1),
 	PINMUX_IPSR_MSEL(IP12_11_8,	MSIOF1_SS1_B,		SEL_MSIOF1_1),
-	PINMUX_IPSR_MSEL(IP12_11_8,	AUDIO_CLKA_B,		SEL_ADG_A_1),
+	PINMUX_IPSR_MSEL(IP12_11_8,	AUDIO_CLKA_B,		SEL_ADGA_1),
 	PINMUX_IPSR_MSEL(IP12_11_8,	SCL2_A,			SEL_I2C2_0),
 	PINMUX_IPSR_MSEL(IP12_11_8,	STP_IVCXO27_1_C,	SEL_SSP1_1_2),
 	PINMUX_IPSR_MSEL(IP12_11_8,	RIF0_SYNC_B,		SEL_DRIF0_1),
@@ -1222,7 +1222,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP13_11_8,	HSCK0),
 	PINMUX_IPSR_MSEL(IP13_11_8,	MSIOF1_SCK_D,		SEL_MSIOF1_3),
-	PINMUX_IPSR_MSEL(IP13_11_8,	AUDIO_CLKB_A,		SEL_ADG_B_0),
+	PINMUX_IPSR_MSEL(IP13_11_8,	AUDIO_CLKB_A,		SEL_ADGB_0),
 	PINMUX_IPSR_MSEL(IP13_11_8,	SSI_SDATA1_B,		SEL_SSI1_1),
 	PINMUX_IPSR_MSEL(IP13_11_8,	TS_SCK0_D,		SEL_TSIF0_3),
 	PINMUX_IPSR_MSEL(IP13_11_8,	STP_ISCLK_0_D,		SEL_SSP1_0_3),
@@ -1269,7 +1269,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP14_3_0,	MSIOF0_SS1),
 	PINMUX_IPSR_MSEL(IP14_3_0,	RX5_A,			SEL_SCIF5_0),
 	PINMUX_IPSR_GPSR(IP14_3_0,	NFWP_N_A),
-	PINMUX_IPSR_MSEL(IP14_3_0,	AUDIO_CLKA_C,		SEL_ADG_A_2),
+	PINMUX_IPSR_MSEL(IP14_3_0,	AUDIO_CLKA_C,		SEL_ADGA_2),
 	PINMUX_IPSR_MSEL(IP14_3_0,	SSI_SCK2_A,		SEL_SSI2_0),
 	PINMUX_IPSR_MSEL(IP14_3_0,	STP_IVCXO27_0_C,	SEL_SSP1_0_2),
 	PINMUX_IPSR_GPSR(IP14_3_0,	AUDIO_CLKOUT3_A),
@@ -1278,7 +1278,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP14_7_4,	MSIOF0_SS2),
 	PINMUX_IPSR_MSEL(IP14_7_4,	TX5_A,			SEL_SCIF5_0),
 	PINMUX_IPSR_MSEL(IP14_7_4,	MSIOF1_SS2_D,		SEL_MSIOF1_3),
-	PINMUX_IPSR_MSEL(IP14_7_4,	AUDIO_CLKC_A,		SEL_ADG_C_0),
+	PINMUX_IPSR_MSEL(IP14_7_4,	AUDIO_CLKC_A,		SEL_ADGC_0),
 	PINMUX_IPSR_MSEL(IP14_7_4,	SSI_WS2_A,		SEL_SSI2_0),
 	PINMUX_IPSR_MSEL(IP14_7_4,	STP_OPWM_0_D,		SEL_SSP1_0_3),
 	PINMUX_IPSR_GPSR(IP14_7_4,	AUDIO_CLKOUT_D),
@@ -1409,9 +1409,9 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP16_31_28,	SCK5_A,			SEL_SCIF5_0),
 
 	/* IPSR17 */
-	PINMUX_IPSR_MSEL(IP17_3_0,	AUDIO_CLKA_A,		SEL_ADG_A_0),
+	PINMUX_IPSR_MSEL(IP17_3_0,	AUDIO_CLKA_A,		SEL_ADGA_0),
 
-	PINMUX_IPSR_MSEL(IP17_7_4,	AUDIO_CLKB_B,		SEL_ADG_B_1),
+	PINMUX_IPSR_MSEL(IP17_7_4,	AUDIO_CLKB_B,		SEL_ADGB_1),
 	PINMUX_IPSR_MSEL(IP17_7_4,	SCIF_CLK_A,		SEL_SCIF_0),
 	PINMUX_IPSR_MSEL(IP17_7_4,	STP_IVCXO27_1_D,	SEL_SSP1_1_3),
 	PINMUX_IPSR_MSEL(IP17_7_4,	REMOCON_A,		SEL_REMOCON_0),
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 08ee69e7baac913a..c5a7bc6c92b3254f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -2,7 +2,7 @@
 /*
  * R8A7796 processor support - PFC hardware block.
  *
- * Copyright (C) 2016-2017 Renesas Electronics Corp.
+ * Copyright (C) 2016-2019 Renesas Electronics Corp.
  *
  * This file is based on the drivers/pinctrl/sh-pfc/pfc-r8a7795.c
  *
@@ -467,7 +467,7 @@ FM(IP16_31_28)	IP16_31_28	FM(IP17_31_28)	IP17_31_28
 #define MOD_SEL0_9_8		FM(SEL_DRIF1_0)		FM(SEL_DRIF1_1)		FM(SEL_DRIF1_2)		F_(0, 0)
 #define MOD_SEL0_7_6		FM(SEL_DRIF0_0)		FM(SEL_DRIF0_1)		FM(SEL_DRIF0_2)		F_(0, 0)
 #define MOD_SEL0_5		FM(SEL_CANFD0_0)	FM(SEL_CANFD0_1)
-#define MOD_SEL0_4_3		FM(SEL_ADG_A_0)		FM(SEL_ADG_A_1)		FM(SEL_ADG_A_2)		FM(SEL_ADG_A_3)
+#define MOD_SEL0_4_3		FM(SEL_ADGA_0)		FM(SEL_ADGA_1)		FM(SEL_ADGA_2)		FM(SEL_ADGA_3)
 
 /* MOD_SEL1 */			/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */			/* 5 */			/* 6 */			/* 7 */
 #define MOD_SEL1_31_30		FM(SEL_TSIF1_0)		FM(SEL_TSIF1_1)		FM(SEL_TSIF1_2)		FM(SEL_TSIF1_3)
@@ -504,8 +504,8 @@ FM(IP16_31_28)	IP16_31_28	FM(IP17_31_28)	IP17_31_28
 #define MOD_SEL2_21		FM(SEL_SSI2_0)		FM(SEL_SSI2_1)
 #define MOD_SEL2_20		FM(SEL_SSI9_0)		FM(SEL_SSI9_1)
 #define MOD_SEL2_19		FM(SEL_TIMER_TMU2_0)	FM(SEL_TIMER_TMU2_1)
-#define MOD_SEL2_18		FM(SEL_ADG_B_0)		FM(SEL_ADG_B_1)
-#define MOD_SEL2_17		FM(SEL_ADG_C_0)		FM(SEL_ADG_C_1)
+#define MOD_SEL2_18		FM(SEL_ADGB_0)		FM(SEL_ADGB_1)
+#define MOD_SEL2_17		FM(SEL_ADGC_0)		FM(SEL_ADGC_1)
 #define MOD_SEL2_0		FM(SEL_VIN4_0)		FM(SEL_VIN4_1)
 
 #define PINMUX_MOD_SELS	\
@@ -1137,7 +1137,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP11_27_24,	SCK0),
 	PINMUX_IPSR_MSEL(IP11_27_24,	HSCK1_B,		SEL_HSCIF1_1),
 	PINMUX_IPSR_MSEL(IP11_27_24,	MSIOF1_SS2_B,		SEL_MSIOF1_1),
-	PINMUX_IPSR_MSEL(IP11_27_24,	AUDIO_CLKC_B,		SEL_ADG_C_1),
+	PINMUX_IPSR_MSEL(IP11_27_24,	AUDIO_CLKC_B,		SEL_ADGC_1),
 	PINMUX_IPSR_MSEL(IP11_27_24,	SDA2_A,			SEL_I2C2_0),
 	PINMUX_IPSR_MSEL(IP11_27_24,	SIM0_RST_B,		SEL_SIMCARD_1),
 	PINMUX_IPSR_MSEL(IP11_27_24,	STP_OPWM_0_C,		SEL_SSP1_0_2),
@@ -1170,7 +1170,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP12_11_8,	RTS0_N),
 	PINMUX_IPSR_MSEL(IP12_11_8,	HRTS1_N_B,		SEL_HSCIF1_1),
 	PINMUX_IPSR_MSEL(IP12_11_8,	MSIOF1_SS1_B,		SEL_MSIOF1_1),
-	PINMUX_IPSR_MSEL(IP12_11_8,	AUDIO_CLKA_B,		SEL_ADG_A_1),
+	PINMUX_IPSR_MSEL(IP12_11_8,	AUDIO_CLKA_B,		SEL_ADGA_1),
 	PINMUX_IPSR_MSEL(IP12_11_8,	SCL2_A,			SEL_I2C2_0),
 	PINMUX_IPSR_MSEL(IP12_11_8,	STP_IVCXO27_1_C,	SEL_SSP1_1_2),
 	PINMUX_IPSR_MSEL(IP12_11_8,	RIF0_SYNC_B,		SEL_DRIF0_1),
@@ -1229,7 +1229,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP13_11_8,	HSCK0),
 	PINMUX_IPSR_MSEL(IP13_11_8,	MSIOF1_SCK_D,		SEL_MSIOF1_3),
-	PINMUX_IPSR_MSEL(IP13_11_8,	AUDIO_CLKB_A,		SEL_ADG_B_0),
+	PINMUX_IPSR_MSEL(IP13_11_8,	AUDIO_CLKB_A,		SEL_ADGB_0),
 	PINMUX_IPSR_MSEL(IP13_11_8,	SSI_SDATA1_B,		SEL_SSI1_1),
 	PINMUX_IPSR_MSEL(IP13_11_8,	TS_SCK0_D,		SEL_TSIF0_3),
 	PINMUX_IPSR_MSEL(IP13_11_8,	STP_ISCLK_0_D,		SEL_SSP1_0_3),
@@ -1276,7 +1276,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP14_3_0,	MSIOF0_SS1),
 	PINMUX_IPSR_MSEL(IP14_3_0,	RX5_A,			SEL_SCIF5_0),
 	PINMUX_IPSR_MSEL(IP14_3_0,	NFWP_N_A,		SEL_NDFC_0),
-	PINMUX_IPSR_MSEL(IP14_3_0,	AUDIO_CLKA_C,		SEL_ADG_A_2),
+	PINMUX_IPSR_MSEL(IP14_3_0,	AUDIO_CLKA_C,		SEL_ADGA_2),
 	PINMUX_IPSR_MSEL(IP14_3_0,	SSI_SCK2_A,		SEL_SSI2_0),
 	PINMUX_IPSR_MSEL(IP14_3_0,	STP_IVCXO27_0_C,	SEL_SSP1_0_2),
 	PINMUX_IPSR_GPSR(IP14_3_0,	AUDIO_CLKOUT3_A),
@@ -1285,7 +1285,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP14_7_4,	MSIOF0_SS2),
 	PINMUX_IPSR_MSEL(IP14_7_4,	TX5_A,			SEL_SCIF5_0),
 	PINMUX_IPSR_MSEL(IP14_7_4,	MSIOF1_SS2_D,		SEL_MSIOF1_3),
-	PINMUX_IPSR_MSEL(IP14_7_4,	AUDIO_CLKC_A,		SEL_ADG_C_0),
+	PINMUX_IPSR_MSEL(IP14_7_4,	AUDIO_CLKC_A,		SEL_ADGC_0),
 	PINMUX_IPSR_MSEL(IP14_7_4,	SSI_WS2_A,		SEL_SSI2_0),
 	PINMUX_IPSR_MSEL(IP14_7_4,	STP_OPWM_0_D,		SEL_SSP1_0_3),
 	PINMUX_IPSR_GPSR(IP14_7_4,	AUDIO_CLKOUT_D),
@@ -1413,9 +1413,9 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP16_31_28,	SCK5_A,			SEL_SCIF5_0),
 
 	/* IPSR17 */
-	PINMUX_IPSR_MSEL(IP17_3_0,	AUDIO_CLKA_A,		SEL_ADG_A_0),
+	PINMUX_IPSR_MSEL(IP17_3_0,	AUDIO_CLKA_A,		SEL_ADGA_0),
 
-	PINMUX_IPSR_MSEL(IP17_7_4,	AUDIO_CLKB_B,		SEL_ADG_B_1),
+	PINMUX_IPSR_MSEL(IP17_7_4,	AUDIO_CLKB_B,		SEL_ADGB_1),
 	PINMUX_IPSR_MSEL(IP17_7_4,	SCIF_CLK_A,		SEL_SCIF_0),
 	PINMUX_IPSR_MSEL(IP17_7_4,	STP_IVCXO27_1_D,	SEL_SSP1_1_3),
 	PINMUX_IPSR_MSEL(IP17_7_4,	REMOCON_A,		SEL_REMOCON_0),
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index af432fad37e8e131..53d554315e4880d1 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -3,7 +3,7 @@
  * R8A77965 processor support - PFC hardware block.
  *
  * Copyright (C) 2018 Jacopo Mondi <jacopo+renesas@jmondi.org>
- * Copyright (C) 2016 Renesas Electronics Corp.
+ * Copyright (C) 2016-2019 Renesas Electronics Corp.
  *
  * This file is based on the drivers/pinctrl/sh-pfc/pfc-r8a7796.c
  *
@@ -468,7 +468,7 @@ FM(IP16_31_28)	IP16_31_28	FM(IP17_31_28)	IP17_31_28
 #define MOD_SEL0_9_8		FM(SEL_DRIF1_0)		FM(SEL_DRIF1_1)		FM(SEL_DRIF1_2)		F_(0, 0)
 #define MOD_SEL0_7_6		FM(SEL_DRIF0_0)		FM(SEL_DRIF0_1)		FM(SEL_DRIF0_2)		F_(0, 0)
 #define MOD_SEL0_5		FM(SEL_CANFD0_0)	FM(SEL_CANFD0_1)
-#define MOD_SEL0_4_3		FM(SEL_ADG_A_0)		FM(SEL_ADG_A_1)		FM(SEL_ADG_A_2)		FM(SEL_ADG_A_3)
+#define MOD_SEL0_4_3		FM(SEL_ADGA_0)		FM(SEL_ADGA_1)		FM(SEL_ADGA_2)		FM(SEL_ADGA_3)
 
 /* MOD_SEL1 */			/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */			/* 5 */			/* 6 */			/* 7 */
 #define MOD_SEL1_31_30		FM(SEL_TSIF1_0)		FM(SEL_TSIF1_1)		FM(SEL_TSIF1_2)		FM(SEL_TSIF1_3)
@@ -505,8 +505,8 @@ FM(IP16_31_28)	IP16_31_28	FM(IP17_31_28)	IP17_31_28
 #define MOD_SEL2_21		FM(SEL_SSI2_0)		FM(SEL_SSI2_1)
 #define MOD_SEL2_20		FM(SEL_SSI9_0)		FM(SEL_SSI9_1)
 #define MOD_SEL2_19		FM(SEL_TIMER_TMU2_0)	FM(SEL_TIMER_TMU2_1)
-#define MOD_SEL2_18		FM(SEL_ADG_B_0)		FM(SEL_ADG_B_1)
-#define MOD_SEL2_17		FM(SEL_ADG_C_0)		FM(SEL_ADG_C_1)
+#define MOD_SEL2_18		FM(SEL_ADGB_0)		FM(SEL_ADGB_1)
+#define MOD_SEL2_17		FM(SEL_ADGC_0)		FM(SEL_ADGC_1)
 #define MOD_SEL2_0		FM(SEL_VIN4_0)		FM(SEL_VIN4_1)
 
 #define PINMUX_MOD_SELS	\
@@ -1131,7 +1131,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP11_27_24,	SCK0),
 	PINMUX_IPSR_MSEL(IP11_27_24,	HSCK1_B,		SEL_HSCIF1_1),
 	PINMUX_IPSR_MSEL(IP11_27_24,	MSIOF1_SS2_B,		SEL_MSIOF1_1),
-	PINMUX_IPSR_MSEL(IP11_27_24,	AUDIO_CLKC_B,		SEL_ADG_C_1),
+	PINMUX_IPSR_MSEL(IP11_27_24,	AUDIO_CLKC_B,		SEL_ADGC_1),
 	PINMUX_IPSR_MSEL(IP11_27_24,	SDA2_A,			SEL_I2C2_0),
 	PINMUX_IPSR_MSEL(IP11_27_24,	SIM0_RST_B,		SEL_SIMCARD_1),
 	PINMUX_IPSR_MSEL(IP11_27_24,	STP_OPWM_0_C,		SEL_SSP1_0_2),
@@ -1164,7 +1164,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP12_11_8,	RTS0_N),
 	PINMUX_IPSR_MSEL(IP12_11_8,	HRTS1_N_B,		SEL_HSCIF1_1),
 	PINMUX_IPSR_MSEL(IP12_11_8,	MSIOF1_SS1_B,		SEL_MSIOF1_1),
-	PINMUX_IPSR_MSEL(IP12_11_8,	AUDIO_CLKA_B,		SEL_ADG_A_1),
+	PINMUX_IPSR_MSEL(IP12_11_8,	AUDIO_CLKA_B,		SEL_ADGA_1),
 	PINMUX_IPSR_MSEL(IP12_11_8,	SCL2_A,			SEL_I2C2_0),
 	PINMUX_IPSR_MSEL(IP12_11_8,	STP_IVCXO27_1_C,	SEL_SSP1_1_2),
 	PINMUX_IPSR_MSEL(IP12_11_8,	RIF0_SYNC_B,		SEL_DRIF0_1),
@@ -1223,7 +1223,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP13_11_8,	HSCK0),
 	PINMUX_IPSR_MSEL(IP13_11_8,	MSIOF1_SCK_D,		SEL_MSIOF1_3),
-	PINMUX_IPSR_MSEL(IP13_11_8,	AUDIO_CLKB_A,		SEL_ADG_B_0),
+	PINMUX_IPSR_MSEL(IP13_11_8,	AUDIO_CLKB_A,		SEL_ADGB_0),
 	PINMUX_IPSR_MSEL(IP13_11_8,	SSI_SDATA1_B,		SEL_SSI1_1),
 	PINMUX_IPSR_MSEL(IP13_11_8,	TS_SCK0_D,		SEL_TSIF0_3),
 	PINMUX_IPSR_MSEL(IP13_11_8,	STP_ISCLK_0_D,		SEL_SSP1_0_3),
@@ -1270,7 +1270,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP14_3_0,	MSIOF0_SS1),
 	PINMUX_IPSR_MSEL(IP14_3_0,	RX5_A,			SEL_SCIF5_0),
 	PINMUX_IPSR_MSEL(IP14_3_0,	NFWP_N_A,		SEL_NDFC_0),
-	PINMUX_IPSR_MSEL(IP14_3_0,	AUDIO_CLKA_C,		SEL_ADG_A_2),
+	PINMUX_IPSR_MSEL(IP14_3_0,	AUDIO_CLKA_C,		SEL_ADGA_2),
 	PINMUX_IPSR_MSEL(IP14_3_0,	SSI_SCK2_A,		SEL_SSI2_0),
 	PINMUX_IPSR_MSEL(IP14_3_0,	STP_IVCXO27_0_C,	SEL_SSP1_0_2),
 	PINMUX_IPSR_GPSR(IP14_3_0,	AUDIO_CLKOUT3_A),
@@ -1279,7 +1279,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP14_7_4,	MSIOF0_SS2),
 	PINMUX_IPSR_MSEL(IP14_7_4,	TX5_A,			SEL_SCIF5_0),
 	PINMUX_IPSR_MSEL(IP14_7_4,	MSIOF1_SS2_D,		SEL_MSIOF1_3),
-	PINMUX_IPSR_MSEL(IP14_7_4,	AUDIO_CLKC_A,		SEL_ADG_C_0),
+	PINMUX_IPSR_MSEL(IP14_7_4,	AUDIO_CLKC_A,		SEL_ADGC_0),
 	PINMUX_IPSR_MSEL(IP14_7_4,	SSI_WS2_A,		SEL_SSI2_0),
 	PINMUX_IPSR_MSEL(IP14_7_4,	STP_OPWM_0_D,		SEL_SSP1_0_3),
 	PINMUX_IPSR_GPSR(IP14_7_4,	AUDIO_CLKOUT_D),
@@ -1408,9 +1408,9 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP16_31_28,	SCK5_A,			SEL_SCIF5_0),
 
 	/* IPSR17 */
-	PINMUX_IPSR_MSEL(IP17_3_0,	AUDIO_CLKA_A,		SEL_ADG_A_0),
+	PINMUX_IPSR_MSEL(IP17_3_0,	AUDIO_CLKA_A,		SEL_ADGA_0),
 
-	PINMUX_IPSR_MSEL(IP17_7_4,	AUDIO_CLKB_B,		SEL_ADG_B_1),
+	PINMUX_IPSR_MSEL(IP17_7_4,	AUDIO_CLKB_B,		SEL_ADGB_1),
 	PINMUX_IPSR_MSEL(IP17_7_4,	SCIF_CLK_A,		SEL_SCIF_0),
 	PINMUX_IPSR_MSEL(IP17_7_4,	STP_IVCXO27_1_D,	SEL_SSP1_1_3),
 	PINMUX_IPSR_MSEL(IP17_7_4,	REMOCON_A,		SEL_REMOCON_0),
-- 
2.17.1

