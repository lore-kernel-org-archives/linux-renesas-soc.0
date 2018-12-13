Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1820C67872
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 18:27:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BE6120811
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 18:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BE6120811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbeLMS11 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 13:27:27 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:57794 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728269AbeLMS1T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 13:27:19 -0500
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id BWTG1z01h3XaVaC01WTG6B; Thu, 13 Dec 2018 19:27:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXVhc-0007fK-Rt; Thu, 13 Dec 2018 19:27:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXVhc-0006oJ-Qc; Thu, 13 Dec 2018 19:27:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 10/15] pinctrl: sh-pfc: sh7734: Fix shifted values in IPSR10
Date:   Thu, 13 Dec 2018 19:27:09 +0100
Message-Id: <20181213182714.26094-11-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181213182714.26094-1-geert+renesas@glider.be>
References: <20181213182714.26094-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some values in the Peripheral Function Select Register 10 descriptor are
shifted by one position, which may cause a peripheral function to be
programmed incorrectly.

Fixing this makes all HSCIF0 pins use Function 4 (value 3), like was
already the case for the HSCK0 pin in field IP10[5:3].

Fixes: ac1ebc2190f575fc ("sh-pfc: Add sh7734 pinmux support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Based on the SH7734 Hardware User's Manual Rev. 1.00.
Compile-tested only.

Noticed when investigating a different bug in the same register
description.
---
 drivers/pinctrl/sh-pfc/pfc-sh7734.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7734.c b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
index cad70f9cf5699f0c..748a32a3af82d368 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh7734.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
@@ -2210,22 +2210,22 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	    /* IP10_22 [1] */
 		FN_CAN_CLK_A, FN_RX4_D,
 	    /* IP10_21_19 [3] */
-		FN_AUDIO_CLKOUT, FN_TX1_E, FN_HRTS0_C, FN_FSE_B,
-		FN_LCD_M_DISP_B, 0, 0, 0,
+		FN_AUDIO_CLKOUT, FN_TX1_E, 0, FN_HRTS0_C, FN_FSE_B,
+		FN_LCD_M_DISP_B, 0, 0,
 	    /* IP10_18_16 [3] */
-		FN_AUDIO_CLKC, FN_SCK1_E, FN_HCTS0_C, FN_FRB_B,
-		FN_LCD_VEPWC_B, 0, 0, 0,
+		FN_AUDIO_CLKC, FN_SCK1_E, 0, FN_HCTS0_C, FN_FRB_B,
+		FN_LCD_VEPWC_B, 0, 0,
 	    /* IP10_15 [1] */
 		FN_AUDIO_CLKB_A, FN_LCD_CLK_B,
 	    /* IP10_14_12 [3] */
 		FN_AUDIO_CLKA_A, FN_VI1_CLK_B, FN_SCK1_D, FN_IECLK_B,
 		FN_LCD_FLM_B, 0, 0, 0,
 	    /* IP10_11_9 [3] */
-		FN_SSI_SDATA3, FN_VI1_7_B, FN_HTX0_C, FN_FWE_B,
-		FN_LCD_CL2_B, 0, 0, 0,
+		FN_SSI_SDATA3, FN_VI1_7_B, 0, FN_HTX0_C, FN_FWE_B,
+		FN_LCD_CL2_B, 0, 0,
 	    /* IP10_8_6 [3] */
-		FN_SSI_SDATA2, FN_VI1_6_B, FN_HRX0_C, FN_FRE_B,
-		FN_LCD_CL1_B, 0, 0, 0,
+		FN_SSI_SDATA2, FN_VI1_6_B, 0, FN_HRX0_C, FN_FRE_B,
+		FN_LCD_CL1_B, 0, 0,
 	    /* IP10_5_3 [3] */
 		FN_SSI_WS23, FN_VI1_5_B, FN_TX1_D, FN_HSCK0_C, FN_FALE_B,
 		FN_LCD_DON_B, 0, 0,
-- 
2.17.1

