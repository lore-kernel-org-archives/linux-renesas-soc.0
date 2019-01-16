Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE72C43444
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 15:37:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8EC2C206C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 15:37:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404983AbfAPPhz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 10:37:55 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:43848 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404986AbfAPPhy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 10:37:54 -0500
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id R3dt1z0023XaVaC013dtwU; Wed, 16 Jan 2019 16:37:53 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gjnGK-0007jf-Uf; Wed, 16 Jan 2019 16:37:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gjl30-0001ez-Vs; Wed, 16 Jan 2019 14:15:59 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77965: Replace DU_DOTCLKIN2 by DU_DOTCLKIN3
Date:   Wed, 16 Jan 2019 14:15:55 +0100
Message-Id: <20190116131555.6337-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Unlike R-Car M3-W, R-Car M3-N does not have DU_DOTCLKIN2, but the
corresponding pin carries the DU_DOTCLKIN3 signal.  Correct all
references to DU_DOTCLKIN2 to fix this.

This change does not have any runtime effect, as it only changes an
internal enum name, and a comment.

Fixes: 490e687eb8b274b5 ("pinctrl: sh-pfc: Initial R-Car M3-N support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The comment for the bit in DRVCTRL12 was already correct.
---
To be queued in sh-pfc-for-v5.1.

 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index a7c4882de09e3bd6..d937b1bc396accee 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -554,7 +554,7 @@ MOD_SEL0_4_3		MOD_SEL1_4 \
 	FM(AVB_RX_CTL) FM(AVB_RXC) FM(AVB_RD0) FM(AVB_RD1) FM(AVB_RD2) FM(AVB_RD3) \
 	FM(AVB_TXCREFCLK) FM(AVB_MDIO) \
 	FM(PRESETOUT) \
-	FM(DU_DOTCLKIN0) FM(DU_DOTCLKIN1) FM(DU_DOTCLKIN2) \
+	FM(DU_DOTCLKIN0) FM(DU_DOTCLKIN1) FM(DU_DOTCLKIN3) \
 	FM(TMS) FM(TDO) FM(ASEBRK) FM(MLB_REF) FM(TDI) FM(TCK) FM(TRST) FM(EXTALR)
 
 enum {
@@ -1566,7 +1566,7 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  5, QSPI1_MISO_IO1, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  7, DU_DOTCLKIN0, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  8, DU_DOTCLKIN1, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  8, DU_DOTCLKIN2, CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  8, DU_DOTCLKIN3, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 26, TRST#, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 29, TDI, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 30, TMS, CFG_FLAGS),
@@ -5740,7 +5740,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[31] = PIN_A_NUMBER('P', 8),	/* DU_DOTCLKIN1 */
 	} },
 	{ PINMUX_BIAS_REG("PUEN3", 0xe606040c, "PUD3", 0xe606044c) {
-		[ 0] = PIN_A_NUMBER('R', 8),	/* DU_DOTCLKIN2 */
+		[ 0] = PIN_A_NUMBER('R', 8),	/* DU_DOTCLKIN3 */
 		[ 1] = PIN_NONE,
 		[ 2] = PIN_A_NUMBER('D', 38),	/* FSCLKST */
 		[ 3] = PIN_A_NUMBER('D', 39),	/* EXTALR*/
-- 
2.17.1

