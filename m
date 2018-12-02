Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33520 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbeLBTgb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Dec 2018 14:36:31 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 13/14] gpio: pca953x: Zap single use of pca953x_read_single()
Date: Sun,  2 Dec 2018 20:35:52 +0100
Message-Id: <20181202193553.29704-13-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Drop pca953x_write_single() which is used in one place.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 8155f1dd667b..7c0122fac383 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -324,21 +324,6 @@ static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
 	return regaddr;
 }
 
-static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
-				int off)
-{
-	u8 regaddr = pca953x_recalc_addr(chip, reg, off, false, false);
-	int ret;
-
-	ret = regmap_read(chip->regmap, regaddr, val);
-	if (ret < 0) {
-		dev_err(&chip->client->dev, "failed reading register\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, true, true);
@@ -408,11 +393,14 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	u8 inreg = pca953x_recalc_addr(chip, chip->regs->input, off,
+				       true, false);
+	u8 bit = BIT(off % BANK_SZ);
 	u32 reg_val;
 	int ret;
 
 	mutex_lock(&chip->i2c_lock);
-	ret = pca953x_read_single(chip, chip->regs->input, &reg_val, off);
+	ret = regmap_read(chip->regmap, inreg, &reg_val);
 	mutex_unlock(&chip->i2c_lock);
 	if (ret < 0) {
 		/* NOTE:  diagnostic already emitted; that's all we should
@@ -422,7 +410,7 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 		return 0;
 	}
 
-	return (reg_val & (1u << (off % BANK_SZ))) ? 1 : 0;
+	return !!(reg_val & bit);
 }
 
 static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
-- 
2.18.0
