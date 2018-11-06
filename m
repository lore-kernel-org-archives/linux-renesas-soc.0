Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:3220 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387804AbeKGEqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 23:46:09 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] gpio: rcar: Request GPIO while enabling interrupt
Date: Tue,  6 Nov 2018 19:19:09 +0000
Message-Id: <1541531949-23407-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

There are cases when the bootloader configures a pin to work
as a function rather than GPIO, and other cases when the pin
is configured as a function at POR.
This commit makes sure the pin is configured as a GPIO the
moment we need it to work as an interrupt.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v1->v2:
* Moved gpio_rcar_request call from gpio_rcar_irq_set_type to
  rcar_gpio_irq_request_resources
* Added rcar_gpio_irq_release_resources for calling gpio_rcar_free

Comments very welcome!

 drivers/gpio/gpio-rcar.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 3c82bb3..c16598b 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -344,6 +344,29 @@ static int gpio_rcar_direction_output(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
+static int rcar_gpio_irq_request_resources(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
+	unsigned int hwirq = irqd_to_hwirq(d);
+	int err;
+
+	gpio_rcar_direction_input(gc, hwirq);
+	err = gpio_rcar_request(gc, hwirq);
+	if (err)
+		dev_err(&p->pdev->dev, "Can't request GPIO %u from %s\n", hwirq,
+			gc->label);
+	return err;
+}
+
+static void rcar_gpio_irq_release_resources(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+
+	gpio_rcar_free(gc, hwirq);
+}
+
 struct gpio_rcar_info {
 	bool has_both_edge_trigger;
 };
@@ -491,6 +514,8 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	irq_chip->irq_set_type = gpio_rcar_irq_set_type;
 	irq_chip->irq_set_wake = gpio_rcar_irq_set_wake;
 	irq_chip->flags	= IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
+	irq_chip->irq_request_resources = rcar_gpio_irq_request_resources;
+	irq_chip->irq_release_resources = rcar_gpio_irq_release_resources;
 
 	ret = gpiochip_add_data(gpio_chip, p);
 	if (ret) {
-- 
2.7.4
