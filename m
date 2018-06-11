Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:39625 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933300AbeFKL7H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jun 2018 07:59:07 -0400
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 03/14] mfd: da9063: Use regmap_reg_range
Date: Mon, 11 Jun 2018 13:58:40 +0200
Message-Id: <20180611115851.1987-3-marek.vasut+renesas@gmail.com>
In-Reply-To: <20180611115851.1987-1-marek.vasut+renesas@gmail.com>
References: <20180611115851.1987-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Convert the regmap_range tables to use regmap_reg_range() macro.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
V5: New patch
V6: No change
---
 drivers/mfd/da9063-i2c.c | 174 ++++++++++++-----------------------------------
 1 file changed, 42 insertions(+), 132 deletions(-)

diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
index 29456e807ed4..e9797153bc19 100644
--- a/drivers/mfd/da9063-i2c.c
+++ b/drivers/mfd/da9063-i2c.c
@@ -29,78 +29,33 @@
 #include <linux/regulator/of_regulator.h>
 
 static const struct regmap_range da9063_ad_readable_ranges[] = {
-	{
-		.range_min = DA9063_REG_PAGE_CON,
-		.range_max = DA9063_AD_REG_SECOND_D,
-	}, {
-		.range_min = DA9063_REG_SEQ,
-		.range_max = DA9063_REG_ID_32_31,
-	}, {
-		.range_min = DA9063_REG_SEQ_A,
-		.range_max = DA9063_REG_AUTO3_LOW,
-	}, {
-		.range_min = DA9063_REG_T_OFFSET,
-		.range_max = DA9063_AD_REG_GP_ID_19,
-	}, {
-		.range_min = DA9063_REG_CHIP_ID,
-		.range_max = DA9063_REG_CHIP_VARIANT,
-	},
+	regmap_reg_range(DA9063_REG_PAGE_CON, DA9063_AD_REG_SECOND_D),
+	regmap_reg_range(DA9063_REG_SEQ, DA9063_REG_ID_32_31),
+	regmap_reg_range(DA9063_REG_SEQ_A, DA9063_REG_AUTO3_LOW),
+	regmap_reg_range(DA9063_REG_T_OFFSET, DA9063_AD_REG_GP_ID_19),
+	regmap_reg_range(DA9063_REG_CHIP_ID, DA9063_REG_CHIP_VARIANT),
 };
 
 static const struct regmap_range da9063_ad_writeable_ranges[] = {
-	{
-		.range_min = DA9063_REG_PAGE_CON,
-		.range_max = DA9063_REG_PAGE_CON,
-	}, {
-		.range_min = DA9063_REG_FAULT_LOG,
-		.range_max = DA9063_REG_VSYS_MON,
-	}, {
-		.range_min = DA9063_REG_COUNT_S,
-		.range_max = DA9063_AD_REG_ALARM_Y,
-	}, {
-		.range_min = DA9063_REG_SEQ,
-		.range_max = DA9063_REG_ID_32_31,
-	}, {
-		.range_min = DA9063_REG_SEQ_A,
-		.range_max = DA9063_REG_AUTO3_LOW,
-	}, {
-		.range_min = DA9063_REG_CONFIG_I,
-		.range_max = DA9063_AD_REG_MON_REG_4,
-	}, {
-		.range_min = DA9063_AD_REG_GP_ID_0,
-		.range_max = DA9063_AD_REG_GP_ID_19,
-	},
+	regmap_reg_range(DA9063_REG_PAGE_CON, DA9063_REG_PAGE_CON),
+	regmap_reg_range(DA9063_REG_FAULT_LOG, DA9063_REG_VSYS_MON),
+	regmap_reg_range(DA9063_REG_COUNT_S, DA9063_AD_REG_ALARM_Y),
+	regmap_reg_range(DA9063_REG_SEQ, DA9063_REG_ID_32_31),
+	regmap_reg_range(DA9063_REG_SEQ_A, DA9063_REG_AUTO3_LOW),
+	regmap_reg_range(DA9063_REG_CONFIG_I, DA9063_AD_REG_MON_REG_4),
+	regmap_reg_range(DA9063_AD_REG_GP_ID_0, DA9063_AD_REG_GP_ID_19),
 };
 
 static const struct regmap_range da9063_ad_volatile_ranges[] = {
-	{
-		.range_min = DA9063_REG_PAGE_CON,
-		.range_max = DA9063_REG_EVENT_D,
-	}, {
-		.range_min = DA9063_REG_CONTROL_A,
-		.range_max = DA9063_REG_CONTROL_B,
-	}, {
-		.range_min = DA9063_REG_CONTROL_E,
-		.range_max = DA9063_REG_CONTROL_F,
-	}, {
-		.range_min = DA9063_REG_BCORE2_CONT,
-		.range_max = DA9063_REG_LDO11_CONT,
-	}, {
-		.range_min = DA9063_REG_DVC_1,
-		.range_max = DA9063_REG_ADC_MAN,
-	}, {
-		.range_min = DA9063_REG_ADC_RES_L,
-		.range_max = DA9063_AD_REG_SECOND_D,
-	}, {
-		.range_min = DA9063_REG_SEQ,
-		.range_max = DA9063_REG_SEQ,
-	}, {
-		.range_min = DA9063_REG_EN_32K,
-		.range_max = DA9063_REG_EN_32K,
-	}, {
-		.range_min = DA9063_AD_REG_MON_REG_5,
-		.range_max = DA9063_AD_REG_MON_REG_6,
-	},
+	regmap_reg_range(DA9063_REG_PAGE_CON, DA9063_REG_EVENT_D),
+	regmap_reg_range(DA9063_REG_CONTROL_A, DA9063_REG_CONTROL_B),
+	regmap_reg_range(DA9063_REG_CONTROL_E, DA9063_REG_CONTROL_F),
+	regmap_reg_range(DA9063_REG_BCORE2_CONT, DA9063_REG_LDO11_CONT),
+	regmap_reg_range(DA9063_REG_DVC_1, DA9063_REG_ADC_MAN),
+	regmap_reg_range(DA9063_REG_ADC_RES_L, DA9063_AD_REG_SECOND_D),
+	regmap_reg_range(DA9063_REG_SEQ, DA9063_REG_SEQ),
+	regmap_reg_range(DA9063_REG_EN_32K, DA9063_REG_EN_32K),
+	regmap_reg_range(DA9063_AD_REG_MON_REG_5, DA9063_AD_REG_MON_REG_6),
 };
 
 static const struct regmap_access_table da9063_ad_readable_table = {
@@ -119,78 +74,33 @@ static const struct regmap_access_table da9063_ad_volatile_table = {
 };
 
 static const struct regmap_range da9063_bb_readable_ranges[] = {
-	{
-		.range_min = DA9063_REG_PAGE_CON,
-		.range_max = DA9063_BB_REG_SECOND_D,
-	}, {
-		.range_min = DA9063_REG_SEQ,
-		.range_max = DA9063_REG_ID_32_31,
-	}, {
-		.range_min = DA9063_REG_SEQ_A,
-		.range_max = DA9063_REG_AUTO3_LOW,
-	}, {
-		.range_min = DA9063_REG_T_OFFSET,
-		.range_max = DA9063_BB_REG_GP_ID_19,
-	}, {
-		.range_min = DA9063_REG_CHIP_ID,
-		.range_max = DA9063_REG_CHIP_VARIANT,
-	},
+	regmap_reg_range(DA9063_REG_PAGE_CON, DA9063_BB_REG_SECOND_D),
+	regmap_reg_range(DA9063_REG_SEQ, DA9063_REG_ID_32_31),
+	regmap_reg_range(DA9063_REG_SEQ_A, DA9063_REG_AUTO3_LOW),
+	regmap_reg_range(DA9063_REG_T_OFFSET, DA9063_BB_REG_GP_ID_19),
+	regmap_reg_range(DA9063_REG_CHIP_ID, DA9063_REG_CHIP_VARIANT),
 };
 
 static const struct regmap_range da9063_bb_writeable_ranges[] = {
-	{
-		.range_min = DA9063_REG_PAGE_CON,
-		.range_max = DA9063_REG_PAGE_CON,
-	}, {
-		.range_min = DA9063_REG_FAULT_LOG,
-		.range_max = DA9063_REG_VSYS_MON,
-	}, {
-		.range_min = DA9063_REG_COUNT_S,
-		.range_max = DA9063_BB_REG_ALARM_Y,
-	}, {
-		.range_min = DA9063_REG_SEQ,
-		.range_max = DA9063_REG_ID_32_31,
-	}, {
-		.range_min = DA9063_REG_SEQ_A,
-		.range_max = DA9063_REG_AUTO3_LOW,
-	}, {
-		.range_min = DA9063_REG_CONFIG_I,
-		.range_max = DA9063_BB_REG_MON_REG_4,
-	}, {
-		.range_min = DA9063_BB_REG_GP_ID_0,
-		.range_max = DA9063_BB_REG_GP_ID_19,
-	},
+	regmap_reg_range(DA9063_REG_PAGE_CON, DA9063_REG_PAGE_CON),
+	regmap_reg_range(DA9063_REG_FAULT_LOG, DA9063_REG_VSYS_MON),
+	regmap_reg_range(DA9063_REG_COUNT_S, DA9063_BB_REG_ALARM_Y),
+	regmap_reg_range(DA9063_REG_SEQ, DA9063_REG_ID_32_31),
+	regmap_reg_range(DA9063_REG_SEQ_A, DA9063_REG_AUTO3_LOW),
+	regmap_reg_range(DA9063_REG_CONFIG_I, DA9063_BB_REG_MON_REG_4),
+	regmap_reg_range(DA9063_BB_REG_GP_ID_0, DA9063_BB_REG_GP_ID_19),
 };
 
 static const struct regmap_range da9063_bb_volatile_ranges[] = {
-	{
-		.range_min = DA9063_REG_PAGE_CON,
-		.range_max = DA9063_REG_EVENT_D,
-	}, {
-		.range_min = DA9063_REG_CONTROL_A,
-		.range_max = DA9063_REG_CONTROL_B,
-	}, {
-		.range_min = DA9063_REG_CONTROL_E,
-		.range_max = DA9063_REG_CONTROL_F,
-	}, {
-		.range_min = DA9063_REG_BCORE2_CONT,
-		.range_max = DA9063_REG_LDO11_CONT,
-	}, {
-		.range_min = DA9063_REG_DVC_1,
-		.range_max = DA9063_REG_ADC_MAN,
-	}, {
-		.range_min = DA9063_REG_ADC_RES_L,
-		.range_max = DA9063_BB_REG_SECOND_D,
-	}, {
-		.range_min = DA9063_REG_SEQ,
-		.range_max = DA9063_REG_SEQ,
-	}, {
-		.range_min = DA9063_REG_EN_32K,
-		.range_max = DA9063_REG_EN_32K,
-	}, {
-		.range_min = DA9063_BB_REG_MON_REG_5,
-		.range_max = DA9063_BB_REG_MON_REG_6,
-	},
+	regmap_reg_range(DA9063_REG_PAGE_CON, DA9063_REG_EVENT_D),
+	regmap_reg_range(DA9063_REG_CONTROL_A, DA9063_REG_CONTROL_B),
+	regmap_reg_range(DA9063_REG_CONTROL_E, DA9063_REG_CONTROL_F),
+	regmap_reg_range(DA9063_REG_BCORE2_CONT, DA9063_REG_LDO11_CONT),
+	regmap_reg_range(DA9063_REG_DVC_1, DA9063_REG_ADC_MAN),
+	regmap_reg_range(DA9063_REG_ADC_RES_L, DA9063_BB_REG_SECOND_D),
+	regmap_reg_range(DA9063_REG_SEQ, DA9063_REG_SEQ),
+	regmap_reg_range(DA9063_REG_EN_32K, DA9063_REG_EN_32K),
+	regmap_reg_range(DA9063_BB_REG_MON_REG_5, DA9063_BB_REG_MON_REG_6),
 };
 
 static const struct regmap_access_table da9063_bb_readable_table = {
-- 
2.16.2
