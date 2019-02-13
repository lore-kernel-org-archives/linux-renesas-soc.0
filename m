Return-Path: <SRS0=YTPq=QU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51619C282C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 13:15:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BA1F222B1
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 13:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390048AbfBMNPI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Feb 2019 08:15:08 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:41194 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389633AbfBMNPI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Feb 2019 08:15:08 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id cDF61z00H3XaVaC01DF6n4; Wed, 13 Feb 2019 14:15:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gtuNW-0003yB-BW; Wed, 13 Feb 2019 14:15:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gtuNW-0006zb-9j; Wed, 13 Feb 2019 14:15:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] gpio: pca953x: Add wake-up support
Date:   Wed, 13 Feb 2019 14:15:03 +0100
Message-Id: <20190213131503.26801-1-geert+renesas@glider.be>
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

v2:
  - Just propagate irq_set_irq_wake().  As pca953x_irq_set_wake()
    doesn't need to do anything else, there's no reason for making it
    conditional.
---
 drivers/gpio/gpio-pca953x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index de52f63863dbe59b..86c00a3980c47c3b 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -513,6 +513,14 @@ static void pca953x_irq_unmask(struct irq_data *d)
 	chip->irq_mask[d->hwirq / BANK_SZ] |= 1 << (d->hwirq % BANK_SZ);
 }
 
+static int pca953x_irq_set_wake(struct irq_data *d, unsigned int on)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
+
+	return irq_set_irq_wake(chip->client->irq, on);
+}
+
 static void pca953x_irq_bus_lock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -732,6 +740,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 	irq_chip->name = dev_name(&chip->client->dev);
 	irq_chip->irq_mask = pca953x_irq_mask;
 	irq_chip->irq_unmask = pca953x_irq_unmask;
+	irq_chip->irq_set_wake = pca953x_irq_set_wake;
 	irq_chip->irq_bus_lock = pca953x_irq_bus_lock;
 	irq_chip->irq_bus_sync_unlock = pca953x_irq_bus_sync_unlock;
 	irq_chip->irq_set_type = pca953x_irq_set_type;
-- 
2.17.1

