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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5918EC67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19B242081B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkcA7nwG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19B242081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbeLLBkr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:40:47 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38350 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbeLLBkr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:40:47 -0500
Received: by mail-wr1-f65.google.com with SMTP id v13so16035118wrw.5;
        Tue, 11 Dec 2018 17:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=B3y60QNGnEeNUo7z75DsEI4zO/MsYhoXLy0FOACkVxc=;
        b=SkcA7nwGRX+TB5nEo1ydwGlG3RIlAZsQSTlmQtHI73gpjuEqE1TFfkF3hZqLzDCPXF
         K0Yu0uc9Pi5YX5jKGSbkx7vIPgSDVSnweoxAplM8ut9dfg6TMtazcE44Z1v8/eVsXzLI
         BbqErP7Swe8uJ9uZj4YnlZmDp/Uvrzsuc+jRzqSIbaw4HLRwOSyCNNGOM9y+gYHygYEw
         lkxNk+qxn2jSulcFHZyEJP8ub2uetPKw+S92gImubDW0/fC08iIuiApk6JmwunXuXZ1J
         /86LrLmtx0hzbK7+5M/0tdjY3TUNJ5c61jeYF/Fx7dmr61UzmRMiCgxWDdmuzrSpmrgk
         ukiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=B3y60QNGnEeNUo7z75DsEI4zO/MsYhoXLy0FOACkVxc=;
        b=ZvORTxhj+RgfUoxz+1Um+Ud4PGjHc7nzPXxO6erTvf/IP6Hrg4hXJgy1rGTPkQjvLg
         36+GxTgM/ZnqA3SuVkUZit3bJ2kMIaKwl7XfA0bg4MKOpLg9AS62BxDUWDmZ/1RlYv8f
         JhCzOoAk2B2UEn2CB0pCw38g6dFqo6drvUXtyAr/H1nEQELJDLObcTGzAYTYMyM8V0wi
         XKvgs5BAAO4A4QzO0Wt3zsAfBrpyeKVdVX/x/cgiB2FF6ZMFMAL4Z3EhkRnrxaOb3Wjy
         jkXYVFANAgLk3aQaFQcOEYMj/FnuA1Rp2DkExlSn4lds4FUBYgaGSpkgDdxc0CZdVvWs
         SiNA==
X-Gm-Message-State: AA+aEWay4n33IkssCcHzOlD6AiilN3DvPHrIKaaBTVTqMb+1GHi7lbtz
        CjaBHrialvJLp2Xh/JJmdXDgfs6a
X-Google-Smtp-Source: AFSGD/W28CBGt6F+7W73FL1yCfoJRcaiF43OzhPP8DZo3UGjcu66dss7Y4BJ/hQaYyMO1+lFT34ufQ==
X-Received: by 2002:adf:f091:: with SMTP id n17mr15424382wro.292.1544578845608;
        Tue, 11 Dec 2018 17:40:45 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c12sm12719214wrs.82.2018.12.11.17.40.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:40:44 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V2 14/14] gpio: pca953x: Restore registers after suspend/resume cycle
Date:   Wed, 12 Dec 2018 02:40:02 +0100
Message-Id: <20181212014002.4753-14-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
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

