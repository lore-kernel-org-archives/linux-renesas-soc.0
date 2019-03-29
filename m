Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB819C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86B40218A2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729576AbfC2P34 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 11:29:56 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:40936 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729564AbfC2P34 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 11:29:56 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id trVk1z0023XaVaC01rVkYb; Fri, 29 Mar 2019 16:29:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003Rx-8W; Fri, 29 Mar 2019 16:29:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003es-6k; Fri, 29 Mar 2019 16:29:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/8] pinctrl: sh-pfc: rcar-gen3: Rename RTS{0,1,3,4}# pin function definitions
Date:   Fri, 29 Mar 2019 16:29:40 +0100
Message-Id: <20190329152942.13995-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190329152942.13995-1-geert+renesas@glider.be>
References: <20190329152942.13995-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.50 of
Feb 12, 2019, the RTS{0,1,3,4}_#/TANS pin names defined in the GPSR and
IPSR registers are renamed to RTS{0,1,3,4}_#.
This patch updates the pin control drivers to reflect this.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Update R-Car H3 ES1.x, V3M, V3H, and D3]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 48 ++++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c    | 24 ++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c    | 32 ++++++++--------
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    | 36 +++++++++---------
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c    | 12 +++---
 5 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 0d74b9c7e93e8ed8..f16dfbad3f17988c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -154,11 +154,11 @@
 #define GPSR5_11	F_(RX2_A,		IP12_7_4)
 #define GPSR5_10	F_(TX2_A,		IP12_3_0)
 #define GPSR5_9		F_(SCK2,		IP11_31_28)
-#define GPSR5_8		F_(RTS1_N_TANS,		IP11_27_24)
+#define GPSR5_8		F_(RTS1_N,		IP11_27_24)
 #define GPSR5_7		F_(CTS1_N,		IP11_23_20)
 #define GPSR5_6		F_(TX1_A,		IP11_19_16)
 #define GPSR5_5		F_(RX1_A,		IP11_15_12)
-#define GPSR5_4		F_(RTS0_N_TANS,		IP11_11_8)
+#define GPSR5_4		F_(RTS0_N,		IP11_11_8)
 #define GPSR5_3		F_(CTS0_N,		IP11_7_4)
 #define GPSR5_2		F_(TX0,			IP11_3_0)
 #define GPSR5_1		F_(RX0,			IP10_31_28)
@@ -211,7 +211,7 @@
 #define IP0_11_8	FM(AVB_PHY_INT)		F_(0, 0)	FM(MSIOF2_SYNC_C)	FM(RX4_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_15_12	FM(AVB_LINK)		F_(0, 0)	FM(MSIOF2_SCK_C)	FM(TX4_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_19_16	FM(AVB_AVTP_MATCH_A)	F_(0, 0)	FM(MSIOF2_RXD_C)	FM(CTS4_N_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0_23_20	FM(AVB_AVTP_CAPTURE_A)	F_(0, 0)	FM(MSIOF2_TXD_C)	FM(RTS4_N_TANS_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0_23_20	FM(AVB_AVTP_CAPTURE_A)	F_(0, 0)	FM(MSIOF2_TXD_C)	FM(RTS4_N_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_27_24	FM(IRQ0)		FM(QPOLB)	F_(0, 0)		FM(DU_CDE)			FM(VI4_DATA0_B)	FM(CAN0_TX_B)	FM(CANFD0_TX_B)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_31_28	FM(IRQ1)		FM(QPOLA)	F_(0, 0)		FM(DU_DISP)			FM(VI4_DATA1_B)	FM(CAN0_RX_B)	FM(CANFD0_RX_B)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_3_0		FM(IRQ2)		FM(QCPV_QDE)	F_(0, 0)		FM(DU_EXODDF_DU_ODDF_DISP_CDE)	FM(VI4_DATA2_B)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		FM(PWM3_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -233,7 +233,7 @@
 #define IP2_27_24	FM(A7)			FM(LCDOUT23)	FM(MSIOF2_SS2_A)	FM(TX4_B)			FM(VI4_DATA15)	FM(VI5_DATA15)	FM(DU_DB7)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2_31_28	FM(A8)			FM(RX3_B)	FM(MSIOF2_SYNC_A)	FM(HRX4_B)			F_(0, 0)	F_(0, 0)	F_(0, 0)		FM(SDA6_A)	FM(AVB_AVTP_MATCH_B)	FM(PWM1_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_3_0		FM(A9)			F_(0, 0)	FM(MSIOF2_SCK_A)	FM(CTS4_N_B)			F_(0, 0)	FM(VI5_VSYNC_N)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3_7_4		FM(A10)			F_(0, 0)	FM(MSIOF2_RXD_A)	FM(RTS4_N_TANS_B)		F_(0, 0)	FM(VI5_HSYNC_N)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3_7_4		FM(A10)			F_(0, 0)	FM(MSIOF2_RXD_A)	FM(RTS4_N_B)			F_(0, 0)	FM(VI5_HSYNC_N)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_11_8	FM(A11)			FM(TX3_B)	FM(MSIOF2_TXD_A)	FM(HTX4_B)			FM(HSCK4)	FM(VI5_FIELD)	F_(0, 0)		FM(SCL6_A)	FM(AVB_AVTP_CAPTURE_B)	FM(PWM2_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_15_12	FM(A12)			FM(LCDOUT12)	FM(MSIOF3_SCK_C)	F_(0, 0)			FM(HRX4_A)	FM(VI5_DATA8)	FM(DU_DG4)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_19_16	FM(A13)			FM(LCDOUT13)	FM(MSIOF3_SYNC_C)	F_(0, 0)			FM(HTX4_A)	FM(VI5_DATA9)	FM(DU_DG5)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -249,7 +249,7 @@
 #define IP4_27_24	FM(RD_N)		F_(0, 0)	FM(MSIOF3_SYNC_D)	FM(RX3_A)			FM(HRX3_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(CAN0_TX_A)		FM(CANFD0_TX_A)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_31_28	FM(RD_WR_N)		F_(0, 0)	FM(MSIOF3_RXD_D)	FM(TX3_A)			FM(HTX3_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	FM(CAN0_RX_A)		FM(CANFD0_RX_A)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP5_3_0		FM(WE0_N)		F_(0, 0)	FM(MSIOF3_TXD_D)	FM(CTS3_N)			FM(HCTS3_N)	F_(0, 0)	F_(0, 0)		FM(SCL6_B)	FM(CAN_CLK)		F_(0, 0)	FM(IECLK_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP5_7_4		FM(WE1_N)		F_(0, 0)	FM(MSIOF3_SS1_D)	FM(RTS3_N_TANS)			FM(HRTS3_N)	F_(0, 0)	F_(0, 0)		FM(SDA6_B)	FM(CAN1_RX)		FM(CANFD1_RX)	FM(IERX_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP5_7_4		FM(WE1_N)		F_(0, 0)	FM(MSIOF3_SS1_D)	FM(RTS3_N)			FM(HRTS3_N)	F_(0, 0)	F_(0, 0)		FM(SDA6_B)	FM(CAN1_RX)		FM(CANFD1_RX)	FM(IERX_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP5_11_8	FM(EX_WAIT0_A)		FM(QCLK)	F_(0, 0)		F_(0, 0)			FM(VI4_CLK)	F_(0, 0)	FM(DU_DOTCLKOUT0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP5_15_12	FM(D0)			FM(MSIOF2_SS1_B)FM(MSIOF3_SCK_A)	F_(0, 0)			FM(VI4_DATA16)	FM(VI5_DATA0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP5_19_16	FM(D1)			FM(MSIOF2_SS2_B)FM(MSIOF3_SYNC_A)	F_(0, 0)			FM(VI4_DATA17)	FM(VI5_DATA1)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -262,7 +262,7 @@
 #define IP6_15_12	FM(D8)			FM(LCDOUT0)	FM(MSIOF2_SCK_D)	FM(SCK4_C)			FM(VI4_DATA0_A)	F_(0, 0)	FM(DU_DR0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_19_16	FM(D9)			FM(LCDOUT1)	FM(MSIOF2_SYNC_D)	F_(0, 0)			FM(VI4_DATA1_A)	F_(0, 0)	FM(DU_DR1)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_23_20	FM(D10)			FM(LCDOUT2)	FM(MSIOF2_RXD_D)	FM(HRX3_B)			FM(VI4_DATA2_A)	FM(CTS4_N_C)	FM(DU_DR2)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP6_27_24	FM(D11)			FM(LCDOUT3)	FM(MSIOF2_TXD_D)	FM(HTX3_B)			FM(VI4_DATA3_A)	FM(RTS4_N_TANS_C)FM(DU_DR3)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP6_27_24	FM(D11)			FM(LCDOUT3)	FM(MSIOF2_TXD_D)	FM(HTX3_B)			FM(VI4_DATA3_A)	FM(RTS4_N_C)	FM(DU_DR3)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_31_28	FM(D12)			FM(LCDOUT4)	FM(MSIOF2_SS1_D)	FM(RX4_C)			FM(VI4_DATA4_A)	F_(0, 0)	FM(DU_DR4)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_3_0		FM(D13)			FM(LCDOUT5)	FM(MSIOF2_SS2_D)	FM(TX4_C)			FM(VI4_DATA5_A)	F_(0, 0)	FM(DU_DR5)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_7_4		FM(D14)			FM(LCDOUT6)	FM(MSIOF3_SS1_A)	FM(HRX3_C)			FM(VI4_DATA6_A)	F_(0, 0)	FM(DU_DR6)		FM(SCL6_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -300,11 +300,11 @@
 #define IP10_31_28	FM(RX0)			FM(HRX1_B)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SCK0_C)	FM(STP_ISCLK_0_C)	FM(RIF0_D0_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_3_0	FM(TX0)			FM(HTX1_B)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC0_C)FM(STP_ISSYNC_0_C)	FM(RIF0_D1_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_7_4	FM(CTS0_N)		FM(HCTS1_N_B)	FM(MSIOF1_SYNC_B)	F_(0, 0)			F_(0, 0)	FM(TS_SPSYNC1_C)FM(STP_ISSYNC_1_C)	FM(RIF1_SYNC_B)	FM(AUDIO_CLKOUT_C)	FM(ADICS_SAMP)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_11_8	FM(RTS0_N_TANS)		FM(HRTS1_N_B)	FM(MSIOF1_SS1_B)	FM(AUDIO_CLKA_B)		FM(SCL2_A)	F_(0, 0)	FM(STP_IVCXO27_1_C)	FM(RIF0_SYNC_B)	F_(0, 0)		FM(ADICHS1)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_11_8	FM(RTS0_N)		FM(HRTS1_N_B)	FM(MSIOF1_SS1_B)	FM(AUDIO_CLKA_B)		FM(SCL2_A)	F_(0, 0)	FM(STP_IVCXO27_1_C)	FM(RIF0_SYNC_B)	F_(0, 0)		FM(ADICHS1)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_15_12	FM(RX1_A)		FM(HRX1_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SDAT0_C)	FM(STP_ISD_0_C)		FM(RIF1_CLK_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_19_16	FM(TX1_A)		FM(HTX1_A)	F_(0, 0)		F_(0, 0)			F_(0, 0)	FM(TS_SDEN0_C)	FM(STP_ISEN_0_C)	FM(RIF1_D0_C)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_23_20	FM(CTS1_N)		FM(HCTS1_N_A)	FM(MSIOF1_RXD_B)	F_(0, 0)			F_(0, 0)	FM(TS_SDEN1_C)	FM(STP_ISEN_1_C)	FM(RIF1_D0_B)	F_(0, 0)		FM(ADIDATA)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_27_24	FM(RTS1_N_TANS)		FM(HRTS1_N_A)	FM(MSIOF1_TXD_B)	F_(0, 0)			F_(0, 0)	FM(TS_SDAT1_C)	FM(STP_ISD_1_C)		FM(RIF1_D1_B)	F_(0, 0)		FM(ADICHS0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_27_24	FM(RTS1_N)		FM(HRTS1_N_A)	FM(MSIOF1_TXD_B)	F_(0, 0)			F_(0, 0)	FM(TS_SDAT1_C)	FM(STP_ISD_1_C)		FM(RIF1_D1_B)	F_(0, 0)		FM(ADICHS0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_31_28	FM(SCK2)		FM(SCIF_CLK_B)	FM(MSIOF1_SCK_B)	F_(0, 0)			F_(0, 0)	FM(TS_SCK1_C)	FM(STP_ISCLK_1_C)	FM(RIF1_CLK_B)	F_(0, 0)		FM(ADICLK)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_3_0	FM(TX2_A)		F_(0, 0)	F_(0, 0)		FM(SD2_CD_B)			FM(SCL1_A)	F_(0, 0)	FM(FMCLK_A)		FM(RIF1_D1_C)	F_(0, 0)		FM(FSO_CFE_0_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_7_4	FM(RX2_A)		F_(0, 0)	F_(0, 0)		FM(SD2_WP_B)			FM(SDA1_A)	F_(0, 0)	FM(FMIN_A)		FM(RIF1_SYNC_C)	F_(0, 0)		FM(FSO_CFE_1_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -617,7 +617,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, AVB_AVTP_CAPTURE_A,	I2C_SEL_5_0,	SEL_ETHERAVB_0),
 	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, MSIOF2_TXD_C,		I2C_SEL_5_0,	SEL_MSIOF2_2),
-	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, RTS4_N_TANS_A,		I2C_SEL_5_0,	SEL_SCIF4_0),
+	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, RTS4_N_A,		I2C_SEL_5_0,	SEL_SCIF4_0),
 	PINMUX_IPSR_PHYS(IP0_23_20,	SDA5,			I2C_SEL_5_1),
 
 	PINMUX_IPSR_GPSR(IP0_27_24,	IRQ0),
@@ -757,7 +757,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP3_7_4,	A10),
 	PINMUX_IPSR_MSEL(IP3_7_4,	MSIOF2_RXD_A,		SEL_MSIOF2_0),
-	PINMUX_IPSR_MSEL(IP3_7_4,	RTS4_N_TANS_B,		SEL_SCIF4_1),
+	PINMUX_IPSR_MSEL(IP3_7_4,	RTS4_N_B,		SEL_SCIF4_1),
 	PINMUX_IPSR_GPSR(IP3_7_4,	VI5_HSYNC_N),
 
 	PINMUX_IPSR_GPSR(IP3_11_8,	A11),
@@ -860,7 +860,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP5_7_4,	WE1_N),
 	PINMUX_IPSR_MSEL(IP5_7_4,	MSIOF3_SS1_D,		SEL_MSIOF3_3),
-	PINMUX_IPSR_GPSR(IP5_7_4,	RTS3_N_TANS),
+	PINMUX_IPSR_GPSR(IP5_7_4,	RTS3_N),
 	PINMUX_IPSR_GPSR(IP5_7_4,	HRTS3_N),
 	PINMUX_IPSR_MSEL(IP5_7_4,	SDA6_B,			SEL_I2C6_1),
 	PINMUX_IPSR_GPSR(IP5_7_4,	CAN1_RX),
@@ -941,7 +941,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP6_27_24,	MSIOF2_TXD_D,		SEL_MSIOF2_3),
 	PINMUX_IPSR_MSEL(IP6_27_24,	HTX3_B,			SEL_HSCIF3_1),
 	PINMUX_IPSR_MSEL(IP6_27_24,	VI4_DATA3_A,		SEL_VIN4_0),
-	PINMUX_IPSR_MSEL(IP6_27_24,	RTS4_N_TANS_C,		SEL_SCIF4_2),
+	PINMUX_IPSR_MSEL(IP6_27_24,	RTS4_N_C,		SEL_SCIF4_2),
 	PINMUX_IPSR_GPSR(IP6_27_24,	DU_DR3),
 
 	PINMUX_IPSR_GPSR(IP6_31_28,	D12),
@@ -1113,7 +1113,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP11_7_4,	AUDIO_CLKOUT_C,		SEL_ADG_2),
 	PINMUX_IPSR_GPSR(IP11_7_4,	ADICS_SAMP),
 
-	PINMUX_IPSR_GPSR(IP11_11_8,	RTS0_N_TANS),
+	PINMUX_IPSR_GPSR(IP11_11_8,	RTS0_N),
 	PINMUX_IPSR_MSEL(IP11_11_8,	HRTS1_N_B,		SEL_HSCIF1_1),
 	PINMUX_IPSR_MSEL(IP11_11_8,	MSIOF1_SS1_B,		SEL_MSIOF1_1),
 	PINMUX_IPSR_MSEL(IP11_11_8,	AUDIO_CLKA_B,		SEL_ADG_1),
@@ -1142,7 +1142,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP11_23_20,	RIF1_D0_B,		SEL_DRIF1_1),
 	PINMUX_IPSR_GPSR(IP11_23_20,	ADIDATA),
 
-	PINMUX_IPSR_GPSR(IP11_27_24,	RTS1_N_TANS),
+	PINMUX_IPSR_GPSR(IP11_27_24,	RTS1_N),
 	PINMUX_IPSR_MSEL(IP11_27_24,	HRTS1_N_A,		SEL_HSCIF1_0),
 	PINMUX_IPSR_MSEL(IP11_27_24,	MSIOF1_TXD_B,		SEL_MSIOF1_1),
 	PINMUX_IPSR_MSEL(IP11_27_24,	TS_SDAT1_C,		SEL_TSIF1_2),
@@ -3219,7 +3219,7 @@ static const unsigned int scif0_ctrl_pins[] = {
 	RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 3),
 };
 static const unsigned int scif0_ctrl_mux[] = {
-	RTS0_N_TANS_MARK, CTS0_N_MARK,
+	RTS0_N_MARK, CTS0_N_MARK,
 };
 /* - SCIF1 ------------------------------------------------------------------ */
 static const unsigned int scif1_data_a_pins[] = {
@@ -3241,7 +3241,7 @@ static const unsigned int scif1_ctrl_pins[] = {
 	RCAR_GP_PIN(5, 8), RCAR_GP_PIN(5, 7),
 };
 static const unsigned int scif1_ctrl_mux[] = {
-	RTS1_N_TANS_MARK, CTS1_N_MARK,
+	RTS1_N_MARK, CTS1_N_MARK,
 };
 
 static const unsigned int scif1_data_b_pins[] = {
@@ -3293,7 +3293,7 @@ static const unsigned int scif3_ctrl_pins[] = {
 	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
 };
 static const unsigned int scif3_ctrl_mux[] = {
-	RTS3_N_TANS_MARK, CTS3_N_MARK,
+	RTS3_N_MARK, CTS3_N_MARK,
 };
 static const unsigned int scif3_data_b_pins[] = {
 	/* RX, TX */
@@ -3322,7 +3322,7 @@ static const unsigned int scif4_ctrl_a_pins[] = {
 	RCAR_GP_PIN(2, 14), RCAR_GP_PIN(2, 13),
 };
 static const unsigned int scif4_ctrl_a_mux[] = {
-	RTS4_N_TANS_A_MARK, CTS4_N_A_MARK,
+	RTS4_N_A_MARK, CTS4_N_A_MARK,
 };
 static const unsigned int scif4_data_b_pins[] = {
 	/* RX, TX */
@@ -3343,7 +3343,7 @@ static const unsigned int scif4_ctrl_b_pins[] = {
 	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
 };
 static const unsigned int scif4_ctrl_b_mux[] = {
-	RTS4_N_TANS_B_MARK, CTS4_N_B_MARK,
+	RTS4_N_B_MARK, CTS4_N_B_MARK,
 };
 static const unsigned int scif4_data_c_pins[] = {
 	/* RX, TX */
@@ -3364,7 +3364,7 @@ static const unsigned int scif4_ctrl_c_pins[] = {
 	RCAR_GP_PIN(0, 11), RCAR_GP_PIN(0, 10),
 };
 static const unsigned int scif4_ctrl_c_mux[] = {
-	RTS4_N_TANS_C_MARK, CTS4_N_C_MARK,
+	RTS4_N_C_MARK, CTS4_N_C_MARK,
 };
 /* - SCIF5 ------------------------------------------------------------------ */
 static const unsigned int scif5_data_pins[] = {
@@ -5448,11 +5448,11 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(5,  3),  0, 3 },	/* CTS0 */
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL18", 0xe6060348) {
-		{ RCAR_GP_PIN(5,  4), 28, 3 },	/* RTS0_TANS */
+		{ RCAR_GP_PIN(5,  4), 28, 3 },	/* RTS0 */
 		{ RCAR_GP_PIN(5,  5), 24, 3 },	/* RX1 */
 		{ RCAR_GP_PIN(5,  6), 20, 3 },	/* TX1 */
 		{ RCAR_GP_PIN(5,  7), 16, 3 },	/* CTS1 */
-		{ RCAR_GP_PIN(5,  8), 12, 3 },	/* RTS1_TANS */
+		{ RCAR_GP_PIN(5,  8), 12, 3 },	/* RTS1 */
 		{ RCAR_GP_PIN(5,  9),  8, 3 },	/* SCK2 */
 		{ RCAR_GP_PIN(5, 10),  4, 3 },	/* TX2 */
 		{ RCAR_GP_PIN(5, 11),  0, 3 },	/* RX2 */
@@ -5700,11 +5700,11 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[13] = RCAR_GP_PIN(5,  1),	/* RX0 */
 		[14] = RCAR_GP_PIN(5,  2),	/* TX0 */
 		[15] = RCAR_GP_PIN(5,  3),	/* CTS0_N */
-		[16] = RCAR_GP_PIN(5,  4),	/* RTS0_N_TANS */
+		[16] = RCAR_GP_PIN(5,  4),	/* RTS0_N */
 		[17] = RCAR_GP_PIN(5,  5),	/* RX1_A */
 		[18] = RCAR_GP_PIN(5,  6),	/* TX1_A */
 		[19] = RCAR_GP_PIN(5,  7),	/* CTS1_N */
-		[20] = RCAR_GP_PIN(5,  8),	/* RTS1_N_TANS */
+		[20] = RCAR_GP_PIN(5,  8),	/* RTS1_N */
 		[21] = RCAR_GP_PIN(5,  9),	/* SCK2 */
 		[22] = RCAR_GP_PIN(5, 10),	/* TX2_A */
 		[23] = RCAR_GP_PIN(5, 11),	/* RX2_A */
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
index 68c4db041ecb09f2..6aa8f321a4b648bd 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -177,14 +177,14 @@
 #define IP3_3_0		FM(VI0_CLKENB)			FM(MSIOF2_RXD)		FM(RX3)		FM(RD_WR_N)	FM(HCTS3_N)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_7_4		FM(VI0_HSYNC_N)			FM(MSIOF2_TXD)		FM(TX3)		F_(0, 0)	FM(HRTS3_N)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_11_8	FM(VI0_VSYNC_N)			FM(MSIOF2_SYNC)		FM(CTS3_N)	F_(0, 0)	FM(HTX3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3_15_12	FM(VI0_DATA0)			FM(MSIOF2_SS1)		FM(RTS3_N_TANS)	F_(0, 0)	FM(HRX3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3_15_12	FM(VI0_DATA0)			FM(MSIOF2_SS1)		FM(RTS3_N)	F_(0, 0)	FM(HRX3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_19_16	FM(VI0_DATA1)			FM(MSIOF2_SS2)		FM(SCK1)	F_(0, 0)	FM(SPEEDIN_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_23_20	FM(VI0_DATA2)			FM(AVB0_AVTP_PPS)	FM(SDA3_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_27_24	FM(VI0_DATA3)			FM(HSCK1)		FM(SCL3_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_31_28	FM(VI0_DATA4)			FM(HRTS1_N)		FM(RX1_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_3_0		FM(VI0_DATA5)			FM(HCTS1_N)		FM(TX1_A)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_7_4		FM(VI0_DATA6)			FM(HTX1)		FM(CTS1_N)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP4_11_8	FM(VI0_DATA7)			FM(HRX1)		FM(RTS1_N_TANS)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP4_11_8	FM(VI0_DATA7)			FM(HRX1)		FM(RTS1_N)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_15_12	FM(VI0_DATA8)			FM(HSCK2)		FM(PWM0_A)	FM(A22)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_19_16	FM(VI0_DATA9)			FM(HCTS2_N)		FM(PWM1_A)	FM(A23)		FM(FSO_CFE_0_N_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_23_20	FM(VI0_DATA10)			FM(HRTS2_N)		FM(PWM2_A)	FM(A24)		FM(FSO_CFE_1_N_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -203,14 +203,14 @@
 #define IP6_11_8	FM(VI1_DATA6)			F_(0,0)			FM(RX4)		FM(D9)		FM(MMC_CLK)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_15_12	FM(VI1_DATA7)			F_(0,0)			FM(TX4)		FM(D10)		FM(MMC_D4)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_19_16	FM(VI1_DATA8)			F_(0,0)			FM(CTS4_N)	FM(D11)		FM(MMC_D5)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP6_23_20	FM(VI1_DATA9)			F_(0,0)			FM(RTS4_N_TANS)	FM(D12)		FM(MMC_D6)		FM(SCL3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP6_23_20	FM(VI1_DATA9)			F_(0,0)			FM(RTS4_N)	FM(D12)		FM(MMC_D6)		FM(SCL3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_27_24	FM(VI1_DATA10)			F_(0,0)			F_(0, 0)	FM(D13)		FM(MMC_D7)		FM(SDA3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_31_28	FM(VI1_DATA11)			FM(SCL4)		FM(IRQ4)	FM(D14)		FM(MMC_WP)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_3_0		FM(VI1_FIELD)			FM(SDA4)		FM(IRQ5)	FM(D15)		FM(MMC_CD)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_7_4		FM(SCL0)			FM(DU_DR0)		FM(TPU0TO0)	FM(CLKOUT)	F_(0, 0)		FM(MSIOF0_RXD)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_11_8	FM(SDA0)			FM(DU_DR1)		FM(TPU0TO1)	FM(BS_N)	FM(SCK0)		FM(MSIOF0_TXD)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_15_12	FM(SCL1)			FM(DU_DG0)		FM(TPU0TO2)	FM(RD_N)	FM(CTS0_N)		FM(MSIOF0_SCK)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP7_19_16	FM(SDA1)			FM(DU_DG1)		FM(TPU0TO3)	FM(WE0_N)	FM(RTS0_N_TANS)		FM(MSIOF0_SYNC)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP7_19_16	FM(SDA1)			FM(DU_DG1)		FM(TPU0TO3)	FM(WE0_N)	FM(RTS0_N)		FM(MSIOF0_SYNC)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_23_20	FM(SCL2)			FM(DU_DB0)		FM(TCLK1_A)	FM(WE1_N)	FM(RX0)			FM(MSIOF0_SS1)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_27_24	FM(SDA2)			FM(DU_DB1)		FM(TCLK2_A)	FM(EX_WAIT0)	FM(TX0)			FM(MSIOF0_SS2)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_31_28	FM(AVB0_AVTP_CAPTURE)		F_(0, 0)		F_(0, 0)	F_(0, 0)	FM(FSCLKST2_N_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -496,7 +496,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP3_15_12,	VI0_DATA0),
 	PINMUX_IPSR_GPSR(IP3_15_12,	MSIOF2_SS1),
-	PINMUX_IPSR_GPSR(IP3_15_12,	RTS3_N_TANS),
+	PINMUX_IPSR_GPSR(IP3_15_12,	RTS3_N),
 	PINMUX_IPSR_GPSR(IP3_15_12,	HRX3),
 
 	PINMUX_IPSR_GPSR(IP3_19_16,	VI0_DATA1),
@@ -527,7 +527,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP4_11_8,	VI0_DATA7),
 	PINMUX_IPSR_GPSR(IP4_11_8,	HRX1),
-	PINMUX_IPSR_GPSR(IP4_11_8,	RTS1_N_TANS),
+	PINMUX_IPSR_GPSR(IP4_11_8,	RTS1_N),
 
 	PINMUX_IPSR_GPSR(IP4_15_12,	VI0_DATA8),
 	PINMUX_IPSR_GPSR(IP4_15_12,	HSCK2),
@@ -617,7 +617,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP6_19_16,	MMC_D5),
 
 	PINMUX_IPSR_GPSR(IP6_23_20,	VI1_DATA9),
-	PINMUX_IPSR_GPSR(IP6_23_20,	RTS4_N_TANS),
+	PINMUX_IPSR_GPSR(IP6_23_20,	RTS4_N),
 	PINMUX_IPSR_GPSR(IP6_23_20,	D12),
 	PINMUX_IPSR_GPSR(IP6_23_20,	MMC_D6),
 	PINMUX_IPSR_MSEL(IP6_23_20,	SCL3_B,	SEL_I2C3_1),
@@ -664,7 +664,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP7_19_16,	DU_DG1),
 	PINMUX_IPSR_GPSR(IP7_19_16,	TPU0TO3),
 	PINMUX_IPSR_GPSR(IP7_19_16,	WE0_N),
-	PINMUX_IPSR_GPSR(IP7_19_16,	RTS0_N_TANS),
+	PINMUX_IPSR_GPSR(IP7_19_16,	RTS0_N),
 	PINMUX_IPSR_GPSR(IP7_19_16,	MSIOF0_SYNC),
 
 	PINMUX_IPSR_GPSR(IP7_23_20,	SCL2),
@@ -1468,7 +1468,7 @@ static const unsigned int scif0_ctrl_pins[] = {
 	RCAR_GP_PIN(4, 3), RCAR_GP_PIN(4, 2),
 };
 static const unsigned int scif0_ctrl_mux[] = {
-	RTS0_N_TANS_MARK, CTS0_N_MARK,
+	RTS0_N_MARK, CTS0_N_MARK,
 };
 
 /* - SCIF1 ------------------------------------------------------------------ */
@@ -1491,7 +1491,7 @@ static const unsigned int scif1_ctrl_pins[] = {
 	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 10),
 };
 static const unsigned int scif1_ctrl_mux[] = {
-	RTS1_N_TANS_MARK, CTS1_N_MARK,
+	RTS1_N_MARK, CTS1_N_MARK,
 };
 static const unsigned int scif1_data_b_pins[] = {
 	/* RX, TX */
@@ -1521,7 +1521,7 @@ static const unsigned int scif3_ctrl_pins[] = {
 	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 3),
 };
 static const unsigned int scif3_ctrl_mux[] = {
-	RTS3_N_TANS_MARK, CTS3_N_MARK,
+	RTS3_N_MARK, CTS3_N_MARK,
 };
 
 /* - SCIF4 ------------------------------------------------------------------ */
@@ -1544,7 +1544,7 @@ static const unsigned int scif4_ctrl_pins[] = {
 	RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 12),
 };
 static const unsigned int scif4_ctrl_mux[] = {
-	RTS4_N_TANS_MARK, CTS4_N_MARK,
+	RTS4_N_MARK, CTS4_N_MARK,
 };
 
 /* - TMU -------------------------------------------------------------------- */
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
index fad8e864cd67acdd..473da65890a7086c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -187,7 +187,7 @@
 #define IP0_7_4		FM(DU_DR3)			FM(RX4)			FM(GETHER_RMII_RX_ER)	FM(A1)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_11_8	FM(DU_DR4)			FM(TX4)			FM(GETHER_RMII_RXD0)	FM(A2)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_15_12	FM(DU_DR5)			FM(CTS4_N)		FM(GETHER_RMII_RXD1)	FM(A3)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0_19_16	FM(DU_DR6)			FM(RTS4_N_TANS)		FM(GETHER_RMII_TXD_EN)	FM(A4)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0_19_16	FM(DU_DR6)			FM(RTS4_N)		FM(GETHER_RMII_TXD_EN)	FM(A4)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_23_20	FM(DU_DR7)			F_(0, 0)		FM(GETHER_RMII_TXD0)	FM(A5)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_27_24	FM(DU_DG2)			F_(0, 0)		FM(GETHER_RMII_TXD1)	FM(A6)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_31_28	FM(DU_DG3)			FM(CPG_CPCKOUT)		FM(GETHER_RMII_REFCLK)	FM(A7)		FM(PWMFSW0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -210,14 +210,14 @@
 #define IP3_3_0		FM(VI0_CLKENB)			FM(MSIOF2_RXD)		FM(RX3)			FM(RD_WR_N)	FM(HCTS3_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_7_4		FM(VI0_HSYNC_N)			FM(MSIOF2_TXD)		FM(TX3)			F_(0, 0)	FM(HRTS3_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_11_8	FM(VI0_VSYNC_N)			FM(MSIOF2_SYNC)		FM(CTS3_N)		F_(0, 0)	FM(HTX3)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3_15_12	FM(VI0_DATA0)			FM(MSIOF2_SS1)		FM(RTS3_N_TANS)		F_(0, 0)	FM(HRX3)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3_15_12	FM(VI0_DATA0)			FM(MSIOF2_SS1)		FM(RTS3_N)		F_(0, 0)	FM(HRX3)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_19_16	FM(VI0_DATA1)			FM(MSIOF2_SS2)		FM(SCK1)		F_(0, 0)	FM(SPEEDIN_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_23_20	FM(VI0_DATA2)			FM(AVB_AVTP_PPS)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_27_24	FM(VI0_DATA3)			FM(HSCK1)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_31_28	FM(VI0_DATA4)			FM(HRTS1_N)		FM(RX1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_3_0		FM(VI0_DATA5)			FM(HCTS1_N)		FM(TX1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_7_4		FM(VI0_DATA6)			FM(HTX1)		FM(CTS1_N)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP4_11_8	FM(VI0_DATA7)			FM(HRX1)		FM(RTS1_N_TANS)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP4_11_8	FM(VI0_DATA7)			FM(HRX1)		FM(RTS1_N)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_15_12	FM(VI0_DATA8)			FM(HSCK2)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_19_16	FM(VI0_DATA9)			FM(HCTS2_N)		FM(PWM1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP4_23_20	FM(VI0_DATA10)			FM(HRTS2_N)		FM(PWM2_A)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -243,7 +243,7 @@
 #define IP7_7_4		FM(SCL0)			F_(0, 0)		F_(0, 0)		FM(CLKOUT)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_11_8	FM(SDA0)			F_(0, 0)		F_(0, 0)		FM(BS_N)	FM(SCK0)	FM(HSCK0_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_15_12	FM(SCL1)			F_(0, 0)		FM(TPU0TO2)		FM(RD_N)	FM(CTS0_N)	FM(HCTS0_N_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP7_19_16	FM(SDA1)			F_(0, 0)		FM(TPU0TO3)		FM(WE0_N)	FM(RTS0_N_TANS)	FM(HRTS0_N_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP7_19_16	FM(SDA1)			F_(0, 0)		FM(TPU0TO3)		FM(WE0_N)	FM(RTS0_N)	FM(HRTS0_N_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_23_20	FM(SCL2)			F_(0, 0)		F_(0, 0)		FM(WE1_N)	FM(RX0)		FM(HRX0_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_27_24	FM(SDA2)			F_(0, 0)		F_(0, 0)		FM(EX_WAIT0)	FM(TX0)		FM(HTX0_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_31_28	FM(AVB_AVTP_MATCH)		FM(TPU0TO0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -470,7 +470,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP0_15_12,	A3),
 
 	PINMUX_IPSR_GPSR(IP0_19_16,	DU_DR6),
-	PINMUX_IPSR_GPSR(IP0_19_16,	RTS4_N_TANS),
+	PINMUX_IPSR_GPSR(IP0_19_16,	RTS4_N),
 	PINMUX_IPSR_GPSR(IP0_19_16,	GETHER_RMII_TXD_EN),
 	PINMUX_IPSR_GPSR(IP0_19_16,	A4),
 
@@ -580,7 +580,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP3_15_12,	VI0_DATA0),
 	PINMUX_IPSR_GPSR(IP3_15_12,	MSIOF2_SS1),
-	PINMUX_IPSR_GPSR(IP3_15_12,	RTS3_N_TANS),
+	PINMUX_IPSR_GPSR(IP3_15_12,	RTS3_N),
 	PINMUX_IPSR_GPSR(IP3_15_12,	HRX3),
 
 	PINMUX_IPSR_GPSR(IP3_19_16,	VI0_DATA1),
@@ -609,7 +609,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP4_11_8,	VI0_DATA7),
 	PINMUX_IPSR_GPSR(IP4_11_8,	HRX1),
-	PINMUX_IPSR_GPSR(IP4_11_8,	RTS1_N_TANS),
+	PINMUX_IPSR_GPSR(IP4_11_8,	RTS1_N),
 
 	PINMUX_IPSR_GPSR(IP4_15_12,	VI0_DATA8),
 	PINMUX_IPSR_GPSR(IP4_15_12,	HSCK2),
@@ -728,7 +728,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP7_19_16,	SDA1),
 	PINMUX_IPSR_GPSR(IP7_19_16,	TPU0TO3),
 	PINMUX_IPSR_GPSR(IP7_19_16,	WE0_N),
-	PINMUX_IPSR_GPSR(IP7_19_16,	RTS0_N_TANS),
+	PINMUX_IPSR_GPSR(IP7_19_16,	RTS0_N),
 	PINMUX_IPSR_MSEL(IP1_23_20,	HRTS0_N_B, SEL_HSCIF0_1),
 
 	PINMUX_IPSR_GPSR(IP7_23_20,	SCL2),
@@ -1726,11 +1726,11 @@ static const unsigned int scif0_clk_mux[] = {
 	SCK0_MARK,
 };
 static const unsigned int scif0_ctrl_pins[] = {
-	/* RTS0#/TANS, CTS0# */
+	/* RTS0#, CTS0# */
 	RCAR_GP_PIN(4, 3), RCAR_GP_PIN(4, 2),
 };
 static const unsigned int scif0_ctrl_mux[] = {
-	RTS0_N_TANS_MARK, CTS0_N_MARK,
+	RTS0_N_MARK, CTS0_N_MARK,
 };
 
 /* - SCIF1 ------------------------------------------------------------------ */
@@ -1749,11 +1749,11 @@ static const unsigned int scif1_clk_mux[] = {
 	SCK1_MARK,
 };
 static const unsigned int scif1_ctrl_pins[] = {
-	/* RTS1#/TANS, CTS1# */
+	/* RTS1#, CTS1# */
 	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 10),
 };
 static const unsigned int scif1_ctrl_mux[] = {
-	RTS1_N_TANS_MARK, CTS1_N_MARK,
+	RTS1_N_MARK, CTS1_N_MARK,
 };
 static const unsigned int scif1_data_b_pins[] = {
 	/* RX1, TX1 */
@@ -1779,11 +1779,11 @@ static const unsigned int scif3_clk_mux[] = {
 	SCK3_MARK,
 };
 static const unsigned int scif3_ctrl_pins[] = {
-	/* RTS3#/TANS, CTS3# */
+	/* RTS3#, CTS3# */
 	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 3),
 };
 static const unsigned int scif3_ctrl_mux[] = {
-	RTS3_N_TANS_MARK, CTS3_N_MARK,
+	RTS3_N_MARK, CTS3_N_MARK,
 };
 
 /* - SCIF4 ------------------------------------------------------------------ */
@@ -1802,11 +1802,11 @@ static const unsigned int scif4_clk_mux[] = {
 	SCK4_MARK,
 };
 static const unsigned int scif4_ctrl_pins[] = {
-	/* RTS4#/TANS, CTS4# */
+	/* RTS4#, CTS4# */
 	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 3),
 };
 static const unsigned int scif4_ctrl_mux[] = {
-	RTS4_N_TANS_MARK, CTS4_N_MARK,
+	RTS4_N_MARK, CTS4_N_MARK,
 };
 
 /* - SCIF Clock ------------------------------------------------------------- */
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 9ca002b6173c1447..ff6db925f9cc2616 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -2,7 +2,7 @@
 /*
  * R8A77990 processor support - PFC hardware block.
  *
- * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018-2019 Renesas Electronics Corp.
  *
  * This file is based on the drivers/pinctrl/sh-pfc/pfc-r8a7796.c
  *
@@ -166,7 +166,7 @@
 #define GPSR5_7		F_(SCK2_A,		IP12_7_4)
 #define GPSR5_6		F_(TX1,			IP12_3_0)
 #define GPSR5_5		F_(RX1,			IP11_31_28)
-#define GPSR5_4		F_(RTS0_N_TANS_A,	IP11_23_20)
+#define GPSR5_4		F_(RTS0_N_A,		IP11_23_20)
 #define GPSR5_3		F_(CTS0_N_A,		IP11_19_16)
 #define GPSR5_2		F_(TX0_A,		IP11_15_12)
 #define GPSR5_1		F_(RX0_A,		IP11_11_8)
@@ -220,7 +220,7 @@
 #define IP3_3_0		FM(A1)			FM(IRQ1)		FM(PWM3_A)		FM(DU_DOTCLKIN1)	FM(VI5_DATA0_A)		FM(DU_DISP_CDE) FM(SDA6_B)	FM(IETX)	FM(QCPV_QDE)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_7_4		FM(A2)			FM(IRQ2)		FM(AVB_AVTP_PPS)	FM(VI4_CLKENB)		FM(VI5_DATA1_A)		FM(DU_DISP)	FM(SCL6_B)	F_(0, 0)	FM(QSTVB_QVE)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_11_8	FM(A3)			FM(CTS4_N_A)		FM(PWM4_A)		FM(VI4_DATA12)		F_(0, 0)		FM(DU_DOTCLKOUT0) FM(HTX3_D)	FM(IECLK)	FM(LCDOUT12)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3_15_12	FM(A4)			FM(RTS4_N_TANS_A)	FM(MSIOF3_SYNC_B)	FM(VI4_DATA8)		FM(PWM2_B)		FM(DU_DG4)	FM(RIF2_CLK_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3_15_12	FM(A4)			FM(RTS4_N_A)		FM(MSIOF3_SYNC_B)	FM(VI4_DATA8)		FM(PWM2_B)		FM(DU_DG4)	FM(RIF2_CLK_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_19_16	FM(A5)			FM(SCK4_A)		FM(MSIOF3_SCK_B)	FM(VI4_DATA9)		FM(PWM3_B)		F_(0, 0)	FM(RIF2_SYNC_B)	F_(0, 0)	FM(QPOLA)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_23_20	FM(A6)			FM(RX4_A)		FM(MSIOF3_RXD_B)	FM(VI4_DATA10)		F_(0, 0)		F_(0, 0)	FM(RIF2_D0_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3_27_24	FM(A7)			FM(TX4_A)		FM(MSIOF3_TXD_B)	FM(VI4_DATA11)		F_(0, 0)		F_(0, 0)	FM(RIF2_D1_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -241,10 +241,10 @@
 #define IP5_15_12	FM(CS0_N)		FM(SCL5)		F_(0, 0)		F_(0, 0)		F_(0, 0)		FM(DU_DR0)	FM(VI4_DATA2_B)	F_(0, 0)	FM(LCDOUT16)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP5_19_16	FM(WE0_N)		FM(SDA5)		F_(0, 0)		F_(0, 0)		F_(0, 0)		FM(DU_DR1)	FM(VI4_DATA3_B)	F_(0, 0)	FM(LCDOUT17)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP5_23_20	FM(D0)			FM(MSIOF3_SCK_A)	F_(0, 0)		F_(0, 0)		F_(0, 0)		FM(DU_DR2)	FM(CTS4_N_C)	F_(0, 0)	FM(LCDOUT18)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP5_27_24	FM(D1)			FM(MSIOF3_SYNC_A)	FM(SCK3_A)		FM(VI4_DATA23)		FM(VI5_CLKENB_A)	FM(DU_DB7)	FM(RTS4_N_TANS_C) F_(0, 0)	FM(LCDOUT7)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP5_27_24	FM(D1)			FM(MSIOF3_SYNC_A)	FM(SCK3_A)		FM(VI4_DATA23)		FM(VI5_CLKENB_A)	FM(DU_DB7)	FM(RTS4_N_C)	F_(0, 0)	FM(LCDOUT7)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP5_31_28	FM(D2)			FM(MSIOF3_RXD_A)	FM(RX5_C)		F_(0, 0)		FM(VI5_DATA14_A)	FM(DU_DR3)	FM(RX4_C)	F_(0, 0)	FM(LCDOUT19)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_3_0		FM(D3)			FM(MSIOF3_TXD_A)	FM(TX5_C)		F_(0, 0)		FM(VI5_DATA15_A)	FM(DU_DR4)	FM(TX4_C)	F_(0, 0)	FM(LCDOUT20)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP6_7_4		FM(D4)			FM(CANFD1_TX)		FM(HSCK3_B)		FM(CAN1_TX)		FM(RTS3_N_TANS_A)	FM(MSIOF3_SS2_A) F_(0, 0)	FM(VI5_DATA1_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP6_7_4		FM(D4)			FM(CANFD1_TX)		FM(HSCK3_B)		FM(CAN1_TX)		FM(RTS3_N_A)		FM(MSIOF3_SS2_A) F_(0, 0)	FM(VI5_DATA1_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_11_8	FM(D5)			FM(RX3_A)		FM(HRX3_B)		F_(0, 0)		F_(0, 0)		FM(DU_DR5)	FM(VI4_DATA4_B)	F_(0, 0)	FM(LCDOUT21)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_15_12	FM(D6)			FM(TX3_A)		FM(HTX3_B)		F_(0, 0)		F_(0, 0)		FM(DU_DR6)	FM(VI4_DATA5_B)	F_(0, 0)	FM(LCDOUT22)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_19_16	FM(D7)			FM(CANFD1_RX)		FM(IRQ5)		FM(CAN1_RX)		FM(CTS3_N_A)		F_(0, 0)	F_(0, 0)	FM(VI5_DATA2_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -290,8 +290,8 @@
 #define IP11_11_8	FM(RX0_A)		FM(HRX1_A)		FM(SSI_SCK2_A)		FM(RIF1_SYNC)		F_(0, 0)		F_(0, 0)	F_(0, 0)	FM(TS_SCK1)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_15_12	FM(TX0_A)		FM(HTX1_A)		FM(SSI_WS2_A)		FM(RIF1_D0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	FM(TS_SDAT1)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_19_16	FM(CTS0_N_A)		FM(NFDATA14_A)		FM(AUDIO_CLKOUT_A)	FM(RIF1_D1)		FM(SCIF_CLK_A)		FM(FMCLK_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_23_20	FM(RTS0_N_TANS_A)	FM(NFDATA15_A)		FM(AUDIO_CLKOUT1_A)	FM(RIF1_CLK)		FM(SCL2_A)		FM(FMIN_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_27_24	FM(SCK0_A)		FM(HSCK1_A)		FM(USB3HS0_ID)		FM(RTS1_N_TANS)		FM(SDA2_A)		FM(FMCLK_C)	F_(0, 0)	F_(0, 0)	FM(USB0_ID)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_23_20	FM(RTS0_N_A)		FM(NFDATA15_A)		FM(AUDIO_CLKOUT1_A)	FM(RIF1_CLK)		FM(SCL2_A)		FM(FMIN_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_27_24	FM(SCK0_A)		FM(HSCK1_A)		FM(USB3HS0_ID)		FM(RTS1_N)		FM(SDA2_A)		FM(FMCLK_C)	F_(0, 0)	F_(0, 0)	FM(USB0_ID)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_31_28	FM(RX1)			FM(HRX2_B)		FM(SSI_SCK9_B)		FM(AUDIO_CLKOUT1_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IPSRx */		/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */		/* 8 */		/* 9 - F */
@@ -669,7 +669,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP3_11_8,		LCDOUT12),
 
 	PINMUX_IPSR_GPSR(IP3_15_12,		A4),
-	PINMUX_IPSR_MSEL(IP3_15_12,		RTS4_N_TANS_A,	SEL_SCIF4_0),
+	PINMUX_IPSR_MSEL(IP3_15_12,		RTS4_N_A,	SEL_SCIF4_0),
 	PINMUX_IPSR_MSEL(IP3_15_12,		MSIOF3_SYNC_B,	SEL_MSIOF3_1),
 	PINMUX_IPSR_GPSR(IP3_15_12,		VI4_DATA8),
 	PINMUX_IPSR_MSEL(IP3_15_12,		PWM2_B,		SEL_PWM2_1),
@@ -819,7 +819,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP5_27_24,		VI4_DATA23),
 	PINMUX_IPSR_MSEL(IP5_27_24,		VI5_CLKENB_A,	SEL_VIN5_0),
 	PINMUX_IPSR_GPSR(IP5_27_24,		DU_DB7),
-	PINMUX_IPSR_MSEL(IP5_27_24,		RTS4_N_TANS_C,	SEL_SCIF4_2),
+	PINMUX_IPSR_MSEL(IP5_27_24,		RTS4_N_C,	SEL_SCIF4_2),
 	PINMUX_IPSR_GPSR(IP5_27_24,		LCDOUT7),
 
 	PINMUX_IPSR_GPSR(IP5_31_28,		D2),
@@ -843,7 +843,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP6_7_4,		CANFD1_TX),
 	PINMUX_IPSR_MSEL(IP6_7_4,		HSCK3_B,	SEL_HSCIF3_1),
 	PINMUX_IPSR_GPSR(IP6_7_4,		CAN1_TX),
-	PINMUX_IPSR_MSEL(IP6_7_4,		RTS3_N_TANS_A,	SEL_SCIF3_0),
+	PINMUX_IPSR_MSEL(IP6_7_4,		RTS3_N_A,	SEL_SCIF3_0),
 	PINMUX_IPSR_GPSR(IP6_7_4,		MSIOF3_SS2_A),
 	PINMUX_IPSR_MSEL(IP6_7_4,		VI5_DATA1_B,	SEL_VIN5_1),
 
@@ -1084,7 +1084,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP11_19_16,		SCIF_CLK_A,	SEL_SCIF_0),
 	PINMUX_IPSR_MSEL(IP11_19_16,		FMCLK_A,	SEL_FM_0),
 
-	PINMUX_IPSR_MSEL(IP11_23_20,		RTS0_N_TANS_A,	SEL_SCIF0_0),
+	PINMUX_IPSR_MSEL(IP11_23_20,		RTS0_N_A,	SEL_SCIF0_0),
 	PINMUX_IPSR_MSEL(IP11_23_20,		NFDATA15_A,	SEL_NDFC_0),
 	PINMUX_IPSR_GPSR(IP11_23_20,		AUDIO_CLKOUT1_A),
 	PINMUX_IPSR_GPSR(IP11_23_20,		RIF1_CLK),
@@ -1094,7 +1094,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP11_27_24,		SCK0_A,		SEL_SCIF0_0),
 	PINMUX_IPSR_MSEL(IP11_27_24,		HSCK1_A,	SEL_HSCIF1_0),
 	PINMUX_IPSR_GPSR(IP11_27_24,		USB3HS0_ID),
-	PINMUX_IPSR_GPSR(IP11_27_24,		RTS1_N_TANS),
+	PINMUX_IPSR_GPSR(IP11_27_24,		RTS1_N),
 	PINMUX_IPSR_MSEL(IP11_27_24,		SDA2_A,		SEL_I2C2_0),
 	PINMUX_IPSR_MSEL(IP11_27_24,		FMCLK_C,	SEL_FM_2),
 	PINMUX_IPSR_GPSR(IP11_27_24,		USB0_ID),
@@ -2837,7 +2837,7 @@ static const unsigned int scif0_ctrl_a_pins[] = {
 };
 
 static const unsigned int scif0_ctrl_a_mux[] = {
-	RTS0_N_TANS_A_MARK, CTS0_N_A_MARK,
+	RTS0_N_A_MARK, CTS0_N_A_MARK,
 };
 
 static const unsigned int scif0_data_b_pins[] = {
@@ -2883,7 +2883,7 @@ static const unsigned int scif1_ctrl_pins[] = {
 };
 
 static const unsigned int scif1_ctrl_mux[] = {
-	RTS1_N_TANS_MARK, CTS1_N_MARK,
+	RTS1_N_MARK, CTS1_N_MARK,
 };
 
 /* - SCIF2 ------------------------------------------------------------------ */
@@ -2939,7 +2939,7 @@ static const unsigned int scif3_ctrl_a_pins[] = {
 };
 
 static const unsigned int scif3_ctrl_a_mux[] = {
-	RTS3_N_TANS_A_MARK, CTS3_N_A_MARK,
+	RTS3_N_A_MARK, CTS3_N_A_MARK,
 };
 
 static const unsigned int scif3_data_b_pins[] = {
@@ -2994,7 +2994,7 @@ static const unsigned int scif4_ctrl_a_pins[] = {
 };
 
 static const unsigned int scif4_ctrl_a_mux[] = {
-	RTS4_N_TANS_A_MARK, CTS4_N_A_MARK,
+	RTS4_N_A_MARK, CTS4_N_A_MARK,
 };
 
 static const unsigned int scif4_data_b_pins[] = {
@@ -3030,7 +3030,7 @@ static const unsigned int scif4_ctrl_c_pins[] = {
 };
 
 static const unsigned int scif4_ctrl_c_mux[] = {
-	RTS4_N_TANS_C_MARK, CTS4_N_C_MARK,
+	RTS4_N_C_MARK, CTS4_N_C_MARK,
 };
 
 /* - SCIF5 ------------------------------------------------------------------ */
@@ -5126,7 +5126,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	} },
 	{ PINMUX_BIAS_REG("PUEN3", 0xe606040c, "PUD3", 0xe606044c) {
 		 [0] = RCAR_GP_PIN(5,  0),	/* SCK0_A */
-		 [1] = RCAR_GP_PIN(5,  4),	/* RTS0#/TANS_A */
+		 [1] = RCAR_GP_PIN(5,  4),	/* RTS0#_A */
 		 [2] = RCAR_GP_PIN(5,  3),	/* CTS0#_A */
 		 [3] = RCAR_GP_PIN(5,  2),	/* TX0_A */
 		 [4] = RCAR_GP_PIN(5,  1),	/* RX0_A */
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 40fbb05401f688f0..dd87085d48cb8798 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -288,7 +288,7 @@
 #define IP10_23_20	FM(SSI_SDATA4_A)	FM(HTX0)		FM(SCL2_A)		FM(CAN1_RX_B)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP10_27_24	FM(SSI_WS4_A)		FM(HRX0)		FM(SDA2_A)		FM(CAN1_TX_B)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP10_31_28	FM(SCL1)		FM(CTS1_N)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_3_0	FM(SDA1)		FM(RTS1_N_TANS)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_3_0	FM(SDA1)		FM(RTS1_N)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_7_4	FM(MSIOF1_SCK)		FM(AVB0_AVTP_PPS_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_11_8	FM(MSIOF1_TXD)		FM(AVB0_AVTP_CAPTURE_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_15_12	FM(MSIOF1_RXD)		FM(AVB0_AVTP_MATCH_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -299,7 +299,7 @@
 
 /* IPSRx */		/* 0 */			/* 1 */			/* 2 */			/* 3 */		/* 4 */			/* 5 */		/* 6  - F */
 #define IP12_3_0	FM(RX1_A)		FM(CTS0_N)		FM(TPU0TO0_B)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP12_7_4	FM(TX1_A)		FM(RTS0_N_TANS)		FM(TPU0TO1_B)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP12_7_4	FM(TX1_A)		FM(RTS0_N)		FM(TPU0TO1_B)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_11_8	FM(SCK2)		FM(MSIOF1_SS1)		FM(TPU0TO3_B)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_15_12	FM(TPU0TO0_A)		FM(AVB0_AVTP_CAPTURE_A)	FM(HCTS0_N)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP12_19_16	FM(TPU0TO1_A)		FM(AVB0_AVTP_MATCH_A)	FM(HRTS0_N)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -858,7 +858,7 @@ static const u16 pinmux_data[] = {
 
 	/* IPSR11 */
 	PINMUX_IPSR_GPSR(IP11_3_0,	SDA1),
-	PINMUX_IPSR_GPSR(IP11_3_0,	RTS1_N_TANS),
+	PINMUX_IPSR_GPSR(IP11_3_0,	RTS1_N),
 
 	PINMUX_IPSR_GPSR(IP11_7_4,	MSIOF1_SCK),
 	PINMUX_IPSR_MSEL(IP11_7_4,	AVB0_AVTP_PPS_B, SEL_ETHERAVB_1),
@@ -893,7 +893,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP12_3_0,	TPU0TO0_B),
 
 	PINMUX_IPSR_MSEL(IP12_7_4,	TX1_A, SEL_SCIF1_0),
-	PINMUX_IPSR_GPSR(IP12_7_4,	RTS0_N_TANS),
+	PINMUX_IPSR_GPSR(IP12_7_4,	RTS0_N),
 	PINMUX_IPSR_GPSR(IP12_7_4,	TPU0TO1_B),
 
 	PINMUX_IPSR_GPSR(IP12_11_8,	SCK2),
@@ -1705,7 +1705,7 @@ static const unsigned int scif0_ctrl_pins[] = {
 	RCAR_GP_PIN(4, 24), RCAR_GP_PIN(4, 23),
 };
 static const unsigned int scif0_ctrl_mux[] = {
-	RTS0_N_TANS_MARK, CTS0_N_MARK,
+	RTS0_N_MARK, CTS0_N_MARK,
 };
 /* - SCIF1 ------------------------------------------------------------------ */
 static const unsigned int scif1_data_a_pins[] = {
@@ -1741,7 +1741,7 @@ static const unsigned int scif1_ctrl_pins[] = {
 	RCAR_GP_PIN(4, 11), RCAR_GP_PIN(4, 10),
 };
 static const unsigned int scif1_ctrl_mux[] = {
-	RTS1_N_TANS_MARK, CTS1_N_MARK,
+	RTS1_N_MARK, CTS1_N_MARK,
 };
 
 /* - SCIF2 ------------------------------------------------------------------ */
-- 
2.17.1

