Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:32252 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727360AbeHGJeP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 05:34:15 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org,
        Stephen Boyd <sboyd@codeaurora.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] gpiolib: Avoid calling chip->request() for unused gpios
Date: Tue,  7 Aug 2018 08:15:18 +0100
Message-Id: <1533626118-26583-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a check for unused gpios to avoid chip->request() call to client
driver for unused gpios.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/gpio/gpiolib.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 20fe531..1ffe17b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2261,6 +2261,7 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	struct gpio_chip	*chip = desc->gdev->chip;
 	int			status;
 	unsigned long		flags;
+	unsigned		offset;
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
@@ -2279,7 +2280,11 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	if (chip->request) {
 		/* chip->request may sleep */
 		spin_unlock_irqrestore(&gpio_lock, flags);
-		status = chip->request(chip, gpio_chip_hwgpio(desc));
+		offset = gpio_chip_hwgpio(desc);
+		if (gpiochip_line_is_valid(chip, offset))
+			status = chip->request(chip, offset);
+		else
+			status = -EINVAL;
 		spin_lock_irqsave(&gpio_lock, flags);
 
 		if (status < 0) {
-- 
2.7.4
