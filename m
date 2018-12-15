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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB42C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E32272080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIVGRIqQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730252AbeLOO0f (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:35 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44734 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbeLOO0f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:35 -0500
Received: by mail-wr1-f66.google.com with SMTP id z5so8057583wrt.11;
        Sat, 15 Dec 2018 06:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uJQ10kolOpwc6gQ7lRBdlTd/5YvWveGTvKblNVYSap0=;
        b=nIVGRIqQ9v13EpQFYlO0kQxVdB1h1n9Zst3UBSw6WmZG5fcv+NGjnNwnpMd43pURGP
         WC+gl99lHCIVk1mQDSMtsqm++uqb/p4MW7sUJuC4avVKYOTqq3bKpzE+nNeYfIvkTvMh
         Yy9g5rmXdzQMAa68MS+NU0P20kgOqfGAGStAr8okVHmv1V9/IXR8ddAPMZqWPZIyqgl5
         3n8eBP8jPOXZD6HIHbB0ivUSoz2KXr7XRQRkqDsaUp78w1H3GyvY56+8CsuFj2lYMHxD
         9JU9hi+DxYncnZbhDIP2ZV/H+7gIk9vlI7Z7hl2RU2MrMW43c7MUzstZ/LyKXEmLg1E2
         8Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uJQ10kolOpwc6gQ7lRBdlTd/5YvWveGTvKblNVYSap0=;
        b=Ek/Ys26utXmueTml0Cy78ezbQpeHdtB4xuooa4dRnIq0oA4SsDWtnulQ5NugKeJfhL
         u2XzGRL+VOIqE6XK6VG6T53OrOGW6gX4/eZDJA2AzmPwC3OQr2+wkupxmHb74xiWwrv3
         xEgTtDciNATjT6D9RmbHxggdmy+g4I+GHsUb7bNf6+K89BkKltUZy22zRGLwftJ+UdQq
         PbGiqx28b/aZ+tiS+Tn2aysGEWrm+sUOT36wQDda+n35NSjKokANPrgkOCDHLGlatupN
         fweOjetiw2a99JBFoZa6uBhYvJZp20Bh5LxyYWNwvrskSx/Lcy2rkdWIf6kRLtEbHlZg
         WudA==
X-Gm-Message-State: AA+aEWbfpG/JwwbzNw7csOowcinVR+qdIx8RD0fwYtZUvafv/vC9NrqR
        m44OnN5bTX3HkIsAesTzQb0mhFH+
X-Google-Smtp-Source: AFSGD/UPnd7e1WmwSDdR3rIDVqWtE1DLBZciQ3uArafw6ts+kODVdC+VIYuDzxHRYjqXuPQgLCJViA==
X-Received: by 2002:a5d:51ca:: with SMTP id n10mr5324255wrv.316.1544883992435;
        Sat, 15 Dec 2018 06:26:32 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:31 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 05/14] gpio: pca953x: Unify pca953x_{read,write}_regs_{16,24}()
Date:   Sat, 15 Dec 2018 15:25:56 +0100
Message-Id: <20181215142605.15397-6-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

At this point, these two functions only differ in whether they do or do not
set the address increment bit. The 16 GPIO case does not need to set the AI
bit, except for PCA9575 on write, while the 24 GPIO and more case does set
the AI bit always. Merge these two functions together to simplify the code
a bit.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
V2: No change
V3: No change
---
 drivers/gpio/gpio-pca953x.c | 49 ++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 7288a589a6b7..9b37dbbb63cb 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -206,9 +206,16 @@ static int pca953x_write_regs_8(struct pca953x_chip *chip, int reg, u8 *val)
 	return i2c_smbus_write_byte_data(chip->client, reg, *val);
 }
 
-static int pca953x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
+static int pca953x_write_regs_mul(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	u32 regaddr = (reg << 1);
+	int bank_shift = pca953x_bank_shift(chip);
+	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
+	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
+	u8 regaddr = pinctrl | addr;
+
+	/* Chips with 24 and more GPIOs always support Auto Increment */
+	if (NBANK(chip) > 2)
+		regaddr |= REG_ADDR_AI;
 
 	/* PCA9575 needs address-increment on multi-byte writes */
 	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
@@ -218,17 +225,6 @@ static int pca953x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 					      NBANK(chip), val);
 }
 
-static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	int bank_shift = pca953x_bank_shift(chip);
-	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
-	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
-
-	return i2c_smbus_write_i2c_block_data(chip->client,
-					      pinctrl | addr | REG_ADDR_AI,
-					      NBANK(chip), val);
-}
-
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	int ret = 0;
@@ -252,24 +248,18 @@ static int pca953x_read_regs_8(struct pca953x_chip *chip, int reg, u8 *val)
 	return ret;
 }
 
-static int pca953x_read_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	int ret;
-
-	ret = i2c_smbus_read_word_data(chip->client, reg << 1);
-	put_unaligned(ret, (u16 *)val);
-
-	return ret;
-}
-
-static int pca953x_read_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
+static int pca953x_read_regs_mul(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	int bank_shift = pca953x_bank_shift(chip);
 	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
 	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
+	u8 regaddr = pinctrl | addr;
+
+	/* Chips with 24 and more GPIOs always support Auto Increment */
+	if (NBANK(chip) > 2)
+		regaddr |= REG_ADDR_AI;
 
-	return i2c_smbus_read_i2c_block_data(chip->client,
-					     pinctrl | addr | REG_ADDR_AI,
+	return i2c_smbus_read_i2c_block_data(chip->client, regaddr,
 					     NBANK(chip), val);
 }
 
@@ -885,12 +875,9 @@ static int pca953x_probe(struct i2c_client *client,
 	if (chip->gpio_chip.ngpio <= 8) {
 		chip->write_regs = pca953x_write_regs_8;
 		chip->read_regs = pca953x_read_regs_8;
-	} else if (chip->gpio_chip.ngpio >= 24) {
-		chip->write_regs = pca953x_write_regs_24;
-		chip->read_regs = pca953x_read_regs_24;
 	} else {
-		chip->write_regs = pca953x_write_regs_16;
-		chip->read_regs = pca953x_read_regs_16;
+		chip->write_regs = pca953x_write_regs_mul;
+		chip->read_regs = pca953x_read_regs_mul;
 	}
 
 	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
-- 
2.18.0

