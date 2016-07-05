Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34253 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751762AbcGEOPd (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 10:15:33 -0400
Received: by mail-lf0-f49.google.com with SMTP id h129so135796219lfh.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2016 07:15:32 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH] gpio: be more careful when forcing IRQ line to input
Date: Tue,  5 Jul 2016 16:15:26 +0200
Message-Id: <1467728126-26131-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We need to convince the IRQ line to become input unless there
is a reason for. Also fixes up reference counting on the
errorpath.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Geert: does this solve the problem you saw in the RCAR
in "gpio: convince line to become input in irq helper"?
---
 drivers/gpio/gpiolib.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 69efe278f74d..e3e3cc19b8b0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1505,25 +1505,32 @@ static const struct irq_domain_ops gpiochip_domain_ops = {
 static int gpiochip_irq_reqres(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_desc *desc;
 
 	if (!try_module_get(chip->gpiodev->owner))
 		return -ENODEV;
 
+	/* Look up the corresponding descriptor */
+	desc = gpiochip_get_desc(chip, d->hwirq);
+	if (IS_ERR(desc)) {
+		module_put(chip->gpiodev->owner);
+		return PTR_ERR(desc);
+	}
+
 	/*
-	 * If it is possible to switch this GPIO to an input
-	 * this is a good time to do it.
+	 * If the pin is flagged as output and it is possible to
+	 * switch this GPIO to an input this is a good time to
+	 * do it.
 	 */
-	if (chip->direction_input) {
-		struct gpio_desc *desc;
+	if (test_bit(FLAG_IS_OUT, &desc->flags) &&
+	    chip->direction_input) {
 		int ret;
 
-		desc = gpiochip_get_desc(chip, d->hwirq);
-		if (IS_ERR(desc))
-			return PTR_ERR(desc);
-
 	        ret = chip->direction_input(chip, d->hwirq);
-		if (ret)
+		if (ret) {
+			module_put(chip->gpiodev->owner);
 			return ret;
+		}
 
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 	}
-- 
2.4.11
