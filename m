Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:1228 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726855AbeHFMCQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 08:02:16 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] gpiolib: Fix of_node inconsistency
Date: Mon,  6 Aug 2018 10:48:01 +0100
Message-Id: <1533548881-35174-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Some platforms are not setting of_node in the driver. On these platforms
defining gpio-reserved-ranges on device tree leads to kernel crash.

It is due to some parts of the gpio core relying on the driver to set up
of_node,while other parts do themselves.This inconsistent behaviour leads 
to a crash.

gpiochip_add_data_with_key() calls gpiochip_init_valid_mask() with of_node
as NULL. of_gpiochip_add() fills "of_node" and calls 
of_gpiochip_init_valid_mask().

The fix is to move the assignment to chip->of_node from of_gpiochip_add()
to gpiochip_add_data_with_key().

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/gpio/gpiolib-of.c | 3 ---
 drivers/gpio/gpiolib.c    | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 28d9680..91174bf 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -620,9 +620,6 @@ int of_gpiochip_add(struct gpio_chip *chip)
 {
 	int status;
 
-	if ((!chip->of_node) && (chip->parent))
-		chip->of_node = chip->parent->of_node;
-
 	if (!chip->of_node)
 		return 0;
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e11a3bb..20fe531 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1256,6 +1256,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	/* If the gpiochip has an assigned OF node this takes precedence */
 	if (chip->of_node)
 		gdev->dev.of_node = chip->of_node;
+	else
+		chip->of_node = gdev->dev.of_node;
 #endif
 
 	gdev->id = ida_simple_get(&gpio_ida, 0, 0, GFP_KERNEL);
-- 
2.7.4
