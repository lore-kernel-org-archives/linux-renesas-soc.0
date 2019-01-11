Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3B3C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 11:50:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4656C2064C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 11:50:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731813AbfAKLu0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 06:50:26 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:45580 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731797AbfAKLuZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 06:50:25 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id NzqN1z0063XaVaC06zqNyu; Fri, 11 Jan 2019 12:50:22 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvKQ-0005ix-1G; Fri, 11 Jan 2019 12:50:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvKP-0007aq-Uk; Fri, 11 Jan 2019 12:50:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77995: Fix MOD_SEL bit numbering
Date:   Fri, 11 Jan 2019 12:50:20 +0100
Message-Id: <20190111115020.29147-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

MOD_SEL register bit numbering was different from R-Car D3 SoC and
R-Car H3/M3-[WN] SoCs.

MOD_SEL 1-bit      H3/M3-[WN]  D3
===============    ==========  =====
Set Value = H'0    b'0         b'0
Set Value = H'1    b'1         b'1

MOD_SEL 2-bits     H3/M3-[WN]  D3
===============    ==========  =====
Set Value = H'0    b'00        b'00
Set Value = H'1    b'01        b'10
Set Value = H'2    b'10        b'01
Set Value = H'3    b'11        b'11

MOD_SEL 3-bits     H3/M3-[WN]  D3
===============    ==========  =====
Set Value = H'0    b'000       b'000
Set Value = H'1    b'001       b'100
Set Value = H'2    b'010       b'010
Set Value = H'3    b'011       b'110
Set Value = H'4    b'100       b'001
Set Value = H'5    b'101       b'101
Set Value = H'6    b'110       b'011
Set Value = H'7    b'111       b'111

This patch replaces the #define name and value of MOD_SEL.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Fixes: 794a67117646 ("pinctrl: sh-pfc: Initial R8A77995 PFC support")
[shimoda: split a patch per SoC and revise the commit log]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[geert: Use a macro to do the actual reordering]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested as we don't know how to test the impact of MOD_SEL bits on
output pins.

Using a macro makes the code easier to write, read, and maintain.
Use "git show --color-words" to see the difference.

I'd love to handle the reversal in the PINMUX_CFG_REG_VAR()
descriptions, but I can't use e.g. REV4(MOD_SEL0_24_23) there, as
MOD_SEL0_24_23 is a single parameter, not 4 parameters.

Can this be improved?
---
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 84d78db381e30249..9e377e3b9cb3c20c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -381,6 +381,9 @@ FM(IP12_23_20)	IP12_23_20 \
 FM(IP12_27_24)	IP12_27_24 \
 FM(IP12_31_28)	IP12_31_28 \
 
+/* The bit numbering in MOD_SEL fields is reversed */
+#define REV4(f0, f1, f2, f3)			f0 f2 f1 f3
+
 /* MOD_SEL0 */			/* 0 */			/* 1 */			/* 2 */			/* 3 */
 #define MOD_SEL0_30		FM(SEL_MSIOF2_0)	FM(SEL_MSIOF2_1)
 #define MOD_SEL0_29		FM(SEL_I2C3_0)		FM(SEL_I2C3_1)
@@ -388,10 +391,10 @@ FM(IP12_31_28)	IP12_31_28 \
 #define MOD_SEL0_27		FM(SEL_MSIOF3_0)	FM(SEL_MSIOF3_1)
 #define MOD_SEL0_26		FM(SEL_HSCIF3_0)	FM(SEL_HSCIF3_1)
 #define MOD_SEL0_25		FM(SEL_SCIF4_0)		FM(SEL_SCIF4_1)
-#define MOD_SEL0_24_23		FM(SEL_PWM0_0)		FM(SEL_PWM0_1)		FM(SEL_PWM0_2)		F_(0, 0)
-#define MOD_SEL0_22_21		FM(SEL_PWM1_0)		FM(SEL_PWM1_1)		FM(SEL_PWM1_2)		F_(0, 0)
-#define MOD_SEL0_20_19		FM(SEL_PWM2_0)		FM(SEL_PWM2_1)		FM(SEL_PWM2_2)		F_(0, 0)
-#define MOD_SEL0_18_17		FM(SEL_PWM3_0)		FM(SEL_PWM3_1)		FM(SEL_PWM3_2)		F_(0, 0)
+#define MOD_SEL0_24_23	   REV4(FM(SEL_PWM0_0),		FM(SEL_PWM0_1),		FM(SEL_PWM0_2),		F_(0, 0))
+#define MOD_SEL0_22_21	   REV4(FM(SEL_PWM1_0),		FM(SEL_PWM1_1),		FM(SEL_PWM1_2),		F_(0, 0))
+#define MOD_SEL0_20_19	   REV4(FM(SEL_PWM2_0),		FM(SEL_PWM2_1),		FM(SEL_PWM2_2),		F_(0, 0))
+#define MOD_SEL0_18_17	   REV4(FM(SEL_PWM3_0),		FM(SEL_PWM3_1),		FM(SEL_PWM3_2),		F_(0, 0))
 #define MOD_SEL0_15		FM(SEL_IRQ_0_0)		FM(SEL_IRQ_0_1)
 #define MOD_SEL0_14		FM(SEL_IRQ_1_0)		FM(SEL_IRQ_1_1)
 #define MOD_SEL0_13		FM(SEL_IRQ_2_0)		FM(SEL_IRQ_2_1)
-- 
2.17.1

