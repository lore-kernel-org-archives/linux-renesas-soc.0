Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:60780 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725965AbeJ0Ef6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 27 Oct 2018 00:35:58 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC] gpio: rcar: Request GPIO before enabling interrupt
Date: Fri, 26 Oct 2018 20:57:30 +0100
Message-Id: <1540583850-30825-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

There are cases when the bootloader configures a pin to work
as a function rather than GPIO, and other cases when the pin
is configured as a function at POR.
This commit makes sure the pin is configured as a GPIO the
moment we need it to work as an interrupt.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---

Dear All,

we have got some issues while trying to bring up the interrupt
line of the HDMI transmitter on the iwg23s, as GP2_29 is configured
as a function when the kernel starts, and therefore setting up the
interrupt from the driver won't have the desired effect.
This patch makes sure the pinctrl driver sets GP2[29] to GP-2-29
before enabling the interrupt, but it doesn't addresses the
"direction problem", as in the pin will be a GPIO after calling
gc->request, but the direction would be whatever was previously
configured. There could be the option of moving the additional
code added by this patch to the bottom of function
gpio_rcar_irq_set_type, but is that going to behave properly on
every SoC this driver is supporting?
Is configuring every gpio with direction input while probing
something that should be looked into to reduce concerns over
switching from function to GPIO?

Comments very welcome!

Thanks,
Fab

 drivers/gpio/gpio-rcar.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 3c82bb3..8c69431 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -147,6 +147,14 @@ static int gpio_rcar_irq_set_type(struct irq_data *d, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
 	unsigned int hwirq = irqd_to_hwirq(d);
+	int err;
+
+	err = gc->request(gc, hwirq);
+	if (err) {
+		dev_err(&p->pdev->dev, "Can't request GPIO %d from %s\n", hwirq,
+			gc->label);
+		return err;
+	}
 
 	dev_dbg(&p->pdev->dev, "sense irq = %d, type = %d\n", hwirq, type);
 
-- 
2.7.4
