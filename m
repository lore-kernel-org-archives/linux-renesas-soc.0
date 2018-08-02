Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:28310 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732419AbeHBQIn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Aug 2018 12:08:43 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/5] gpio: rcar: Add GPIO hole support
Date: Thu,  2 Aug 2018 15:11:23 +0100
Message-Id: <1533219087-33695-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533219087-33695-1-git-send-email-biju.das@bp.renesas.com>
References: <1533219087-33695-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

GPIO hole is present in RZ/G1C SoC. Valid GPIO pins on bank3 are in the
range GP3_0 to GP3_16 and GP3_27 to GP3_29. The GPIO pins between GP3_17
to GP3_26 are unused. Add support for handling unused GPIO's.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
V1-->V2
    * Added gpio-reserved-ranges support for handling
      unused gpios.
---
 drivers/gpio/gpio-rcar.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 350390c..378c6e9 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -38,6 +38,7 @@ struct gpio_rcar_bank_info {
 	u32 edglevel;
 	u32 bothedge;
 	u32 intmsk;
+	u32 gpiomsk;
 };
 
 struct gpio_rcar_priv {
@@ -252,6 +253,9 @@ static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 	int error;
 
+	if (!gpiochip_line_is_valid(chip, offset))
+		return -EINVAL;
+
 	error = pm_runtime_get_sync(&p->pdev->dev);
 	if (error < 0)
 		return error;
@@ -313,6 +317,9 @@ static void gpio_rcar_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 	unsigned long flags;
 	u32 val, bankmask;
 
+	if (chip->valid_mask && (mask[0] & p->bank_info.gpiomsk))
+		return;
+
 	bankmask = mask[0] & GENMASK(chip->ngpio - 1, 0);
 	if (!bankmask)
 		return;
@@ -399,7 +406,8 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
 	struct device_node *np = p->pdev->dev.of_node;
 	const struct gpio_rcar_info *info;
 	struct of_phandle_args args;
-	int ret;
+	int ret, len, i;
+	u32 start, count;
 
 	info = of_device_get_match_data(&p->pdev->dev);
 
@@ -414,6 +422,22 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
 		*npins = RCAR_MAX_GPIO_PER_BANK;
 	}
 
+	p->bank_info.gpiomsk = 0;
+	len = of_property_count_u32_elems(np,  "gpio-reserved-ranges");
+	if (len < 0 || len % 2 != 0)
+		return 0;
+
+	for (i = 0; i < len; i += 2) {
+		of_property_read_u32_index(np, "gpio-reserved-ranges",
+					   i, &start);
+		of_property_read_u32_index(np, "gpio-reserved-ranges",
+					   i + 1, &count);
+		if (start >= *npins || start + count >= *npins)
+			continue;
+
+		p->bank_info.gpiomsk = GENMASK(start + count - 1, start);
+	}
+
 	return 0;
 }
 
@@ -471,6 +495,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	gpio_chip->owner = THIS_MODULE;
 	gpio_chip->base = -1;
 	gpio_chip->ngpio = npins;
+	gpio_chip->need_valid_mask = p->bank_info.gpiomsk ? true : false;
 
 	irq_chip = &p->irq_chip;
 	irq_chip->name = name;
@@ -551,6 +576,9 @@ static int gpio_rcar_resume(struct device *dev)
 
 	for (offset = 0; offset < p->gpio_chip.ngpio; offset++) {
 		mask = BIT(offset);
+		if (p->gpio_chip.valid_mask && (mask & p->bank_info.gpiomsk))
+			continue;
+
 		/* I/O pin */
 		if (!(p->bank_info.iointsel & mask)) {
 			if (p->bank_info.inoutsel & mask)
-- 
2.7.4
