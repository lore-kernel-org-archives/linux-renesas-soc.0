Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2991C43612
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B543E2080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJsjyGZy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729966AbeLOO0g (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:36 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39378 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730213AbeLOO0g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:36 -0500
Received: by mail-wr1-f68.google.com with SMTP id t27so8074184wra.6;
        Sat, 15 Dec 2018 06:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+eVatpNYpctLV5eQ09gAR2feTXDR5tDxt4OOMoQLa68=;
        b=BJsjyGZybTsNU/zJSbLLKhU9Wanm04KQE/vUSYJ5lbGaAQZUQsHsH2u1OHZ9NJGx83
         Vl2kQdRZH0ApxpUNfUdaVbwmJ7S+X8wSjllJGI73KCTZJ+q7Z3FxY61kvCqNsZA2NFVI
         suqUdSdKqkdKqfdq1Wznl8KmvdMfHXQIvSybo/kqHWnx9CcFBo1OeMOZv7FKc9zdKIXo
         zhH11fJ5RzZWT+RCc0jEOFIEiKVvix8htbRx93nYapURky5vN4GDi1aLb4ppn1Qkawlm
         m7ooX0An4k2OoE+18Pqeh23d7kixLXMN0r7R79bbhiRmhTbR2o0P5y+WRHKPYQmbJk3p
         bRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+eVatpNYpctLV5eQ09gAR2feTXDR5tDxt4OOMoQLa68=;
        b=fTtsqr/l+9JpV+w4en7mjUWq6Be09hwJou0cBZeQGjQtnyk+y0ITDWZ1TWr+p90IkJ
         8RMb9G8ToZENMW5I279cnmZYjU6wr5ypIGXE+PwpG9EGwMZZEVoQhzX7wO/vjBACWcfL
         6TH+ZnZpJ6bNLXyhTW6fEwShClT1QpvU+UdQMCHvWp9zUjV8r7Pm7AYbcBavpg+d2r/j
         UEQihOnvLMsEHlggIe053RFMJafJG5NlSOL/nht8vNR6aM0+4GIY7iLqPiYbWzjtakgN
         PMqEtKX+bw8oVF9WLnloHyLKiCv9i+B07bbMTTNOH89eexr2slPz7gmJO5bgeyjXNUJn
         CNLA==
X-Gm-Message-State: AA+aEWZ9ggJ28MM2IZZNnAELX6eR055uPWoOBYi6XeAOOlpgB6y7K0dX
        nQKEpM7WsVoLIBans8PacgivFR7T
X-Google-Smtp-Source: AFSGD/VzblJP4WBcQMN1gDLvULiMbDGtwXbhSzdlTNGLLqXII4001F3tGf2iGS8JgrdXulMGP5pWmg==
X-Received: by 2002:a05:6000:11c3:: with SMTP id i3mr5984236wrx.221.1544883993780;
        Sat, 15 Dec 2018 06:26:33 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:32 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 06/14] gpio: pca953x: Unify pca953x_{read,write}_regs_{8,mul}()
Date:   Sat, 15 Dec 2018 15:25:57 +0100
Message-Id: <20181215142605.15397-7-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
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
V2: No change
V3: No change
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

