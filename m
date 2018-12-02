Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40078 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbeLBTgY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Dec 2018 14:36:24 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 07/14] gpio: pca953x: Factor out common code from device_pca95xx_init()
Date: Sun,  2 Dec 2018 20:35:46 +0100
Message-Id: <20181202193553.29704-7-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The PCA957x and PCA953x init functions are almost the same, except for
the different register mapping and one extra write to BKEN register in
case of PCA957x. Factor out the common code.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 09fd8cde9ca9..dc691bd52a79 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -119,18 +119,21 @@ struct pca953x_reg_config {
 	int direction;
 	int output;
 	int input;
+	int invert;
 };
 
 static const struct pca953x_reg_config pca953x_regs = {
 	.direction = PCA953X_DIRECTION,
 	.output = PCA953X_OUTPUT,
 	.input = PCA953X_INPUT,
+	.invert = PCA953X_INVERT,
 };
 
 static const struct pca953x_reg_config pca957x_regs = {
 	.direction = PCA957X_CFG,
 	.output = PCA957X_OUT,
 	.input = PCA957X_IN,
+	.invert = PCA957X_INVRT,
 };
 
 struct pca953x_chip {
@@ -679,13 +682,11 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 }
 #endif
 
-static int device_pca953x_init(struct pca953x_chip *chip, u32 invert)
+static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
 {
 	int ret;
 	u8 val[MAX_BANK];
 
-	chip->regs = &pca953x_regs;
-
 	ret = pca953x_read_regs(chip, chip->regs->output, chip->reg_output);
 	if (ret)
 		goto out;
@@ -701,7 +702,7 @@ static int device_pca953x_init(struct pca953x_chip *chip, u32 invert)
 	else
 		memset(val, 0, NBANK(chip));
 
-	ret = pca953x_write_regs(chip, PCA953X_INVERT, val);
+	ret = pca953x_write_regs(chip, chip->regs->invert, val);
 out:
 	return ret;
 }
@@ -711,22 +712,7 @@ static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 	int ret;
 	u8 val[MAX_BANK];
 
-	chip->regs = &pca957x_regs;
-
-	ret = pca953x_read_regs(chip, chip->regs->output, chip->reg_output);
-	if (ret)
-		goto out;
-	ret = pca953x_read_regs(chip, chip->regs->direction,
-				chip->reg_direction);
-	if (ret)
-		goto out;
-
-	/* set platform specific polarity inversion */
-	if (invert)
-		memset(val, 0xFF, NBANK(chip));
-	else
-		memset(val, 0, NBANK(chip));
-	ret = pca953x_write_regs(chip, PCA957X_INVRT, val);
+	ret = device_pca95xx_init(chip, invert);
 	if (ret)
 		goto out;
 
@@ -842,10 +828,13 @@ static int pca953x_probe(struct i2c_client *client,
 	 */
 	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
-		ret = device_pca953x_init(chip, invert);
-	else
+	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE) {
+		chip->regs = &pca953x_regs;
+		ret = device_pca95xx_init(chip, invert);
+	} else {
+		chip->regs = &pca957x_regs;
 		ret = device_pca957x_init(chip, invert);
+	}
 	if (ret)
 		goto err_exit;
 
-- 
2.18.0
