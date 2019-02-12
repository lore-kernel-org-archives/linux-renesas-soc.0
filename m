Return-Path: <SRS0=s4Ke=QT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE26C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 14:17:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8D7F218E0
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 14:17:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730205AbfBLORS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Feb 2019 09:17:18 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:58130 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730179AbfBLORS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Feb 2019 09:17:18 -0500
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id bqHG1z00c3XaVaC01qHGjt; Tue, 12 Feb 2019 15:17:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gtYs8-0005e9-FJ; Tue, 12 Feb 2019 15:17:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gtYs8-00012h-D1; Tue, 12 Feb 2019 15:17:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: pca953x: Add wake-up support
Date:   Tue, 12 Feb 2019 15:17:15 +0100
Message-Id: <20190212141715.3966-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Implement the irq_set_wake() method in the (optional) irq_chip of the
GPIO expander, and propagate wake-up settings to the upstream interrupt
controller.  This allows GPIOs connected to a PCA953X GPIO expander to
serve as wake-up sources.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested with a PCA9654 and gpio-keys on an R-Car Ebisu-4D board.
---
 drivers/gpio/gpio-pca953x.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index de52f63863dbe59b..8dfb8e326b9d12ca 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -151,6 +151,7 @@ struct pca953x_chip {
 	u8 irq_trig_raise[MAX_BANK];
 	u8 irq_trig_fall[MAX_BANK];
 	struct irq_chip irq_chip;
+	unsigned int irq_parent;
 #endif
 
 	struct i2c_client *client;
@@ -513,6 +514,24 @@ static void pca953x_irq_unmask(struct irq_data *d)
 	chip->irq_mask[d->hwirq / BANK_SZ] |= 1 << (d->hwirq % BANK_SZ);
 }
 
+static int pca953x_irq_set_wake(struct irq_data *d, unsigned int on)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	int error = 0;
+
+	if (chip->irq_parent) {
+		error = irq_set_irq_wake(chip->irq_parent, on);
+		if (error) {
+			dev_dbg(&chip->client->dev,
+				"irq %u doesn't support irq_set_wake\n",
+				chip->irq_parent);
+			chip->irq_parent = 0;
+		}
+	}
+	return error;
+}
+
 static void pca953x_irq_bus_lock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -732,6 +751,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 	irq_chip->name = dev_name(&chip->client->dev);
 	irq_chip->irq_mask = pca953x_irq_mask;
 	irq_chip->irq_unmask = pca953x_irq_unmask;
+	irq_chip->irq_set_wake = pca953x_irq_set_wake;
 	irq_chip->irq_bus_lock = pca953x_irq_bus_lock;
 	irq_chip->irq_bus_sync_unlock = pca953x_irq_bus_sync_unlock;
 	irq_chip->irq_set_type = pca953x_irq_set_type;
@@ -747,6 +767,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 	}
 
 	gpiochip_set_nested_irqchip(&chip->gpio_chip, irq_chip, client->irq);
+	chip->irq_parent = client->irq;
 
 	return 0;
 }
-- 
2.17.1

