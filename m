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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5B1C43444
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C3A82080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohebmE/T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730145AbeLOO0c (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:32 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37455 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730037AbeLOO0c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:32 -0500
Received: by mail-wr1-f65.google.com with SMTP id s12so7633087wrt.4;
        Sat, 15 Dec 2018 06:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=do3KTnLDgvxNSCcH3TW+HHFTH6vyfh6ObjgTjsGaoeM=;
        b=ohebmE/TX7mCV3mDk4EZiGf6zJbHpbq+eacQRrlLLLunexP8FmROfoTtYKHRGgxn47
         GEST6o/Px0WZ9D9LMPfju51VBE61vwq+jQVr0WP9SyjX7otexmBfIJPmbvibYvIUtjmE
         vjCZO2rmVv72c5uWWSTbOM+Cxo/9BHiUkSAbIX1f16VszBRwT3kGooBsRzhBN6TNaDZI
         VJwVkGy3+AZTUKDw1UcG87FHTsmQNxLmhsqIMrheb4JvDYjc4SBJMmN7MBYoI5tnh6y9
         f0qkaMZ+fwK02LVi6JsQ0uudGccc5hL2C5NPr7ea36eyK93QomAC3aaF7GjOMoxTKeZ+
         C/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=do3KTnLDgvxNSCcH3TW+HHFTH6vyfh6ObjgTjsGaoeM=;
        b=RudSrEpZ0k7I4T010iD8r87Q8p9BahfMebhRVWMBIJV8Br90Lu1+2v1YiBlWTSqSEK
         4uBF/jWxMdDWq6jafWjiFYPa2Sk9Q5F6Bv3pB042wfuxfHDj3B/mZRUFzLR/WRPH92P9
         67mO54B5kB6pqJNKYo+E5yMZo+q7AGojYdlT3KlaneJiHjkfmHcbeEMMJwHKXauuvibH
         06y/RWhg+wLYsbfa9bNs6yMoAAlthA4F1M0HUU2cxatRX/j9aDc8vPMclk4+PFriqxkv
         Sdolmg6BoDq14AZwaqPoGQQ7XblWDmLYU7hu8+wjb00W3tRWMUyM4IZgWb/01ZOmTBLE
         vYfQ==
X-Gm-Message-State: AA+aEWZnKVjr9P3bsXk5iEZUSx8cYTEdou5IBQc6nmmaCOC/q/xfgAYC
        EF7SwpbBqmAH+I4tzNEJ2Pj6NelK
X-Google-Smtp-Source: AFSGD/Vgm5x4qJs5LHLNiHrr9KNwee5veuqZX+5gm4ilBzNQSgjntH8zSTLHLd6ycVgfpS1V3vFX8A==
X-Received: by 2002:adf:e78f:: with SMTP id n15mr5814055wrm.115.1544883989800;
        Sat, 15 Dec 2018 06:26:29 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:28 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 03/14] gpio: pca953x: Repair multi-byte IO address increment on PCA9575
Date:   Sat, 15 Dec 2018 15:25:54 +0100
Message-Id: <20181215142605.15397-4-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
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
V2: No change
V3: No change
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

