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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDFEC67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA1E82081B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:40:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llJRcM8E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA1E82081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbeLLBkl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:40:41 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44362 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbeLLBkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:40:41 -0500
Received: by mail-wr1-f65.google.com with SMTP id z5so15994766wrt.11;
        Tue, 11 Dec 2018 17:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DpWZb5WRsY4Q4jAkVb7pINizqUtxsA/DsJDqWLhxDcY=;
        b=llJRcM8Ej3271+MVzjMfMED57goFGaW243Ea8FM3aVbBlVz2QDpx2/7g9zQdqqjkhg
         1KqHbml6VdTEvaC0tJjBqSxrT+OD+mvbU40c+bKJmcNlitg1JwHliVUtKmnAnbOUU+bq
         t2lXb/L8PPhiKLDkrHeq2TdNueQPoFMSx8h+CpE6ZPVJInnOaKcGi/xzVeiLJp6NfRk+
         SO8Pax52oj5oNgW6ZUpZxn9bJCsLcmFcabAnKa9twaPx+n75Ut5sAHAkxYkR4Aisf/tg
         J93d3n5bMWvevWN8pt8Riqqfn93QQN1H0bYsuA+T+TBSxhSsYVrC7q+JF4MfAK7r6wEU
         foFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DpWZb5WRsY4Q4jAkVb7pINizqUtxsA/DsJDqWLhxDcY=;
        b=HJd5/tsoZtAX1iTlOCublSlq/vmMzJe4A1WxNZGLgboG21A9wOGgTZq9q7RVAwNDgI
         bG2H2WE651Q9EcZ/k6GMt3v35TKPeYMy8XxhdZrbtDOyndRfuh0mGinwzXi4IGh92yBY
         z0EDekXm+2oCbUGux87CwMHyxGBaRvqoQ6MSK0g7A12EgW0pUrpyuFuW1uMhWPq3oUsw
         sKh/GH2cTyUZbXYyV6+N87If36P2c+1DzbceaF4fkixQeYC9MTtFzaYid3IrtXV3UGef
         /uTgfVMw5Q5iL5Bq40SXqL3C3jpF+xxsdYuYOO827IG7q/DYd1gRS10iOsA3ekybhTLE
         TTsw==
X-Gm-Message-State: AA+aEWaeVel0vSXnb1mk7yjCNlLtS57ati6WZ8u7aZsvwfulzuNlbdGH
        oHY+v7xqeTFXdr/ih11TDs2E6Kqd
X-Google-Smtp-Source: AFSGD/XYsZo4cEJC6b4pTn5XPAoZtg4wPY06flrZ/Yuwoyo4ytsp2DX5e743o8U2BR+PLGxQ7SGknw==
X-Received: by 2002:a5d:4b42:: with SMTP id w2mr15643119wrs.156.1544578838660;
        Tue, 11 Dec 2018 17:40:38 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c12sm12719214wrs.82.2018.12.11.17.40.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:40:37 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V2 09/14] gpio: pca953x: Extract the register address mangling to single function
Date:   Wed, 12 Dec 2018 02:39:57 +0100
Message-Id: <20181212014002.4753-9-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
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

