Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35279C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB24D2080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUOIYNg6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730345AbeLOO0n (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:43 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39543 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730290AbeLOO0n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:43 -0500
Received: by mail-wm1-f66.google.com with SMTP id f81so8396924wmd.4;
        Sat, 15 Dec 2018 06:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FkxR36aSdz7Fhz8F2HZuglQv6zBwcjtACJ9r41PUZIs=;
        b=kUOIYNg6mVhwAjD/HnDbSW4IB2TcS8vWcOiqjvhdoBRS1uFGswFePTuX1QOENShuT+
         uieaNfaPgpu6DYZtnXae4DDiN/lV8WIq4VSGLPcWAuCcfLfA/DLV+Ro+W5Y4+Wt3F9kh
         M9pDfVCzZ8zv16ST383ikNFDTSVzyOUYbPkXfeJ/bW5oxsfNvnuDXc0V0LtndAXrwuGL
         TaFSMUnJtDDgZt1MSuvjq2+T1VjJFCUwgasJd/F/zHz8Wvk0qD7ZZ1C7INjhqGdMbUJf
         U2iEAepM1bl+VDS7632MkiTA/cjTkErliLfdBwbSRpEE7hLfxwhWIjWzR3rTRxDDfTV+
         NRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FkxR36aSdz7Fhz8F2HZuglQv6zBwcjtACJ9r41PUZIs=;
        b=RiKzMVTjkalDId+3gvIKz+okjNysaD2HwagiiRPkclmnZhz4NajrcD32kiy+SMrpym
         OR5dJElGpJnWvFIRzgkJ0D5BmYHxTfjWWuYeLPT4dCHxDQ8ht2IkPpgWh2ceOMrAtlEi
         UWAMPxcBKe9IXBJkPdynyB4p0DgIxTOk1xoH9I78kGOFdOWK8IAo+AqNkjVZ5HtDmDhT
         NzfYEnJaTOi1XdcWttisqq3DVNJBkvOSvS/nRfeYBanzxzC+nJX4CRJ3osOUGsH8XvdM
         7ZZecYt1rkjFnPQUhm1OYSIQi/2hMTMnqwo2GrOIxfh935yUgx9JDo8yHdQoRl7bT3Yo
         hd8Q==
X-Gm-Message-State: AA+aEWYPbQ8oX7IFRhHrgYrTdo7lhjmFAeogncNqZDK2owuQDGnlyq7g
        ohV6B72ZOEM6HWRKnkNlrG6bUeUQ
X-Google-Smtp-Source: AFSGD/X+ovS7J/ahsHGm/+XGWpe+69Pt2PMa03vAAbkf1HBfXJIFfsUGLk50HEzLOBDN3kHy1b3jQw==
X-Received: by 2002:a1c:ac85:: with SMTP id v127mr5738360wme.62.1544884000635;
        Sat, 15 Dec 2018 06:26:40 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:39 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 11/14] gpio: pca953x: Zap ad-hoc reg_direction cache
Date:   Sat, 15 Dec 2018 15:26:02 +0100
Message-Id: <20181215142605.15397-12-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
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
V3: No change
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

