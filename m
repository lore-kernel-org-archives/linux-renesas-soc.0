Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:35480 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932779AbeFPM4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Jun 2018 08:56:55 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] i2c: gpio: initialize SCL to HIGH again
Date: Sat, 16 Jun 2018 21:56:36 +0900
Message-Id: <20180616125636.4210-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

It seems that during the conversion from gpio* to gpiod*, the initial
state of SCL was wrongly switched to LOW. Fix it to be HIGH again.

Fixes: 7bb75029ef34 ("i2c: gpio: Enforce open drain through gpiolib")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Linus: Or was it intentional? But then I am missing something... I found this
by trying to fix a regression. I can't scope my use case now because I am on
the road. I recall SCL being unexpectedly LOW when using the GPIO fault
injector the last time, though. This made me do a fix in the underlying
i2c-algo-bit algorithm, but that sadly caused a regression :( So, this may be
the proper fix. RFC for now, until I have my scope back. But discussion is
welcome.

 drivers/i2c/busses/i2c-gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index 005e6e0330c2..66f85bbf3591 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -279,9 +279,9 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	 * required for an I2C bus.
 	 */
 	if (pdata->scl_is_open_drain)
-		gflags = GPIOD_OUT_LOW;
+		gflags = GPIOD_OUT_HIGH;
 	else
-		gflags = GPIOD_OUT_LOW_OPEN_DRAIN;
+		gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
 	priv->scl = i2c_gpio_get_desc(dev, "scl", 1, gflags);
 	if (IS_ERR(priv->scl))
 		return PTR_ERR(priv->scl);
-- 
2.11.0
