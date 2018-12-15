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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60006C43612
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FC142080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azxt7qjk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730196AbeLOO0d (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:33 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39374 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbeLOO0d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:33 -0500
Received: by mail-wr1-f67.google.com with SMTP id t27so8074125wra.6;
        Sat, 15 Dec 2018 06:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZNYURw3tH9DmBORc9fD+7ODj82imGs8g5WxeCqaGPr8=;
        b=azxt7qjkQzuXJsbWwAHrMWeGG3WX3aD7Xdgkn3hQ+6RJ84mAX8nfWW05KpS11VgD/h
         U1mbvUUkbOaC1u34XXR0n0PYUHFR/co9PQ1dSSe1G+GmNn5/IDT3QjLbIuXayt2jDfmZ
         PkIh7/+GGDFAhqRPkTkiyamPdAM1LmLSNqoD3TannwrrONYLbqnN6k9w/PmjEpdqM2eB
         NVefd4sY+r+iruc+OvHZkkkUvxiuolA5IRoxGfGhO9C4VodK99agPmRXRJkXg8zU/VLS
         qMcFOMQZuECGuLL7ZierYDAbuTk6/36Sf8zxi1Yb+hAPVk/TjZumMzIOEtzf1M2WG7r0
         42ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZNYURw3tH9DmBORc9fD+7ODj82imGs8g5WxeCqaGPr8=;
        b=TC4HD6dt2YvT311s2VqKGWLDozFt4y0U/+RgbXEX003VJaHRH7RLMhy9sClIAeYAFs
         q1pyh5ihpOp/YcRumb07RkqLmF0XDetmyJgYdVyuUT89DVs0wo3bVR8wMFZE9FBOckMj
         AlIl+1yoxqp0jgCZ7D3Pu8mrm9ijPCzeC1eqgtTzbsLNSiidf7zM/9Vu66b17khghM+f
         zD0Qm8QvtGFqv6pGhtB81cakyJVcb5pLWygXMMsO2fidh7KwgJJgQSUKYWSzvjNFYYXZ
         zQxggoMIP0faVGo8MejaMsHgQxbVJvfVeamNxn2m1TU8jxqKo302PaQpl/+M+QO70/Ps
         EHrA==
X-Gm-Message-State: AA+aEWbzRsg9GoS0gXsAD7bScwvYabdfTgS3VIHTyQ9BsNx98dBmf2tq
        4K1TTQ0uqvhu/NdcwqnzhA4NKIr/
X-Google-Smtp-Source: AFSGD/XI2beqfvo0VD6W7MnULa2p0KGZLnqq3lp/K0lYDK+kmoGl0w1yo4vV/IwI7K7/Zv6Xh1ZLdg==
X-Received: by 2002:adf:b6a1:: with SMTP id j33mr5652542wre.55.1544883991210;
        Sat, 15 Dec 2018 06:26:31 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:30 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 04/14] gpio: pca953x: Unify pca95{3,7}x_write_regs_16()
Date:   Sat, 15 Dec 2018 15:25:55 +0100
Message-Id: <20181215142605.15397-5-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

At this point, these two functions only differ in whether they do or do not
set the address increment bit on PCA9575. Merge these two functions together
to simplify the code a bit.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
V2: No change
V3: No change
---
 drivers/gpio/gpio-pca953x.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 8f6478f4545f..7288a589a6b7 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -208,14 +208,11 @@ static int pca953x_write_regs_8(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca953x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	u16 word = get_unaligned((u16 *)val);
+	u32 regaddr = (reg << 1);
 
-	return i2c_smbus_write_word_data(chip->client, reg << 1, word);
-}
-
-static int pca957x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
-{
-	u32 regaddr = (reg << 1) | REG_ADDR_AI;
+	/* PCA9575 needs address-increment on multi-byte writes */
+	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
+		regaddr |= REG_ADDR_AI;
 
 	return i2c_smbus_write_i2c_block_data(chip->client, regaddr,
 					      NBANK(chip), val);
@@ -892,10 +889,7 @@ static int pca953x_probe(struct i2c_client *client,
 		chip->write_regs = pca953x_write_regs_24;
 		chip->read_regs = pca953x_read_regs_24;
 	} else {
-		if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
-			chip->write_regs = pca953x_write_regs_16;
-		else
-			chip->write_regs = pca957x_write_regs_16;
+		chip->write_regs = pca953x_write_regs_16;
 		chip->read_regs = pca953x_read_regs_16;
 	}
 
-- 
2.18.0

