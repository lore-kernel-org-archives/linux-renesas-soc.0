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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271B5C67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0E9A2081B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mK0JEQhe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0E9A2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbeLLBkf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:40:35 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37545 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbeLLBkf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:40:35 -0500
Received: by mail-wr1-f66.google.com with SMTP id j10so16020035wru.4;
        Tue, 11 Dec 2018 17:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4PbaR0V9EmRCLg24iwUIkDoVUH0vr7nly0FBuvzjG1c=;
        b=mK0JEQheWToyJzvpWCDqOE33jXNa2J+6t9cHmt20sKAT1u/2r6oRz73d2Yno2fqBj3
         3xO/oc2URQjUXpykk2CFuXuysF1BCOFhhHRaKUsNcZrWTiMTfEJ5Mt7up2j3eXU5q/sp
         R4E4fvGfQ3pKqukygZ5+q+WCZNd7RuLjNCEgG3bBdUHwK/Eg89sEKeDYJMaSHA6nU2LP
         fSpjl5qNO4p47vzcd6LebAXk2mEjpt4MeQjd1psp/AunbAJrS1eZCdTmQtJLDQconeGq
         necteSBoViUUe1sQk3gQhnCt176eqZcoiI1FxzJvmlztZMlaM64lEC2zrAeVrAGoAAW3
         zDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4PbaR0V9EmRCLg24iwUIkDoVUH0vr7nly0FBuvzjG1c=;
        b=cgtuYOnKnaDVHd26LkUlfg+IWz778FM3u6hYHcHtFKtRR2IsD4QaMgpurhUBG/A74y
         J6w4MePopftzpxJkdLDSighglWEaKX2qd1zNjsaKTeHyR+UBzLgSbV2rQsvbqwasNe6R
         wrjHJ0hpPVFuEyIHy8WHUj+xQLyiLGBC6je1SsSf8KbJND/I3kj1B7WdaglMmyHzEEyK
         OgvGH1UIEbMlxePtPNZGEwtbIAsN2BpHXmolu+cSNxblofIG6xUiPHOHYsUnf6A2zd3B
         avXPBKC59daA+iV/eqrxfvZAbVxRaahQZnH8Fac+L47hgft5yl75nl0T/N9IjLcMBPwD
         MXJw==
X-Gm-Message-State: AA+aEWaaLaW2oTUdso6qQuSCoRw2AARf+32p8IPFdS8BYxvuIK30aboy
        8Cf5A7ypUDnE3xOFN8uXLmJGnObI
X-Google-Smtp-Source: AFSGD/VoXWXZdE25EcJu+sjiawARxCQQbcswlbQhHNCE/Xy2+e+bpZVGyWzzk7DSpDA2CI0zX1KhGQ==
X-Received: by 2002:adf:ff09:: with SMTP id k9mr14756785wrr.97.1544578832896;
        Tue, 11 Dec 2018 17:40:32 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c12sm12719214wrs.82.2018.12.11.17.40.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:40:31 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V2 05/14] gpio: pca953x: Unify pca953x_{read,write}_regs_{16,24}()
Date:   Wed, 12 Dec 2018 02:39:53 +0100
Message-Id: <20181212014002.4753-5-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
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

