Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38442 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbeLBTgR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Dec 2018 14:36:17 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 02/14] gpio: pca953x: Fix AI overflow on PCAL6524
Date: Sun,  2 Dec 2018 20:35:41 +0100
Message-Id: <20181202193553.29704-2-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The PCAL_PINCTRL_MASK is too large. The extended register block on
PCAL6524, which is the largest chip with this block, has the block
limited to address range 0x40..0x7f. This is because the bit 7 in
the command register is used for the Address Increment functionality.

Trim the mask to 0x60 to match the datasheet and to prevent accidental
overwrite of the AI bit.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 31e3b1b52330..4e9c79ca69c5 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -58,7 +58,7 @@
 #define PCA_GPIO_MASK		0x00FF
 
 #define PCAL_GPIO_MASK		0x1f
-#define PCAL_PINCTRL_MASK	0xe0
+#define PCAL_PINCTRL_MASK	0x60
 
 #define PCA_INT			0x0100
 #define PCA_PCAL		0x0200
-- 
2.18.0
