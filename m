Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55094 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbeLBTg3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Dec 2018 14:36:29 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 11/14] gpio: pca953x: Zap ad-hoc reg_direction cache
Date: Sun,  2 Dec 2018 20:35:50 +0100
Message-Id: <20181202193553.29704-11-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Replace the ad-hoc reg_direction direction register caching with generic
regcache cache. This reduces code duplication.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 52 ++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 389fa891f342..a01e9f158439 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -142,7 +142,6 @@ static const struct pca953x_reg_config pca957x_regs = {
 struct pca953x_chip {
 	unsigned gpio_start;
 	u8 reg_output[MAX_BANK];
-	u8 reg_direction[MAX_BANK];
 	struct mutex i2c_lock;
 	struct regmap *regmap;
 
@@ -387,18 +386,13 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
 static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 reg_val;
+	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off,
+					true, false);
+	u8 bit = BIT(off % BANK_SZ);
 	int ret;
 
 	mutex_lock(&chip->i2c_lock);
-	reg_val = chip->reg_direction[off / BANK_SZ] | (1u << (off % BANK_SZ));
-
-	ret = pca953x_write_single(chip, chip->regs->direction, reg_val, off);
-	if (ret)
-		goto exit;
-
-	chip->reg_direction[off / BANK_SZ] = reg_val;
-exit:
+	ret = regmap_write_bits(chip->regmap, dirreg, bit, bit);
 	mutex_unlock(&chip->i2c_lock);
 	return ret;
 }
@@ -407,6 +401,9 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 		unsigned off, int val)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off,
+					true, false);
+	u8 bit = BIT(off % BANK_SZ);
 	u8 reg_val;
 	int ret;
 
@@ -426,12 +423,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	chip->reg_output[off / BANK_SZ] = reg_val;
 
 	/* then direction */
-	reg_val = chip->reg_direction[off / BANK_SZ] & ~(1u << (off % BANK_SZ));
-	ret = pca953x_write_single(chip, chip->regs->direction, reg_val, off);
-	if (ret)
-		goto exit;
-
-	chip->reg_direction[off / BANK_SZ] = reg_val;
+	ret = regmap_write_bits(chip->regmap, dirreg, bit, 0);
 exit:
 	mutex_unlock(&chip->i2c_lock);
 	return ret;
@@ -483,16 +475,19 @@ static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off,
+					true, false);
+	u8 bit = BIT(off % BANK_SZ);
 	u32 reg_val;
 	int ret;
 
 	mutex_lock(&chip->i2c_lock);
-	ret = pca953x_read_single(chip, chip->regs->direction, &reg_val, off);
+	ret = regmap_read(chip->regmap, dirreg, &reg_val);
 	mutex_unlock(&chip->i2c_lock);
 	if (ret < 0)
 		return ret;
 
-	return !!(reg_val & (1u << (off % BANK_SZ)));
+	return !!(reg_val & bit);
 }
 
 static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
@@ -580,6 +575,9 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	u8 new_irqs;
 	int level, i;
 	u8 invert_irq_mask[MAX_BANK];
+	u8 reg_direction[MAX_BANK];
+
+	regmap_read(chip->regmap, chip->regs->direction, reg_direction);
 
 	if (chip->driver_data & PCA_PCAL) {
 		/* Enable latch on interrupt-enabled inputs */
@@ -595,7 +593,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	/* Look for any newly setup interrupt */
 	for (i = 0; i < NBANK(chip); i++) {
 		new_irqs = chip->irq_trig_fall[i] | chip->irq_trig_raise[i];
-		new_irqs &= ~chip->reg_direction[i];
+		new_irqs &= reg_direction[i];
 
 		while (new_irqs) {
 			level = __ffs(new_irqs);
@@ -660,6 +658,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 	bool pending_seen = false;
 	bool trigger_seen = false;
 	u8 trigger[MAX_BANK];
+	u8 reg_direction[MAX_BANK];
 	int ret, i;
 
 	if (chip->driver_data & PCA_PCAL) {
@@ -690,8 +689,9 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 		return false;
 
 	/* Remove output pins from the equation */
+	regmap_read(chip->regmap, chip->regs->direction, reg_direction);
 	for (i = 0; i < NBANK(chip); i++)
-		cur_stat[i] &= chip->reg_direction[i];
+		cur_stat[i] &= reg_direction[i];
 
 	memcpy(old_stat, chip->irq_stat, NBANK(chip));
 
@@ -745,6 +745,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 			     int irq_base)
 {
 	struct i2c_client *client = chip->client;
+	u8 reg_direction[MAX_BANK];
 	int ret, i;
 
 	if (client->irq && irq_base != -1
@@ -759,8 +760,9 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 		 * interrupt.  We have to rely on the previous read for
 		 * this purpose.
 		 */
+		regmap_read(chip->regmap, chip->regs->direction, reg_direction);
 		for (i = 0; i < NBANK(chip); i++)
-			chip->irq_stat[i] &= chip->reg_direction[i];
+			chip->irq_stat[i] &= reg_direction[i];
 		mutex_init(&chip->irq_lock);
 
 		ret = devm_request_threaded_irq(&client->dev,
@@ -817,9 +819,9 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
 	if (ret)
 		goto out;
 
-	ret = pca953x_read_regs(chip, chip->regs->direction,
-				chip->reg_direction);
-	if (ret)
+	ret = regcache_sync_region(chip->regmap, chip->regs->direction,
+				   chip->regs->direction + NBANK(chip));
+	if (ret != 0)
 		goto out;
 
 	/* set platform specific polarity inversion */
@@ -937,6 +939,8 @@ static int pca953x_probe(struct i2c_client *client,
 		goto err_exit;
 	}
 
+	regcache_mark_dirty(chip->regmap);
+
 	mutex_init(&chip->i2c_lock);
 	/*
 	 * In case we have an i2c-mux controlled by a GPIO provided by an
-- 
2.18.0
