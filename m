Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56094 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbeLBTgX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Dec 2018 14:36:23 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 06/14] gpio: pca953x: Unify pca953x_{read,write}_regs_{8,mul}()
Date: Sun,  2 Dec 2018 20:35:45 +0100
Message-Id: <20181202193553.29704-6-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

At this point, the pca953x_{read,write}_regs_mul() can read single bank
PCA953x GPIO chips as well. Merge the _8 and _mul functions together to
simplify the code a bit.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 54 ++++++-------------------------------
 1 file changed, 8 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 551fa69661b2..09fd8cde9ca9 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -154,9 +154,6 @@ struct pca953x_chip {
 	struct regulator *regulator;
 
 	const struct pca953x_reg_config *regs;
-
-	int (*write_regs)(struct pca953x_chip *, int, u8 *);
-	int (*read_regs)(struct pca953x_chip *, int, u8 *);
 };
 
 static int pca953x_bank_shift(struct pca953x_chip *chip)
@@ -201,17 +198,13 @@ static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
 	return 0;
 }
 
-static int pca953x_write_regs_8(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	return i2c_smbus_write_byte_data(chip->client, reg, *val);
-}
-
-static int pca953x_write_regs_mul(struct pca953x_chip *chip, int reg, u8 *val)
+static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	int bank_shift = pca953x_bank_shift(chip);
 	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
 	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
 	u8 regaddr = pinctrl | addr;
+	int ret;
 
 	/* Chips with 24 and more GPIOs always support Auto Increment */
 	if (NBANK(chip) > 2)
@@ -221,15 +214,8 @@ static int pca953x_write_regs_mul(struct pca953x_chip *chip, int reg, u8 *val)
 	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
 		regaddr |= REG_ADDR_AI;
 
-	return i2c_smbus_write_i2c_block_data(chip->client, regaddr,
-					      NBANK(chip), val);
-}
-
-static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	int ret = 0;
-
-	ret = chip->write_regs(chip, reg, val);
+	ret = i2c_smbus_write_i2c_block_data(chip->client, regaddr,
+					     NBANK(chip), val);
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed writing register\n");
 		return ret;
@@ -238,36 +224,20 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 	return 0;
 }
 
-static int pca953x_read_regs_8(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	int ret;
-
-	ret = i2c_smbus_read_byte_data(chip->client, reg);
-	*val = ret;
-
-	return ret;
-}
-
-static int pca953x_read_regs_mul(struct pca953x_chip *chip, int reg, u8 *val)
+static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	int bank_shift = pca953x_bank_shift(chip);
 	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
 	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
 	u8 regaddr = pinctrl | addr;
+	int ret;
 
 	/* Chips with 24 and more GPIOs always support Auto Increment */
 	if (NBANK(chip) > 2)
 		regaddr |= REG_ADDR_AI;
 
-	return i2c_smbus_read_i2c_block_data(chip->client, regaddr,
-					     NBANK(chip), val);
-}
-
-static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	int ret;
-
-	ret = chip->read_regs(chip, reg, val);
+	ret = i2c_smbus_read_i2c_block_data(chip->client, regaddr,
+					    NBANK(chip), val);
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed reading register\n");
 		return ret;
@@ -872,14 +842,6 @@ static int pca953x_probe(struct i2c_client *client,
 	 */
 	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
 
-	if (chip->gpio_chip.ngpio <= 8) {
-		chip->write_regs = pca953x_write_regs_8;
-		chip->read_regs = pca953x_read_regs_8;
-	} else {
-		chip->write_regs = pca953x_write_regs_mul;
-		chip->read_regs = pca953x_read_regs_mul;
-	}
-
 	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
 		ret = device_pca953x_init(chip, invert);
 	else
-- 
2.18.0
