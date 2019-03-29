Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C7AC10F05
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE167218A3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729625AbfC2P3r (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 11:29:47 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:50764 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729621AbfC2P3r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 11:29:47 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id trVk1z00G3XaVaC01rVksD; Fri, 29 Mar 2019 16:29:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003Rn-5a; Fri, 29 Mar 2019 16:29:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003ej-3u; Fri, 29 Mar 2019 16:29:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/8] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit30 when using SSI_SCK2 and SSI_WS2
Date:   Fri, 29 Mar 2019 16:29:37 +0100
Message-Id: <20190329152942.13995-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190329152942.13995-1-geert+renesas@glider.be>
References: <20190329152942.13995-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of Aug
24, 2018, there is no need to configure MOD_SEL1 bit30 when the
SSI_SCK2_{A,B} or SSI_WS2_{A,B} pin functions are selected.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Remove now unused definitions, mark MOD_SEL1 bit30 reserved]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 68abacd9732f94c9..9ca002b6173c1447 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -430,7 +430,6 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
 #define MOD_SEL0_1_0	   REV4(FM(SEL_SPEED_PULSE_IF_0),	FM(SEL_SPEED_PULSE_IF_1),	FM(SEL_SPEED_PULSE_IF_2),	F_(0, 0))
 
 /* MOD_SEL1 */			/* 0 */				/* 1 */				/* 2 */				/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */
-#define MOD_SEL1_30		FM(SEL_SSI2_0)			FM(SEL_SSI2_1)
 #define MOD_SEL1_29		FM(SEL_TIMER_TMU_0)		FM(SEL_TIMER_TMU_1)
 #define MOD_SEL1_28		FM(SEL_USB_20_CH0_0)		FM(SEL_USB_20_CH0_1)
 #define MOD_SEL1_26		FM(SEL_DRIF2_0)			FM(SEL_DRIF2_1)
@@ -451,7 +450,7 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
 
 #define PINMUX_MOD_SELS	\
 \
-MOD_SEL0_30_29		MOD_SEL1_30 \
+MOD_SEL0_30_29 \
 			MOD_SEL1_29 \
 MOD_SEL0_28		MOD_SEL1_28 \
 MOD_SEL0_27_26 \
@@ -1041,7 +1040,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP10_27_24,		RIF0_CLK_B,	SEL_DRIF0_1),
 	PINMUX_IPSR_MSEL(IP10_27_24,		SCL2_B,		SEL_I2C2_1),
 	PINMUX_IPSR_MSEL(IP10_27_24,		TCLK1_A,	SEL_TIMER_TMU_0),
-	PINMUX_IPSR_MSEL(IP10_27_24,		SSI_SCK2_B,	SEL_SSI2_1),
+	PINMUX_IPSR_GPSR(IP10_27_24,		SSI_SCK2_B),
 	PINMUX_IPSR_GPSR(IP10_27_24,		TS_SCK0),
 
 	PINMUX_IPSR_GPSR(IP10_31_28,		SD0_WP),
@@ -1050,7 +1049,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP10_31_28,		RIF0_D0_B,	SEL_DRIF0_1),
 	PINMUX_IPSR_MSEL(IP10_31_28,		SDA2_B,		SEL_I2C2_1),
 	PINMUX_IPSR_MSEL(IP10_31_28,		TCLK2_A,	SEL_TIMER_TMU_0),
-	PINMUX_IPSR_MSEL(IP10_31_28,		SSI_WS2_B,	SEL_SSI2_1),
+	PINMUX_IPSR_GPSR(IP10_31_28,		SSI_WS2_B),
 	PINMUX_IPSR_GPSR(IP10_31_28,		TS_SDAT0),
 
 	/* IPSR11 */
@@ -1068,13 +1067,13 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_MSEL(IP11_11_8,		RX0_A,		SEL_SCIF0_0),
 	PINMUX_IPSR_MSEL(IP11_11_8,		HRX1_A,		SEL_HSCIF1_0),
-	PINMUX_IPSR_MSEL(IP11_11_8,		SSI_SCK2_A,	SEL_SSI2_0),
+	PINMUX_IPSR_GPSR(IP11_11_8,		SSI_SCK2_A),
 	PINMUX_IPSR_GPSR(IP11_11_8,		RIF1_SYNC),
 	PINMUX_IPSR_GPSR(IP11_11_8,		TS_SCK1),
 
 	PINMUX_IPSR_MSEL(IP11_15_12,		TX0_A,		SEL_SCIF0_0),
 	PINMUX_IPSR_GPSR(IP11_15_12,		HTX1_A),
-	PINMUX_IPSR_MSEL(IP11_15_12,		SSI_WS2_A,	SEL_SSI2_0),
+	PINMUX_IPSR_GPSR(IP11_15_12,		SSI_WS2_A),
 	PINMUX_IPSR_GPSR(IP11_15_12,		RIF1_D0),
 	PINMUX_IPSR_GPSR(IP11_15_12,		TS_SDAT1),
 
@@ -4965,12 +4964,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL0_1_0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL1", 0xe6060504, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 1, 3, 3, 1, 1, 1,
-				   1, 2, 2, 2, 1, 1, 2, 1, 4),
+			     GROUP(2, 1, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1,
+				   2, 2, 2, 1, 1, 2, 1, 4),
 			     GROUP(
-		/* RESERVED 31 */
-		0, 0,
-		MOD_SEL1_30
+		/* RESERVED 31, 30 */
+		0, 0, 0, 0,
 		MOD_SEL1_29
 		MOD_SEL1_28
 		/* RESERVED 27 */
-- 
2.17.1

