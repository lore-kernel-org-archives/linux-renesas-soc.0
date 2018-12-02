Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53023 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbeLBTg2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Dec 2018 14:36:28 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 10/14] gpio: pca953x: Perform basic regmap conversion
Date: Sun,  2 Dec 2018 20:35:49 +0100
Message-Id: <20181202193553.29704-10-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Convert the driver to use regmap to access the chips. Due to the convoluted
register mapping scheme, implement read/write/volatile check functions that
untangle the mess and perform check accordingly. This patch does not zap the
internal register cache of the PCA953x driver, nor does it push the regmap
access down into the gpiochip accessors to simplify the review. All that is
in subsequent patches.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 159 ++++++++++++++++++++++++++++++++++--
 1 file changed, 151 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 7e66f46b41b2..389fa891f342 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_data/pca953x.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
@@ -30,6 +31,8 @@
 #define PCA953X_INVERT		0x02
 #define PCA953X_DIRECTION	0x03
 
+#define REG_ADDR_MASK		0x3f
+#define REG_ADDR_EXT		0x40
 #define REG_ADDR_AI		0x80
 
 #define PCA957X_IN		0x00
@@ -141,6 +144,7 @@ struct pca953x_chip {
 	u8 reg_output[MAX_BANK];
 	u8 reg_direction[MAX_BANK];
 	struct mutex i2c_lock;
+	struct regmap *regmap;
 
 #ifdef CONFIG_GPIO_PCA953X_IRQ
 	struct mutex irq_lock;
@@ -164,6 +168,141 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
 	return fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
 }
 
+#define PCA953x_BANK_INPUT	BIT(0)
+#define PCA953x_BANK_OUTPUT	BIT(1)
+#define PCA953x_BANK_POLARITY	BIT(2)
+#define PCA953x_BANK_CONFIG	BIT(3)
+
+#define PCA957x_BANK_INPUT	BIT(0)
+#define PCA957x_BANK_POLARITY	BIT(1)
+#define PCA957x_BANK_BUSHOLD	BIT(2)
+#define PCA957x_BANK_CONFIG	BIT(4)
+#define PCA957x_BANK_OUTPUT	BIT(5)
+
+#define PCAL9xxx_BANK_IN_LATCH	BIT(8 + 2)
+#define PCAL9xxx_BANK_IRQ_MASK	BIT(8 + 5)
+#define PCAL9xxx_BANK_IRQ_STAT	BIT(8 + 6)
+
+/*
+ * We care about the following registers:
+ * - Standard set, below 0x40, each port can be replicated up to 8 times
+ *   - PCA953x standard
+ *     Input port			0x00 + 0 * bank_size	R
+ *     Output port			0x00 + 1 * bank_size	RW
+ *     Polarity Inversion port		0x00 + 2 * bank_size	RW
+ *     Configuration port		0x00 + 3 * bank_size	RW
+ *   - PCA957x with mixed up registers
+ *     Input port			0x00 + 0 * bank_size	R
+ *     Polarity Inversion port		0x00 + 1 * bank_size	RW
+ *     Bus hold port			0x00 + 2 * bank_size	RW
+ *     Configuration port		0x00 + 4 * bank_size	RW
+ *     Output port			0x00 + 5 * bank_size	RW
+ *
+ * - Extended set, above 0x40, often chip specific.
+ *   - PCAL6524/PCAL9555A with custom PCAL IRQ handling:
+ *     Input latch register		0x40 + 2 * bank_size	RW
+ *     Interrupt mask register		0x40 + 5 * bank_size	RW
+ *     Interrupt status register	0x40 + 6 * bank_size	R
+ *
+ * - Registers with bit 0x80 set, the AI bit
+ *   The bit is cleared and the registers fall into one of the
+ *   categories above.
+ */
+
+static bool pca953x_check_register(struct pca953x_chip *chip, unsigned int reg,
+				   u32 checkbank)
+{
+	int bank_shift = pca953x_bank_shift(chip);
+	int bank = (reg & REG_ADDR_MASK) >> bank_shift;
+	int offset = reg & (BIT(bank_shift) - 1);
+
+	/* Special PCAL extended register check. */
+	if (reg & REG_ADDR_EXT) {
+		if (!(chip->driver_data & PCA_PCAL))
+			return false;
+		bank += 8;
+	}
+
+	/* Register is not in the matching bank. */
+	if (!(BIT(bank) & checkbank))
+		return false;
+
+	/* Register is not within allowed range of bank. */
+	if (offset >= NBANK(chip))
+		return false;
+
+	return true;
+}
+
+static bool pca953x_readable_register(struct device *dev, unsigned int reg)
+{
+	struct pca953x_chip *chip = dev_get_drvdata(dev);
+	u32 bank;
+
+	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE) {
+		bank = PCA953x_BANK_INPUT | PCA953x_BANK_OUTPUT |
+		       PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG;
+	} else {
+		bank = PCA957x_BANK_INPUT | PCA957x_BANK_OUTPUT |
+		       PCA957x_BANK_POLARITY | PCA957x_BANK_CONFIG |
+		       PCA957x_BANK_BUSHOLD;
+	}
+
+	if (chip->driver_data & PCA_PCAL) {
+		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_IRQ_MASK |
+			PCAL9xxx_BANK_IRQ_STAT;
+	}
+
+	return pca953x_check_register(chip, reg, bank);
+}
+
+static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
+{
+	struct pca953x_chip *chip = dev_get_drvdata(dev);
+	u32 bank;
+
+	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE) {
+		bank = PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
+			PCA953x_BANK_CONFIG;
+	} else {
+		bank = PCA957x_BANK_OUTPUT | PCA957x_BANK_POLARITY |
+			PCA957x_BANK_CONFIG | PCA957x_BANK_BUSHOLD;
+	}
+
+	if (chip->driver_data & PCA_PCAL)
+		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_IRQ_MASK;
+
+	return pca953x_check_register(chip, reg, bank);
+}
+
+static bool pca953x_volatile_register(struct device *dev, unsigned int reg)
+{
+	struct pca953x_chip *chip = dev_get_drvdata(dev);
+	u32 bank;
+
+	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
+		bank = PCA953x_BANK_INPUT;
+	else
+		bank = PCA957x_BANK_INPUT;
+
+	if (chip->driver_data & PCA_PCAL)
+		bank |= PCAL9xxx_BANK_IRQ_STAT;
+
+	return pca953x_check_register(chip, reg, bank);
+}
+
+const struct regmap_config pca953x_i2c_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.readable_reg = pca953x_readable_register,
+	.writeable_reg = pca953x_writeable_register,
+	.volatile_reg = pca953x_volatile_register,
+
+	.cache_type = REGCACHE_RBTREE,
+	.max_register = 0x7f,
+};
+
 static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
 			      bool write, bool addrinc)
 {
@@ -193,8 +332,7 @@ static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
 	u8 regaddr = pca953x_recalc_addr(chip, reg, off, false, false);
 	int ret;
 
-	ret = i2c_smbus_read_byte_data(chip->client, regaddr);
-	*val = ret;
+	ret = regmap_read(chip->regmap, regaddr, val);
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed reading register\n");
 		return ret;
@@ -209,7 +347,7 @@ static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
 	u8 regaddr = pca953x_recalc_addr(chip, reg, off, true, false);
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(chip->client, regaddr, val);
+	ret = regmap_write(chip->regmap, regaddr, val);
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed writing register\n");
 		return ret;
@@ -223,8 +361,7 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, true, true);
 	int ret;
 
-	ret = i2c_smbus_write_i2c_block_data(chip->client, regaddr,
-					     NBANK(chip), val);
+	ret = regmap_bulk_write(chip->regmap, regaddr, val, NBANK(chip));
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed writing register\n");
 		return ret;
@@ -238,8 +375,7 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
 	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, false, true);
 	int ret;
 
-	ret = i2c_smbus_read_i2c_block_data(chip->client, regaddr,
-					    NBANK(chip), val);
+	ret = regmap_bulk_read(chip->regmap, regaddr, val, NBANK(chip));
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed reading register\n");
 		return ret;
@@ -793,6 +929,14 @@ static int pca953x_probe(struct i2c_client *client,
 		}
 	}
 
+	i2c_set_clientdata(client, chip);
+
+	chip->regmap = devm_regmap_init_i2c(client, &pca953x_i2c_regmap);
+	if (IS_ERR(chip->regmap)) {
+		ret = PTR_ERR(chip->regmap);
+		goto err_exit;
+	}
+
 	mutex_init(&chip->i2c_lock);
 	/*
 	 * In case we have an i2c-mux controlled by a GPIO provided by an
@@ -843,7 +987,6 @@ static int pca953x_probe(struct i2c_client *client,
 			dev_warn(&client->dev, "setup failed, %d\n", ret);
 	}
 
-	i2c_set_clientdata(client, chip);
 	return 0;
 
 err_exit:
-- 
2.18.0
