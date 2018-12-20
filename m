Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A37C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 14:02:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F4AE217D8
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 14:02:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732857AbeLTOCt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 09:02:49 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:48562 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732853AbeLTOCs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 09:02:48 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id EE2m1z00D3XaVaC06E2mRn; Thu, 20 Dec 2018 15:02:46 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gZyuU-0007i1-6L; Thu, 20 Dec 2018 15:02:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gZyuU-0005KU-3w; Thu, 20 Dec 2018 15:02:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL bit numbering
Date:   Thu, 20 Dec 2018 15:02:41 +0100
Message-Id: <20181220140241.20442-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

MOD_SEL register bit numbering was different from R-Car E3 SoC and
R-Car H3/M3-[WN] SoCs.

MOD_SEL 1-bit      H3/M3-[WN]  E3
===============    ==========  =====
Set Value = H'0    b'0         b'0
Set Value = H'1    b'1         b'1

MOD_SEL 2-bits     H3/M3-[WN]  E3
===============    ==========  =====
Set Value = H'0    b'00        b'00
Set Value = H'1    b'01        b'10
Set Value = H'2    b'10        b'01
Set Value = H'3    b'11        b'11

MOD_SEL 3-bits     H3/M3-[WN]  E3
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
Fixes: 6d4036a1e3b3 ("pinctrl: sh-pfc: Initial R8A77990 PFC support")
[shimoda: Split a patch per SoC and revise the commit log]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[geert: Use macros to do the actual reordering]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Using a macro makes the code easier to writ, read, and maintain.
Use "git show --color-words" to see the difference.

I'd love to handle the reversal in the PINMUX_CFG_REG_VAR()
descriptions, but I can't use e.g. REV8(MOD_SEL0_19_18_17) there, as
MOD_SEL0_19_18_17 is a single parameter, not 8 parameters.

Can this be improved?

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 32 +++++++++++++++------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index a733534610b36035..d44959d373603f45 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -391,29 +391,33 @@ FM(IP12_23_20)	IP12_23_20	FM(IP13_23_20)	IP13_23_20	FM(IP14_23_20)	IP14_23_20	FM
 FM(IP12_27_24)	IP12_27_24	FM(IP13_27_24)	IP13_27_24	FM(IP14_27_24)	IP14_27_24	FM(IP15_27_24)	IP15_27_24 \
 FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM(IP15_31_28)	IP15_31_28
 
+/* The bit numbering in MOD_SEL fields is reversed */
+#define REV4(f0, f1, f2, f3)			f0 f2 f1 f3
+#define REV8(f0, f1, f2, f3, f4, f5, f6, f7)	f0 f4 f2 f6 f1 f5 f3 f7
+
 /* MOD_SEL0 */			/* 0 */				/* 1 */				/* 2 */				/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */
-#define MOD_SEL0_30_29		FM(SEL_ADGB_0)			FM(SEL_ADGB_1)			FM(SEL_ADGB_2)			F_(0, 0)
+#define MOD_SEL0_30_29	   REV4(FM(SEL_ADGB_0),			FM(SEL_ADGB_1),			FM(SEL_ADGB_2),			F_(0, 0))
 #define MOD_SEL0_28		FM(SEL_DRIF0_0)			FM(SEL_DRIF0_1)
-#define MOD_SEL0_27_26		FM(SEL_FM_0)			FM(SEL_FM_1)			FM(SEL_FM_2)			F_(0, 0)
+#define MOD_SEL0_27_26	   REV4(FM(SEL_FM_0),			FM(SEL_FM_1),			FM(SEL_FM_2),			F_(0, 0))
 #define MOD_SEL0_25		FM(SEL_FSO_0)			FM(SEL_FSO_1)
 #define MOD_SEL0_24		FM(SEL_HSCIF0_0)		FM(SEL_HSCIF0_1)
 #define MOD_SEL0_23		FM(SEL_HSCIF1_0)		FM(SEL_HSCIF1_1)
 #define MOD_SEL0_22		FM(SEL_HSCIF2_0)		FM(SEL_HSCIF2_1)
-#define MOD_SEL0_21_20		FM(SEL_I2C1_0)			FM(SEL_I2C1_1)			FM(SEL_I2C1_2)			FM(SEL_I2C1_3)
-#define MOD_SEL0_19_18_17	FM(SEL_I2C2_0)			FM(SEL_I2C2_1)			FM(SEL_I2C2_2)			FM(SEL_I2C2_3)		FM(SEL_I2C2_4)		F_(0, 0)	F_(0, 0)	F_(0, 0)
+#define MOD_SEL0_21_20	   REV4(FM(SEL_I2C1_0),			FM(SEL_I2C1_1),			FM(SEL_I2C1_2),			FM(SEL_I2C1_3))
+#define MOD_SEL0_19_18_17  REV8(FM(SEL_I2C2_0),			FM(SEL_I2C2_1),			FM(SEL_I2C2_2),			FM(SEL_I2C2_3),		FM(SEL_I2C2_4),		F_(0, 0),	F_(0, 0),	F_(0, 0))
 #define MOD_SEL0_16		FM(SEL_NDFC_0)			FM(SEL_NDFC_1)
 #define MOD_SEL0_15		FM(SEL_PWM0_0)			FM(SEL_PWM0_1)
 #define MOD_SEL0_14		FM(SEL_PWM1_0)			FM(SEL_PWM1_1)
-#define MOD_SEL0_13_12		FM(SEL_PWM2_0)			FM(SEL_PWM2_1)			FM(SEL_PWM2_2)			F_(0, 0)
-#define MOD_SEL0_11_10		FM(SEL_PWM3_0)			FM(SEL_PWM3_1)			FM(SEL_PWM3_2)			F_(0, 0)
+#define MOD_SEL0_13_12	   REV4(FM(SEL_PWM2_0),			FM(SEL_PWM2_1),			FM(SEL_PWM2_2),			F_(0, 0))
+#define MOD_SEL0_11_10	   REV4(FM(SEL_PWM3_0),			FM(SEL_PWM3_1),			FM(SEL_PWM3_2),			F_(0, 0))
 #define MOD_SEL0_9		FM(SEL_PWM4_0)			FM(SEL_PWM4_1)
 #define MOD_SEL0_8		FM(SEL_PWM5_0)			FM(SEL_PWM5_1)
 #define MOD_SEL0_7		FM(SEL_PWM6_0)			FM(SEL_PWM6_1)
-#define MOD_SEL0_6_5		FM(SEL_REMOCON_0)		FM(SEL_REMOCON_1)		FM(SEL_REMOCON_2)		F_(0, 0)
+#define MOD_SEL0_6_5	   REV4(FM(SEL_REMOCON_0),		FM(SEL_REMOCON_1),		FM(SEL_REMOCON_2),		F_(0, 0))
 #define MOD_SEL0_4		FM(SEL_SCIF_0)			FM(SEL_SCIF_1)
 #define MOD_SEL0_3		FM(SEL_SCIF0_0)			FM(SEL_SCIF0_1)
 #define MOD_SEL0_2		FM(SEL_SCIF2_0)			FM(SEL_SCIF2_1)
-#define MOD_SEL0_1_0		FM(SEL_SPEED_PULSE_IF_0)	FM(SEL_SPEED_PULSE_IF_1)	FM(SEL_SPEED_PULSE_IF_2)	F_(0, 0)
+#define MOD_SEL0_1_0	   REV4(FM(SEL_SPEED_PULSE_IF_0),	FM(SEL_SPEED_PULSE_IF_1),	FM(SEL_SPEED_PULSE_IF_2),	F_(0, 0))
 
 /* MOD_SEL1 */			/* 0 */				/* 1 */				/* 2 */				/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */
 #define MOD_SEL1_31		FM(SEL_SIMCARD_0)		FM(SEL_SIMCARD_1)
@@ -422,18 +426,18 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
 #define MOD_SEL1_28		FM(SEL_USB_20_CH0_0)		FM(SEL_USB_20_CH0_1)
 #define MOD_SEL1_26		FM(SEL_DRIF2_0)			FM(SEL_DRIF2_1)
 #define MOD_SEL1_25		FM(SEL_DRIF3_0)			FM(SEL_DRIF3_1)
-#define MOD_SEL1_24_23_22	FM(SEL_HSCIF3_0)		FM(SEL_HSCIF3_1)		FM(SEL_HSCIF3_2)		FM(SEL_HSCIF3_3)	FM(SEL_HSCIF3_4)	F_(0, 0)	F_(0, 0)	F_(0, 0)
-#define MOD_SEL1_21_20_19	FM(SEL_HSCIF4_0)		FM(SEL_HSCIF4_1)		FM(SEL_HSCIF4_2)		FM(SEL_HSCIF4_3)	FM(SEL_HSCIF4_4)	F_(0, 0)	F_(0, 0)	F_(0, 0)
+#define MOD_SEL1_24_23_22  REV8(FM(SEL_HSCIF3_0),		FM(SEL_HSCIF3_1),		FM(SEL_HSCIF3_2),		FM(SEL_HSCIF3_3),	FM(SEL_HSCIF3_4),	F_(0, 0),	F_(0, 0),	F_(0, 0))
+#define MOD_SEL1_21_20_19  REV8(FM(SEL_HSCIF4_0),		FM(SEL_HSCIF4_1),		FM(SEL_HSCIF4_2),		FM(SEL_HSCIF4_3),	FM(SEL_HSCIF4_4),	F_(0, 0),	F_(0, 0),	F_(0, 0))
 #define MOD_SEL1_18		FM(SEL_I2C6_0)			FM(SEL_I2C6_1)
 #define MOD_SEL1_17		FM(SEL_I2C7_0)			FM(SEL_I2C7_1)
 #define MOD_SEL1_16		FM(SEL_MSIOF2_0)		FM(SEL_MSIOF2_1)
 #define MOD_SEL1_15		FM(SEL_MSIOF3_0)		FM(SEL_MSIOF3_1)
-#define MOD_SEL1_14_13		FM(SEL_SCIF3_0)			FM(SEL_SCIF3_1)			FM(SEL_SCIF3_2)			F_(0, 0)
-#define MOD_SEL1_12_11		FM(SEL_SCIF4_0)			FM(SEL_SCIF4_1)			FM(SEL_SCIF4_2)			F_(0, 0)
-#define MOD_SEL1_10_9		FM(SEL_SCIF5_0)			FM(SEL_SCIF5_1)			FM(SEL_SCIF5_2)			F_(0, 0)
+#define MOD_SEL1_14_13	   REV4(FM(SEL_SCIF3_0),		FM(SEL_SCIF3_1),		FM(SEL_SCIF3_2),		F_(0, 0))
+#define MOD_SEL1_12_11	   REV4(FM(SEL_SCIF4_0),		FM(SEL_SCIF4_1),		FM(SEL_SCIF4_2),		F_(0, 0))
+#define MOD_SEL1_10_9	   REV4(FM(SEL_SCIF5_0),		FM(SEL_SCIF5_1),		FM(SEL_SCIF5_2),		F_(0, 0))
 #define MOD_SEL1_8		FM(SEL_VIN4_0)			FM(SEL_VIN4_1)
 #define MOD_SEL1_7		FM(SEL_VIN5_0)			FM(SEL_VIN5_1)
-#define MOD_SEL1_6_5		FM(SEL_ADGC_0)			FM(SEL_ADGC_1)			FM(SEL_ADGC_2)			F_(0, 0)
+#define MOD_SEL1_6_5	   REV4(FM(SEL_ADGC_0),			FM(SEL_ADGC_1),			FM(SEL_ADGC_2),			F_(0, 0))
 #define MOD_SEL1_4		FM(SEL_SSI9_0)			FM(SEL_SSI9_1)
 
 #define PINMUX_MOD_SELS	\
-- 
2.17.1

