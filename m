Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B57C67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D39D2081B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZohIxevR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D39D2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbeLLBkh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:40:37 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46532 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbeLLBkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:40:37 -0500
Received: by mail-wr1-f65.google.com with SMTP id l9so15970663wrt.13;
        Tue, 11 Dec 2018 17:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iOl5Aj9f9bLTGhk6xSvzlIBjjGnlsrh8kgQMMvzCAZ0=;
        b=ZohIxevRAsWB+cehGMVywEY+17F9cHfYEjmuAkkSjm8rtC/cdq7vmFX6Kub1lFfPNC
         vBKHtp3lFhaJUuusxnA0iOsDzq8nUm7di5zzZH5cf9Iiq52D8JHHWY8CjRSaIdZPt+0U
         Nwm6BXauPwyjJIf442Q7eCNIJPN/yk5zG9IMK3tfvG4CH3WTnHF8gCSeRzZC4NFgbRDv
         XIoy7eLAChGhKESLS0KJpev5AufPXik5IXi8urNga5o+6voUp3OZv280i2rdRRMKQ6oB
         co25/kKohDir9VMdWzsUdYqJXa6JYVRgZFFP4af0NtixRd25ilbLIElbAJne57Qf+Y1E
         RmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iOl5Aj9f9bLTGhk6xSvzlIBjjGnlsrh8kgQMMvzCAZ0=;
        b=NidpKghONhh0OmCd8CzdcDawvRPXEZ7FqIRzvwpH9FvIIaRwmF2FR6H4T5VkzTi3AV
         r3h56Sq7SKBazlLq/C6/xFuHoX65KDTdmdwk+b6MTMjkPEnY+RCMlbTF39SpJCK0yCAi
         vmiFIqBxdbiB8ja2fmBmeNtVVd7HXRJfvG7L2KK5CwHSjZTES6Gm1HA5rwX+HvLoazi2
         XDmfr2r7buU3BpKERXZSXPRJQdxh6bLOD7dWd+pgE1Nde7kC0VY3MzR7hA5pA0nawlpj
         tuhz2HjLY7HKMHlMbhD9qBtDQGzZHaiGmvwNsK2mNvtfaMHu19KU7YyyqcOojGAqEH+F
         qtyA==
X-Gm-Message-State: AA+aEWZGjmOa3qZr1gQMexX1hWjQ0hjhUmwFHUfkn0F3Mngivy3aCh/6
        8Y2IW+n08Xd4Bgd6XVpPL+5V6BQw
X-Google-Smtp-Source: AFSGD/UsJG5Z5FPt+vUciSlTolyg3sVE5vHyVA9MIsndkv1rxU+IQo3DqGu62EHoQ0K6wEz0E4kkbg==
X-Received: by 2002:a5d:4c8a:: with SMTP id z10mr15024447wrs.75.1544578834224;
        Tue, 11 Dec 2018 17:40:34 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c12sm12719214wrs.82.2018.12.11.17.40.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:40:33 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V2 06/14] gpio: pca953x: Unify pca953x_{read,write}_regs_{8,mul}()
Date:   Wed, 12 Dec 2018 02:39:54 +0100
Message-Id: <20181212014002.4753-6-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

At this point, the pca953x_{read,write}_regs_mul() can read single bank
PCA953x GPIO chips as well. Merge the _8 and _mul functions together to
simplify the code a bit.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 54 ++++++-------------------------------
 1 file changed, 8 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 9b37dbbb63cb..626cbe040985 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -154,9 +154,6 @@ struct pca953x_chip {
 	struct regulator *regulator;
 
 	const struct pca953x_reg_config *regs;
-
-	int (*write_regs)(struct pca953x_chip *, int, u8 *);
-	int (*read_regs)(struct pca953x_chip *, int, u8 *);
 };
 
 static int pca953x_bank_shift(struct pca953x_chip *chip)
@@ -201,17 +198,13 @@ static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
 	return 0;
 }
 
-static int pca953x_write_regs_8(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	return i2c_smbus_write_byte_data(chip->client, reg, *val);
-}
-
-static int pca953x_write_regs_mul(struct pca953x_chip *chip, int reg, u8 *val)
+static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	int bank_shift = pca953x_bank_shift(chip);
 	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
 	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
 	u8 regaddr = pinctrl | addr;
+	int ret;
 
 	/* Chips with 24 and more GPIOs always support Auto Increment */
 	if (NBANK(chip) > 2)
@@ -221,15 +214,8 @@ static int pca953x_write_regs_mul(struct pca953x_chip *chip, int reg, u8 *val)
 	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
 		regaddr |= REG_ADDR_AI;
 
-	return i2c_smbus_write_i2c_block_data(chip->client, regaddr,
-					      NBANK(chip), val);
-}
-
-static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	int ret = 0;
-
-	ret = chip->write_regs(chip, reg, val);
+	ret = i2c_smbus_write_i2c_block_data(chip->client, regaddr,
+					     NBANK(chip), val);
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed writing register\n");
 		return ret;
@@ -238,36 +224,20 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 	return 0;
 }
 
-static int pca953x_read_regs_8(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	int ret;
-
-	ret = i2c_smbus_read_byte_data(chip->client, reg);
-	*val = ret;
-
-	return ret;
-}
-
-static int pca953x_read_regs_mul(struct pca953x_chip *chip, int reg, u8 *val)
+static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	int bank_shift = pca953x_bank_shift(chip);
 	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
 	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
 	u8 regaddr = pinctrl | addr;
+	int ret;
 
 	/* Chips with 24 and more GPIOs always support Auto Increment */
 	if (NBANK(chip) > 2)
 		regaddr |= REG_ADDR_AI;
 
-	return i2c_smbus_read_i2c_block_data(chip->client, regaddr,
-					     NBANK(chip), val);
-}
-
-static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	int ret;
-
-	ret = chip->read_regs(chip, reg, val);
+	ret = i2c_smbus_read_i2c_block_data(chip->client, regaddr,
+					    NBANK(chip), val);
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed reading register\n");
 		return ret;
@@ -872,14 +842,6 @@ static int pca953x_probe(struct i2c_client *client,
 	 */
 	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
 
-	if (chip->gpio_chip.ngpio <= 8) {
-		chip->write_regs = pca953x_write_regs_8;
-		chip->read_regs = pca953x_read_regs_8;
-	} else {
-		chip->write_regs = pca953x_write_regs_mul;
-		chip->read_regs = pca953x_read_regs_mul;
-	}
-
 	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
 		ret = device_pca953x_init(chip, invert);
 	else
-- 
2.18.0

