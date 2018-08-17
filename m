Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:14282 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbeHQQWX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 12:22:23 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: linux-renesas-soc@vger.kernel.org
Cc: horms@verge.net.au, wsa@the-dreams.de,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 2/3] pinctrl: sh-pfc: r8a7795-es1: Add I2C{0,3,5} pins, groups and functions
Date: Fri, 17 Aug 2018 15:18:40 +0200
Message-Id: <1534511921-19470-3-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534511921-19470-1-git-send-email-uli+renesas@fpond.eu>
References: <1534511921-19470-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds I2C{0,3,5} pins, groups and functions to
the R8A7795 ES1.x SoC.

These pins are physically muxed with other pins. Therefore, setup of
MOD_SEL is needed for exclusive control with other pins.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 103 ++++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index a6c5d50..b3aee4c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -540,6 +540,9 @@ MOD_SEL0_2_1		MOD_SEL1_2 \
 	FM(DU_DOTCLKIN0) FM(DU_DOTCLKIN1) FM(DU_DOTCLKIN2) FM(DU_DOTCLKIN3) \
 	FM(TMS) FM(TDO) FM(ASEBRK) FM(MLB_REF) FM(TDI) FM(TCK) FM(TRST) FM(EXTALR)
 
+#define PINMUX_PHYS \
+	FM(SCL0) FM(SDA0) FM(SCL3) FM(SDA3) FM(SCL5) FM(SDA5)
+
 enum {
 	PINMUX_RESERVED = 0,
 
@@ -565,11 +568,18 @@ enum {
 	PINMUX_IPSR
 	PINMUX_MOD_SELS
 	PINMUX_STATIC
+	PINMUX_PHYS
 	PINMUX_MARK_END,
 #undef F_
 #undef FM
 };
 
+#define PINMUX_IPSR_MSEL2(ipsr, fn, msel1, msel2) \
+	PINMUX_DATA(fn##_MARK, FN_##msel1, FN_##msel2, FN_##fn, FN_##ipsr)
+
+#define PINMUX_IPSR_PHYS(ipsr, fn, msel) \
+	PINMUX_DATA(fn##_MARK, FN_##msel)
+
 static const u16 pinmux_data[] = {
 	PINMUX_DATA_GP_ALL(),
 
@@ -577,9 +587,6 @@ static const u16 pinmux_data[] = {
 	PINMUX_SINGLE(AVS2),
 	PINMUX_SINGLE(HDMI0_CEC),
 	PINMUX_SINGLE(HDMI1_CEC),
-	PINMUX_SINGLE(I2C_SEL_0_1),
-	PINMUX_SINGLE(I2C_SEL_3_1),
-	PINMUX_SINGLE(I2C_SEL_5_1),
 	PINMUX_SINGLE(MSIOF0_RXD),
 	PINMUX_SINGLE(MSIOF0_SCK),
 	PINMUX_SINGLE(MSIOF0_TXD),
@@ -611,13 +618,15 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP0_15_12,	MSIOF2_SCK_C,		SEL_MSIOF2_2),
 	PINMUX_IPSR_MSEL(IP0_15_12,	TX4_A,			SEL_SCIF4_0),
 
-	PINMUX_IPSR_MSEL(IP0_19_16,	AVB_AVTP_MATCH_A,	SEL_ETHERAVB_0),
-	PINMUX_IPSR_MSEL(IP0_19_16,	MSIOF2_RXD_C,		SEL_MSIOF2_2),
-	PINMUX_IPSR_MSEL(IP0_19_16,	CTS4_N_A,		SEL_SCIF4_0),
+	PINMUX_IPSR_MSEL2(IP0_19_16,	AVB_AVTP_MATCH_A,	I2C_SEL_5_0, SEL_ETHERAVB_0),
+	PINMUX_IPSR_MSEL2(IP0_19_16,	MSIOF2_RXD_C,		I2C_SEL_5_0, SEL_MSIOF2_2),
+	PINMUX_IPSR_MSEL2(IP0_19_16,	CTS4_N_A,		I2C_SEL_5_0, SEL_SCIF4_0),
+	PINMUX_IPSR_PHYS(IP0_19_16,	SCL5,			I2C_SEL_5_1),
 
-	PINMUX_IPSR_MSEL(IP0_23_20,	AVB_AVTP_CAPTURE_A,	SEL_ETHERAVB_0),
-	PINMUX_IPSR_MSEL(IP0_23_20,	MSIOF2_TXD_C,		SEL_MSIOF2_2),
-	PINMUX_IPSR_MSEL(IP0_23_20,	RTS4_N_TANS_A,		SEL_SCIF4_0),
+	PINMUX_IPSR_MSEL2(IP0_23_20,	AVB_AVTP_CAPTURE_A,	I2C_SEL_5_0, SEL_ETHERAVB_0),
+	PINMUX_IPSR_MSEL2(IP0_23_20,	MSIOF2_TXD_C,		I2C_SEL_5_0, SEL_MSIOF2_2),
+	PINMUX_IPSR_MSEL2(IP0_23_20,	RTS4_N_TANS_A,		I2C_SEL_5_0, SEL_SCIF4_0),
+	PINMUX_IPSR_PHYS(IP0_23_20,	SDA5,			I2C_SEL_5_1),
 
 	PINMUX_IPSR_GPSR(IP0_27_24,	IRQ0),
 	PINMUX_IPSR_GPSR(IP0_27_24,	QPOLB),
@@ -667,16 +676,18 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP1_19_16,	VI4_DATA6_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP1_19_16,	IECLK_B,		SEL_IEBUS_1),
 
-	PINMUX_IPSR_MSEL(IP1_23_20,	PWM1_A,			SEL_PWM1_0),
-	PINMUX_IPSR_GPSR(IP1_23_20,	A21),
-	PINMUX_IPSR_MSEL(IP1_23_20,	HRX3_D,			SEL_HSCIF3_3),
-	PINMUX_IPSR_MSEL(IP1_23_20,	VI4_DATA7_B,		SEL_VIN4_1),
-	PINMUX_IPSR_MSEL(IP1_23_20,	IERX_B,			SEL_IEBUS_1),
+	PINMUX_IPSR_MSEL2(IP1_23_20,	PWM1_A,		I2C_SEL_3_0,	SEL_PWM1_0),
+	PINMUX_IPSR_MSEL(IP1_23_20,	A21,		I2C_SEL_3_0),
+	PINMUX_IPSR_MSEL2(IP1_23_20,	HRX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
+	PINMUX_IPSR_MSEL2(IP1_23_20,	VI4_DATA7_B,	I2C_SEL_3_0,	SEL_VIN4_1),
+	PINMUX_IPSR_MSEL2(IP1_23_20,	IERX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
+	PINMUX_IPSR_PHYS(IP0_23_20,	SCL3,		I2C_SEL_3_1),
 
-	PINMUX_IPSR_MSEL(IP1_27_24,	PWM2_A,			SEL_PWM2_0),
-	PINMUX_IPSR_GPSR(IP1_27_24,	A20),
-	PINMUX_IPSR_MSEL(IP1_27_24,	HTX3_D,			SEL_HSCIF3_3),
-	PINMUX_IPSR_MSEL(IP1_27_24,	IETX_B,			SEL_IEBUS_1),
+	PINMUX_IPSR_MSEL2(IP1_27_24,	PWM2_A,		I2C_SEL_3_0,	SEL_PWM2_0),
+	PINMUX_IPSR_MSEL(IP1_27_24,	A20,		I2C_SEL_3_0),
+	PINMUX_IPSR_MSEL2(IP1_27_24,	HTX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
+	PINMUX_IPSR_MSEL2(IP1_27_24,	IETX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
+	PINMUX_IPSR_PHYS(IP1_27_24,	SDA3,		I2C_SEL_3_1),
 
 	PINMUX_IPSR_GPSR(IP1_31_28,	A0),
 	PINMUX_IPSR_GPSR(IP1_31_28,	LCDOUT16),
@@ -1070,11 +1081,13 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP10_15_12,	SD0_WP),
 	PINMUX_IPSR_MSEL(IP10_15_12,	SDA2_B,			SEL_I2C2_1),
 
-	PINMUX_IPSR_GPSR(IP10_19_16,	SD1_CD),
-	PINMUX_IPSR_MSEL(IP10_19_16,	SIM0_CLK_B,		SEL_SIMCARD_1),
+	PINMUX_IPSR_MSEL(IP10_19_16,	SD1_CD,			I2C_SEL_0_0),
+	PINMUX_IPSR_MSEL2(IP10_19_16,	SIM0_CLK_B,		I2C_SEL_0_0, SEL_SIMCARD_1),
+	PINMUX_IPSR_PHYS(IP10_19_16,	SCL0,			I2C_SEL_0_1),
 
-	PINMUX_IPSR_GPSR(IP10_23_20,	SD1_WP),
-	PINMUX_IPSR_MSEL(IP10_23_20,	SIM0_D_B,		SEL_SIMCARD_1),
+	PINMUX_IPSR_MSEL(IP10_23_20,	SD1_WP,			I2C_SEL_0_0),
+	PINMUX_IPSR_MSEL2(IP10_23_20,	SIM0_D_B,		I2C_SEL_0_0, SEL_SIMCARD_1),
+	PINMUX_IPSR_PHYS(IP10_23_20,	SDA0,			I2C_SEL_0_1),
 
 	PINMUX_IPSR_GPSR(IP10_27_24,	SCK0),
 	PINMUX_IPSR_MSEL(IP10_27_24,	HSCK1_B,		SEL_HSCIF1_1),
@@ -2269,6 +2282,15 @@ static const unsigned int hscif4_data_b_mux[] = {
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
@@ -2297,6 +2319,25 @@ static const unsigned int i2c2_b_pins[] = {
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
@@ -3939,9 +3980,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(hscif4_clk),
 	SH_PFC_PIN_GROUP(hscif4_ctrl),
 	SH_PFC_PIN_GROUP(hscif4_data_b),
+	SH_PFC_PIN_GROUP(i2c0),
 	SH_PFC_PIN_GROUP(i2c1_a),
 	SH_PFC_PIN_GROUP(i2c1_b),
 	SH_PFC_PIN_GROUP(i2c2_a),
+	SH_PFC_PIN_GROUP(i2c3),
+	SH_PFC_PIN_GROUP(i2c5),
 	SH_PFC_PIN_GROUP(i2c2_b),
 	SH_PFC_PIN_GROUP(i2c6_a),
 	SH_PFC_PIN_GROUP(i2c6_b),
@@ -4312,6 +4356,10 @@ static const char * const hscif4_groups[] = {
 	"hscif4_data_b",
 };
 
+static const char * const i2c0_groups[] = {
+	"i2c0",
+};
+
 static const char * const i2c1_groups[] = {
 	"i2c1_a",
 	"i2c1_b",
@@ -4322,6 +4370,14 @@ static const char * const i2c2_groups[] = {
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
@@ -4654,8 +4710,11 @@ static const struct sh_pfc_function pinmux_functions[] = {
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
