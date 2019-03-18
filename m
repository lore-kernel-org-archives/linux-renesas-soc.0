Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D04C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 16:40:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A97EC20854
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 16:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="NvgcGgT6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfCRQkb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 12:40:31 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:17698 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726922AbfCRQkb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 12:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1552927226;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=+7CZFmUkrJZJSlsLHV+hqs8R02mJ/CcJfi9450arLho=;
        b=NvgcGgT6oljF/OyXudnLLjbkQsJCKfTzdgG9CBhruIrk4WmuE5vtwu2NoLzTecqI40
        jY8sm+rFAQpC97tgEgxnLJ1OAHcGU932Y5DQalRqEG1Tcwl2t2O3JRJsrmVmsNykjyPN
        6ihvDdjmDl2o7W7j8pK7ipxQ8fLdXScC77HDsn3MTH3n50ebKpk9Pp20U2uoJ1dHErll
        XBC7k+ZFLLjWmyhz0PfaQXEf6CrDAdPujWfcCbWK1OSSIbBOiJk/xP7lVDT33Hqp41mt
        dc5NZBhcYjoeQInSqUlqpjkOD3Gpx0TnOTrHAS0WJGAhaMY2Xp4/Y1s69JmdTBwfEmY4
        PN7A==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvJ5qUpzBvrMmfJWi4wQa8="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.16 DYNA|AUTH)
        with ESMTPSA id R086cdv2IGeKC6d
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 18 Mar 2019 17:40:20 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        wsa@the-dreams.de
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] pinctrl: sh-pfc: r8a77965: Add I2C{0,3,5} pins, groups and functions
Date:   Mon, 18 Mar 2019 17:40:18 +0100
Message-Id: <1552927218-22394-1-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds I2C{0,3,5} pins, groups and functions to the R8A7796 SoC.

These pins are physically muxed with other pins. Therefore, setup of
MOD_SEL is needed for exclusive control with other pins.

[takeshi.kihara.df: add blank lines after function declarations]
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[uli: use standard macros PINMUX_IPSR_PHYS and PINMUX_IPSR_PHYS_MSEL]
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 106 ++++++++++++++++++++++++++++------
 1 file changed, 87 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index d2390e3..fd19993 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -558,6 +558,9 @@ MOD_SEL0_4_3		MOD_SEL1_4 \
 	FM(DU_DOTCLKIN0) FM(DU_DOTCLKIN1) FM(DU_DOTCLKIN3) \
 	FM(TMS) FM(TDO) FM(ASEBRK) FM(MLB_REF) FM(TDI) FM(TCK) FM(TRST) FM(EXTALR)
 
+#define PINMUX_PHYS \
+	FM(SCL0) FM(SDA0) FM(SCL3) FM(SDA3) FM(SCL5) FM(SDA5)
+
 enum {
 	PINMUX_RESERVED = 0,
 
@@ -583,6 +586,7 @@ enum {
 	PINMUX_IPSR
 	PINMUX_MOD_SELS
 	PINMUX_STATIC
+	PINMUX_PHYS
 	PINMUX_MARK_END,
 #undef F_
 #undef FM
@@ -620,13 +624,15 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP0_15_12,	TX4_A,			SEL_SCIF4_0),
 	PINMUX_IPSR_GPSR(IP0_19_16,	FSCLKST2_N_A),
 
-	PINMUX_IPSR_MSEL(IP0_19_16,	AVB_AVTP_MATCH_A,	SEL_ETHERAVB_0),
-	PINMUX_IPSR_MSEL(IP0_19_16,	MSIOF2_RXD_C,		SEL_MSIOF2_2),
-	PINMUX_IPSR_MSEL(IP0_19_16,	CTS4_N_A,		SEL_SCIF4_0),
+	PINMUX_IPSR_PHYS_MSEL(IP0_19_16,	AVB_AVTP_MATCH_A,	I2C_SEL_5_0, SEL_ETHERAVB_0),
+	PINMUX_IPSR_PHYS_MSEL(IP0_19_16,	MSIOF2_RXD_C,	I2C_SEL_5_0, SEL_MSIOF2_2),
+	PINMUX_IPSR_PHYS_MSEL(IP0_19_16,	CTS4_N_A,	I2C_SEL_5_0, SEL_SCIF4_0),
+	PINMUX_IPSR_PHYS(IP0_19_16,	SCL5,			I2C_SEL_5_1),
 
-	PINMUX_IPSR_MSEL(IP0_23_20,	AVB_AVTP_CAPTURE_A,	SEL_ETHERAVB_0),
-	PINMUX_IPSR_MSEL(IP0_23_20,	MSIOF2_TXD_C,		SEL_MSIOF2_2),
-	PINMUX_IPSR_MSEL(IP0_23_20,	RTS4_N_A,		SEL_SCIF4_0),
+	PINMUX_IPSR_PHYS_MSEL(IP0_23_20,	AVB_AVTP_CAPTURE_A,	I2C_SEL_5_0, SEL_ETHERAVB_0),
+	PINMUX_IPSR_PHYS_MSEL(IP0_23_20,	MSIOF2_TXD_C,		I2C_SEL_5_0, SEL_MSIOF2_2),
+	PINMUX_IPSR_PHYS_MSEL(IP0_23_20,	RTS4_N_A,		I2C_SEL_5_0, SEL_SCIF4_0),
+	PINMUX_IPSR_PHYS(IP0_23_20,	SDA5,			I2C_SEL_5_1),
 
 	PINMUX_IPSR_GPSR(IP0_27_24,	IRQ0),
 	PINMUX_IPSR_GPSR(IP0_27_24,	QPOLB),
@@ -679,14 +685,16 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP1_19_16,	VI4_DATA6_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP1_19_16,	IECLK_B,		SEL_IEBUS_1),
 
-	PINMUX_IPSR_MSEL(IP1_23_20,	PWM1_A,			SEL_PWM1_0),
-	PINMUX_IPSR_MSEL(IP1_23_20,	HRX3_D,			SEL_HSCIF3_3),
-	PINMUX_IPSR_MSEL(IP1_23_20,	VI4_DATA7_B,		SEL_VIN4_1),
-	PINMUX_IPSR_MSEL(IP1_23_20,	IERX_B,			SEL_IEBUS_1),
+	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	PWM1_A,		I2C_SEL_3_0,	SEL_PWM1_0),
+	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	HRX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
+	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	VI4_DATA7_B,	I2C_SEL_3_0,	SEL_VIN4_1),
+	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	IERX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
+	PINMUX_IPSR_PHYS(IP0_23_20,	SCL3,		I2C_SEL_3_1),
 
-	PINMUX_IPSR_MSEL(IP1_27_24,	PWM2_A,			SEL_PWM2_0),
-	PINMUX_IPSR_MSEL(IP1_27_24,	HTX3_D,			SEL_HSCIF3_3),
-	PINMUX_IPSR_MSEL(IP1_27_24,	IETX_B,			SEL_IEBUS_1),
+	PINMUX_IPSR_PHYS_MSEL(IP1_27_24,	PWM2_A,		I2C_SEL_3_0,	SEL_PWM2_0),
+	PINMUX_IPSR_PHYS_MSEL(IP1_27_24,	HTX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
+	PINMUX_IPSR_PHYS_MSEL(IP1_27_24,	IETX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
+	PINMUX_IPSR_PHYS(IP1_27_24,	SDA3,		I2C_SEL_3_1),
 
 	PINMUX_IPSR_GPSR(IP1_31_28,	A0),
 	PINMUX_IPSR_GPSR(IP1_31_28,	LCDOUT16),
@@ -1120,13 +1128,15 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP11_15_12,	NFDATA15_A,		SEL_NDFC_0),
 	PINMUX_IPSR_MSEL(IP11_15_12,	SDA2_B,			SEL_I2C2_1),
 
-	PINMUX_IPSR_GPSR(IP11_19_16,	SD1_CD),
-	PINMUX_IPSR_MSEL(IP11_19_16,	NFRB_N_A,		SEL_NDFC_0),
-	PINMUX_IPSR_MSEL(IP11_19_16,	SIM0_CLK_B,		SEL_SIMCARD_1),
+	PINMUX_IPSR_MSEL(IP11_19_16,	SD1_CD,			I2C_SEL_0_0),
+	PINMUX_IPSR_PHYS_MSEL(IP11_19_16,	NFRB_N_A,	I2C_SEL_0_0, SEL_NDFC_0),
+	PINMUX_IPSR_PHYS_MSEL(IP11_19_16,	SIM0_CLK_B,	I2C_SEL_0_0, SEL_SIMCARD_1),
+	PINMUX_IPSR_PHYS(IP11_19_16,	SCL0,			I2C_SEL_0_1),
 
-	PINMUX_IPSR_GPSR(IP11_23_20,	SD1_WP),
-	PINMUX_IPSR_MSEL(IP11_23_20,	NFCE_N_A,		SEL_NDFC_0),
-	PINMUX_IPSR_MSEL(IP11_23_20,	SIM0_D_B,		SEL_SIMCARD_1),
+	PINMUX_IPSR_MSEL(IP11_23_20,	SD1_WP,			I2C_SEL_0_0),
+	PINMUX_IPSR_PHYS_MSEL(IP11_23_20,	NFCE_N_A,	I2C_SEL_0_0, SEL_NDFC_0),
+	PINMUX_IPSR_PHYS_MSEL(IP11_23_20,	SIM0_D_B,	I2C_SEL_0_0, SEL_SIMCARD_1),
+	PINMUX_IPSR_PHYS(IP11_23_20,	SDA0,			I2C_SEL_0_1),
 
 	PINMUX_IPSR_GPSR(IP11_27_24,	SCK0),
 	PINMUX_IPSR_MSEL(IP11_27_24,	HSCK1_B,		SEL_HSCIF1_1),
@@ -2479,52 +2489,92 @@ static const unsigned int hscif4_data_b_mux[] = {
 };
 
 /* - I2C -------------------------------------------------------------------- */
+static const unsigned int i2c0_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(3, 14), RCAR_GP_PIN(3, 15),
+};
+
+static const unsigned int i2c0_mux[] = {
+	SCL0_MARK, SDA0_MARK,
+};
+
 static const unsigned int i2c1_a_pins[] = {
 	/* SDA, SCL */
 	RCAR_GP_PIN(5, 11), RCAR_GP_PIN(5, 10),
 };
+
 static const unsigned int i2c1_a_mux[] = {
 	SDA1_A_MARK, SCL1_A_MARK,
 };
+
 static const unsigned int i2c1_b_pins[] = {
 	/* SDA, SCL */
 	RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 23),
 };
+
 static const unsigned int i2c1_b_mux[] = {
 	SDA1_B_MARK, SCL1_B_MARK,
 };
+
 static const unsigned int i2c2_a_pins[] = {
 	/* SDA, SCL */
 	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 4),
 };
+
 static const unsigned int i2c2_a_mux[] = {
 	SDA2_A_MARK, SCL2_A_MARK,
 };
+
 static const unsigned int i2c2_b_pins[] = {
 	/* SDA, SCL */
 	RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 12),
 };
+
 static const unsigned int i2c2_b_mux[] = {
 	SDA2_B_MARK, SCL2_B_MARK,
 };
+
+static const unsigned int i2c3_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
+};
+
+static const unsigned int i2c3_mux[] = {
+	SCL3_MARK, SDA3_MARK,
+};
+
+static const unsigned int i2c5_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 14),
+};
+
+static const unsigned int i2c5_mux[] = {
+	SCL5_MARK, SDA5_MARK,
+};
+
 static const unsigned int i2c6_a_pins[] = {
 	/* SDA, SCL */
 	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 11),
 };
+
 static const unsigned int i2c6_a_mux[] = {
 	SDA6_A_MARK, SCL6_A_MARK,
 };
+
 static const unsigned int i2c6_b_pins[] = {
 	/* SDA, SCL */
 	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
 };
+
 static const unsigned int i2c6_b_mux[] = {
 	SDA6_B_MARK, SCL6_B_MARK,
 };
+
 static const unsigned int i2c6_c_pins[] = {
 	/* SDA, SCL */
 	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
 };
+
 static const unsigned int i2c6_c_mux[] = {
 	SDA6_C_MARK, SCL6_C_MARK,
 };
@@ -4414,10 +4464,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(hscif4_clk),
 	SH_PFC_PIN_GROUP(hscif4_ctrl),
 	SH_PFC_PIN_GROUP(hscif4_data_b),
+	SH_PFC_PIN_GROUP(i2c0),
 	SH_PFC_PIN_GROUP(i2c1_a),
 	SH_PFC_PIN_GROUP(i2c1_b),
 	SH_PFC_PIN_GROUP(i2c2_a),
 	SH_PFC_PIN_GROUP(i2c2_b),
+	SH_PFC_PIN_GROUP(i2c3),
+	SH_PFC_PIN_GROUP(i2c5),
 	SH_PFC_PIN_GROUP(i2c6_a),
 	SH_PFC_PIN_GROUP(i2c6_b),
 	SH_PFC_PIN_GROUP(i2c6_c),
@@ -4808,6 +4861,10 @@ static const char * const hscif4_groups[] = {
 	"hscif4_data_b",
 };
 
+static const char * const i2c0_groups[] = {
+	"i2c0",
+};
+
 static const char * const i2c1_groups[] = {
 	"i2c1_a",
 	"i2c1_b",
@@ -4818,6 +4875,14 @@ static const char * const i2c2_groups[] = {
 	"i2c2_b",
 };
 
+static const char * const i2c3_groups[] = {
+	"i2c3",
+};
+
+static const char * const i2c5_groups[] = {
+	"i2c5",
+};
+
 static const char * const i2c6_groups[] = {
 	"i2c6_a",
 	"i2c6_b",
@@ -5167,8 +5232,11 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(hscif2),
 	SH_PFC_FUNCTION(hscif3),
 	SH_PFC_FUNCTION(hscif4),
+	SH_PFC_FUNCTION(i2c0),
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
+	SH_PFC_FUNCTION(i2c3),
+	SH_PFC_FUNCTION(i2c5),
 	SH_PFC_FUNCTION(i2c6),
 	SH_PFC_FUNCTION(intc_ex),
 	SH_PFC_FUNCTION(msiof0),
-- 
2.7.4

