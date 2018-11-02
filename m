Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:12601 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728497AbeKCETM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Nov 2018 00:19:12 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] gpio: rcar: Request GPIO while enabling interrupt
Date: Fri,  2 Nov 2018 19:10:43 +0000
Message-Id: <1541185843-32732-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

There are cases when the bootloader configures a pin to work
as a function rather than GPIO, and other cases when the pin
is configured as a function at POR.
This commit makes sure the pin is configured as a GPIO the
moment we need it to work as an interrupt.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
RFC->PATCH:
* Moved gc->request to the bottom of gpio_rcar_irq_set_type

 drivers/gpio/gpio-rcar.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 3c82bb3..5b96ee3 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -147,6 +147,7 @@ static int gpio_rcar_irq_set_type(struct irq_data *d, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
 	unsigned int hwirq = irqd_to_hwirq(d);
+	int err;
 
 	dev_dbg(&p->pdev->dev, "sense irq = %d, type = %d\n", hwirq, type);
 
@@ -176,6 +177,13 @@ static int gpio_rcar_irq_set_type(struct irq_data *d, unsigned int type)
 	default:
 		return -EINVAL;
 	}
+
+	err = gc->request(gc, hwirq);
+	if (err) {
+		dev_err(&p->pdev->dev, "Can't request GPIO %d from %s\n", hwirq,
+			gc->label);
+		return err;
+	}
 	return 0;
 }
 
-- 
2.7.4
