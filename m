Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33511 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbeLBTgT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Dec 2018 14:36:19 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 03/14] gpio: pca953x: Repair multi-byte IO address increment on PCA9575
Date: Sun,  2 Dec 2018 20:35:42 +0100
Message-Id: <20181202193553.29704-3-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The multi-byte IO on various pca953x chips requires the auto-increment bit,
while other chips toggle the LSbit automatically. Note that LSbit toggling
only alternates between two registers during the IO, it is not the same as
address auto-increment. The driver currently assumes that #gpios > 16 implies
auto-increment, while #gpios <= 16 implies LSbit toggling. This is incorrect
at there are chips with 16 GPIOs which require the auto-increment bit.

The PCA9575, according to NXP datasheet rev. 4.2 from 16 April 2015, section
7.3 Command Register, the bit 7 in command register is the auto-increment
bit, which allows programming multiple registers sequentially.

Set this bit both in pca953x_gpio_set_multiple(), where it fixes the multi
register programming, and in pca957x_write_regs_16(), where is simplifies
the function. In fact, the pca957x_write_regs_16() now looks rather similar
to pca953x_write_regs_24() and pca953x_write_regs_16(), which is intended
for subsequent patches.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 4e9c79ca69c5..479fa376bd18 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -215,13 +215,10 @@ static int pca953x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca957x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	int ret;
-
-	ret = i2c_smbus_write_byte_data(chip->client, reg << 1, val[0]);
-	if (ret < 0)
-		return ret;
+	u32 regaddr = (reg << 1) | REG_ADDR_AI;
 
-	return i2c_smbus_write_byte_data(chip->client, (reg << 1) + 1, val[1]);
+	return i2c_smbus_write_i2c_block_data(chip->client, regaddr,
+					      NBANK(chip), val);
 }
 
 static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
@@ -408,6 +405,7 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	int bank_shift = pca953x_bank_shift(chip);
+	u32 regaddr = chip->regs->output << bank_shift;
 	unsigned int bank_mask, bank_val;
 	int bank;
 	u8 reg_val[MAX_BANK];
@@ -426,8 +424,13 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 		}
 	}
 
-	ret = i2c_smbus_write_i2c_block_data(chip->client,
-					     chip->regs->output << bank_shift,
+	/* PCA9575 needs address-increment on multi-byte writes */
+	if ((PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) &&
+	    (NBANK(chip) > 1)) {
+		regaddr |= REG_ADDR_AI;
+	}
+
+	ret = i2c_smbus_write_i2c_block_data(chip->client, regaddr,
 					     NBANK(chip), reg_val);
 	if (ret)
 		goto exit;
-- 
2.18.0
