Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:50808 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933341AbeFKL7M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jun 2018 07:59:12 -0400
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 06/14] mfd: da9063: Replace DA9063_NUM_IRQ with ARRAY_SIZE
Date: Mon, 11 Jun 2018 13:58:43 +0200
Message-Id: <20180611115851.1987-6-marek.vasut+renesas@gmail.com>
In-Reply-To: <20180611115851.1987-1-marek.vasut+renesas@gmail.com>
References: <20180611115851.1987-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Replace DA9063_NUM_IRQ macro which is not used anywhere with
plain ARRAY_SIZE().

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
V4: New patch
V5: Remove DA9063_IRQ_BASE_OFFSET
V6: No change
---
 drivers/mfd/da9063-irq.c        | 2 +-
 include/linux/mfd/da9063/core.h | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mfd/da9063-irq.c b/drivers/mfd/da9063-irq.c
index 044bd867f540..579947f83486 100644
--- a/drivers/mfd/da9063-irq.c
+++ b/drivers/mfd/da9063-irq.c
@@ -94,7 +94,7 @@ static const struct regmap_irq da9063_irqs[] = {
 static const struct regmap_irq_chip da9063_irq_chip = {
 	.name = "da9063-irq",
 	.irqs = da9063_irqs,
-	.num_irqs = DA9063_NUM_IRQ,
+	.num_irqs = ARRAY_SIZE(da9063_irqs),
 	.num_regs = 4,
 	.status_base = DA9063_REG_EVENT_A,
 	.mask_base = DA9063_REG_IRQ_MASK_A,
diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
index 8e6684d884e0..260cd5834861 100644
--- a/include/linux/mfd/da9063/core.h
+++ b/include/linux/mfd/da9063/core.h
@@ -72,9 +72,6 @@ enum da9063_irqs {
 	DA9063_IRQ_GPI15,
 };
 
-#define DA9063_IRQ_BASE_OFFSET	0
-#define DA9063_NUM_IRQ		(DA9063_IRQ_GPI15 + 1 - DA9063_IRQ_BASE_OFFSET)
-
 struct da9063 {
 	/* Device */
 	struct device	*dev;
-- 
2.16.2
