Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: rcar: Implement gpiochip.set_multiple()
Date: Mon, 14 Mar 2016 16:21:44 +0100
Message-Id: <1457968904-22899-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This allows to set multiple outputs using a single register write.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index d9ab0cd1d2059635..3fe8e773d95c3b62 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -336,6 +336,25 @@ static void gpio_rcar_set(struct gpio_chip *chip, unsigned offset, int value)
 	spin_unlock_irqrestore(&p->lock, flags);
 }
 
+static void gpio_rcar_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				   unsigned long *bits)
+{
+	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
+	unsigned long flags;
+	u32 val, bankmask;
+
+	bankmask = mask[0] & GENMASK(chip->ngpio - 1, 0);
+	if (!bankmask)
+		return;
+
+	spin_lock_irqsave(&p->lock, flags);
+	val = gpio_rcar_read(p, OUTDT);
+	val &= ~bankmask;
+	val |= (bankmask & bits[0]);
+	gpio_rcar_write(p, OUTDT, val);
+	spin_unlock_irqrestore(&p->lock, flags);
+}
+
 static int gpio_rcar_direction_output(struct gpio_chip *chip, unsigned offset,
 				      int value)
 {
@@ -476,6 +495,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	gpio_chip->get = gpio_rcar_get;
 	gpio_chip->direction_output = gpio_rcar_direction_output;
 	gpio_chip->set = gpio_rcar_set;
+	gpio_chip->set_multiple = gpio_rcar_set_multiple;
 	gpio_chip->label = name;
 	gpio_chip->parent = dev;
 	gpio_chip->owner = THIS_MODULE;
-- 
1.9.1
