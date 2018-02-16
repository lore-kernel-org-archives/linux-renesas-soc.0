Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:56117 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034154AbeBPOZT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 09:25:19 -0500
Received: by mail-wm0-f67.google.com with SMTP id h74so3469536wme.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2018 06:25:18 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 3/3] pinctrl: sh-pfc: r8a7796: Fix IPSR and MOD_SEL register pin assignment for NDFC pins group
Date: Fri, 16 Feb 2018 15:25:04 +0100
Message-Id: <1518791104-13928-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1518791104-13928-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1518791104-13928-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixes to set IPSR and MOD_SEL when using NFDATA{14,15}_A and
NF{RB,WP}_N_A pin function is selected. And renamess MOD_SEL2 bit22 value
definition name to SEL_NDFC.

This is a correction to the incorrect implementation of MOD_SEL register
pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
User's Manual Rev.0.53E.

Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 74ee483..48f371e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -502,7 +502,7 @@ FM(IP16_31_28)	IP16_31_28	FM(IP17_31_28)	IP17_31_28
 #define MOD_SEL2_28_27		FM(SEL_FM_0)		FM(SEL_FM_1)		FM(SEL_FM_2)		FM(SEL_FM_3)
 #define MOD_SEL2_26		FM(SEL_SCIF5_0)		FM(SEL_SCIF5_1)
 #define MOD_SEL2_25_24_23	FM(SEL_I2C6_0)		FM(SEL_I2C6_1)		FM(SEL_I2C6_2)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)
-#define MOD_SEL2_22		FM(SEL_NDF_0)		FM(SEL_NDF_1)
+#define MOD_SEL2_22		FM(SEL_NDFC_0)		FM(SEL_NDFC_1)
 #define MOD_SEL2_21		FM(SEL_SSI2_0)		FM(SEL_SSI2_1)
 #define MOD_SEL2_20		FM(SEL_SSI9_0)		FM(SEL_SSI9_1)
 #define MOD_SEL2_19		FM(SEL_TIMER_TMU2_0)	FM(SEL_TIMER_TMU2_1)
@@ -1016,35 +1016,35 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP8_15_12,	SD1_CMD),
 	PINMUX_IPSR_MSEL(IP8_15_12,	MSIOF1_SYNC_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_15_12,	NFCE_N_B,		SEL_NDF_1),
+	PINMUX_IPSR_MSEL(IP8_15_12,	NFCE_N_B,		SEL_NDFC_1),
 	PINMUX_IPSR_MSEL(IP8_15_12,	SIM0_D_A,		SEL_SIMCARD_0),
 	PINMUX_IPSR_MSEL(IP8_15_12,	STP_IVCXO27_1_B,	SEL_SSP1_1_1),
 
 	PINMUX_IPSR_GPSR(IP8_19_16,	SD1_DAT0),
 	PINMUX_IPSR_GPSR(IP8_19_16,	SD2_DAT4),
 	PINMUX_IPSR_MSEL(IP8_19_16,	MSIOF1_RXD_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_19_16,	NFWP_N_B,		SEL_NDF_1),
+	PINMUX_IPSR_MSEL(IP8_19_16,	NFWP_N_B,		SEL_NDFC_1),
 	PINMUX_IPSR_MSEL(IP8_19_16,	TS_SCK1_B,		SEL_TSIF1_1),
 	PINMUX_IPSR_MSEL(IP8_19_16,	STP_ISCLK_1_B,		SEL_SSP1_1_1),
 
 	PINMUX_IPSR_GPSR(IP8_23_20,	SD1_DAT1),
 	PINMUX_IPSR_GPSR(IP8_23_20,	SD2_DAT5),
 	PINMUX_IPSR_MSEL(IP8_23_20,	MSIOF1_TXD_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_23_20,	NFDATA14_B,		SEL_NDF_1),
+	PINMUX_IPSR_MSEL(IP8_23_20,	NFDATA14_B,		SEL_NDFC_1),
 	PINMUX_IPSR_MSEL(IP8_23_20,	TS_SPSYNC1_B,		SEL_TSIF1_1),
 	PINMUX_IPSR_MSEL(IP8_23_20,	STP_ISSYNC_1_B,		SEL_SSP1_1_1),
 
 	PINMUX_IPSR_GPSR(IP8_27_24,	SD1_DAT2),
 	PINMUX_IPSR_GPSR(IP8_27_24,	SD2_DAT6),
 	PINMUX_IPSR_MSEL(IP8_27_24,	MSIOF1_SS1_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_27_24,	NFDATA15_B,		SEL_NDF_1),
+	PINMUX_IPSR_MSEL(IP8_27_24,	NFDATA15_B,		SEL_NDFC_1),
 	PINMUX_IPSR_MSEL(IP8_27_24,	TS_SDAT1_B,		SEL_TSIF1_1),
 	PINMUX_IPSR_MSEL(IP8_27_24,	STP_ISD_1_B,		SEL_SSP1_1_1),
 
 	PINMUX_IPSR_GPSR(IP8_31_28,	SD1_DAT3),
 	PINMUX_IPSR_GPSR(IP8_31_28,	SD2_DAT7),
 	PINMUX_IPSR_MSEL(IP8_31_28,	MSIOF1_SS2_G,		SEL_MSIOF1_6),
-	PINMUX_IPSR_MSEL(IP8_31_28,	NFRB_N_B,		SEL_NDF_1),
+	PINMUX_IPSR_MSEL(IP8_31_28,	NFRB_N_B,		SEL_NDFC_1),
 	PINMUX_IPSR_MSEL(IP8_31_28,	TS_SDEN1_B,		SEL_TSIF1_1),
 	PINMUX_IPSR_MSEL(IP8_31_28,	STP_ISEN_1_B,		SEL_SSP1_1_1),
 
@@ -1110,16 +1110,20 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP11_7_4,	NFCLE),
 
 	PINMUX_IPSR_GPSR(IP11_11_8,	SD0_CD),
+	PINMUX_IPSR_MSEL(IP11_11_8,	NFDATA14_A,		SEL_NDFC_0),
 	PINMUX_IPSR_MSEL(IP11_11_8,	SCL2_B,			SEL_I2C2_1),
 	PINMUX_IPSR_MSEL(IP11_11_8,	SIM0_RST_A,		SEL_SIMCARD_0),
 
 	PINMUX_IPSR_GPSR(IP11_15_12,	SD0_WP),
+	PINMUX_IPSR_MSEL(IP11_15_12,	NFDATA15_A,		SEL_NDFC_0),
 	PINMUX_IPSR_MSEL(IP11_15_12,	SDA2_B,			SEL_I2C2_1),
 
 	PINMUX_IPSR_GPSR(IP11_19_16,	SD1_CD),
+	PINMUX_IPSR_MSEL(IP11_19_16,	NFRB_N_A,		SEL_NDFC_0),
 	PINMUX_IPSR_MSEL(IP11_19_16,	SIM0_CLK_B,		SEL_SIMCARD_1),
 
 	PINMUX_IPSR_GPSR(IP11_23_20,	SD1_WP),
+	PINMUX_IPSR_MSEL(IP11_23_20,	NFCE_N_A,		SEL_NDFC_0),
 	PINMUX_IPSR_MSEL(IP11_23_20,	SIM0_D_B,		SEL_SIMCARD_1),
 
 	PINMUX_IPSR_GPSR(IP11_27_24,	SCK0),
@@ -1263,7 +1267,7 @@ static const u16 pinmux_data[] = {
 	/* IPSR14 */
 	PINMUX_IPSR_GPSR(IP14_3_0,	MSIOF0_SS1),
 	PINMUX_IPSR_MSEL(IP14_3_0,	RX5_A,			SEL_SCIF5_0),
-	PINMUX_IPSR_MSEL(IP14_3_0,	NFWP_N_A,		SEL_NDF_0),
+	PINMUX_IPSR_MSEL(IP14_3_0,	NFWP_N_A,		SEL_NDFC_0),
 	PINMUX_IPSR_MSEL(IP14_3_0,	AUDIO_CLKA_C,		SEL_ADG_A_2),
 	PINMUX_IPSR_MSEL(IP14_3_0,	SSI_SCK2_A,		SEL_SSI2_0),
 	PINMUX_IPSR_MSEL(IP14_3_0,	STP_IVCXO27_0_C,	SEL_SSP1_0_2),
-- 
2.7.4
