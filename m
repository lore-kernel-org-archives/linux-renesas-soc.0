Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2480C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B971218A2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729628AbfC2P3q (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 11:29:46 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:40888 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728720AbfC2P3q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 11:29:46 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id trVj1z00V3XaVaC01rVjYW; Fri, 29 Mar 2019 16:29:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003Rj-47; Fri, 29 Mar 2019 16:29:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003eg-39; Fri, 29 Mar 2019 16:29:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/8] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit31 when using SIM0_D
Date:   Fri, 29 Mar 2019 16:29:36 +0100
Message-Id: <20190329152942.13995-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190329152942.13995-1-geert+renesas@glider.be>
References: <20190329152942.13995-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
Aug 24, 2018, there is no need to configure MOD_SEL1 bit31 when the
SIM0_D_{A,B} pin function is selected.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Remove now unused definitions, mark MOD_SEL1 bit31 reserved]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 2328fd25fa4f6cb0..68abacd9732f94c9 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -430,7 +430,6 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
 #define MOD_SEL0_1_0	   REV4(FM(SEL_SPEED_PULSE_IF_0),	FM(SEL_SPEED_PULSE_IF_1),	FM(SEL_SPEED_PULSE_IF_2),	F_(0, 0))
 
 /* MOD_SEL1 */			/* 0 */				/* 1 */				/* 2 */				/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */
-#define MOD_SEL1_31		FM(SEL_SIMCARD_0)		FM(SEL_SIMCARD_1)
 #define MOD_SEL1_30		FM(SEL_SSI2_0)			FM(SEL_SSI2_1)
 #define MOD_SEL1_29		FM(SEL_TIMER_TMU_0)		FM(SEL_TIMER_TMU_1)
 #define MOD_SEL1_28		FM(SEL_USB_20_CH0_0)		FM(SEL_USB_20_CH0_1)
@@ -452,7 +451,6 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
 
 #define PINMUX_MOD_SELS	\
 \
-			MOD_SEL1_31 \
 MOD_SEL0_30_29		MOD_SEL1_30 \
 			MOD_SEL1_29 \
 MOD_SEL0_28		MOD_SEL1_28 \
@@ -1181,7 +1179,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP13_19_16,		RIF0_D1_A,	SEL_DRIF0_0),
 	PINMUX_IPSR_MSEL(IP13_19_16,		SDA1_B,		SEL_I2C1_1),
 	PINMUX_IPSR_MSEL(IP13_19_16,		TCLK2_B,	SEL_TIMER_TMU_1),
-	PINMUX_IPSR_MSEL(IP13_19_16,		SIM0_D_A,	SEL_SIMCARD_0),
+	PINMUX_IPSR_GPSR(IP13_19_16,		SIM0_D_A),
 
 	PINMUX_IPSR_GPSR(IP13_23_20,		MLB_DAT),
 	PINMUX_IPSR_MSEL(IP13_23_20,		TX0_B,		SEL_SCIF0_1),
@@ -1249,7 +1247,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP15_15_12,		TPU0TO2),
 	PINMUX_IPSR_MSEL(IP15_15_12,		SDA1_D,		SEL_I2C1_3),
 	PINMUX_IPSR_MSEL(IP15_15_12,		FSO_CFE_1_N_B,	SEL_FSO_1),
-	PINMUX_IPSR_MSEL(IP15_15_12,		SIM0_D_B,	SEL_SIMCARD_1),
+	PINMUX_IPSR_GPSR(IP15_15_12,		SIM0_D_B),
 
 	PINMUX_IPSR_GPSR(IP15_19_16,		SSI_SDATA6),
 	PINMUX_IPSR_MSEL(IP15_19_16,		HRTS2_N_A,	SEL_HSCIF2_0),
@@ -4970,7 +4968,8 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 			     GROUP(1, 1, 1, 1, 1, 1, 1, 3, 3, 1, 1, 1,
 				   1, 2, 2, 2, 1, 1, 2, 1, 4),
 			     GROUP(
-		MOD_SEL1_31
+		/* RESERVED 31 */
+		0, 0,
 		MOD_SEL1_30
 		MOD_SEL1_29
 		MOD_SEL1_28
-- 
2.17.1

