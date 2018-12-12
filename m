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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0E1C67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D68222081B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wekuk2+l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D68222081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbeLLBkj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:40:39 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46537 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbeLLBkj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:40:39 -0500
Received: by mail-wr1-f68.google.com with SMTP id l9so15970720wrt.13;
        Tue, 11 Dec 2018 17:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qQls99DGa2P09dzhm2GX4qgbvkumagW/IWb4YMXEQx8=;
        b=Wekuk2+l4jrAfgZ4J5Bp83hPuY9MXavtxE5wZ0S9CIwzn+TSwENV1qfzu/hR7kPeof
         pnIZ3oN2YEIHtG1vkmU0PLoqzhSlB+50jJYquJdtFLF7pO05U7YPQeAb2FhyURxLMI51
         +X9op0ZSAV2rCLAht0pen2ZV2yk6HwC0f2AkL8ek8XmxqYloGjwohSPV+L3O+rAdJdbo
         trga0bBddjN9pW5A52akiyJ4LhtRGwpoST+yuGiN4+bGCzeni9s4+ov6T5ns4wF1UUoR
         A59DeROraEZPyoIGKFqsIWE+kVXIJrWJ+/b2gTunUhZ8VfiQL4oZGpYk+3Z4dETmEJpj
         gQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qQls99DGa2P09dzhm2GX4qgbvkumagW/IWb4YMXEQx8=;
        b=NUD2xnrBkFpu1dNPu9oDwfBVy3t3UZXG0/KK51wHv2LdJoacFBZ/4hKQqefm7uRD/N
         RNooONp+8nW+tKpt+zqRbW/WUr69dMi/98jZwyprCRqdz9Zyr2jccuPzk493K/CokVhZ
         zsUAIHHgV/cdScrsxJfKvPjDEB8d3aGeyQb1797sR0VsRmu2ccmkTBOIK+2RRfvMGTpH
         LQgXBHDmy5BlnkydaeZa7dA+BItdzHOPlztLR7OLUOXcGdjGbGpwZmEJDmZVw+7eGO0R
         22+p4j5qo9YzH902rSGMSNkcckMK/mRG7gBaFMXf8tTiHZraHnRKcYsXWiEflT3fMTKi
         KpNQ==
X-Gm-Message-State: AA+aEWYis5pp2h8wWiGUCvB2X/8IUPpPRQheCmykhM7W9t8pUHvQBgFU
        hubW1En20c6HAplD9XiVuvUNOgn0
X-Google-Smtp-Source: AFSGD/WH7TjweDqtSemuGHrQlbHBxnJHdOeKu1B1wI6M5GbYrip1Zs9bsnc36G1Kk4d7tLku0aETVg==
X-Received: by 2002:adf:a78a:: with SMTP id j10mr15841849wrc.191.1544578837146;
        Tue, 11 Dec 2018 17:40:37 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c12sm12719214wrs.82.2018.12.11.17.40.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:40:35 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V2 08/14] gpio: pca953x: Zap ad-hoc I2C block write in multi GPIO set
Date:   Wed, 12 Dec 2018 02:39:56 +0100
Message-Id: <20181212014002.4753-8-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The ad-hoc i2c block write can be replaced by standard register accessor
function, which correctly handles all the chip details and differences.
Do so to simplify the code.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d4b8946ea710..cbc3b82b9385 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -364,8 +364,6 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 				      unsigned long *mask, unsigned long *bits)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	int bank_shift = pca953x_bank_shift(chip);
-	u32 regaddr = chip->regs->output << bank_shift;
 	unsigned int bank_mask, bank_val;
 	int bank;
 	u8 reg_val[MAX_BANK];
@@ -384,14 +382,7 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 		}
 	}
 
-	/* PCA9575 needs address-increment on multi-byte writes */
-	if ((PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) &&
-	    (NBANK(chip) > 1)) {
-		regaddr |= REG_ADDR_AI;
-	}
-
-	ret = i2c_smbus_write_i2c_block_data(chip->client, regaddr,
-					     NBANK(chip), reg_val);
+	ret = pca953x_write_regs(chip, chip->regs->output, reg_val);
 	if (ret)
 		goto exit;
 
-- 
2.18.0

