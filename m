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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2750DC6783B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2C9D2081B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngMFkEOW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2C9D2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbeLLBkd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:40:33 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38318 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbeLLBkd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:40:33 -0500
Received: by mail-wm1-f67.google.com with SMTP id m22so4229850wml.3;
        Tue, 11 Dec 2018 17:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lbs5gg62732h5zCjnUEcSBYfHb4JmLXnFfVOZ2cKzYw=;
        b=ngMFkEOWBmsDCdFT2pPwJ7q05rOc5zlopVJf2eWHOTNoheQHEaLA0t06GlM3MEndlE
         Ud0dToBlUazYwg2yCVcujAl1DB2pIP3qE9bo+bbcnhINbz1hG2UmIRqfpnyEp9GyLT79
         tW/Jqh0w9uLiOyI6LYZhVzi8x6ZY0kRswoptB59WGka1hhDfNUAizYdxO26RBq8XEZQ5
         BEJLe+Hi6+ASKBJQNmw0gONSo7zSQ5NRkkD3XkXUR7HOWDiQW/T9Z5dm7Upsl7QyAs6D
         fb5W1M0NcvqUIs8JQZG6jnRQ451hdSWzGGVVT4cdgc5L+oOCOwQjiRY+3y3FycI9EPca
         UydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lbs5gg62732h5zCjnUEcSBYfHb4JmLXnFfVOZ2cKzYw=;
        b=CPP9eyaPeFO1SX/bRuskzbn+6ihWFd18X19VzrVdpk1kAX6Csu08mbIN++lxc4ZWDN
         L4A4ctHEGh3dQq5+2g27xAyV0cwIqLz8X6gyJQRIx6HektbDnC7bwWxPBnjDHCv6ZTBb
         Gg3Ey1FS52rLykme+SbU7IGBMYZinGL96sVJN0vZf8GLGEsOmFe+WYBCMrzY9UQZQsY1
         WAdK6fwqV9/hzgyGUNWmRRRlrn5+uiLC41K6l77go7IENCajv6O7Fj9FimP081qM51Ax
         yeNIWso+VeFYdjGoAZjIxO5a6NaVnRmn5Lmh9EvhrtNJUznWUXXSV9RIeu/jeT4vyp6l
         jviw==
X-Gm-Message-State: AA+aEWagJWZq41fq79xLOM4NReeTOeG9STCUUjJe5HnwbhCKz19B3Zat
        5Tw2O2S22hmC/CE4zieC6LaTPFSK
X-Google-Smtp-Source: AFSGD/UyHH3JWJ17NuRExW0vBAVmnuYGPvVLHLVl5Q/5y16E69QdTJqZVJoqaeo3hf4RiuJZiV98/A==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr4428315wmi.140.1544578830104;
        Tue, 11 Dec 2018 17:40:30 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c12sm12719214wrs.82.2018.12.11.17.40.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:40:29 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V2 03/14] gpio: pca953x: Repair multi-byte IO address increment on PCA9575
Date:   Wed, 12 Dec 2018 02:39:51 +0100
Message-Id: <20181212014002.4753-3-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The multi-byte IO on various pca953x chips requires the auto-increment bit,
while other chips toggle the LSbit automatically. Note that LSbit toggling
only alternates between two registers during the IO, it is not the same as
address auto-increment. The driver currently assumes that #gpios > 16 implies
auto-increment, while #gpios <= 16 implies LSbit toggling. This is incorrect
at there are chips with 16 GPIOs which require the auto-increment bit.

The PCA9575, according to NXP datasheet rev. 4.2 from 16 April 2015, section
7.3 Command Register, the bit 7 in command register is the auto-increment
bit, which allows programming multiple registers sequentially.

Set this bit both in pca953x_gpio_set_multiple(), where it fixes the multi
register programming, and in pca957x_write_regs_16(), where is simplifies
the function. In fact, the pca957x_write_regs_16() now looks rather similar
to pca953x_write_regs_24() and pca953x_write_regs_16(), which is intended
for subsequent patches.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index ec9fd11cd21c..8f6478f4545f 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -215,13 +215,10 @@ static int pca953x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca957x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	int ret;
-
-	ret = i2c_smbus_write_byte_data(chip->client, reg << 1, val[0]);
-	if (ret < 0)
-		return ret;
+	u32 regaddr = (reg << 1) | REG_ADDR_AI;
 
-	return i2c_smbus_write_byte_data(chip->client, (reg << 1) + 1, val[1]);
+	return i2c_smbus_write_i2c_block_data(chip->client, regaddr,
+					      NBANK(chip), val);
 }
 
 static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
@@ -408,6 +405,7 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	int bank_shift = pca953x_bank_shift(chip);
+	u32 regaddr = chip->regs->output << bank_shift;
 	unsigned int bank_mask, bank_val;
 	int bank;
 	u8 reg_val[MAX_BANK];
@@ -426,8 +424,13 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 		}
 	}
 
-	ret = i2c_smbus_write_i2c_block_data(chip->client,
-					     chip->regs->output << bank_shift,
+	/* PCA9575 needs address-increment on multi-byte writes */
+	if ((PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) &&
+	    (NBANK(chip) > 1)) {
+		regaddr |= REG_ADDR_AI;
+	}
+
+	ret = i2c_smbus_write_i2c_block_data(chip->client, regaddr,
 					     NBANK(chip), reg_val);
 	if (ret)
 		goto exit;
-- 
2.18.0

