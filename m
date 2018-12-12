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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F293DC67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2DA52081B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahFdpLPO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2DA52081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbeLLBke (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:40:34 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46530 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbeLLBke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:40:34 -0500
Received: by mail-wr1-f65.google.com with SMTP id l9so15970607wrt.13;
        Tue, 11 Dec 2018 17:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PoFi/6xWt0t7twyJW3rX+5VrLthttOb8iXjJTwRe0ZM=;
        b=ahFdpLPOrZHYw1Zyxw8P+OTz+BMg+aIRpOdW0wDx/wPsAKbZgfsuAAqpukeU96883a
         7NyVJxElQ4eKdIHoFB8eivZRnAl8iPtYxKNRA3i+go8J0rIYigf+KbbMVhUU7bMO5jSa
         Oeu3Z0hoF+KOquh9x/Zitw7QcW74nFFOyq4w1iU4QWi8f0PmHP8uPW4KfzY1dWrEd6mj
         zGybhCIN14YPS8B25WyPna8MTtjobDTDff52eXEY9l1LC0edz7j+y01PiZTJLY8E9l1/
         bGO0dIB0xFN440oIcUDj4t5V9b5hfBVTwp2cSm45ueJ0tje2qDAKAEmCET+1A6FYwE7V
         d+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PoFi/6xWt0t7twyJW3rX+5VrLthttOb8iXjJTwRe0ZM=;
        b=K0qjUZqXaaXJo+zcm/zBktFClmkeWrOzwFpW2Yp+tq29wvrU+d35r41KGD1/7qkNvu
         7f8Muw+35fLuOygXyX+wB51t/GO0wp8AXI1eY1qkVoZvZwVkjI7J6cSkAwp7TSHGBgWi
         GY+edE4BV7/i/hls2DzLOlkEBf2vP7dqHY6UE4vXQyUWgpa5VGYTY5ZI4BCrRCqZhbcn
         PzEsjlK8zcMEA58oCXHY8GK7NSPnhfbYfKW6cTxTzLhzmvbL+EY41M93WDpIQdm16zNL
         0PeSVjAsgiHN5ZURujF+DQC45D+EiuFWan59BuO6T3CgMTQqyBJDxhNxPqtU4kzZZ156
         +sOA==
X-Gm-Message-State: AA+aEWYPCcEEJiN33MUQE/x1adPWDPr076qN5uXC1ADZBRu95mLjcO+2
        a1Q3XPL2DbCjZJhfQXvcqU31CQ9a
X-Google-Smtp-Source: AFSGD/V7hTRuWMkCXh9wRcVHk8RHq4Tsy2RoQOeZb9qTrxRdMKV9halWxofOrIjw8YQICI8LYPdhLg==
X-Received: by 2002:a5d:6710:: with SMTP id o16mr15834046wru.152.1544578831609;
        Tue, 11 Dec 2018 17:40:31 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c12sm12719214wrs.82.2018.12.11.17.40.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:40:30 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V2 04/14] gpio: pca953x: Unify pca95{3,7}x_write_regs_16()
Date:   Wed, 12 Dec 2018 02:39:52 +0100
Message-Id: <20181212014002.4753-4-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
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

