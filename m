Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56093 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbeLBTgV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Dec 2018 14:36:21 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 05/14] gpio: pca953x: Unify pca953x_{read,write}_regs_{16,24}()
Date: Sun,  2 Dec 2018 20:35:44 +0100
Message-Id: <20181202193553.29704-5-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

At this point, these two functions only differ in whether they do or do not
set the address increment bit. The 16 GPIO case does not need to set the AI
bit, except for PCA9575 on write, while the 24 GPIO and more case does set
the AI bit always. Merge these two functions together to simplify the code
a bit.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 49 ++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 2e02b3a9ac48..551fa69661b2 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -206,9 +206,16 @@ static int pca953x_write_regs_8(struct pca953x_chip *chip, int reg, u8 *val)
 	return i2c_smbus_write_byte_data(chip->client, reg, *val);
 }
 
-static int pca953x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
+static int pca953x_write_regs_mul(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	u32 regaddr = (reg << 1);
+	int bank_shift = pca953x_bank_shift(chip);
+	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
+	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
+	u8 regaddr = pinctrl | addr;
+
+	/* Chips with 24 and more GPIOs always support Auto Increment */
+	if (NBANK(chip) > 2)
+		regaddr |= REG_ADDR_AI;
 
 	/* PCA9575 needs address-increment on multi-byte writes */
 	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
@@ -218,17 +225,6 @@ static int pca953x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 					      NBANK(chip), val);
 }
 
-static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	int bank_shift = pca953x_bank_shift(chip);
-	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
-	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
-
-	return i2c_smbus_write_i2c_block_data(chip->client,
-					      pinctrl | addr | REG_ADDR_AI,
-					      NBANK(chip), val);
-}
-
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	int ret = 0;
@@ -252,24 +248,18 @@ static int pca953x_read_regs_8(struct pca953x_chip *chip, int reg, u8 *val)
 	return ret;
 }
 
-static int pca953x_read_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	int ret;
-
-	ret = i2c_smbus_read_word_data(chip->client, reg << 1);
-	put_unaligned(ret, (u16 *)val);
-
-	return ret;
-}
-
-static int pca953x_read_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
+static int pca953x_read_regs_mul(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	int bank_shift = pca953x_bank_shift(chip);
 	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
 	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
+	u8 regaddr = pinctrl | addr;
+
+	/* Chips with 24 and more GPIOs always support Auto Increment */
+	if (NBANK(chip) > 2)
+		regaddr |= REG_ADDR_AI;
 
-	return i2c_smbus_read_i2c_block_data(chip->client,
-					     pinctrl | addr | REG_ADDR_AI,
+	return i2c_smbus_read_i2c_block_data(chip->client, regaddr,
 					     NBANK(chip), val);
 }
 
@@ -885,12 +875,9 @@ static int pca953x_probe(struct i2c_client *client,
 	if (chip->gpio_chip.ngpio <= 8) {
 		chip->write_regs = pca953x_write_regs_8;
 		chip->read_regs = pca953x_read_regs_8;
-	} else if (chip->gpio_chip.ngpio >= 24) {
-		chip->write_regs = pca953x_write_regs_24;
-		chip->read_regs = pca953x_read_regs_24;
 	} else {
-		chip->write_regs = pca953x_write_regs_16;
-		chip->read_regs = pca953x_read_regs_16;
+		chip->write_regs = pca953x_write_regs_mul;
+		chip->read_regs = pca953x_read_regs_mul;
 	}
 
 	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
-- 
2.18.0
