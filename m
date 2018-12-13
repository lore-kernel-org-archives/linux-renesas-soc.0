Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8A0C67872
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 18:27:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1493220811
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 18:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1493220811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbeLMS1V (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 13:27:21 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:41264 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728304AbeLMS1V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 13:27:21 -0500
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id BWTH1z0043XaVaC01WTHtx; Thu, 13 Dec 2018 19:27:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXVhd-0007fW-0g; Thu, 13 Dec 2018 19:27:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXVhc-0006oV-Va; Thu, 13 Dec 2018 19:27:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 14/15] [RFC] pinctrl: sh-pfc: Absorb enum IDs in PINMUX_CFG_REG_VAR() macro
Date:   Thu, 13 Dec 2018 19:27:13 +0100
Message-Id: <20181213182714.26094-15-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181213182714.26094-1-geert+renesas@glider.be>
References: <20181213182714.26094-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently the PINMUX_CFG_REG_VAR() macro must be followed by
initialization data, specifying all enum IDs.  Hence the macro itself
does not know anything about the enum IDs, preventing the macro from
performing any validation on it.

Make the macro accept the enum IDs as a parameter, and update all users.
Note that array data enclosed by curly braces cannot be passed to a
macro as a parameter, hence both the register field widths and the enum
IDs are wrapped using the GROUP() macro.

No functional changes.

Not-yet-signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This patch is incomplete!
It contains only the generic and r8a7795 parts.

 drivers/pinctrl/sh-pfc/pfc-emev2.c       |  47 +++++----
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c    | 111 +++++++++++---------
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c     |  81 +++++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c     |  89 +++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c     | 107 ++++++++++++--------
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c     | 123 ++++++++++++++---------
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c     |  86 +++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c     |  98 ++++++++++--------
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c |  20 ++--
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     |  21 ++--
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     |  21 ++--
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    |  21 ++--
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c    |   7 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c    |   7 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    |  14 +--
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c    |  13 +--
 drivers/pinctrl/sh-pfc/pfc-sh7734.c      |  81 +++++++++------
 drivers/pinctrl/sh-pfc/sh_pfc.h          |  25 +++--
 18 files changed, 571 insertions(+), 401 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 2c1d5d56628a1156..abf6e0167ef6053a 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -5669,8 +5669,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 #define F_(x, y)	x,
 #define FM(x)		FN_##x,
 	{ PINMUX_CFG_REG_VAR("MOD_SEL0", 0xe6060500, 32,
-			     3, 2, 3, 1, 1, 1, 1, 1, 2, 1,
-			     1, 2, 1, 1, 1, 2, 2, 1, 2, 3) {
+			     GROUP(3, 2, 3, 1, 1, 1, 1, 1, 2, 1, 1, 2,
+				   1, 1, 1, 2, 2, 1, 2, 3),
+			     GROUP(
 		MOD_SEL0_31_30_29
 		MOD_SEL0_28_27
 		MOD_SEL0_26_25_24
@@ -5691,11 +5692,12 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL0_5
 		MOD_SEL0_4_3
 		/* RESERVED 2, 1, 0 */
-		0, 0, 0, 0, 0, 0, 0, 0 }
+		0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL1", 0xe6060504, 32,
-			     2, 3, 1, 2, 3, 1, 1, 2, 1,
-			     2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1) {
+			     GROUP(2, 3, 1, 2, 3, 1, 1, 2, 1, 2, 1, 1,
+				   1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
 		MOD_SEL1_31_30
 		MOD_SEL1_29_28_27
 		MOD_SEL1_26
@@ -5718,11 +5720,12 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL1_3
 		MOD_SEL1_2
 		MOD_SEL1_1
-		MOD_SEL1_0 }
+		MOD_SEL1_0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL2", 0xe6060508, 32,
-			     1, 1, 1, 2, 1, 3, 1, 1, 1, 1, 1, 1, 1,
-			     4, 4, 4, 3, 1) {
+			     GROUP(1, 1, 1, 2, 1, 3, 1, 1, 1, 1, 1, 1,
+				   1, 4, 4, 4, 3, 1),
+			     GROUP(
 		MOD_SEL2_31
 		MOD_SEL2_30
 		MOD_SEL2_29
@@ -5749,7 +5752,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0, 0, 0, 0, 0, 0,
 		/* RESERVED 3, 2, 1 */
 		0, 0, 0, 0, 0, 0, 0, 0,
-		MOD_SEL2_0 }
+		MOD_SEL2_0 ))
 	},
 	{ },
 };
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 84468bba9c30e675..584d58d954961018 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -138,16 +138,17 @@ struct pinmux_cfg_reg {
  *   - name: Register name (unused, for documentation purposes only)
  *   - r: Physical register address
  *   - r_width: Width of the register (in bits)
- *   - var_fw0, var_fwn...: List of widths of the register fields (in bits),
- *                          From left to right (i.e. MSB to LSB)
- * This macro must be followed by initialization data: For each register field
- * (from left to right, i.e. MSB to LSB), 2^var_fwi enum IDs must be specified,
- * one for each possible combination of the register field bit values.
+ *   - f_widths: List of widths of the register fields (in bits), from left
+ *               to right (i.e. MSB to LSB), wrapped using the GROUP() macro.
+ *   - ids: For each register field (from left to right, i.e. MSB to LSB),
+ *          2^f_widths[i] enum IDs must be specified, one for each possible
+ *          combination of the register field bit values, wrapped using the
+ *          GROUP() macro.
  */
-#define PINMUX_CFG_REG_VAR(name, r, r_width, var_fw0, var_fwn...) \
-	.reg = r, .reg_width = r_width,	\
-	.var_field_width = (const u8 []) { var_fw0, var_fwn, 0 }, \
-	.enum_ids = (const u16 [])
+#define PINMUX_CFG_REG_VAR(name, r, r_width, f_widths, ids)		\
+	.reg = r, .reg_width = r_width,					\
+	.var_field_width = (const u8 []) { f_widths, 0 },		\
+	.enum_ids = (const u16 []) { ids }
 
 struct pinmux_drive_reg_field {
 	u16 pin;
@@ -666,7 +667,9 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
  */
 #define PORTCR(nr, reg)							\
 	{								\
-		PINMUX_CFG_REG_VAR("PORT" nr "CR", reg, 8, 2, 2, 1, 3) {\
+		PINMUX_CFG_REG_VAR("PORT" nr "CR", reg, 8,		\
+				   GROUP(2, 2, 1, 3),			\
+				   GROUP(				\
 			/* PULMD[1:0], handled by .set_bias() */	\
 			0, 0, 0, 0,					\
 			/* IE and OE */					\
@@ -678,7 +681,7 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 			PORT##nr##_FN2, PORT##nr##_FN3,			\
 			PORT##nr##_FN4, PORT##nr##_FN5,			\
 			PORT##nr##_FN6, PORT##nr##_FN7			\
-		}							\
+		))							\
 	}
 
 /*
-- 
2.17.1

