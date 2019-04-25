Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F06BC10F03
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:59:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0ED3921906
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:59:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbfDYJ7x (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 05:59:53 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:54788 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729207AbfDYJ7v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 05:59:51 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id 4Zzo200023XaVaC01ZzoKM; Thu, 25 Apr 2019 11:59:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJbAR-0003Xe-Vv; Thu, 25 Apr 2019 11:59:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJbAR-0000LG-Uu; Thu, 25 Apr 2019 11:59:47 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] pinctrl: sh-pfc: Move PIN_NONE to shared header file
Date:   Thu, 25 Apr 2019 11:59:46 +0200
Message-Id: <20190425095946.1259-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190425095946.1259-1-geert+renesas@glider.be>
References: <20190425095946.1259-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Several drivers have identical definitions for PIN_NONE.
Provide a definition with a SH_PFC_ prefix for general use in sh_pfc.h,
and convert all drivers over to use it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c     | 76 ++++++++++----------
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 53 +++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 53 +++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 55 +++++++--------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 55 +++++++--------
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    | 89 ++++++++++++------------
 drivers/pinctrl/sh-pfc/sh_pfc.h          |  2 +
 7 files changed, 189 insertions(+), 194 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7778.c b/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
index bed067b3019892fd..985e8c215c6dee48 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
@@ -2921,8 +2921,6 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
-#define PIN_NONE	U16_MAX
-
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ PINMUX_BIAS_REG("PUPR0", 0x100, "N/A", 0) {
 		[ 0] = RCAR_GP_PIN(0,  6),	/* A0 */
@@ -2969,28 +2967,28 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[ 7] = RCAR_GP_PIN(1, 10),	/* DACK0	*/
 		[ 8] = RCAR_GP_PIN(1, 12),	/* IRQ0		*/
 		[ 9] = RCAR_GP_PIN(1, 13),	/* IRQ1		*/
-		[10] = PIN_NONE,
-		[11] = PIN_NONE,
-		[12] = PIN_NONE,
-		[13] = PIN_NONE,
-		[14] = PIN_NONE,
-		[15] = PIN_NONE,
-		[16] = PIN_NONE,
-		[17] = PIN_NONE,
-		[18] = PIN_NONE,
-		[19] = PIN_NONE,
-		[20] = PIN_NONE,
-		[21] = PIN_NONE,
-		[22] = PIN_NONE,
-		[23] = PIN_NONE,
-		[24] = PIN_NONE,
-		[25] = PIN_NONE,
-		[26] = PIN_NONE,
-		[27] = PIN_NONE,
-		[28] = PIN_NONE,
-		[29] = PIN_NONE,
-		[30] = PIN_NONE,
-		[31] = PIN_NONE,
+		[10] = SH_PFC_PIN_NONE,
+		[11] = SH_PFC_PIN_NONE,
+		[12] = SH_PFC_PIN_NONE,
+		[13] = SH_PFC_PIN_NONE,
+		[14] = SH_PFC_PIN_NONE,
+		[15] = SH_PFC_PIN_NONE,
+		[16] = SH_PFC_PIN_NONE,
+		[17] = SH_PFC_PIN_NONE,
+		[18] = SH_PFC_PIN_NONE,
+		[19] = SH_PFC_PIN_NONE,
+		[20] = SH_PFC_PIN_NONE,
+		[21] = SH_PFC_PIN_NONE,
+		[22] = SH_PFC_PIN_NONE,
+		[23] = SH_PFC_PIN_NONE,
+		[24] = SH_PFC_PIN_NONE,
+		[25] = SH_PFC_PIN_NONE,
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
 	} },
 	{ PINMUX_BIAS_REG("PUPR2", 0x108, "N/A", 0) {
 		[ 0] = RCAR_GP_PIN(1, 22),	/* DU0_DR0	*/
@@ -3112,21 +3110,21 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[14] = RCAR_GP_PIN(4, 20),	/* ETH_MAGIC	*/
 		[15] = RCAR_GP_PIN(4, 25),	/* AVS1		*/
 		[16] = RCAR_GP_PIN(4, 26),	/* AVS2		*/
-		[17] = PIN_NONE,
-		[18] = PIN_NONE,
-		[19] = PIN_NONE,
-		[20] = PIN_NONE,
-		[21] = PIN_NONE,
-		[22] = PIN_NONE,
-		[23] = PIN_NONE,
-		[24] = PIN_NONE,
-		[25] = PIN_NONE,
-		[26] = PIN_NONE,
-		[27] = PIN_NONE,
-		[28] = PIN_NONE,
-		[29] = PIN_NONE,
-		[30] = PIN_NONE,
-		[31] = PIN_NONE,
+		[17] = SH_PFC_PIN_NONE,
+		[18] = SH_PFC_PIN_NONE,
+		[19] = SH_PFC_PIN_NONE,
+		[20] = SH_PFC_PIN_NONE,
+		[21] = SH_PFC_PIN_NONE,
+		[22] = SH_PFC_PIN_NONE,
+		[23] = SH_PFC_PIN_NONE,
+		[24] = SH_PFC_PIN_NONE,
+		[25] = SH_PFC_PIN_NONE,
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
 	} },
 	{ /* sentinel */ },
 };
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 69f18b640edcc5c0..3f7d021367e90604 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -1451,7 +1451,6 @@ static const u16 pinmux_data[] = {
 #define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
 #define PIN_NUMBER(r, c) (((r) - 'A') * 39 + (c) + 300)
 #define PIN_A_NUMBER(r, c) PIN_NUMBER(ROW_GROUP_A(r), c)
-#define PIN_NONE U16_MAX
 
 static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
@@ -5656,7 +5655,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[ 5] = PIN_A_NUMBER('T', 27),	/* TCK */
 		[ 6] = PIN_A_NUMBER('R', 30),	/* TMS */
 		[ 7] = PIN_A_NUMBER('R', 29),	/* TDI */
-		[ 8] = PIN_NONE,
+		[ 8] = SH_PFC_PIN_NONE,
 		[ 9] = PIN_A_NUMBER('T', 30),	/* ASEBRK */
 		[10] = RCAR_GP_PIN(3,  0),	/* SD0_CLK */
 		[11] = RCAR_GP_PIN(3,  1),	/* SD0_CMD */
@@ -5757,31 +5756,31 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[ 4] = RCAR_GP_PIN(6, 29),	/* USB30_OVC */
 		[ 5] = RCAR_GP_PIN(6, 30),	/* USB31_PWEN */
 		[ 6] = RCAR_GP_PIN(6, 31),	/* USB31_OVC */
-		[ 7] = PIN_NONE,
-		[ 8] = PIN_NONE,
-		[ 9] = PIN_NONE,
-		[10] = PIN_NONE,
-		[11] = PIN_NONE,
-		[12] = PIN_NONE,
-		[13] = PIN_NONE,
-		[14] = PIN_NONE,
-		[15] = PIN_NONE,
-		[16] = PIN_NONE,
-		[17] = PIN_NONE,
-		[18] = PIN_NONE,
-		[19] = PIN_NONE,
-		[20] = PIN_NONE,
-		[21] = PIN_NONE,
-		[22] = PIN_NONE,
-		[23] = PIN_NONE,
-		[24] = PIN_NONE,
-		[25] = PIN_NONE,
-		[26] = PIN_NONE,
-		[27] = PIN_NONE,
-		[28] = PIN_NONE,
-		[29] = PIN_NONE,
-		[30] = PIN_NONE,
-		[31] = PIN_NONE,
+		[ 7] = SH_PFC_PIN_NONE,
+		[ 8] = SH_PFC_PIN_NONE,
+		[ 9] = SH_PFC_PIN_NONE,
+		[10] = SH_PFC_PIN_NONE,
+		[11] = SH_PFC_PIN_NONE,
+		[12] = SH_PFC_PIN_NONE,
+		[13] = SH_PFC_PIN_NONE,
+		[14] = SH_PFC_PIN_NONE,
+		[15] = SH_PFC_PIN_NONE,
+		[16] = SH_PFC_PIN_NONE,
+		[17] = SH_PFC_PIN_NONE,
+		[18] = SH_PFC_PIN_NONE,
+		[19] = SH_PFC_PIN_NONE,
+		[20] = SH_PFC_PIN_NONE,
+		[21] = SH_PFC_PIN_NONE,
+		[22] = SH_PFC_PIN_NONE,
+		[23] = SH_PFC_PIN_NONE,
+		[24] = SH_PFC_PIN_NONE,
+		[25] = SH_PFC_PIN_NONE,
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
 	} },
 	{ /* sentinel */ },
 };
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 6bad4b98157763df..79073b2f1ae2c335 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1512,7 +1512,6 @@ static const u16 pinmux_data[] = {
 #define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
 #define PIN_NUMBER(r, c) (((r) - 'A') * 39 + (c) + 300)
 #define PIN_A_NUMBER(r, c) PIN_NUMBER(ROW_GROUP_A(r), c)
-#define PIN_NONE U16_MAX
 
 static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
@@ -6006,7 +6005,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[ 5] = PIN_A_NUMBER('T', 27),	/* TCK */
 		[ 6] = PIN_A_NUMBER('R', 30),	/* TMS */
 		[ 7] = PIN_A_NUMBER('R', 29),	/* TDI */
-		[ 8] = PIN_NONE,
+		[ 8] = SH_PFC_PIN_NONE,
 		[ 9] = PIN_A_NUMBER('T', 30),	/* ASEBRK */
 		[10] = RCAR_GP_PIN(3,  0),	/* SD0_CLK */
 		[11] = RCAR_GP_PIN(3,  1),	/* SD0_CMD */
@@ -6107,31 +6106,31 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[ 4] = RCAR_GP_PIN(6, 29),	/* USB30_OVC */
 		[ 5] = RCAR_GP_PIN(6, 30),	/* USB2_CH3_PWEN */
 		[ 6] = RCAR_GP_PIN(6, 31),	/* USB2_CH3_OVC */
-		[ 7] = PIN_NONE,
-		[ 8] = PIN_NONE,
-		[ 9] = PIN_NONE,
-		[10] = PIN_NONE,
-		[11] = PIN_NONE,
-		[12] = PIN_NONE,
-		[13] = PIN_NONE,
-		[14] = PIN_NONE,
-		[15] = PIN_NONE,
-		[16] = PIN_NONE,
-		[17] = PIN_NONE,
-		[18] = PIN_NONE,
-		[19] = PIN_NONE,
-		[20] = PIN_NONE,
-		[21] = PIN_NONE,
-		[22] = PIN_NONE,
-		[23] = PIN_NONE,
-		[24] = PIN_NONE,
-		[25] = PIN_NONE,
-		[26] = PIN_NONE,
-		[27] = PIN_NONE,
-		[28] = PIN_NONE,
-		[29] = PIN_NONE,
-		[30] = PIN_NONE,
-		[31] = PIN_NONE,
+		[ 7] = SH_PFC_PIN_NONE,
+		[ 8] = SH_PFC_PIN_NONE,
+		[ 9] = SH_PFC_PIN_NONE,
+		[10] = SH_PFC_PIN_NONE,
+		[11] = SH_PFC_PIN_NONE,
+		[12] = SH_PFC_PIN_NONE,
+		[13] = SH_PFC_PIN_NONE,
+		[14] = SH_PFC_PIN_NONE,
+		[15] = SH_PFC_PIN_NONE,
+		[16] = SH_PFC_PIN_NONE,
+		[17] = SH_PFC_PIN_NONE,
+		[18] = SH_PFC_PIN_NONE,
+		[19] = SH_PFC_PIN_NONE,
+		[20] = SH_PFC_PIN_NONE,
+		[21] = SH_PFC_PIN_NONE,
+		[22] = SH_PFC_PIN_NONE,
+		[23] = SH_PFC_PIN_NONE,
+		[24] = SH_PFC_PIN_NONE,
+		[25] = SH_PFC_PIN_NONE,
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
 	} },
 	{ /* sentinel */ },
 };
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index ad7369f42f5680f6..33108f8886901a19 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1516,7 +1516,6 @@ static const u16 pinmux_data[] = {
 #define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
 #define PIN_NUMBER(r, c) (((r) - 'A') * 39 + (c) + 300)
 #define PIN_A_NUMBER(r, c) PIN_NUMBER(ROW_GROUP_A(r), c)
-#define PIN_NONE U16_MAX
 
 static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
@@ -5965,14 +5964,14 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	} },
 	{ PINMUX_BIAS_REG("PUEN3", 0xe606040c, "PUD3", 0xe606044c) {
 		[ 0] = PIN_A_NUMBER('R', 8),	/* DU_DOTCLKIN2 */
-		[ 1] = PIN_NONE,
+		[ 1] = SH_PFC_PIN_NONE,
 		[ 2] = PIN_A_NUMBER('D', 38),	/* FSCLKST */
 		[ 3] = PIN_A_NUMBER('D', 39),	/* EXTALR*/
 		[ 4] = PIN_A_NUMBER('R', 26),	/* TRST# */
 		[ 5] = PIN_A_NUMBER('T', 27),	/* TCK */
 		[ 6] = PIN_A_NUMBER('R', 30),	/* TMS */
 		[ 7] = PIN_A_NUMBER('R', 29),	/* TDI */
-		[ 8] = PIN_NONE,
+		[ 8] = SH_PFC_PIN_NONE,
 		[ 9] = PIN_A_NUMBER('T', 30),	/* ASEBRK */
 		[10] = RCAR_GP_PIN(3,  0),	/* SD0_CLK */
 		[11] = RCAR_GP_PIN(3,  1),	/* SD0_CMD */
@@ -6073,31 +6072,31 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[ 4] = RCAR_GP_PIN(6, 29),	/* USB30_OVC */
 		[ 5] = RCAR_GP_PIN(6, 30),	/* GP6_30 */
 		[ 6] = RCAR_GP_PIN(6, 31),	/* GP6_31 */
-		[ 7] = PIN_NONE,
-		[ 8] = PIN_NONE,
-		[ 9] = PIN_NONE,
-		[10] = PIN_NONE,
-		[11] = PIN_NONE,
-		[12] = PIN_NONE,
-		[13] = PIN_NONE,
-		[14] = PIN_NONE,
-		[15] = PIN_NONE,
-		[16] = PIN_NONE,
-		[17] = PIN_NONE,
-		[18] = PIN_NONE,
-		[19] = PIN_NONE,
-		[20] = PIN_NONE,
-		[21] = PIN_NONE,
-		[22] = PIN_NONE,
-		[23] = PIN_NONE,
-		[24] = PIN_NONE,
-		[25] = PIN_NONE,
-		[26] = PIN_NONE,
-		[27] = PIN_NONE,
-		[28] = PIN_NONE,
-		[29] = PIN_NONE,
-		[30] = PIN_NONE,
-		[31] = PIN_NONE,
+		[ 7] = SH_PFC_PIN_NONE,
+		[ 8] = SH_PFC_PIN_NONE,
+		[ 9] = SH_PFC_PIN_NONE,
+		[10] = SH_PFC_PIN_NONE,
+		[11] = SH_PFC_PIN_NONE,
+		[12] = SH_PFC_PIN_NONE,
+		[13] = SH_PFC_PIN_NONE,
+		[14] = SH_PFC_PIN_NONE,
+		[15] = SH_PFC_PIN_NONE,
+		[16] = SH_PFC_PIN_NONE,
+		[17] = SH_PFC_PIN_NONE,
+		[18] = SH_PFC_PIN_NONE,
+		[19] = SH_PFC_PIN_NONE,
+		[20] = SH_PFC_PIN_NONE,
+		[21] = SH_PFC_PIN_NONE,
+		[22] = SH_PFC_PIN_NONE,
+		[23] = SH_PFC_PIN_NONE,
+		[24] = SH_PFC_PIN_NONE,
+		[25] = SH_PFC_PIN_NONE,
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
 	} },
 	{ /* sentinel */ },
 };
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 4b42dfc0fc9e6722..bddc6c038d8f233d 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -1521,7 +1521,6 @@ static const u16 pinmux_data[] = {
 #define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
 #define PIN_NUMBER(r, c) (((r) - 'A') * 39 + (c) + 300)
 #define PIN_A_NUMBER(r, c) PIN_NUMBER(ROW_GROUP_A(r), c)
-#define PIN_NONE U16_MAX
 
 static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
@@ -6205,14 +6204,14 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	} },
 	{ PINMUX_BIAS_REG("PUEN3", 0xe606040c, "PUD3", 0xe606044c) {
 		[ 0] = PIN_A_NUMBER('R', 8),	/* DU_DOTCLKIN3 */
-		[ 1] = PIN_NONE,
+		[ 1] = SH_PFC_PIN_NONE,
 		[ 2] = PIN_A_NUMBER('D', 38),	/* FSCLKST */
 		[ 3] = PIN_A_NUMBER('D', 39),	/* EXTALR*/
 		[ 4] = PIN_A_NUMBER('R', 26),	/* TRST# */
 		[ 5] = PIN_A_NUMBER('T', 27),	/* TCK */
 		[ 6] = PIN_A_NUMBER('R', 30),	/* TMS */
 		[ 7] = PIN_A_NUMBER('R', 29),	/* TDI */
-		[ 8] = PIN_NONE,
+		[ 8] = SH_PFC_PIN_NONE,
 		[ 9] = PIN_A_NUMBER('T', 30),	/* ASEBRK */
 		[10] = RCAR_GP_PIN(3,  0),	/* SD0_CLK */
 		[11] = RCAR_GP_PIN(3,  1),	/* SD0_CMD */
@@ -6313,31 +6312,31 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[ 4] = RCAR_GP_PIN(6, 29),	/* USB30_OVC */
 		[ 5] = RCAR_GP_PIN(6, 30),	/* GP6_30 */
 		[ 6] = RCAR_GP_PIN(6, 31),	/* GP6_31 */
-		[ 7] = PIN_NONE,
-		[ 8] = PIN_NONE,
-		[ 9] = PIN_NONE,
-		[10] = PIN_NONE,
-		[11] = PIN_NONE,
-		[12] = PIN_NONE,
-		[13] = PIN_NONE,
-		[14] = PIN_NONE,
-		[15] = PIN_NONE,
-		[16] = PIN_NONE,
-		[17] = PIN_NONE,
-		[18] = PIN_NONE,
-		[19] = PIN_NONE,
-		[20] = PIN_NONE,
-		[21] = PIN_NONE,
-		[22] = PIN_NONE,
-		[23] = PIN_NONE,
-		[24] = PIN_NONE,
-		[25] = PIN_NONE,
-		[26] = PIN_NONE,
-		[27] = PIN_NONE,
-		[28] = PIN_NONE,
-		[29] = PIN_NONE,
-		[30] = PIN_NONE,
-		[31] = PIN_NONE,
+		[ 7] = SH_PFC_PIN_NONE,
+		[ 8] = SH_PFC_PIN_NONE,
+		[ 9] = SH_PFC_PIN_NONE,
+		[10] = SH_PFC_PIN_NONE,
+		[11] = SH_PFC_PIN_NONE,
+		[12] = SH_PFC_PIN_NONE,
+		[13] = SH_PFC_PIN_NONE,
+		[14] = SH_PFC_PIN_NONE,
+		[15] = SH_PFC_PIN_NONE,
+		[16] = SH_PFC_PIN_NONE,
+		[17] = SH_PFC_PIN_NONE,
+		[18] = SH_PFC_PIN_NONE,
+		[19] = SH_PFC_PIN_NONE,
+		[20] = SH_PFC_PIN_NONE,
+		[21] = SH_PFC_PIN_NONE,
+		[22] = SH_PFC_PIN_NONE,
+		[23] = SH_PFC_PIN_NONE,
+		[24] = SH_PFC_PIN_NONE,
+		[25] = SH_PFC_PIN_NONE,
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
 	} },
 	{ /* sentinel */ },
 };
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 4db337a6db9fa3ca..1055ab94accf5780 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1282,7 +1282,6 @@ static const u16 pinmux_data[] = {
 #define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
 #define PIN_NUMBER(r, c) (((r) - 'A') * 25 + (c) + 300)
 #define PIN_A_NUMBER(r, c) PIN_NUMBER(ROW_GROUP_A(r), c)
-#define PIN_NONE U16_MAX
 
 static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
@@ -5084,8 +5083,8 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[25] = RCAR_GP_PIN(1,  2),	/* A2 */
 		[26] = RCAR_GP_PIN(1,  1),	/* A1 */
 		[27] = RCAR_GP_PIN(1,  0),	/* A0 */
-		[28] = PIN_NONE,
-		[29] = PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
 		[30] = RCAR_GP_PIN(2, 25),	/* PUEN_EX_WAIT0 */
 		[31] = RCAR_GP_PIN(2, 24),	/* PUEN_RD/WR# */
 	} },
@@ -5093,23 +5092,23 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		 [0] = RCAR_GP_PIN(3,  1),	/* SD0_CMD */
 		 [1] = RCAR_GP_PIN(3,  0),	/* SD0_CLK */
 		 [2] = PIN_NUMBER('H', 1),	/* ASEBRK */
-		 [3] = PIN_NONE,
+		 [3] = SH_PFC_PIN_NONE,
 		 [4] = PIN_NUMBER('G', 2),	/* TDI */
 		 [5] = PIN_NUMBER('F', 3),	/* TMS */
 		 [6] = PIN_NUMBER('F', 4),	/* TCK */
 		 [7] = PIN_NUMBER('F', 1),	/* TRST# */
-		 [8] = PIN_NONE,
-		 [9] = PIN_NONE,
-		[10] = PIN_NONE,
-		[11] = PIN_NONE,
-		[12] = PIN_NONE,
-		[13] = PIN_NONE,
-		[14] = PIN_NONE,
+		 [8] = SH_PFC_PIN_NONE,
+		 [9] = SH_PFC_PIN_NONE,
+		[10] = SH_PFC_PIN_NONE,
+		[11] = SH_PFC_PIN_NONE,
+		[12] = SH_PFC_PIN_NONE,
+		[13] = SH_PFC_PIN_NONE,
+		[14] = SH_PFC_PIN_NONE,
 		[15] = PIN_NUMBER('G', 3),	/* FSCLKST# */
 		[16] = RCAR_GP_PIN(0, 17),	/* SDA4 */
 		[17] = RCAR_GP_PIN(0, 16),	/* SCL4 */
-		[18] = PIN_NONE,
-		[19] = PIN_NONE,
+		[18] = SH_PFC_PIN_NONE,
+		[19] = SH_PFC_PIN_NONE,
 		[20] = PIN_A_NUMBER('D', 3),	/* PRESETOUT# */
 		[21] = RCAR_GP_PIN(0, 15),	/* D15 */
 		[22] = RCAR_GP_PIN(0, 14),	/* D14 */
@@ -5129,8 +5128,8 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		 [2] = RCAR_GP_PIN(5,  3),	/* CTS0#_A */
 		 [3] = RCAR_GP_PIN(5,  2),	/* TX0_A */
 		 [4] = RCAR_GP_PIN(5,  1),	/* RX0_A */
-		 [5] = PIN_NONE,
-		 [6] = PIN_NONE,
+		 [5] = SH_PFC_PIN_NONE,
+		 [6] = SH_PFC_PIN_NONE,
 		 [7] = RCAR_GP_PIN(3, 15),	/* SD1_WP */
 		 [8] = RCAR_GP_PIN(3, 14),	/* SD1_CD */
 		 [9] = RCAR_GP_PIN(3, 13),	/* SD0_WP */
@@ -5192,36 +5191,36 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[31] = RCAR_GP_PIN(5,  5),	/* RX1 */
 	} },
 	{ PINMUX_BIAS_REG("PUEN5", 0xe6060414, "PUD5", 0xe6060454) {
-		 [0] = PIN_NONE,
-		 [1] = PIN_NONE,
-		 [2] = PIN_NONE,
-		 [3] = PIN_NONE,
-		 [4] = PIN_NONE,
-		 [5] = PIN_NONE,
-		 [6] = PIN_NONE,
-		 [7] = PIN_NONE,
-		 [8] = PIN_NONE,
-		 [9] = PIN_NONE,
-		[10] = PIN_NONE,
-		[11] = PIN_NONE,
-		[12] = PIN_NONE,
-		[13] = PIN_NONE,
-		[14] = PIN_NONE,
-		[15] = PIN_NONE,
-		[16] = PIN_NONE,
-		[17] = PIN_NONE,
-		[18] = PIN_NONE,
-		[19] = PIN_NONE,
-		[20] = PIN_NONE,
-		[21] = PIN_NONE,
-		[22] = PIN_NONE,
-		[23] = PIN_NONE,
-		[24] = PIN_NONE,
-		[25] = PIN_NONE,
-		[26] = PIN_NONE,
-		[27] = PIN_NONE,
-		[28] = PIN_NONE,
-		[29] = PIN_NONE,
+		 [0] = SH_PFC_PIN_NONE,
+		 [1] = SH_PFC_PIN_NONE,
+		 [2] = SH_PFC_PIN_NONE,
+		 [3] = SH_PFC_PIN_NONE,
+		 [4] = SH_PFC_PIN_NONE,
+		 [5] = SH_PFC_PIN_NONE,
+		 [6] = SH_PFC_PIN_NONE,
+		 [7] = SH_PFC_PIN_NONE,
+		 [8] = SH_PFC_PIN_NONE,
+		 [9] = SH_PFC_PIN_NONE,
+		[10] = SH_PFC_PIN_NONE,
+		[11] = SH_PFC_PIN_NONE,
+		[12] = SH_PFC_PIN_NONE,
+		[13] = SH_PFC_PIN_NONE,
+		[14] = SH_PFC_PIN_NONE,
+		[15] = SH_PFC_PIN_NONE,
+		[16] = SH_PFC_PIN_NONE,
+		[17] = SH_PFC_PIN_NONE,
+		[18] = SH_PFC_PIN_NONE,
+		[19] = SH_PFC_PIN_NONE,
+		[20] = SH_PFC_PIN_NONE,
+		[21] = SH_PFC_PIN_NONE,
+		[22] = SH_PFC_PIN_NONE,
+		[23] = SH_PFC_PIN_NONE,
+		[24] = SH_PFC_PIN_NONE,
+		[25] = SH_PFC_PIN_NONE,
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
 		[30] = RCAR_GP_PIN(6,  9),	/* PUEN_USB30_OVC */
 		[31] = RCAR_GP_PIN(6, 17),	/* PUEN_USB30_PWEN */
 	} },
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 9a116cc0ea0c6aee..d1b61066ee88c6fd 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -21,6 +21,8 @@ enum {
 	PINMUX_TYPE_INPUT,
 };
 
+#define SH_PFC_PIN_NONE			U16_MAX
+
 #define SH_PFC_PIN_CFG_INPUT		(1 << 0)
 #define SH_PFC_PIN_CFG_OUTPUT		(1 << 1)
 #define SH_PFC_PIN_CFG_PULL_UP		(1 << 2)
-- 
2.17.1

