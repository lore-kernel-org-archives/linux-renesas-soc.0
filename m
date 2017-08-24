Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:60700 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752111AbdHXJVS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 05:21:18 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Haavard Skinnemoen <hskinnemoen@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/3] i2c: gpio: Add support for named gpios in DT
Date: Thu, 24 Aug 2017 11:21:13 +0200
Message-Id: <1503566474-5335-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1503566474-5335-1-git-send-email-geert+renesas@glider.be>
References: <1503566474-5335-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for the new DT bindings using named gpios, which are less
error-prone than unnamed gpios.  The latter are still supported as a
fallback.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/i2c-gpio.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index 0ef8fcc6ac3aca1e..45b7ec99dc210bbe 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -88,6 +88,15 @@ static int i2c_gpio_getscl(void *data)
 static int of_i2c_gpio_get_pins(struct device_node *np,
 				unsigned int *sda_pin, unsigned int *scl_pin)
 {
+	*sda_pin = of_get_named_gpio(np, "sda-gpios", 0);
+	*scl_pin = of_get_named_gpio(np, "scl-gpios", 0);
+	if (*sda_pin == -EPROBE_DEFER || *scl_pin == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	if (gpio_is_valid(*sda_pin) && gpio_is_valid(*scl_pin))
+		return 0;
+
+	/* Try deprecated unnamed gpios */
 	if (of_gpio_count(np) < 2)
 		return -ENODEV;
 
-- 
2.7.4
