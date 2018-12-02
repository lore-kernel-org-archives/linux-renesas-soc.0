Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40090 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbeLBTgd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Dec 2018 14:36:33 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 14/14] gpio: pca953x: Restore registers after suspend/resume cycle
Date: Sun,  2 Dec 2018 20:35:53 +0100
Message-Id: <20181202193553.29704-14-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

It is possible that the PCA953x is powered down during suspend.
Use regmap cache to assure the registers in the PCA953x are in
line with the driver state after resume.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 92 +++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 7c0122fac383..e2c2e97b7321 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -972,6 +972,95 @@ static int pca953x_remove(struct i2c_client *client)
 	return ret;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int pca953x_regcache_sync(struct device *dev)
+{
+	struct pca953x_chip *chip = dev_get_drvdata(dev);
+	int ret;
+
+	/*
+	 * The ordering between direction and output is important,
+	 * sync these registers first and only then sync the rest.
+	 */
+	ret = regcache_sync_region(chip->regmap, chip->regs->direction,
+				   chip->regs->direction + NBANK(chip));
+	if (ret != 0) {
+		dev_err(dev, "Failed to sync GPIO dir registers: %d\n", ret);
+		return ret;
+	}
+
+	ret = regcache_sync_region(chip->regmap, chip->regs->output,
+				   chip->regs->output + NBANK(chip));
+	if (ret != 0) {
+		dev_err(dev, "Failed to sync GPIO out registers: %d\n", ret);
+		return ret;
+	}
+
+#ifdef CONFIG_GPIO_PCA953X_IRQ
+	if (chip->driver_data & PCA_PCAL) {
+		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
+		pca953x_write_regs(chip, PCAL953X_INT_MASK, invert_irq_mask);
+
+		ret = regcache_sync_region(chip->regmap, PCAL953X_IN_LATCH,
+					   PCAL953X_IN_LATCH + NBANK(chip));
+		if (ret != 0) {
+			dev_err(dev, "Failed to sync INT latch registers: %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = regcache_sync_region(chip->regmap, PCAL953X_INT_MASK,
+					   PCAL953X_INT_MASK + NBANK(chip));
+		if (ret != 0) {
+			dev_err(dev, "Failed to sync INT mask registers: %d\n",
+				ret);
+			return ret;
+		}
+	}
+#endif
+
+	return 0;
+}
+
+static int pca953x_suspend(struct device *dev)
+{
+	struct pca953x_chip *chip = dev_get_drvdata(dev);
+
+	regcache_mark_dirty(chip->regmap);
+	pca953x_regcache_sync(dev);
+	regcache_cache_only(chip->regmap, true);
+
+	regulator_disable(chip->regulator);
+
+	return 0;
+}
+
+static int pca953x_resume(struct device *dev)
+{
+	struct pca953x_chip *chip = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_enable(chip->regulator);
+	if (ret != 0) {
+		dev_err(dev, "Failed to enable regulator: %d\n", ret);
+		return 0;
+	}
+
+	regcache_cache_only(chip->regmap, false);
+	ret = pca953x_regcache_sync(dev);
+	if (ret)
+		return ret;
+
+	ret = regcache_sync(chip->regmap);
+	if (ret != 0) {
+		dev_err(dev, "Failed to restore register map: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+#endif
+
 /* convenience to stop overlong match-table lines */
 #define OF_953X(__nrgpio, __int) (void *)(__nrgpio | PCA953X_TYPE | __int)
 #define OF_957X(__nrgpio, __int) (void *)(__nrgpio | PCA957X_TYPE | __int)
@@ -1015,9 +1104,12 @@ static const struct of_device_id pca953x_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, pca953x_dt_ids);
 
+static SIMPLE_DEV_PM_OPS(pca953x_pm_ops, pca953x_suspend, pca953x_resume);
+
 static struct i2c_driver pca953x_driver = {
 	.driver = {
 		.name	= "pca953x",
+		.pm	= &pca953x_pm_ops,
 		.of_match_table = pca953x_dt_ids,
 		.acpi_match_table = ACPI_PTR(pca953x_acpi_ids),
 	},
-- 
2.18.0
