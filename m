Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43580C10F0A
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F5D7218A3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729577AbfC2P3r (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 11:29:47 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:40920 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729608AbfC2P3r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 11:29:47 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id trVj1z00Y3XaVaC01rVjYa; Fri, 29 Mar 2019 16:29:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003Rr-6w; Fri, 29 Mar 2019 16:29:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003ep-69; Fri, 29 Mar 2019 16:29:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/8] pinctrl: sh-pfc: rcar-gen3: Remove CC5_OSCOUT pin
Date:   Fri, 29 Mar 2019 16:29:39 +0100
Message-Id: <20190329152942.13995-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190329152942.13995-1-geert+renesas@glider.be>
References: <20190329152942.13995-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
Jun 4, 2018, the CC5_OSCOUT pin is removed.  Update the pin control
drivers to reflect this.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Update R-Car V3M, V3H]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 3 +--
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 3 +--
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 3 +--
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 3 +--
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c    | 3 +--
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c    | 3 +--
 6 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 95fa082ae4439f16..0d74b9c7e93e8ed8 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -340,7 +340,7 @@
 #define IP15_23_20	FM(SSI_SDATA7)		FM(HCTS2_N_B)	FM(MSIOF1_RXD_C)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN1_A)	FM(STP_ISEN_1_A)	FM(RIF1_D0_A)	FM(RIF3_D0_A)		F_(0, 0)	FM(TCLK2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP15_27_24	FM(SSI_SDATA8)		FM(HRTS2_N_B)	FM(MSIOF1_TXD_C)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC1_A)FM(STP_ISSYNC_1_A)	FM(RIF1_D1_A)	FM(RIF3_D1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP15_31_28	FM(SSI_SDATA9_A)	FM(HSCK2_B)	FM(MSIOF1_SS1_C)	FM(HSCK1_A)			FM(SSI_WS1_B)	FM(SCK1)	FM(STP_IVCXO27_1_A)	FM(SCK5)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP16_3_0	FM(AUDIO_CLKA_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	FM(CC5_OSCOUT)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP16_3_0	FM(AUDIO_CLKA_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP16_7_4	FM(AUDIO_CLKB_B)	FM(SCIF_CLK_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	FM(STP_IVCXO27_1_D)	FM(REMOCON_A)	F_(0, 0)		F_(0, 0)	FM(TCLK1_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP16_11_8	FM(USB0_PWEN)		F_(0, 0)	F_(0, 0)		FM(SIM0_RST_C)			F_(0, 0)	FM(TS_SCK1_D)	FM(STP_ISCLK_1_D)	FM(BPFCLK_B)	FM(RIF3_CLK_B)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP16_15_12	FM(USB0_OVC)		F_(0, 0)	F_(0, 0)		FM(SIM0_D_C)			F_(0, 0)	FM(TS_SDAT1_D)	FM(STP_ISD_1_D)		F_(0, 0)	FM(RIF3_SYNC_B)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -1359,7 +1359,6 @@ static const u16 pinmux_data[] = {
 
 	/* IPSR16 */
 	PINMUX_IPSR_MSEL(IP16_3_0,	AUDIO_CLKA_A,		SEL_ADG_0),
-	PINMUX_IPSR_GPSR(IP16_3_0,	CC5_OSCOUT),
 
 	PINMUX_IPSR_MSEL(IP16_7_4,	AUDIO_CLKB_B,		SEL_ADG_1),
 	PINMUX_IPSR_MSEL(IP16_7_4,	SCIF_CLK_A,		SEL_SCIF1_0),
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 63d0eb2cd879a68f..44a0bdeaca443143 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -351,7 +351,7 @@
 #define IP16_23_20	FM(SSI_SDATA7)		FM(HCTS2_N_B)	FM(MSIOF1_RXD_C)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN1_A)	FM(STP_ISEN_1_A)	FM(RIF1_D0_A)	FM(RIF3_D0_A)		F_(0, 0)	FM(TCLK2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP16_27_24	FM(SSI_SDATA8)		FM(HRTS2_N_B)	FM(MSIOF1_TXD_C)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC1_A)FM(STP_ISSYNC_1_A)	FM(RIF1_D1_A)	FM(RIF3_D1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP16_31_28	FM(SSI_SDATA9_A)	FM(HSCK2_B)	FM(MSIOF1_SS1_C)	FM(HSCK1_A)			FM(SSI_WS1_B)	FM(SCK1)	FM(STP_IVCXO27_1_A)	FM(SCK5_A)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP17_3_0	FM(AUDIO_CLKA_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	FM(CC5_OSCOUT)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP17_3_0	FM(AUDIO_CLKA_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP17_7_4	FM(AUDIO_CLKB_B)	FM(SCIF_CLK_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	FM(STP_IVCXO27_1_D)	FM(REMOCON_A)	F_(0, 0)		F_(0, 0)	FM(TCLK1_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP17_11_8	FM(USB0_PWEN)		F_(0, 0)	F_(0, 0)		FM(SIM0_RST_C)			F_(0, 0)	FM(TS_SCK1_D)	FM(STP_ISCLK_1_D)	FM(BPFCLK_B)	FM(RIF3_CLK_B)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) FM(HSCK2_C) F_(0, 0) F_(0, 0)
 #define IP17_15_12	FM(USB0_OVC)		F_(0, 0)	F_(0, 0)		FM(SIM0_D_C)			F_(0, 0)	FM(TS_SDAT1_D)	FM(STP_ISD_1_D)		F_(0, 0)	FM(RIF3_SYNC_B)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) FM(HRX2_C) F_(0, 0) F_(0, 0)
@@ -1410,7 +1410,6 @@ static const u16 pinmux_data[] = {
 
 	/* IPSR17 */
 	PINMUX_IPSR_MSEL(IP17_3_0,	AUDIO_CLKA_A,		SEL_ADG_A_0),
-	PINMUX_IPSR_GPSR(IP17_3_0,	CC5_OSCOUT),
 
 	PINMUX_IPSR_MSEL(IP17_7_4,	AUDIO_CLKB_B,		SEL_ADG_B_1),
 	PINMUX_IPSR_MSEL(IP17_7_4,	SCIF_CLK_A,		SEL_SCIF_0),
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index b463062b77fecbdb..08ee69e7baac913a 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -356,7 +356,7 @@
 #define IP16_23_20	FM(SSI_SDATA7)		FM(HCTS2_N_B)	FM(MSIOF1_RXD_C)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN1_A)	FM(STP_ISEN_1_A)	FM(RIF1_D0_A)	FM(RIF3_D0_A)		F_(0, 0)	FM(TCLK2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP16_27_24	FM(SSI_SDATA8)		FM(HRTS2_N_B)	FM(MSIOF1_TXD_C)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC1_A)FM(STP_ISSYNC_1_A)	FM(RIF1_D1_A)	FM(RIF3_D1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP16_31_28	FM(SSI_SDATA9_A)	FM(HSCK2_B)	FM(MSIOF1_SS1_C)	FM(HSCK1_A)			FM(SSI_WS1_B)	FM(SCK1)	FM(STP_IVCXO27_1_A)	FM(SCK5_A)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP17_3_0	FM(AUDIO_CLKA_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	FM(CC5_OSCOUT)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP17_3_0	FM(AUDIO_CLKA_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP17_7_4	FM(AUDIO_CLKB_B)	FM(SCIF_CLK_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	FM(STP_IVCXO27_1_D)	FM(REMOCON_A)	F_(0, 0)		F_(0, 0)	FM(TCLK1_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP17_11_8	FM(USB0_PWEN)		F_(0, 0)	F_(0, 0)		FM(SIM0_RST_C)			F_(0, 0)	FM(TS_SCK1_D)	FM(STP_ISCLK_1_D)	FM(BPFCLK_B)	FM(RIF3_CLK_B)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) FM(HSCK2_C) F_(0, 0) F_(0, 0)
 #define IP17_15_12	FM(USB0_OVC)		F_(0, 0)	F_(0, 0)		FM(SIM0_D_C)			F_(0, 0)	FM(TS_SDAT1_D)	FM(STP_ISD_1_D)		F_(0, 0)	FM(RIF3_SYNC_B)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) FM(HRX2_C) F_(0, 0) F_(0, 0)
@@ -1414,7 +1414,6 @@ static const u16 pinmux_data[] = {
 
 	/* IPSR17 */
 	PINMUX_IPSR_MSEL(IP17_3_0,	AUDIO_CLKA_A,		SEL_ADG_A_0),
-	PINMUX_IPSR_GPSR(IP17_3_0,	CC5_OSCOUT),
 
 	PINMUX_IPSR_MSEL(IP17_7_4,	AUDIO_CLKB_B,		SEL_ADG_B_1),
 	PINMUX_IPSR_MSEL(IP17_7_4,	SCIF_CLK_A,		SEL_SCIF_0),
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 396ef8335bb8cfd8..af432fad37e8e131 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -357,7 +357,7 @@
 #define IP16_23_20	FM(SSI_SDATA7)		FM(HCTS2_N_B)	FM(MSIOF1_RXD_C)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN1_A)	FM(STP_ISEN_1_A)	FM(RIF1_D0_A)	FM(RIF3_D0_A)		F_(0, 0)	FM(TCLK2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP16_27_24	FM(SSI_SDATA8)		FM(HRTS2_N_B)	FM(MSIOF1_TXD_C)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC1_A)FM(STP_ISSYNC_1_A)	FM(RIF1_D1_A)	FM(RIF3_D1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP16_31_28	FM(SSI_SDATA9_A)	FM(HSCK2_B)	FM(MSIOF1_SS1_C)	FM(HSCK1_A)			FM(SSI_WS1_B)	FM(SCK1)	FM(STP_IVCXO27_1_A)	FM(SCK5_A)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP17_3_0	FM(AUDIO_CLKA_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	FM(CC5_OSCOUT)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP17_3_0	FM(AUDIO_CLKA_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP17_7_4	FM(AUDIO_CLKB_B)	FM(SCIF_CLK_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	F_(0, 0)	FM(STP_IVCXO27_1_D)	FM(REMOCON_A)	F_(0, 0)		F_(0, 0)	FM(TCLK1_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP17_11_8	FM(USB0_PWEN)		F_(0, 0)	F_(0, 0)		FM(SIM0_RST_C)			F_(0, 0)	FM(TS_SCK1_D)	FM(STP_ISCLK_1_D)	FM(BPFCLK_B)	FM(RIF3_CLK_B)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) FM(HSCK2_C) F_(0, 0) F_(0, 0)
 #define IP17_15_12	FM(USB0_OVC)		F_(0, 0)	F_(0, 0)		FM(SIM0_D_C)			F_(0, 0)	FM(TS_SDAT1_D)	FM(STP_ISD_1_D)		F_(0, 0)	FM(RIF3_SYNC_B)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) FM(HRX2_C) F_(0, 0) F_(0, 0)
@@ -1409,7 +1409,6 @@ static const u16 pinmux_data[] = {
 
 	/* IPSR17 */
 	PINMUX_IPSR_MSEL(IP17_3_0,	AUDIO_CLKA_A,		SEL_ADG_A_0),
-	PINMUX_IPSR_GPSR(IP17_3_0,	CC5_OSCOUT),
 
 	PINMUX_IPSR_MSEL(IP17_7_4,	AUDIO_CLKB_B,		SEL_ADG_B_1),
 	PINMUX_IPSR_MSEL(IP17_7_4,	SCIF_CLK_A,		SEL_SCIF_0),
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
index b1135c0dd8801796..68c4db041ecb09f2 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -172,7 +172,7 @@
 #define IP2_15_12	FM(DU_EXHSYNC_DU_HSYNC)		FM(HRX0)		F_(0, 0)	FM(A19)		FM(IRQ3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2_19_16	FM(DU_EXVSYNC_DU_VSYNC)		FM(MSIOF3_SCK)		F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2_23_20	FM(DU_EXODDF_DU_ODDF_DISP_CDE)	FM(MSIOF3_SYNC)		F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2_27_24	FM(IRQ0)			FM(CC5_OSCOUT)		F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2_27_24	FM(IRQ0)			F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2_31_28	FM(VI0_CLK)			FM(MSIOF2_SCK)		FM(SCK3)	F_(0, 0)	FM(HSCK3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_3_0		FM(VI0_CLKENB)			FM(MSIOF2_RXD)		FM(RX3)		FM(RD_WR_N)	FM(HCTS3_N)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_7_4		FM(VI0_HSYNC_N)			FM(MSIOF2_TXD)		FM(TX3)		F_(0, 0)	FM(HRTS3_N)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -471,7 +471,6 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP2_23_20,	MSIOF3_SYNC),
 
 	PINMUX_IPSR_GPSR(IP2_27_24,	IRQ0),
-	PINMUX_IPSR_GPSR(IP2_27_24,	CC5_OSCOUT),
 
 	PINMUX_IPSR_GPSR(IP2_31_28,	VI0_CLK),
 	PINMUX_IPSR_GPSR(IP2_31_28,	MSIOF2_SCK),
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
index f68ae75ba550b562..fad8e864cd67acdd 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -205,7 +205,7 @@
 #define IP2_15_12	FM(DU_EXHSYNC_DU_HSYNC)		FM(MSIOF3_SS2)		FM(GETHER_PHY_INT_B)	FM(A19)		FM(FXR_TXENA_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2_19_16	FM(DU_EXVSYNC_DU_VSYNC)		FM(MSIOF3_SCK)		F_(0, 0)		F_(0, 0)	FM(FXR_TXENB_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2_23_20	FM(DU_EXODDF_DU_ODDF_DISP_CDE)	FM(MSIOF3_SYNC)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2_27_24	FM(IRQ0)			FM(CC5_OSCOUT)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2_27_24	FM(IRQ0)			F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2_31_28	FM(VI0_CLK)			FM(MSIOF2_SCK)		FM(SCK3)		F_(0, 0)	FM(HSCK3)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_3_0		FM(VI0_CLKENB)			FM(MSIOF2_RXD)		FM(RX3)			FM(RD_WR_N)	FM(HCTS3_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_7_4		FM(VI0_HSYNC_N)			FM(MSIOF2_TXD)		FM(TX3)			F_(0, 0)	FM(HRTS3_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -555,7 +555,6 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP2_23_20,	MSIOF3_SYNC),
 
 	PINMUX_IPSR_GPSR(IP2_27_24,	IRQ0),
-	PINMUX_IPSR_GPSR(IP2_27_24,	CC5_OSCOUT),
 
 	PINMUX_IPSR_GPSR(IP2_31_28,	VI0_CLK),
 	PINMUX_IPSR_GPSR(IP2_31_28,	MSIOF2_SCK),
-- 
2.17.1

