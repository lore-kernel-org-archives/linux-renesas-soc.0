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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74B7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 864582080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiL2Z/SM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730290AbeLOO0s (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:48 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54409 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730119AbeLOO0s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:48 -0500
Received: by mail-wm1-f66.google.com with SMTP id a62so8244788wmh.4;
        Sat, 15 Dec 2018 06:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+mepptQUgkA8WUMVQ649aZezSvaJpTojRTTXZmGA4gs=;
        b=XiL2Z/SMW4KU6sV4aJDvIIUCfcNBeULeNnS9efV3+WmUFU51sb4JSbbg7cqeZfLKWH
         D3rWjIg3mFrplSu4QNfPVcRqAHxCPg4zuCin/RfoOdAcdA7b+LnXdOh3v9kzK9+VzKoN
         P94ZYYDS4ZFRITLuTt2WFWWtqjlDFRumX4sQC63RHN8QoxRgtmrKadPIiNBz2h6J74BO
         DLGiR8gqtQXBC9RbYQ9ggugH9uUKcolih6qbmKfX/rElP2YogVTIzpS4OIMM5or6FEnp
         B21pcv45wja4szk8/ArBNZCZ76Bwcl6Urgb3ZsnyGrcx9Bh0nB8PQE5OVVB0ojQdqrML
         j02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+mepptQUgkA8WUMVQ649aZezSvaJpTojRTTXZmGA4gs=;
        b=miju1E4dKLW86034/mfA3x4o02mV4JAbTtHi5iXweaf8u6KnPqZmH9dcao7aDR6yql
         uPh19E1ucaaT0QAW6y4zSTeWh9FiQLu7N2sPDTx5EfMcfnCXhqIFY9SjQY0mLWEYfqrQ
         Ar1CvgbH2dVX0EgnkN6YuU12KgQ/CtfGq4tN6vdofDL/QYHO7mUJABiJVA3kdfX6oGMT
         LaMcnW8a5TMPP2tSXXrYn0eqV1QS3PpIqdRD/F0j8OT2MYxsRCeZi5J4xkN6jwyMOv9o
         CDm9jFxL/smeTTlgmPJDbV/6FmJJH43RPU3ssVV8/3/jPivJ4cl5zMbU1yVxDQoVfASX
         oi+w==
X-Gm-Message-State: AA+aEWYW7eVhnZUrrMzP002S6pyyS65qWRwFxqbu7QbCOn9IOOORjrRN
        oNbgK9ZVGeALQcZWtFiTEzdP2sKf
X-Google-Smtp-Source: AFSGD/X7FKxrLYsvp6xl+pFDiqkZqV/GHmL6xuJ09l8J2y+scmfEDwoBPs5V1+yJ2xRaVgDLpR662w==
X-Received: by 2002:a1c:9ed7:: with SMTP id h206mr6036890wme.28.1544884004632;
        Sat, 15 Dec 2018 06:26:44 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:43 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 14/14] gpio: pca953x: Restore registers after suspend/resume cycle
Date:   Sat, 15 Dec 2018 15:26:05 +0100
Message-Id: <20181215142605.15397-15-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It is possible that the PCA953x is powered down during suspend.
Use regmap cache to assure the registers in the PCA953x are in
line with the driver state after resume.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
V2: - Drop the regcache_sync() calls from suspend callback
    - Fix build with CONFIG_GPIO_PCA953X_IRQ
V3: No change
---
 drivers/gpio/gpio-pca953x.c | 88 +++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 6f50cf14bb23..83617fdc661d 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -975,6 +975,91 @@ static int pca953x_remove(struct i2c_client *client)
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
+	regcache_mark_dirty(chip->regmap);
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
@@ -1018,9 +1103,12 @@ static const struct of_device_id pca953x_dt_ids[] = {
 
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

