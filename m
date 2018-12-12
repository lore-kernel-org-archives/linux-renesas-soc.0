Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6E2C6783B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68BEF2081B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/CxTCSs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68BEF2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbeLLBkp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:40:45 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41853 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbeLLBkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:40:45 -0500
Received: by mail-wr1-f66.google.com with SMTP id x10so15995636wrs.8;
        Tue, 11 Dec 2018 17:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Bgfwqcrv6eNII/YZ+7Ip9skuBgPeoZ8jM1yk/YrNOks=;
        b=h/CxTCSs0eYkdr7LqR76hqvfsjstVl9OKvwtVUM2n5GSHphJc4Mrnwk/YMUPXa7qSV
         UzTcHeIFumMzqhgohRdQQqIovLZ8S18dnuqXb/ZzdMRo+eYpDfyyiBQJMrH+zQqejeGn
         ySv8cN1LZxQuiJn5WrdXGtME9EARcVvs1tDqWxIBcWIg3/23444//cujMyyDokiB7gwZ
         HamzhcwyDQJBqM4WDklWRjIK+z+RGWk+mOMPBEjLJnrG7uyUhE6N4bW5Ku5pepNGV6qD
         Km//cqRAJMT7rNOIS0IrshNzUcqgi6gmv+xaCDyUKdvyETqzTCVtLQDoPJDfE+nJld6h
         5uWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Bgfwqcrv6eNII/YZ+7Ip9skuBgPeoZ8jM1yk/YrNOks=;
        b=L7BWqn1N5FQ1OHkHPPbUtAObAsmzL8Qaw3gizbAAyPkYIMEiKmCRXKSJr41hP5mpSt
         VU/5qxv19Ae/f2j0OrePBfmjRiwGEQ7jzy/eWAZHTeR9O+6VKtEKUXmlfUHgiKGlyRn9
         xWJOIqIdY6RPrCTVjbpdvN7QAS9iC6DFdrCkf/IR/2/4+3rrg7qJPIfhl3F6H/N3hlG1
         DqRzJj0dc1nHFHc+R0ZJt3gy3kVy+cyzkRS3xmYnA8lMpsKY+D6jKloZ3o4BspZ/i5Dx
         vDjxJKaJzTTDOTEUcwSKDXIRyKv0G1gl0hKZc/U6fU0n/9cUizOf5IIrbaxWyQxwcQmL
         vrsA==
X-Gm-Message-State: AA+aEWbu1jR04PCKL1GuSsZNerHpf0t2v/JmlZY+S3SK5S7+klV55Q0e
        LtWzAfJzPYbcl/tk0+zmBnkQAylZ
X-Google-Smtp-Source: AFSGD/VQ5BCzmnRTjdlI9jKITJOtwD/3/ZCztx/DnKhTouGoBUqdzsEqadAMd4YAVD5UUQPY2tYEDw==
X-Received: by 2002:adf:d0c9:: with SMTP id z9mr14938434wrh.317.1544578841427;
        Tue, 11 Dec 2018 17:40:41 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c12sm12719214wrs.82.2018.12.11.17.40.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:40:40 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V2 11/14] gpio: pca953x: Zap ad-hoc reg_direction cache
Date:   Wed, 12 Dec 2018 02:39:59 +0100
Message-Id: <20181212014002.4753-11-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace the ad-hoc reg_direction direction register caching with generic
regcache cache. This reduces code duplication.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
V2: Fix the IRQ handling code as well
---
 drivers/gpio/gpio-pca953x.c | 55 +++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 3b845b16031e..08fd7c17fcb6 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -142,7 +142,6 @@ static const struct pca953x_reg_config pca957x_regs = {
 struct pca953x_chip {
 	unsigned gpio_start;
 	u8 reg_output[MAX_BANK];
-	u8 reg_direction[MAX_BANK];
 	struct mutex i2c_lock;
 	struct regmap *regmap;
 
@@ -387,18 +386,13 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
 static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 reg_val;
+	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off,
+					true, false);
+	u8 bit = BIT(off % BANK_SZ);
 	int ret;
 
 	mutex_lock(&chip->i2c_lock);
-	reg_val = chip->reg_direction[off / BANK_SZ] | (1u << (off % BANK_SZ));
-
-	ret = pca953x_write_single(chip, chip->regs->direction, reg_val, off);
-	if (ret)
-		goto exit;
-
-	chip->reg_direction[off / BANK_SZ] = reg_val;
-exit:
+	ret = regmap_write_bits(chip->regmap, dirreg, bit, bit);
 	mutex_unlock(&chip->i2c_lock);
 	return ret;
 }
@@ -407,6 +401,9 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 		unsigned off, int val)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off,
+					true, false);
+	u8 bit = BIT(off % BANK_SZ);
 	u8 reg_val;
 	int ret;
 
@@ -426,12 +423,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	chip->reg_output[off / BANK_SZ] = reg_val;
 
 	/* then direction */
-	reg_val = chip->reg_direction[off / BANK_SZ] & ~(1u << (off % BANK_SZ));
-	ret = pca953x_write_single(chip, chip->regs->direction, reg_val, off);
-	if (ret)
-		goto exit;
-
-	chip->reg_direction[off / BANK_SZ] = reg_val;
+	ret = regmap_write_bits(chip->regmap, dirreg, bit, 0);
 exit:
 	mutex_unlock(&chip->i2c_lock);
 	return ret;
@@ -483,16 +475,19 @@ static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off,
+					true, false);
+	u8 bit = BIT(off % BANK_SZ);
 	u32 reg_val;
 	int ret;
 
 	mutex_lock(&chip->i2c_lock);
-	ret = pca953x_read_single(chip, chip->regs->direction, &reg_val, off);
+	ret = regmap_read(chip->regmap, dirreg, &reg_val);
 	mutex_unlock(&chip->i2c_lock);
 	if (ret < 0)
 		return ret;
 
-	return !!(reg_val & (1u << (off % BANK_SZ)));
+	return !!(reg_val & bit);
 }
 
 static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
@@ -580,6 +575,10 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	u8 new_irqs;
 	int level, i;
 	u8 invert_irq_mask[MAX_BANK];
+	int reg_direction[MAX_BANK];
+
+	regmap_bulk_read(chip->regmap, chip->regs->direction, reg_direction,
+			 NBANK(chip));
 
 	if (chip->driver_data & PCA_PCAL) {
 		/* Enable latch on interrupt-enabled inputs */
@@ -595,7 +594,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	/* Look for any newly setup interrupt */
 	for (i = 0; i < NBANK(chip); i++) {
 		new_irqs = chip->irq_trig_fall[i] | chip->irq_trig_raise[i];
-		new_irqs &= ~chip->reg_direction[i];
+		new_irqs &= reg_direction[i];
 
 		while (new_irqs) {
 			level = __ffs(new_irqs);
@@ -660,6 +659,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 	bool pending_seen = false;
 	bool trigger_seen = false;
 	u8 trigger[MAX_BANK];
+	int reg_direction[MAX_BANK];
 	int ret, i;
 
 	if (chip->driver_data & PCA_PCAL) {
@@ -690,8 +690,10 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 		return false;
 
 	/* Remove output pins from the equation */
+	regmap_bulk_read(chip->regmap, chip->regs->direction, reg_direction,
+			 NBANK(chip));
 	for (i = 0; i < NBANK(chip); i++)
-		cur_stat[i] &= chip->reg_direction[i];
+		cur_stat[i] &= reg_direction[i];
 
 	memcpy(old_stat, chip->irq_stat, NBANK(chip));
 
@@ -745,6 +747,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 			     int irq_base)
 {
 	struct i2c_client *client = chip->client;
+	int reg_direction[MAX_BANK];
 	int ret, i;
 
 	if (client->irq && irq_base != -1
@@ -759,8 +762,10 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 		 * interrupt.  We have to rely on the previous read for
 		 * this purpose.
 		 */
+		regmap_bulk_read(chip->regmap, chip->regs->direction,
+				 reg_direction, NBANK(chip));
 		for (i = 0; i < NBANK(chip); i++)
-			chip->irq_stat[i] &= chip->reg_direction[i];
+			chip->irq_stat[i] &= reg_direction[i];
 		mutex_init(&chip->irq_lock);
 
 		ret = devm_request_threaded_irq(&client->dev,
@@ -817,9 +822,9 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
 	if (ret)
 		goto out;
 
-	ret = pca953x_read_regs(chip, chip->regs->direction,
-				chip->reg_direction);
-	if (ret)
+	ret = regcache_sync_region(chip->regmap, chip->regs->direction,
+				   chip->regs->direction + NBANK(chip));
+	if (ret != 0)
 		goto out;
 
 	/* set platform specific polarity inversion */
@@ -937,6 +942,8 @@ static int pca953x_probe(struct i2c_client *client,
 		goto err_exit;
 	}
 
+	regcache_mark_dirty(chip->regmap);
+
 	mutex_init(&chip->i2c_lock);
 	/*
 	 * In case we have an i2c-mux controlled by a GPIO provided by an
-- 
2.18.0

