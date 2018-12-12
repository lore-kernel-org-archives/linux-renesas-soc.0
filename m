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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DE9C6783C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E8B42081B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqFjhVeQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E8B42081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbeLLBki (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:40:38 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44361 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbeLLBkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:40:37 -0500
Received: by mail-wr1-f67.google.com with SMTP id z5so15994707wrt.11;
        Tue, 11 Dec 2018 17:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pEmhkbC3iLD7LabI4+PzzqzviIhBSZ0BSKCYclh2Dv8=;
        b=cqFjhVeQbROIBPfotC8KmJtQRWcAThvHbUrG+izXBJ2+aigD3YHTORc4JIhMZbx7ET
         qIkLlvB73gvA33NBCLExoqy0+TEw7Hd/YDycStBwmrEa8Kb1gjonBqHVJiR9hmpEWWWA
         AJO6bm5r+h0I3Ae+9mXokGLQGxVpHeHUx+GSiHxOyQk5EO5k57/ZIpW+3j5rCr2z6xq2
         Co2Iz6yy1VYywEUxL8OLL4thnoTLTfID15UInva/8ZKgVCLxySZIMS9RvywHws57RRCG
         YJQBQuRMBkv0Xvey3XZ6+FDmwa2yQxoyPcTUBaaMHcfIKZ5r3KgBLsM6OYQjpxxv42fZ
         I9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pEmhkbC3iLD7LabI4+PzzqzviIhBSZ0BSKCYclh2Dv8=;
        b=IalSDb+oiTrK9eHoMrv78Ng492P+f0u1fVtgb3PGgbjxRtJ6JnrpX9qZcr/QkhOu+o
         q2lXwYCYVsyd2c4mJ9uHnwdhll3iyoZbBfScTjvpYjrfG7hm00CeUcGqNf2n1fN5/lZe
         THRbjF3Ntq50/u0wawFJ50u4pqwNFmGYciindPgDpFr5mCIjTqfqUuL/RPgALMHiOG/i
         aR3PEXsTekOCbftWddcyt+O7lKNk0dsZT7iHkr+sVhP+mRXVtezb1XI/zdqK4F7LVHR1
         junVfy4rZcqqbbyvzLwetLZbPcuHal4vxFua4powyXG0VwgEwwShxIahdyPgP+FOl/fa
         eh1g==
X-Gm-Message-State: AA+aEWanzL8xbVGAk1IEA0GJ/J7Jvmcskz4MYlJmRycvsEw8S0yyNj1k
        z9FxQni+RHRg1vTJAVZoIB3gCbCP
X-Google-Smtp-Source: AFSGD/UJMCVUj5e1LRFQYAf8MRIxvRDopGdtFtMDMsDvA2r7Nh18IMAH/UJ96cop7GaN8Lro9FvdPQ==
X-Received: by 2002:adf:e78f:: with SMTP id n15mr16009294wrm.115.1544578835599;
        Tue, 11 Dec 2018 17:40:35 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c12sm12719214wrs.82.2018.12.11.17.40.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:40:34 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V2 07/14] gpio: pca953x: Factor out common code from device_pca95xx_init()
Date:   Wed, 12 Dec 2018 02:39:55 +0100
Message-Id: <20181212014002.4753-7-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
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

