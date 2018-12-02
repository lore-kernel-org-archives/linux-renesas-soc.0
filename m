Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55097 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbeLBTga (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Dec 2018 14:36:30 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 12/14] gpio: pca953x: Zap ad-hoc reg_output cache
Date: Sun,  2 Dec 2018 20:35:51 +0100
Message-Id: <20181202193553.29704-12-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Replace the ad-hoc reg_output output register caching with generic
regcache cache. Drop pca953x_write_single() which is no longer used.
This reduces code duplication.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 65 +++++++++----------------------------
 1 file changed, 15 insertions(+), 50 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index a01e9f158439..8155f1dd667b 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -141,7 +141,6 @@ static const struct pca953x_reg_config pca957x_regs = {
 
 struct pca953x_chip {
 	unsigned gpio_start;
-	u8 reg_output[MAX_BANK];
 	struct mutex i2c_lock;
 	struct regmap *regmap;
 
@@ -340,21 +339,6 @@ static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
 	return 0;
 }
 
-static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
-				int off)
-{
-	u8 regaddr = pca953x_recalc_addr(chip, reg, off, true, false);
-	int ret;
-
-	ret = regmap_write(chip->regmap, regaddr, val);
-	if (ret < 0) {
-		dev_err(&chip->client->dev, "failed writing register\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, true, true);
@@ -403,25 +387,17 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off,
 					true, false);
+	u8 outreg = pca953x_recalc_addr(chip, chip->regs->output, off,
+					true, false);
 	u8 bit = BIT(off % BANK_SZ);
-	u8 reg_val;
 	int ret;
 
 	mutex_lock(&chip->i2c_lock);
 	/* set output level */
-	if (val)
-		reg_val = chip->reg_output[off / BANK_SZ]
-			| (1u << (off % BANK_SZ));
-	else
-		reg_val = chip->reg_output[off / BANK_SZ]
-			& ~(1u << (off % BANK_SZ));
-
-	ret = pca953x_write_single(chip, chip->regs->output, reg_val, off);
+	ret = regmap_write_bits(chip->regmap, outreg, bit, val ? bit : 0);
 	if (ret)
 		goto exit;
 
-	chip->reg_output[off / BANK_SZ] = reg_val;
-
 	/* then direction */
 	ret = regmap_write_bits(chip->regmap, dirreg, bit, 0);
 exit:
@@ -452,23 +428,12 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 reg_val;
-	int ret;
+	u8 outreg = pca953x_recalc_addr(chip, chip->regs->output, off,
+					true, false);
+	u8 bit = BIT(off % BANK_SZ);
 
 	mutex_lock(&chip->i2c_lock);
-	if (val)
-		reg_val = chip->reg_output[off / BANK_SZ]
-			| (1u << (off % BANK_SZ));
-	else
-		reg_val = chip->reg_output[off / BANK_SZ]
-			& ~(1u << (off % BANK_SZ));
-
-	ret = pca953x_write_single(chip, chip->regs->output, reg_val, off);
-	if (ret)
-		goto exit;
-
-	chip->reg_output[off / BANK_SZ] = reg_val;
-exit:
+	regmap_write_bits(chip->regmap, outreg, bit, val ? bit : 0);
 	mutex_unlock(&chip->i2c_lock);
 }
 
@@ -500,7 +465,10 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 	int ret;
 
 	mutex_lock(&chip->i2c_lock);
-	memcpy(reg_val, chip->reg_output, NBANK(chip));
+	ret = pca953x_read_regs(chip, chip->regs->output, reg_val);
+	if (ret)
+		goto exit;
+
 	for (bank = 0; bank < NBANK(chip); bank++) {
 		bank_mask = mask[bank / sizeof(*mask)] >>
 			   ((bank % sizeof(*mask)) * 8);
@@ -512,11 +480,7 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 		}
 	}
 
-	ret = pca953x_write_regs(chip, chip->regs->output, reg_val);
-	if (ret)
-		goto exit;
-
-	memcpy(chip->reg_output, reg_val, NBANK(chip));
+	pca953x_write_regs(chip, chip->regs->output, reg_val);
 exit:
 	mutex_unlock(&chip->i2c_lock);
 }
@@ -815,8 +779,9 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
 	int ret;
 	u8 val[MAX_BANK];
 
-	ret = pca953x_read_regs(chip, chip->regs->output, chip->reg_output);
-	if (ret)
+	ret = regcache_sync_region(chip->regmap, chip->regs->output,
+				   chip->regs->output + NBANK(chip));
+	if (ret != 0)
 		goto out;
 
 	ret = regcache_sync_region(chip->regmap, chip->regs->direction,
-- 
2.18.0
