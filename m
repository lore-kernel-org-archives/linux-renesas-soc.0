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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84E2C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99C6B2080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqXXIsSC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730313AbeLOO0l (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:41 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45995 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730290AbeLOO0l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:41 -0500
Received: by mail-wr1-f65.google.com with SMTP id t6so7894888wrr.12;
        Sat, 15 Dec 2018 06:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tztWRkvfsQqp4qFm4CC6NSKUU0zGyK7TW+JZNWp9ghg=;
        b=UqXXIsSCaSJ4ZOdYwTVyxTJOKyHH3CiarG3sTvyxaHMGRYdNspsc912R2DukzBYG1i
         0yIprcC9xgzBrUCdhJ9d63a2XRxH6xIbvKWHHZg5TMQM2N/5Nh+HyzCSVXXn9ukznYrv
         jpYLLLMqkpY+/Fy6AHM+s247O+S9MOt6FAMPChaLv1JY76WHK3SoP2lV4yNI8MSR3KE0
         oX9e50NnHubByK5XQ4USn1Lc9FtoMbciMYuIdMq6lZeP9+yNiRtpfbKn/715D1Vapx0f
         m10MI7PX1WQG2QHDxWglfsQ89KBDT2kNXRao9jNRrhgltCdFh+DEddBuTMp45hkb0uqM
         BJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tztWRkvfsQqp4qFm4CC6NSKUU0zGyK7TW+JZNWp9ghg=;
        b=hSwjLWahUsiIKiDpHjSfEkqQDLgv4NO7aNTiXRkcoAAs8mlUAePBt+fT+epCGAeFYT
         ufqAR3tn+SzjEe69qtcrdqme0pXPHI0/ZufRPWsp0lQGzXvdzvhm5Ut+NXYhec+41jwv
         1yC14bsFDoXReLGDJvQebPv7I1XTCAksGAU8wGi2634IqAhVS8ocz/e4golbuFmxSEy4
         O4OPIIw5Vcl0UDdVENx2/89aqzQDNu30Xg9/oq4o2+B9VRauj8luvW62uZ9W49h94J0d
         MgLk67+V9SbAhRrFbqkCU/7ZrxqLiu4Cun57BDt2o3i7CissYYrA4al9NIoLrKvykwh4
         fhlw==
X-Gm-Message-State: AA+aEWZ5RDP4xnt9XbqRSZow4JNKjAtrrZZPi5MO31VQMqmTgb709BD6
        cm72rsCLYMbvJXCeF3hu0V0Yot5E
X-Google-Smtp-Source: AFSGD/WriX7uxriYIOHn62+624YQU92ckLHf5bYs647x1Uke6wodO6rhPy1K9wjn6uCck45F16ebvQ==
X-Received: by 2002:adf:fd50:: with SMTP id h16mr6025552wrs.231.1544883997922;
        Sat, 15 Dec 2018 06:26:37 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:37 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 09/14] gpio: pca953x: Extract the register address mangling to single function
Date:   Sat, 15 Dec 2018 15:26:00 +0100
Message-Id: <20181215142605.15397-10-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Instead of having the I2C register calculation function spread across
multiple accessor functions, pull it out into a single function which
returns the adjusted register address.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
V2: No change
V3: No change
---
 drivers/gpio/gpio-pca953x.c | 59 ++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index cbc3b82b9385..b08e071ad48c 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -164,17 +164,37 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
 	return fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
 }
 
+static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
+			      bool write, bool addrinc)
+{
+	int bank_shift = pca953x_bank_shift(chip);
+	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
+	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
+	u8 regaddr = pinctrl | addr | (off / BANK_SZ);
+
+	/* Single byte read doesn't need AI bit set. */
+	if (!addrinc)
+		return regaddr;
+
+	/* Chips with 24 and more GPIOs always support Auto Increment */
+	if (write && NBANK(chip) > 2)
+		regaddr |= REG_ADDR_AI;
+
+	/* PCA9575 needs address-increment on multi-byte writes */
+	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
+		regaddr |= REG_ADDR_AI;
+
+	return regaddr;
+}
+
 static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
 				int off)
 {
+	u8 regaddr = pca953x_recalc_addr(chip, reg, off, false, false);
 	int ret;
-	int bank_shift = pca953x_bank_shift(chip);
-	int offset = off / BANK_SZ;
 
-	ret = i2c_smbus_read_byte_data(chip->client,
-				(reg << bank_shift) + offset);
+	ret = i2c_smbus_read_byte_data(chip->client, regaddr);
 	*val = ret;
-
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed reading register\n");
 		return ret;
@@ -186,13 +206,10 @@ static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
 static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
 				int off)
 {
+	u8 regaddr = pca953x_recalc_addr(chip, reg, off, true, false);
 	int ret;
-	int bank_shift = pca953x_bank_shift(chip);
-	int offset = off / BANK_SZ;
-
-	ret = i2c_smbus_write_byte_data(chip->client,
-					(reg << bank_shift) + offset, val);
 
+	ret = i2c_smbus_write_byte_data(chip->client, regaddr, val);
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed writing register\n");
 		return ret;
@@ -203,20 +220,9 @@ static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
 
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	int bank_shift = pca953x_bank_shift(chip);
-	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
-	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
-	u8 regaddr = pinctrl | addr;
+	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, true, true);
 	int ret;
 
-	/* Chips with 24 and more GPIOs always support Auto Increment */
-	if (NBANK(chip) > 2)
-		regaddr |= REG_ADDR_AI;
-
-	/* PCA9575 needs address-increment on multi-byte writes */
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
-		regaddr |= REG_ADDR_AI;
-
 	ret = i2c_smbus_write_i2c_block_data(chip->client, regaddr,
 					     NBANK(chip), val);
 	if (ret < 0) {
@@ -229,16 +235,9 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	int bank_shift = pca953x_bank_shift(chip);
-	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
-	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
-	u8 regaddr = pinctrl | addr;
+	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, false, true);
 	int ret;
 
-	/* Chips with 24 and more GPIOs always support Auto Increment */
-	if (NBANK(chip) > 2)
-		regaddr |= REG_ADDR_AI;
-
 	ret = i2c_smbus_read_i2c_block_data(chip->client, regaddr,
 					    NBANK(chip), val);
 	if (ret < 0) {
-- 
2.18.0

