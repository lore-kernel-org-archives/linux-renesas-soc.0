Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:51778 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387712AbeGKQie (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 12:38:34 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] gpiolib: use better errno if get_direction is not available
Date: Wed, 11 Jul 2018 18:33:19 +0200
Message-Id: <20180711163319.28004-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

EINVAL is very generic, use ENOTSUPP in case the gpiochip does not
provide this function. While removing the assignment from the 'status'
variable, use better indentation in the declaration block.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I got puzzled by the EINVAL until I found out that gpio-rcar simply does not
implement it.

@Geert: any reason gpio-rcar is missing it? I would need it for the
i2c-gpio-fault-injector.

 drivers/gpio/gpiolib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e11a3bb03820..18719f64e80b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -210,15 +210,15 @@ static int gpiochip_find_base(int ngpio)
  */
 int gpiod_get_direction(struct gpio_desc *desc)
 {
-	struct gpio_chip	*chip;
-	unsigned		offset;
-	int			status = -EINVAL;
+	struct gpio_chip *chip;
+	unsigned offset;
+	int status;
 
 	chip = gpiod_to_chip(desc);
 	offset = gpio_chip_hwgpio(desc);
 
 	if (!chip->get_direction)
-		return status;
+		return -ENOTSUPP;
 
 	status = chip->get_direction(chip, offset);
 	if (status > 0) {
-- 
2.11.0
