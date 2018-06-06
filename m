Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:15216 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932107AbeFFGny (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 02:43:54 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a77990: Revise USB ID pin name
Date: Wed,  6 Jun 2018 15:43:04 +0900
Message-Id: <1528267385-19017-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1528267385-19017-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1528267385-19017-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since the datasheet Rev.1.00 has an error about the USB ID pin name,
this patch revises it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index a68fd65..dc4a957 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -277,7 +277,7 @@
 #define IP11_15_12	FM(TX0_A)		FM(HTX1_A)		FM(SSI_WS2_A)		FM(RIF1_D0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	FM(TS_SDAT1)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_19_16	FM(CTS0_N_A)		FM(NFDATA14_A)		FM(AUDIO_CLKOUT_A)	FM(RIF1_D1)		FM(SCIF_CLK_A)		FM(FMCLK_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_23_20	FM(RTS0_N_TANS_A)	FM(NFDATA15_A)		FM(AUDIO_CLKOUT1_A)	FM(RIF1_CLK)		FM(SCL2_A)		FM(FMIN_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP11_27_24	FM(SCK0_A)		FM(HSCK1_A)		FM(USB3HS0_ID)		FM(RTS1_N_TANS)		FM(SDA2_A)		FM(FMCLK_C)	F_(0, 0)	F_(0, 0)	FM(USB1_ID)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP11_27_24	FM(SCK0_A)		FM(HSCK1_A)		FM(USB3HS0_ID)		FM(RTS1_N_TANS)		FM(SDA2_A)		FM(FMCLK_C)	F_(0, 0)	F_(0, 0)	FM(USB0_ID)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP11_31_28	FM(RX1)			FM(HRX2_B)		FM(SSI_SCK9_B)		FM(AUDIO_CLKOUT1_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IPSRx */		/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */		/* 8 */		/* 9 - F */
@@ -1082,7 +1082,7 @@ enum {
 	PINMUX_IPSR_GPSR(IP11_27_24,		RTS1_N_TANS),
 	PINMUX_IPSR_MSEL(IP11_27_24,		SDA2_A,		SEL_I2C2_0),
 	PINMUX_IPSR_MSEL(IP11_27_24,		FMCLK_C,	SEL_FM_2),
-	PINMUX_IPSR_GPSR(IP11_27_24,		USB1_ID),
+	PINMUX_IPSR_GPSR(IP11_27_24,		USB0_ID),
 
 	PINMUX_IPSR_GPSR(IP11_31_28,		RX1),
 	PINMUX_IPSR_MSEL(IP11_31_28,		HRX2_B,		SEL_HSCIF2_1),
-- 
1.9.1
