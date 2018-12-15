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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2762C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6FE9C2080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQW3tVRp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730119AbeLOO0b (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:31 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34939 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729687AbeLOO0a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:30 -0500
Received: by mail-wr1-f67.google.com with SMTP id 96so8083643wrb.2;
        Sat, 15 Dec 2018 06:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BGQ9yNjIn4OO2QkKvR9d+Wcmfw6vmKSB2+xDHiMuT5k=;
        b=AQW3tVRp1mLQ1E0hyOBl/R5RB7pHq5yDVIJOXy4hrqzmFqhx4J3htepDo+uH7a4K/Y
         Vn4oH9zu8D5Kg61rJ0X0BZDIIq/UnjwVO9KG8WC7+5hLmC3XKGDNJ6maNuK9GrjdJKSD
         Zz1SqxQdX881GMAIUKSpmOUzOePtbRKpddlE/B0+70CaAG6NmLg0kPNa+M3PjGUosncC
         2rC1NYUFtCNrgI6iG5alucVjYmplDZ0Eqm3FFYWTPLX7abG0XoAa12m+uCP5p7qP2A9E
         q8TRiAXhgHUSPuF5qAvC9Pi8T2g1gsnYD2cyLREahh34ocUpIp9TM94Wnz8c7QTUKH6W
         rvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BGQ9yNjIn4OO2QkKvR9d+Wcmfw6vmKSB2+xDHiMuT5k=;
        b=YjLBzYnaa6odG6geZGzoanBrJOAW3lyoYzhWu3jkTXCXRDduH/L/sYvi1lquxkflaI
         dqrm8Ow2WXu9TFQci/LzlxMqBK6Tdineohdo/j6HeyDPYV9VhsfFxbujoZ13VEOY4OqI
         RL03n5HCctNlQNjA45ym6ok7aSH9Fxcoe3OdWk5E6C+d56cdH/RWy5sf708kjNvzbgqn
         6B1CUg0e8Mo9EnEKzmDk80DK4aNgBpEW2NC0KLgyetdxyQrXNQYEjvAtjcOOFQ2J8aiA
         UCH2LMdrUMSjc1uNzYPr6fN9/aoh3CmtzJd4Pu+wAMfkM/qFkJBdbdLMRoorECVX1/Vg
         cIAw==
X-Gm-Message-State: AA+aEWY2+xjbVeVnKkNzgOW2CY8A7lP9U4sXzddE1Zq7cAf4wT5JZhpC
        LArUd4QU2zS9tojPC30VnYDUGTDV
X-Google-Smtp-Source: AFSGD/W4lLwUE35wlT1PkNENTCt1Fa5qPrZmH2HFuzGYLfxzRXyDCiVEl9KlMHN6kK3P5xxJ/giRdQ==
X-Received: by 2002:a05:6000:11c3:: with SMTP id i3mr5984040wrx.221.1544883987108;
        Sat, 15 Dec 2018 06:26:27 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:26 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 01/14] gpio: pca953x: Deduplicate the bank_shift
Date:   Sat, 15 Dec 2018 15:25:52 +0100
Message-Id: <20181215142605.15397-2-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The bank_shift = fls(...) code was duplicated in the driver 5 times,
pull it into separate function.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
V2: Replace bank_size with bank_shift in commit message
V3: No change
---
 drivers/gpio/gpio-pca953x.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 540166443c34..afe6de4c48c4 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -159,11 +159,16 @@ struct pca953x_chip {
 	int (*read_regs)(struct pca953x_chip *, int, u8 *);
 };
 
+static int pca953x_bank_shift(struct pca953x_chip *chip)
+{
+	return fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+}
+
 static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
 				int off)
 {
 	int ret;
-	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+	int bank_shift = pca953x_bank_shift(chip);
 	int offset = off / BANK_SZ;
 
 	ret = i2c_smbus_read_byte_data(chip->client,
@@ -182,7 +187,7 @@ static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
 				int off)
 {
 	int ret;
-	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+	int bank_shift = pca953x_bank_shift(chip);
 	int offset = off / BANK_SZ;
 
 	ret = i2c_smbus_write_byte_data(chip->client,
@@ -221,7 +226,7 @@ static int pca957x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+	int bank_shift = pca953x_bank_shift(chip);
 	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
 	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
 
@@ -265,7 +270,7 @@ static int pca953x_read_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca953x_read_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+	int bank_shift = pca953x_bank_shift(chip);
 	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
 	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
 
@@ -402,13 +407,12 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 				      unsigned long *mask, unsigned long *bits)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	int bank_shift = pca953x_bank_shift(chip);
 	unsigned int bank_mask, bank_val;
-	int bank_shift, bank;
+	int bank;
 	u8 reg_val[MAX_BANK];
 	int ret;
 
-	bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
-
 	mutex_lock(&chip->i2c_lock);
 	memcpy(reg_val, chip->reg_output, NBANK(chip));
 	for (bank = 0; bank < NBANK(chip); bank++) {
-- 
2.18.0

