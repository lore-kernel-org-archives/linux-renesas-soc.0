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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D8DC6783B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D02D62081B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEQQBkXF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D02D62081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbeLLBkq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:40:46 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52381 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbeLLBkq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:40:46 -0500
Received: by mail-wm1-f65.google.com with SMTP id m1so3499051wml.2;
        Tue, 11 Dec 2018 17:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sdnkb9xXemjnqlwb44sWyooul4B0KAlemcE323jrTE8=;
        b=VEQQBkXFKJrddvHDsdEWvkc3kIe8AU3QmNQHjFjdk7jYDEWN+SjOguX3E+9OwZgaQk
         hS22alczjxw7Ho6uoflQ46eDF6KytUwbvyhJg8F6HuC0JPxGkoMEJ8yc5JpAUT5t0vWG
         wCgqQBsfoUPxvmp+MFu+pNgsCvo5TVFZgTCN34D3f0jJXXjkdOuvvUdHyiCgnI2KQAGn
         gdfoXGzXwpzcAQ63Vuls+BSbsG1Iz/QtEb375pn8Ynnj940FP/t/d4YI/L6eAqRJJQvu
         Ku8ti5qUWiN3Neoekd8nvMEB9CQlgCf5xTkEljYBcSR3RETvGlp+5KEhgwJavh9ZaDwU
         XEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sdnkb9xXemjnqlwb44sWyooul4B0KAlemcE323jrTE8=;
        b=hAAMCPn72OMdvM9cyt7f4Burz1BkvB3cNgwE4HhnOEwoqBVdF7pfv7avNGn7JLeFTe
         3+msmUJYVMqP82TNlYxbC/RcFlGgKcMV2BnuIv0k5TK13MfwGOEPeWGugVRDVczpf+Ck
         u2LbUz9Slh2BW8OCn7jWsZQf/NGrB45XrNYjF6/i3tkhx9VPjVuHI3MmsRLoVumUJpiE
         cmIl4u2cWIPmOISJrESHZ8VeT7oWIai132xFnhh/eIlUBTRrJ4+0t3n5ibMZNY8a9u5L
         f2nMk8cI5VdMVqh9OStXwit9/utsMHmAAWj2jp+DbkxyLfpzDYdwnQV1xr8O4ysqdwIW
         olPw==
X-Gm-Message-State: AA+aEWbUh+XrAWaZZQrPiWGPv9gzpSHMW1ukGR87Ug8+W2dLI60i6Wk0
        ZUv1I29dxmNdxdVdvCKb08SPycUF
X-Google-Smtp-Source: AFSGD/UxN+Fg5SywOsS87rQ6waJrErKFG5NcyDIARMAjpaNqDm/BHG2yLS7ksvfwI5LkFU8hUGfPKA==
X-Received: by 2002:a1c:ac85:: with SMTP id v127mr3952871wme.62.1544578844162;
        Tue, 11 Dec 2018 17:40:44 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c12sm12719214wrs.82.2018.12.11.17.40.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:40:43 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V2 13/14] gpio: pca953x: Zap single use of pca953x_read_single()
Date:   Wed, 12 Dec 2018 02:40:01 +0100
Message-Id: <20181212014002.4753-13-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Drop pca953x_write_single() which is used in one place.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index a349f68c4025..6f50cf14bb23 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -324,21 +324,6 @@ static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
 	return regaddr;
 }
 
-static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
-				int off)
-{
-	u8 regaddr = pca953x_recalc_addr(chip, reg, off, false, false);
-	int ret;
-
-	ret = regmap_read(chip->regmap, regaddr, val);
-	if (ret < 0) {
-		dev_err(&chip->client->dev, "failed reading register\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, true, true);
@@ -408,11 +393,14 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	u8 inreg = pca953x_recalc_addr(chip, chip->regs->input, off,
+				       true, false);
+	u8 bit = BIT(off % BANK_SZ);
 	u32 reg_val;
 	int ret;
 
 	mutex_lock(&chip->i2c_lock);
-	ret = pca953x_read_single(chip, chip->regs->input, &reg_val, off);
+	ret = regmap_read(chip->regmap, inreg, &reg_val);
 	mutex_unlock(&chip->i2c_lock);
 	if (ret < 0) {
 		/* NOTE:  diagnostic already emitted; that's all we should
@@ -422,7 +410,7 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 		return 0;
 	}
 
-	return (reg_val & (1u << (off % BANK_SZ))) ? 1 : 0;
+	return !!(reg_val & bit);
 }
 
 static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
-- 
2.18.0

