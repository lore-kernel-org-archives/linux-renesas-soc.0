Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55092 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbeLBTg2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Dec 2018 14:36:28 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 09/14] gpio: pca953x: Extract the register address mangling to single function
Date: Sun,  2 Dec 2018 20:35:48 +0100
Message-Id: <20181202193553.29704-9-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Instead of having the I2C register calculation function spread across
multiple accessor functions, pull it out into a single function which
returns the adjusted register address.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 59 ++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index b3386819c550..7e66f46b41b2 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -164,17 +164,37 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
 	return fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
 }
 
+static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
+			      bool write, bool addrinc)
+{
+	int bank_shift = pca953x_bank_shift(chip);
+	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
+	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
+	u8 regaddr = pinctrl | addr | (off / BANK_SZ);
+
+	/* Single byte read doesn't need AI bit set. */
+	if (!addrinc)
+		return regaddr;
+
+	/* Chips with 24 and more GPIOs always support Auto Increment */
+	if (write && NBANK(chip) > 2)
+		regaddr |= REG_ADDR_AI;
+
+	/* PCA9575 needs address-increment on multi-byte writes */
+	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
+		regaddr |= REG_ADDR_AI;
+
+	return regaddr;
+}
+
 static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
 				int off)
 {
+	u8 regaddr = pca953x_recalc_addr(chip, reg, off, false, false);
 	int ret;
-	int bank_shift = pca953x_bank_shift(chip);
-	int offset = off / BANK_SZ;
 
-	ret = i2c_smbus_read_byte_data(chip->client,
-				(reg << bank_shift) + offset);
+	ret = i2c_smbus_read_byte_data(chip->client, regaddr);
 	*val = ret;
-
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed reading register\n");
 		return ret;
@@ -186,13 +206,10 @@ static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
 static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
 				int off)
 {
+	u8 regaddr = pca953x_recalc_addr(chip, reg, off, true, false);
 	int ret;
-	int bank_shift = pca953x_bank_shift(chip);
-	int offset = off / BANK_SZ;
-
-	ret = i2c_smbus_write_byte_data(chip->client,
-					(reg << bank_shift) + offset, val);
 
+	ret = i2c_smbus_write_byte_data(chip->client, regaddr, val);
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed writing register\n");
 		return ret;
@@ -203,20 +220,9 @@ static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
 
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	int bank_shift = pca953x_bank_shift(chip);
-	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
-	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
-	u8 regaddr = pinctrl | addr;
+	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, true, true);
 	int ret;
 
-	/* Chips with 24 and more GPIOs always support Auto Increment */
-	if (NBANK(chip) > 2)
-		regaddr |= REG_ADDR_AI;
-
-	/* PCA9575 needs address-increment on multi-byte writes */
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
-		regaddr |= REG_ADDR_AI;
-
 	ret = i2c_smbus_write_i2c_block_data(chip->client, regaddr,
 					     NBANK(chip), val);
 	if (ret < 0) {
@@ -229,16 +235,9 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	int bank_shift = pca953x_bank_shift(chip);
-	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
-	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
-	u8 regaddr = pinctrl | addr;
+	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, false, true);
 	int ret;
 
-	/* Chips with 24 and more GPIOs always support Auto Increment */
-	if (NBANK(chip) > 2)
-		regaddr |= REG_ADDR_AI;
-
 	ret = i2c_smbus_read_i2c_block_data(chip->client, regaddr,
 					    NBANK(chip), val);
 	if (ret < 0) {
-- 
2.18.0
