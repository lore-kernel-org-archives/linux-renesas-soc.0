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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44AEC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A0882080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeZmUe2w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730308AbeLOO0j (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:39 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39381 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730286AbeLOO0j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:39 -0500
Received: by mail-wr1-f65.google.com with SMTP id t27so8074260wra.6;
        Sat, 15 Dec 2018 06:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uwARdE3a74FgNX4NZBStgOHPfuJ92vwhVPRHZ9llASc=;
        b=HeZmUe2wFPSvnuJ7bS6UYZGifB0Y/Ll4sEoT9Fw4CXpPamgC8u55XOQjPqt2Vp0DT3
         m3sYId4UzsWNo7lDIR7277rgwRfDd4RcWuWWpe5rlt6ycssP+OLIREDdtVc/40Mkaaqh
         zIKnxe87h0xsKkFRdZyQkzQSz2qGDR6fx8wM5w6blUoMa7OlELr5gfn4tUfWhjjJ1hdQ
         v9lLLPn0UxdOsuMde6vFtzopS3IZ10UgdgGv0hA+eo1o5adiul5k+2aZ7z26fsdAeZUI
         Ar95/IjkUyGLv2FKi1zH1QFC2mdnW32XEWrBOP8Kv0NHB69yWRvimaTAAFGdbdPXdOGv
         H8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uwARdE3a74FgNX4NZBStgOHPfuJ92vwhVPRHZ9llASc=;
        b=NbfqHY/ZdG80P4sKMnRfNSl7D3H42jvR++bM6UBwiAaDIV7Zt8RAIkWrpfe940fUTX
         OEFQRfVjf8Kr0MdjVELj8VCpSm4ZdJqLZMc6CXU6n7s1zC+51nHq/E+jc6ff+M/njicn
         VijK9V59+BUGrFv3flwVJFbhScLxuaJFuCnKA6WZBM18kfi2xV+IfxJx3OjGcDWda3K7
         0v2IJ1XUQKXQb2WWTZ4fsTl6iyOzBc5Y/U3lI/PvsHQBIf81xSr/11up33ozusUFXZ1a
         +newmnnljjzbcE3IdlMmcamepg6LLbyvj/JrxEHSpSXfnYxp1xbwaUP6k0QG2g3rKF+J
         5jGg==
X-Gm-Message-State: AA+aEWaIchhOMUpzPBvHnoNXSHYLk7bfTqeze9iXWFWmOsNzg6quCk/O
        asoHEEXsaBaA6Ni2XF4wun56ryg8
X-Google-Smtp-Source: AFSGD/UOSwQRuXaqJ+H0KqSUgl3MSQBnKFc0EHLQwPdApKKGXdFTANNFy+S4FfVylZgS5tBzJIXhAA==
X-Received: by 2002:adf:80a9:: with SMTP id 38mr5206847wrl.137.1544883996572;
        Sat, 15 Dec 2018 06:26:36 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:35 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 08/14] gpio: pca953x: Zap ad-hoc I2C block write in multi GPIO set
Date:   Sat, 15 Dec 2018 15:25:59 +0100
Message-Id: <20181215142605.15397-9-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
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
V2: No change
V3: No change
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

