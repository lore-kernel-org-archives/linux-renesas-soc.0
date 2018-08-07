Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:3597 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725815AbeHGKQM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 06:16:12 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/5] gpio: rcar: Add GPIO hole support
Date: Tue,  7 Aug 2018 08:57:02 +0100
Message-Id: <1533628626-26503-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
References: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

GPIO hole is present in RZ/G1C SoC. Valid GPIO pins on bank3 are in the
range GP3_0 to GP3_16 and GP3_27 to GP3_29. The GPIO pins between GP3_17
to GP3_26 are unused. Add support for handling unused GPIO's.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
    * Added gpio-reserved-ranges support for handling
      unused gpios.
V2-->V3
    * Incorporated Geert's review comment.
---
 drivers/gpio/gpio-rcar.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 350390c..5e72b27 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -314,6 +314,9 @@ static void gpio_rcar_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 	u32 val, bankmask;
 
 	bankmask = mask[0] & GENMASK(chip->ngpio - 1, 0);
+	if (chip->valid_mask)
+		bankmask &= chip->valid_mask[0];
+
 	if (!bankmask)
 		return;
 
@@ -550,6 +553,9 @@ static int gpio_rcar_resume(struct device *dev)
 	u32 mask;
 
 	for (offset = 0; offset < p->gpio_chip.ngpio; offset++) {
+		if (!gpiochip_line_is_valid(&p->gpio_chip, offset))
+			continue;
+
 		mask = BIT(offset);
 		/* I/O pin */
 		if (!(p->bank_info.iointsel & mask)) {
-- 
2.7.4
