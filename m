Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36698 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbeLBTgQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Dec 2018 14:36:16 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 01/14] gpio: pca953x: Deduplicate the bank_size
Date: Sun,  2 Dec 2018 20:35:40 +0100
Message-Id: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The bank_size = fls(...) code was duplicated in the driver 5 times,
pull it into separate function.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 023a32cfac42..31e3b1b52330 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -159,11 +159,16 @@ struct pca953x_chip {
 	int (*read_regs)(struct pca953x_chip *, int, u8 *);
 };
 
+static int pca953x_bank_shift(struct pca953x_chip *chip)
+{
+	return fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+}
+
 static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
 				int off)
 {
 	int ret;
-	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+	int bank_shift = pca953x_bank_shift(chip);
 	int offset = off / BANK_SZ;
 
 	ret = i2c_smbus_read_byte_data(chip->client,
@@ -182,7 +187,7 @@ static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
 				int off)
 {
 	int ret;
-	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+	int bank_shift = pca953x_bank_shift(chip);
 	int offset = off / BANK_SZ;
 
 	ret = i2c_smbus_write_byte_data(chip->client,
@@ -221,7 +226,7 @@ static int pca957x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+	int bank_shift = pca953x_bank_shift(chip);
 	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
 	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
 
@@ -265,7 +270,7 @@ static int pca953x_read_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca953x_read_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+	int bank_shift = pca953x_bank_shift(chip);
 	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
 	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
 
@@ -402,13 +407,12 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 				      unsigned long *mask, unsigned long *bits)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	int bank_shift = pca953x_bank_shift(chip);
 	unsigned int bank_mask, bank_val;
-	int bank_shift, bank;
+	int bank;
 	u8 reg_val[MAX_BANK];
 	int ret;
 
-	bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
-
 	mutex_lock(&chip->i2c_lock);
 	memcpy(reg_val, chip->reg_output, NBANK(chip));
 	for (bank = 0; bank < NBANK(chip); bank++) {
-- 
2.18.0
