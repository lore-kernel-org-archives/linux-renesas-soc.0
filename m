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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD28BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD5802080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pq9ZAtix"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730074AbeLOO0p (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:45 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36702 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729707AbeLOO0p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:45 -0500
Received: by mail-wr1-f67.google.com with SMTP id u4so7097559wrp.3;
        Sat, 15 Dec 2018 06:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c22Xo4JerZfpW1i9fw99SYDqwzQCmVrwRe8O8Sok3NA=;
        b=pq9ZAtixRGc52vcLBIUW8RGIlh2+c6Z7itSnJgUVDZpt7YC9yof/OHjvrAz71l1Rgi
         5qLK/8nzhQhSZHP2IQPEhQIZd8QQ8ABs677/llRwxgoPb/4+zDryClLtxQ5fNBKE5oPA
         71fHhRF6G5zEIoSD8sCXDElXmlHnMF5g5+UcY1+Ui13N5ta1ccACm6Zvsq1DhsnwDA9/
         ML1RsSc5SIaT3Y1mnckFUJXXpMFoU8PQS3H9nCpH/2QiNLPTTU4ytxg8ZsHt6YCUiYE1
         LLkjIj7y2EPgQwrYqOHQa9a5qxjYW5tWb6xWwNgAX+5GDekiL19Vr33fPSAP9sF2vCnn
         OQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=c22Xo4JerZfpW1i9fw99SYDqwzQCmVrwRe8O8Sok3NA=;
        b=bpm15fCQUNUSOXdxG1dBLZaXvkTcnVk8r9b0sQs6Zwln0G+fLMApiTjs1IRPmVkr5S
         zalN6J2Y7wAqfgsZlNJidgD13I09e3qCn/SAwGP6HmTS1oDC+g/yggHAAI6Et6rKWgnX
         9CSiPZLCAJ91W6U7n/zLsENQA0zX2ftzFD7MvoaB8DVBTvN2y6r2p+6CJLC5Vw7+Bmhd
         I1+tkD8z3YOYPw8AkNlEuQUOLDaCFnH25geRuVMBJEPSzYnaaZXIAWaEWvpsFd02qQna
         fR/S5jeun9t938CjNzdEYoTyZkCZI+0m3TuRfxD9Q5X0mp1ExB46GLiOa+mfhe30cDti
         GClg==
X-Gm-Message-State: AA+aEWYYBU7Yu46N4jSrGQmH+E3a3U48C1FtO7cRoRgHs16O3hTU20sA
        0UGO6RiGw4VSf7RD7Upx41zPWwi5
X-Google-Smtp-Source: AFSGD/W+ojI0yAzmiFjFm5kADwMqY8CjzQDnjgIqc3V6YGgSVN1C8DE8WWwgZw8gHFRRBls04AfQHw==
X-Received: by 2002:a5d:530a:: with SMTP id e10mr5798434wrv.151.1544884002049;
        Sat, 15 Dec 2018 06:26:42 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:41 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 12/14] gpio: pca953x: Zap ad-hoc reg_output cache
Date:   Sat, 15 Dec 2018 15:26:03 +0100
Message-Id: <20181215142605.15397-13-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace the ad-hoc reg_output output register caching with generic
regcache cache. Drop pca953x_write_single() which is no longer used.
This reduces code duplication.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
V2: No change
V3: No change
---
 drivers/gpio/gpio-pca953x.c | 65 +++++++++----------------------------
 1 file changed, 15 insertions(+), 50 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 08fd7c17fcb6..a349f68c4025 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -141,7 +141,6 @@ static const struct pca953x_reg_config pca957x_regs = {
 
 struct pca953x_chip {
 	unsigned gpio_start;
-	u8 reg_output[MAX_BANK];
 	struct mutex i2c_lock;
 	struct regmap *regmap;
 
@@ -340,21 +339,6 @@ static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
 	return 0;
 }
 
-static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
-				int off)
-{
-	u8 regaddr = pca953x_recalc_addr(chip, reg, off, true, false);
-	int ret;
-
-	ret = regmap_write(chip->regmap, regaddr, val);
-	if (ret < 0) {
-		dev_err(&chip->client->dev, "failed writing register\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, true, true);
@@ -403,25 +387,17 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off,
 					true, false);
+	u8 outreg = pca953x_recalc_addr(chip, chip->regs->output, off,
+					true, false);
 	u8 bit = BIT(off % BANK_SZ);
-	u8 reg_val;
 	int ret;
 
 	mutex_lock(&chip->i2c_lock);
 	/* set output level */
-	if (val)
-		reg_val = chip->reg_output[off / BANK_SZ]
-			| (1u << (off % BANK_SZ));
-	else
-		reg_val = chip->reg_output[off / BANK_SZ]
-			& ~(1u << (off % BANK_SZ));
-
-	ret = pca953x_write_single(chip, chip->regs->output, reg_val, off);
+	ret = regmap_write_bits(chip->regmap, outreg, bit, val ? bit : 0);
 	if (ret)
 		goto exit;
 
-	chip->reg_output[off / BANK_SZ] = reg_val;
-
 	/* then direction */
 	ret = regmap_write_bits(chip->regmap, dirreg, bit, 0);
 exit:
@@ -452,23 +428,12 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 reg_val;
-	int ret;
+	u8 outreg = pca953x_recalc_addr(chip, chip->regs->output, off,
+					true, false);
+	u8 bit = BIT(off % BANK_SZ);
 
 	mutex_lock(&chip->i2c_lock);
-	if (val)
-		reg_val = chip->reg_output[off / BANK_SZ]
-			| (1u << (off % BANK_SZ));
-	else
-		reg_val = chip->reg_output[off / BANK_SZ]
-			& ~(1u << (off % BANK_SZ));
-
-	ret = pca953x_write_single(chip, chip->regs->output, reg_val, off);
-	if (ret)
-		goto exit;
-
-	chip->reg_output[off / BANK_SZ] = reg_val;
-exit:
+	regmap_write_bits(chip->regmap, outreg, bit, val ? bit : 0);
 	mutex_unlock(&chip->i2c_lock);
 }
 
@@ -500,7 +465,10 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 	int ret;
 
 	mutex_lock(&chip->i2c_lock);
-	memcpy(reg_val, chip->reg_output, NBANK(chip));
+	ret = pca953x_read_regs(chip, chip->regs->output, reg_val);
+	if (ret)
+		goto exit;
+
 	for (bank = 0; bank < NBANK(chip); bank++) {
 		bank_mask = mask[bank / sizeof(*mask)] >>
 			   ((bank % sizeof(*mask)) * 8);
@@ -512,11 +480,7 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 		}
 	}
 
-	ret = pca953x_write_regs(chip, chip->regs->output, reg_val);
-	if (ret)
-		goto exit;
-
-	memcpy(chip->reg_output, reg_val, NBANK(chip));
+	pca953x_write_regs(chip, chip->regs->output, reg_val);
 exit:
 	mutex_unlock(&chip->i2c_lock);
 }
@@ -818,8 +782,9 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
 	int ret;
 	u8 val[MAX_BANK];
 
-	ret = pca953x_read_regs(chip, chip->regs->output, chip->reg_output);
-	if (ret)
+	ret = regcache_sync_region(chip->regmap, chip->regs->output,
+				   chip->regs->output + NBANK(chip));
+	if (ret != 0)
 		goto out;
 
 	ret = regcache_sync_region(chip->regmap, chip->regs->direction,
-- 
2.18.0

