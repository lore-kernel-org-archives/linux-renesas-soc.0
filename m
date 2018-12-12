Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E3FC67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F32B2081B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hizu0FR5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F32B2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbeLLBkn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:40:43 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33337 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbeLLBkm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:40:42 -0500
Received: by mail-wr1-f68.google.com with SMTP id c14so16064203wrr.0;
        Tue, 11 Dec 2018 17:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wV3VPs7htZve5ZzShSwNEmSJrFJ2PTmLnUp+SPpIHrE=;
        b=Hizu0FR5lxe80RKdfeu9nL5VhirOR+kC+Tca9XUvgmlF9d4Igvt64BfrN1vl8STi8a
         kU7yBRsBnpQl5biZ8CioJWSr3qFgIpMC2MzNOaaq1uBrR5xGiMuPP8R+fYxk7ePJtVg8
         OAKqvFGgoKyFBffuMs7RrA2AkjyTAPE+3AdapILBLgnQ3IE0MnzVr8EnsFOCXwQky9Az
         DRmvhKu/JeTRe5nReDRr15ww4fm3xW1oTnghefkU51ZTrdou0Le8fOYGAeepFQFUsoQx
         wPg7ue4KJW4c0iINx9JfpLpDQdjp2FH9ttKe4b2ISAVf6Q4obV+O22f1AiDgEaDWAwJH
         oiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wV3VPs7htZve5ZzShSwNEmSJrFJ2PTmLnUp+SPpIHrE=;
        b=Yb8vpt7oP5zB9o1uOqwG3kp0++3q05zENi/HKs8KREEgCvfUCVg31RrEdA6y40zvS9
         YQPFKsjWe1E1rjwUNEPlxAv7JUXCA6yguT5Y4xL2lQGzIhBjuLs+2KVM0r6OpT/0FRE4
         b7HnVQKK9kwA4rR9Rf0M+yww6wo9nmAOpao4dD/gFHFRsnoeV+7ecXD4ili8HAQTAFDA
         fk6t1RCHWa+Ar6OG+JSLtmgcfAY6De4ZpvXAFoyq9Vbwv5q6G91WZBeNDF5YPc53H2Pi
         s9d8IyJRR3HaJyYZETtd9UeJAXLy3SBYhaPoPGu0g97TB0CZwb41/NgZiPbYy6ZY7n0w
         oSzw==
X-Gm-Message-State: AA+aEWb8M2SpBm0LjTgbRzCXtdav50T0ioZ+OnD3cO4MkoQ0ZAQ4WZF8
        pgTB6LphkM/+PQdcZuKDwrtVygFq
X-Google-Smtp-Source: AFSGD/U435cV9+urR1oBY3Ep4w85eRPJj2ps9KKMjJwYCbxV93fHm4NcdLjQi37S5ZHaLfsHhabb9w==
X-Received: by 2002:adf:9323:: with SMTP id 32mr15265078wro.213.1544578840072;
        Tue, 11 Dec 2018 17:40:40 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c12sm12719214wrs.82.2018.12.11.17.40.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:40:39 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V2 10/14] gpio: pca953x: Perform basic regmap conversion
Date:   Wed, 12 Dec 2018 02:39:58 +0100
Message-Id: <20181212014002.4753-10-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

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
index b08e071ad48c..3b845b16031e 100644
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

