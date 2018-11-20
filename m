Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:28671 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725977AbeKUBtE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 20:49:04 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-gpio@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC v3 1/2] pinctrl: core: Add pinctrl_mux_gpio_request_enable
Date: Tue, 20 Nov 2018 15:19:15 +0000
Message-Id: <1542727156-31432-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1542727156-31432-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1542727156-31432-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sometimes there is the need to change the muxing of a pin to make it
a GPIO without going through gpiolib.
This patch adds pinctrl_mux_gpio_request_enable to deal with this new
use case from code that has nothing to do with pinctrl.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/pinctrl/core.c           | 34 ++++++++++++++++++++++++++++++++++
 include/linux/pinctrl/consumer.h |  6 ++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index c6ff4d5..d5f4128 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -26,6 +26,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinmux.h>
 
 #ifdef CONFIG_GPIOLIB
 #include <asm-generic/gpio.h>
@@ -796,6 +797,39 @@ int pinctrl_gpio_request(unsigned gpio)
 EXPORT_SYMBOL_GPL(pinctrl_gpio_request);
 
 /**
+ * pinctrl_mux_gpio_request_enable() - request the pinmuxing of a single pin to
+ * be set as a GPIO.
+ * @gpio: the GPIO pin number from the GPIO subsystem number space
+ */
+int pinctrl_mux_gpio_request_enable(unsigned gpio)
+{
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_gpio_range *range;
+	const struct pinmux_ops *ops;
+	int ret;
+	int pin;
+
+	ret = pinctrl_get_device_gpio_range(gpio, &pctldev, &range);
+	if (ret)
+		return ret;
+
+	ops = pctldev->desc->pmxops;
+
+	mutex_lock(&pctldev->mutex);
+
+	/* Convert to the pin controllers number space */
+	pin = gpio_to_pin(range, gpio);
+
+	if (ops->gpio_request_enable)
+		ret = ops->gpio_request_enable(pctldev, range, pin);
+
+	mutex_unlock(&pctldev->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pinctrl_mux_gpio_request_enable);
+
+/**
  * pinctrl_gpio_free() - free control on a single pin, currently used as GPIO
  * @gpio: the GPIO pin number from the GPIO subsystem number space
  *
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 0412cc9..3fa32cf 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -26,6 +26,7 @@ struct device;
 
 /* External interface to pin control */
 extern int pinctrl_gpio_request(unsigned gpio);
+extern int pinctrl_mux_gpio_request_enable(unsigned gpio);
 extern void pinctrl_gpio_free(unsigned gpio);
 extern int pinctrl_gpio_direction_input(unsigned gpio);
 extern int pinctrl_gpio_direction_output(unsigned gpio);
@@ -67,6 +68,11 @@ static inline int pinctrl_gpio_request(unsigned gpio)
 	return 0;
 }
 
+static inline int pinctrl_mux_gpio_request_enable(unsigned gpio)
+{
+	return 0;
+}
+
 static inline void pinctrl_gpio_free(unsigned gpio)
 {
 }
-- 
2.7.4
