Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38650 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbeLBTgU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Dec 2018 14:36:20 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 04/14] gpio: pca953x: Unify pca95{3,7}x_write_regs_16()
Date: Sun,  2 Dec 2018 20:35:43 +0100
Message-Id: <20181202193553.29704-4-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

At this point, these two functions only differ in whether they do or do not
set the address increment bit on PCA9575. Merge these two functions together
to simplify the code a bit.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 479fa376bd18..2e02b3a9ac48 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -208,14 +208,11 @@ static int pca953x_write_regs_8(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca953x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	u16 word = get_unaligned((u16 *)val);
+	u32 regaddr = (reg << 1);
 
-	return i2c_smbus_write_word_data(chip->client, reg << 1, word);
-}
-
-static int pca957x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	u32 regaddr = (reg << 1) | REG_ADDR_AI;
+	/* PCA9575 needs address-increment on multi-byte writes */
+	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
+		regaddr |= REG_ADDR_AI;
 
 	return i2c_smbus_write_i2c_block_data(chip->client, regaddr,
 					      NBANK(chip), val);
@@ -892,10 +889,7 @@ static int pca953x_probe(struct i2c_client *client,
 		chip->write_regs = pca953x_write_regs_24;
 		chip->read_regs = pca953x_read_regs_24;
 	} else {
-		if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
-			chip->write_regs = pca953x_write_regs_16;
-		else
-			chip->write_regs = pca957x_write_regs_16;
+		chip->write_regs = pca953x_write_regs_16;
 		chip->read_regs = pca953x_read_regs_16;
 	}
 
-- 
2.18.0
