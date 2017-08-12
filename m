Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:32882 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752018AbdHLGJg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Aug 2017 02:09:36 -0400
From: Bhumika Goyal <bhumirks@gmail.com>
To: julia.lawall@lip6.fr, linus.walleij@linaro.org,
        marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        tony@atomide.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-omap@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH 2/2] gpio: make regmap_irq_chip const
Date: Sat, 12 Aug 2017 11:39:09 +0530
Message-Id: <1502518149-11663-3-git-send-email-bhumirks@gmail.com>
In-Reply-To: <1502518149-11663-1-git-send-email-bhumirks@gmail.com>
References: <1502518149-11663-1-git-send-email-bhumirks@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Make the structure const as it is only passed to the function
devm_regmap_add_irq_chip having the corresponding argument as const.
Done using Coccinelle.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 743459d..538bce4 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -82,7 +82,7 @@ struct max77620_gpio {
 	},
 };
 
-static struct regmap_irq_chip max77620_gpio_irq_chip = {
+static const struct regmap_irq_chip max77620_gpio_irq_chip = {
 	.name = "max77620-gpio",
 	.irqs = max77620_gpio_irqs,
 	.num_irqs = ARRAY_SIZE(max77620_gpio_irqs),
-- 
1.9.1
