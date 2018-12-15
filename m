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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42416C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 134D12080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHOdO9LN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730355AbeLOO0q (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:46 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39391 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730290AbeLOO0q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:46 -0500
Received: by mail-wr1-f67.google.com with SMTP id t27so8074394wra.6;
        Sat, 15 Dec 2018 06:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/7jAJ+8gDj6c9Z98LDI6KfTAvqF6aPPQlA5P4B1/1Fk=;
        b=OHOdO9LNseF0Dwya0FUaAtlmO4tHjtnN6HAg2c/QLfcct5JD3hcovSSuRnamcFfHOX
         GETmUh/zQ1TAVn0YojUggch8BqXTZDSY6LuxWmBrlLjXu8y/tKR1tSM70PYqfvfnrOs3
         bLRHTD9QkJBsUiZzGCRx+DFXBNSvwq8u3LArh1omTLGu7T6W6V5kHFE/s2AwEdv8drtx
         glBrFrce5nR/b/dP9AvrxNQhzRTaduaV/qMZevw7rSEKb8I9n4e2IPgLhqrdxGNLca40
         gBpCcTSEHKMRPYKfWyAy972JvkHcL5Erf07tMrFPKoI+e/LTUpO76trwoOvp/46QNd//
         mjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/7jAJ+8gDj6c9Z98LDI6KfTAvqF6aPPQlA5P4B1/1Fk=;
        b=X2D6bZSoD5eIvfCLBilYuZMx+s+2d+9Jl/cp7FFnJU5lj1fHnlvzm4Wi9sbDKQDHyh
         E9SAAU0x8IslwP83BR5iAbk8rUvSdVkvsAAYVEJ1wRKdyf/dTb2HPRyph01+bM9Y1Jua
         A/yROQjeWH/Qd7ssyyZcm0ScEHo3rJJ2tYJPWLbDaQSp5M5SMXagp37QEz0RtVTkfggk
         WNWnsNnycKF4RaZgEAp5NU0Lu7DHyvlb/5vJOH1Ox7JM3FojTsFduY4rf6O8ssH/rgMA
         zWbMU4Gmer/9WAbHrdDU/qT4b7wA+10yLc1eKxZxYohZeQDysec5yoJw67AlNXe6W955
         8Ryw==
X-Gm-Message-State: AA+aEWa9u217RD9dnNLXXBrXOY0+kiBTA+LVayvHvx384YaMbmxRVsmU
        HeoDRjcjFGrtt6yC08NF6KJBmD/S
X-Google-Smtp-Source: AFSGD/Ucv9HGkggPOc6kFwhVsiRD1ohnk46w7tajycy2zqKVOVB+gUtQ+6Z5qd+n7i/GBVxStKHSjg==
X-Received: by 2002:adf:9d08:: with SMTP id k8mr5970095wre.203.1544884003288;
        Sat, 15 Dec 2018 06:26:43 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:42 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 13/14] gpio: pca953x: Zap single use of pca953x_read_single()
Date:   Sat, 15 Dec 2018 15:26:04 +0100
Message-Id: <20181215142605.15397-14-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Drop pca953x_write_single() which is used in one place.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
V2: No change
V3: No change
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

