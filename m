Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:55296 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbeGLJk2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jul 2018 05:40:28 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: rcar: Implement .get_direction() callback
Date: Thu, 12 Jul 2018 11:15:01 +0200
Message-Id: <20180712091501.22344-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Allow gpiolib to read back the current I/O direction configuration by
implementing the .get_direction() callback.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 4d2cc6d32184f390..ec04752b6bd25fb6 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -278,6 +278,13 @@ static void gpio_rcar_free(struct gpio_chip *chip, unsigned offset)
 	pm_runtime_put(&p->pdev->dev);
 }
 
+static int gpio_rcar_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
+
+	return !(gpio_rcar_read(p, INOUTSEL) & BIT(offset));
+}
+
 static int gpio_rcar_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	gpio_rcar_config_general_input_output_mode(chip, offset, false);
@@ -461,6 +468,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	gpio_chip = &p->gpio_chip;
 	gpio_chip->request = gpio_rcar_request;
 	gpio_chip->free = gpio_rcar_free;
+	gpio_chip->get_direction = gpio_rcar_get_direction;
 	gpio_chip->direction_input = gpio_rcar_direction_input;
 	gpio_chip->get = gpio_rcar_get;
 	gpio_chip->direction_output = gpio_rcar_direction_output;
-- 
2.17.1
