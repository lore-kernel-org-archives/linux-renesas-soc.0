Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,
	UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAD9C04EB8
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:22:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A6042084E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A6042084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbeLLKWn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 05:22:43 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:18405 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727153AbeLLKWI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 05:22:08 -0500
X-IronPort-AV: E=Sophos;i="5.56,343,1539615600"; 
   d="scan'208";a="2417517"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 12 Dec 2018 19:22:05 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2C3294028B8B;
        Wed, 12 Dec 2018 19:22:05 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, linus.walleij@linaro.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL bit numbering
Date:   Wed, 12 Dec 2018 19:19:34 +0900
Message-Id: <1544609975-26477-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1544609975-26477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1544609975-26477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
[shimoda: split a patch per SoC and revise the commit log]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 8c06d72..8c75d31 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -392,28 +392,28 @@
 FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM(IP15_31_28)	IP15_31_28
 
 /* MOD_SEL0 */			/* 0 */				/* 1 */				/* 2 */				/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */
-#define MOD_SEL0_30_29		FM(SEL_ADGB_0)			FM(SEL_ADGB_1)			FM(SEL_ADGB_2)			F_(0, 0)
+#define MOD_SEL0_30_29		FM(SEL_ADGB_0)			FM(SEL_ADGB_2)			FM(SEL_ADGB_1)			F_(0, 0)
 #define MOD_SEL0_28		FM(SEL_DRIF0_0)			FM(SEL_DRIF0_1)
-#define MOD_SEL0_27_26		FM(SEL_FM_0)			FM(SEL_FM_1)			FM(SEL_FM_2)			F_(0, 0)
+#define MOD_SEL0_27_26		FM(SEL_FM_0)			FM(SEL_FM_2)			FM(SEL_FM_1)			F_(0, 0)
 #define MOD_SEL0_25		FM(SEL_FSO_0)			FM(SEL_FSO_1)
 #define MOD_SEL0_24		FM(SEL_HSCIF0_0)		FM(SEL_HSCIF0_1)
 #define MOD_SEL0_23		FM(SEL_HSCIF1_0)		FM(SEL_HSCIF1_1)
 #define MOD_SEL0_22		FM(SEL_HSCIF2_0)		FM(SEL_HSCIF2_1)
-#define MOD_SEL0_21_20		FM(SEL_I2C1_0)			FM(SEL_I2C1_1)			FM(SEL_I2C1_2)			FM(SEL_I2C1_3)		FM(SEL_I2C1_4)		F_(0, 0)	F_(0, 0)	F_(0, 0)
-#define MOD_SEL0_19_18_17	FM(SEL_I2C2_0)			FM(SEL_I2C2_1)			FM(SEL_I2C2_2)			FM(SEL_I2C2_3)		FM(SEL_I2C2_4)		F_(0, 0)	F_(0, 0)	F_(0, 0)
+#define MOD_SEL0_21_20		FM(SEL_I2C1_0)			FM(SEL_I2C1_2)			FM(SEL_I2C1_1)			FM(SEL_I2C1_3)
+#define MOD_SEL0_19_18_17	FM(SEL_I2C2_0)			FM(SEL_I2C2_4)			FM(SEL_I2C2_2)			F_(0, 0)		FM(SEL_I2C2_1)		F_(0, 0)	FM(SEL_I2C2_3)	F_(0, 0)
 #define MOD_SEL0_16		FM(SEL_NDFC_0)			FM(SEL_NDFC_1)
 #define MOD_SEL0_15		FM(SEL_PWM0_0)			FM(SEL_PWM0_1)
 #define MOD_SEL0_14		FM(SEL_PWM1_0)			FM(SEL_PWM1_1)
-#define MOD_SEL0_13_12		FM(SEL_PWM2_0)			FM(SEL_PWM2_1)			FM(SEL_PWM2_2)			F_(0, 0)
-#define MOD_SEL0_11_10		FM(SEL_PWM3_0)			FM(SEL_PWM3_1)			FM(SEL_PWM3_2)			F_(0, 0)
+#define MOD_SEL0_13_12		FM(SEL_PWM2_0)			FM(SEL_PWM2_2)			FM(SEL_PWM2_1)			F_(0, 0)
+#define MOD_SEL0_11_10		FM(SEL_PWM3_0)			FM(SEL_PWM3_2)			FM(SEL_PWM3_1)			F_(0, 0)
 #define MOD_SEL0_9		FM(SEL_PWM4_0)			FM(SEL_PWM4_1)
 #define MOD_SEL0_8		FM(SEL_PWM5_0)			FM(SEL_PWM5_1)
 #define MOD_SEL0_7		FM(SEL_PWM6_0)			FM(SEL_PWM6_1)
-#define MOD_SEL0_6_5		FM(SEL_REMOCON_0)		FM(SEL_REMOCON_1)		FM(SEL_REMOCON_2)		F_(0, 0)
+#define MOD_SEL0_6_5		FM(SEL_REMOCON_0)		FM(SEL_REMOCON_2)		FM(SEL_REMOCON_1)		F_(0, 0)
 #define MOD_SEL0_4		FM(SEL_SCIF_0)			FM(SEL_SCIF_1)
 #define MOD_SEL0_3		FM(SEL_SCIF0_0)			FM(SEL_SCIF0_1)
 #define MOD_SEL0_2		FM(SEL_SCIF2_0)			FM(SEL_SCIF2_1)
-#define MOD_SEL0_1_0		FM(SEL_SPEED_PULSE_IF_0)	FM(SEL_SPEED_PULSE_IF_1)	FM(SEL_SPEED_PULSE_IF_2)	F_(0, 0)
+#define MOD_SEL0_1_0		FM(SEL_SPEED_PULSE_IF_0)	FM(SEL_SPEED_PULSE_IF_2)	FM(SEL_SPEED_PULSE_IF_1)	F_(0, 0)
 
 /* MOD_SEL1 */			/* 0 */				/* 1 */				/* 2 */				/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */
 #define MOD_SEL1_31		FM(SEL_SIMCARD_0)		FM(SEL_SIMCARD_1)
@@ -422,18 +422,18 @@
 #define MOD_SEL1_28		FM(SEL_USB_20_CH0_0)		FM(SEL_USB_20_CH0_1)
 #define MOD_SEL1_26		FM(SEL_DRIF2_0)			FM(SEL_DRIF2_1)
 #define MOD_SEL1_25		FM(SEL_DRIF3_0)			FM(SEL_DRIF3_1)
-#define MOD_SEL1_24_23_22	FM(SEL_HSCIF3_0)		FM(SEL_HSCIF3_1)		FM(SEL_HSCIF3_2)		FM(SEL_HSCIF3_3)	FM(SEL_HSCIF3_4)	F_(0, 0)	F_(0, 0)	F_(0, 0)
-#define MOD_SEL1_21_20_19	FM(SEL_HSCIF4_0)		FM(SEL_HSCIF4_1)		FM(SEL_HSCIF4_2)		FM(SEL_HSCIF4_3)	FM(SEL_HSCIF4_4)	F_(0, 0)	F_(0, 0)	F_(0, 0)
+#define MOD_SEL1_24_23_22	FM(SEL_HSCIF3_0)		FM(SEL_HSCIF3_4)		FM(SEL_HSCIF3_2)		F_(0, 0)		FM(SEL_HSCIF3_1)	F_(0, 0)	FM(SEL_HSCIF3_3) F_(0, 0)
+#define MOD_SEL1_21_20_19	FM(SEL_HSCIF4_0)		FM(SEL_HSCIF4_4)		FM(SEL_HSCIF4_2)		F_(0, 0)		FM(SEL_HSCIF4_1)	F_(0, 0)	FM(SEL_HSCIF4_3) F_(0, 0)
 #define MOD_SEL1_18		FM(SEL_I2C6_0)			FM(SEL_I2C6_1)
 #define MOD_SEL1_17		FM(SEL_I2C7_0)			FM(SEL_I2C7_1)
 #define MOD_SEL1_16		FM(SEL_MSIOF2_0)		FM(SEL_MSIOF2_1)
 #define MOD_SEL1_15		FM(SEL_MSIOF3_0)		FM(SEL_MSIOF3_1)
-#define MOD_SEL1_14_13		FM(SEL_SCIF3_0)			FM(SEL_SCIF3_1)			FM(SEL_SCIF3_2)			F_(0, 0)
-#define MOD_SEL1_12_11		FM(SEL_SCIF4_0)			FM(SEL_SCIF4_1)			FM(SEL_SCIF4_2)			F_(0, 0)
-#define MOD_SEL1_10_9		FM(SEL_SCIF5_0)			FM(SEL_SCIF5_1)			FM(SEL_SCIF5_2)			F_(0, 0)
+#define MOD_SEL1_14_13		FM(SEL_SCIF3_0)			FM(SEL_SCIF3_2)			FM(SEL_SCIF3_1)			F_(0, 0)
+#define MOD_SEL1_12_11		FM(SEL_SCIF4_0)			FM(SEL_SCIF4_2)			FM(SEL_SCIF4_1)			F_(0, 0)
+#define MOD_SEL1_10_9		FM(SEL_SCIF5_0)			FM(SEL_SCIF5_2)			FM(SEL_SCIF5_1)			F_(0, 0)
 #define MOD_SEL1_8		FM(SEL_VIN4_0)			FM(SEL_VIN4_1)
 #define MOD_SEL1_7		FM(SEL_VIN5_0)			FM(SEL_VIN5_1)
-#define MOD_SEL1_6_5		FM(SEL_ADGC_0)			FM(SEL_ADGC_1)			FM(SEL_ADGC_2)			F_(0, 0)
+#define MOD_SEL1_6_5		FM(SEL_ADGC_0)			FM(SEL_ADGC_2)			FM(SEL_ADGC_1)			F_(0, 0)
 #define MOD_SEL1_4		FM(SEL_SSI9_0)			FM(SEL_SSI9_1)
 
 #define PINMUX_MOD_SELS	\
-- 
1.9.1

