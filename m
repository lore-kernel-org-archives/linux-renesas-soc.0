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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CFFC43612
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4CED2080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uWDJHcWm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730309AbeLOO0j (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:39 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54399 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730213AbeLOO0j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:39 -0500
Received: by mail-wm1-f67.google.com with SMTP id a62so8244531wmh.4;
        Sat, 15 Dec 2018 06:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r+kvJhH+BzGdKMl0V+X3Rjd/rHVRApYcyH+fS15GG1U=;
        b=uWDJHcWmnI3BaqtX6jBsI2aZl5+viGrMlfG0Fzz6mIb0xAhE/3hxS1Olr3T7I5K0rx
         +0H8fvI+UUL4WLsdirho381M3BtOVvJ91+7m2mGXwTyTcFVQr/pJKNMcDRc3dWgUCPi1
         ZZCmEGzkFCiJhHmhsqzawuZltonLRK3Kfy5QbxACWr6be2lTyzFc/u+73erVEPpfGxiW
         ys3h5eNAIB1KxFewi9wJ97Zo5AW/6WL4eIprDxeRpvQmKqJHByjXmE/VjwuYqli8ynZo
         f/FAmQU0f/CopUeWtR9o2jqDMt8HBDqpSOeEdIYWHPgJNnvddkOnX5xjdoNwhefpo87E
         Aaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r+kvJhH+BzGdKMl0V+X3Rjd/rHVRApYcyH+fS15GG1U=;
        b=cnplrxpgf9R/FAzZon940cY1r4b+d/SMiICriQB9km2LpPy6eta8O88dy5bjxq3P17
         szRzOEfv+flL82tpX0RGBYUZ2cz9iIj1LG39n3Ve6GMCeeDEt0fiuuH8BwPNsb/hrs3v
         zHOmlbURSgyTkxCZuqIaPiPwxUnK9YfNRc9YMUyTHEC/YB5hcVsIo5TAKQDkejTwlQEp
         urcf23mFu2Lx+UFrjRrtmXeSfONXLFM48WXaWpQe6ReIlsCUB7eRGrsh4upj7c5XW+cV
         2tM2VdKzUMMc4zD2Q0ygeFMhvdRxlCBIOWH1bLbJcWMNSkQuvwTiR66GdiSCfjIuujrh
         aU9g==
X-Gm-Message-State: AA+aEWa022aAMXyvCuSxcE5GNVbjkYAXq0i6fCcXdQA23lLUcr2mYT2I
        l6Olyq/6tIFQnN+IaVdgVdWtoK2u
X-Google-Smtp-Source: AFSGD/W7xeyT7yyV4B9lg++w9XXSRT059BGzHYnwSuriOIPKFgF2zAQ3mGTxBEDAVDxVknlMGMS8sw==
X-Received: by 2002:a1c:9ed7:: with SMTP id h206mr6036619wme.28.1544883995302;
        Sat, 15 Dec 2018 06:26:35 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:34 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 07/14] gpio: pca953x: Factor out common code from device_pca95xx_init()
Date:   Sat, 15 Dec 2018 15:25:58 +0100
Message-Id: <20181215142605.15397-8-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The PCA957x and PCA953x init functions are almost the same, except for
the different register mapping and one extra write to BKEN register in
case of PCA957x. Factor out the common code.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
V2: No change
V3: No change
---
 drivers/gpio/gpio-pca953x.c | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 626cbe040985..d4b8946ea710 100644
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

