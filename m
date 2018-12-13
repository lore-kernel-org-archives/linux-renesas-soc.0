Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CF7C67839
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 18:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B78A720811
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 18:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B78A720811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbeLMS1U (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 13:27:20 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:38300 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728186AbeLMS1T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 13:27:19 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id BWTG1z00Q3XaVaC01WTGPv; Thu, 13 Dec 2018 19:27:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXVhc-0007f9-NU; Thu, 13 Dec 2018 19:27:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXVhc-0006o7-Lf; Thu, 13 Dec 2018 19:27:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/15] pinctrl: sh-pfc: r8a77995: Remove bogus SEL_PWM[0-3]_3 configurations
Date:   Thu, 13 Dec 2018 19:27:05 +0100
Message-Id: <20181213182714.26094-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181213182714.26094-1-geert+renesas@glider.be>
References: <20181213182714.26094-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While the SEL_PWM[0-3] fields in the Module Select Register 0 support 4
possible configurations per PWM pin, only the first 3 are valid.

Replace the invalid and unused configurations for SEL_PWM[0-3]_3 by
dummies.

Fixes: 794a6711764658a1 ("pinctrl: sh-pfc: Initial R8A77995 PFC support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index e457539a61c55bb9..84d78db381e30249 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -388,10 +388,10 @@ FM(IP12_31_28)	IP12_31_28 \
 #define MOD_SEL0_27		FM(SEL_MSIOF3_0)	FM(SEL_MSIOF3_1)
 #define MOD_SEL0_26		FM(SEL_HSCIF3_0)	FM(SEL_HSCIF3_1)
 #define MOD_SEL0_25		FM(SEL_SCIF4_0)		FM(SEL_SCIF4_1)
-#define MOD_SEL0_24_23		FM(SEL_PWM0_0)		FM(SEL_PWM0_1)		FM(SEL_PWM0_2)		FM(SEL_PWM0_3)
-#define MOD_SEL0_22_21		FM(SEL_PWM1_0)		FM(SEL_PWM1_1)		FM(SEL_PWM1_2)		FM(SEL_PWM1_3)
-#define MOD_SEL0_20_19		FM(SEL_PWM2_0)		FM(SEL_PWM2_1)		FM(SEL_PWM2_2)		FM(SEL_PWM2_3)
-#define MOD_SEL0_18_17		FM(SEL_PWM3_0)		FM(SEL_PWM3_1)		FM(SEL_PWM3_2)		FM(SEL_PWM3_3)
+#define MOD_SEL0_24_23		FM(SEL_PWM0_0)		FM(SEL_PWM0_1)		FM(SEL_PWM0_2)		F_(0, 0)
+#define MOD_SEL0_22_21		FM(SEL_PWM1_0)		FM(SEL_PWM1_1)		FM(SEL_PWM1_2)		F_(0, 0)
+#define MOD_SEL0_20_19		FM(SEL_PWM2_0)		FM(SEL_PWM2_1)		FM(SEL_PWM2_2)		F_(0, 0)
+#define MOD_SEL0_18_17		FM(SEL_PWM3_0)		FM(SEL_PWM3_1)		FM(SEL_PWM3_2)		F_(0, 0)
 #define MOD_SEL0_15		FM(SEL_IRQ_0_0)		FM(SEL_IRQ_0_1)
 #define MOD_SEL0_14		FM(SEL_IRQ_1_0)		FM(SEL_IRQ_1_1)
 #define MOD_SEL0_13		FM(SEL_IRQ_2_0)		FM(SEL_IRQ_2_1)
-- 
2.17.1

