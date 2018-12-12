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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0EDC6783B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0ADF2081B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/NEJVut"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0ADF2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbeLLBka (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:40:30 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50356 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbeLLBk3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:40:29 -0500
Received: by mail-wm1-f66.google.com with SMTP id n190so4154583wmd.0;
        Tue, 11 Dec 2018 17:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rCibx6093XLv0OtPOKaZrSvbB8TaTTmfDw79TizC/XM=;
        b=P/NEJVutKq97idZtSWRcz/BW+S8LjnLnXDoj+pzPLE+RcZkP62R5vpQFbP5pQqDYIt
         DWkm70d5iklWxpBfSYkC63rNXtIAAeK1BhMX/0b36yYwFxk7j01fKGETQ1vLK+WXUY7L
         TbfZY1UePc+6vCkOnIsL8j3uEInCc0cyRNZPeE++wLtdBr4BQGeIidaEVsxGkMMHTtpK
         WQFgEdFKO2PxmfeLS2Yp6cCSdWpuKuNbkJQiDC/izN3Myxy/qq+I8AnIbnc10WWF/PrZ
         cADYJzn/pdmhP+ZKXUd8AEBNnA8GrN54bBVBqOEhVjFEz43ftTPEofgWvMSB/WgMqGXf
         7Smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rCibx6093XLv0OtPOKaZrSvbB8TaTTmfDw79TizC/XM=;
        b=s2+MgM/XxsvXTkTNCSfSQTXITbgGAI/dKedfvCZDWEK+mhQGup23g/l+Y8nHspUUN4
         6BZfnl8fAzgeeyAWPoCzZ8b82S9FlSPB9rQN2nRh/KMjLvze9zdGvpgYn/BKsjnzs+nO
         sq9Yz7ZklO9E54wK+kBLpYU8QEq/drn7GOA+H2AqeuS+gtFBjclBVln5UWLjr949dqWw
         dz8Ov/2nHE++ZG2hSqX2orMjiq+2r3wrtJkPyKbMsh5IKNHS0ArJH59+N6Phtb5DQ2EQ
         UtaRTRsnUiDkdxJAElg3l/Emtxe8A2jbgj+Q1o/eUroyXpA7dFiDn9VfV5COnHahVsTZ
         sd9g==
X-Gm-Message-State: AA+aEWaA8zfqWfd8wnlNXw49EBy5Gp+l4wrBUZJDGJiREvTVRz5u6H0+
        IVT/J04FaNTLeTrdoiuIla1q6p6H
X-Google-Smtp-Source: AFSGD/V04La3Fdy7SyhKuslYc6m3IMyse2fMkyRDa0U4OsvA5h6uB37fi+/Er9jn0Ar5KQgKIgU7Eg==
X-Received: by 2002:a1c:d7d3:: with SMTP id o202mr4677958wmg.135.1544578827462;
        Tue, 11 Dec 2018 17:40:27 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c12sm12719214wrs.82.2018.12.11.17.40.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:40:26 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V2 01/14] gpio: pca953x: Deduplicate the bank_shift
Date:   Wed, 12 Dec 2018 02:39:49 +0100
Message-Id: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The bank_shift = fls(...) code was duplicated in the driver 5 times,
pull it into separate function.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
V2: Replace bank_size with bank_shift in commit message
---
 drivers/gpio/gpio-pca953x.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 540166443c34..afe6de4c48c4 100644
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

