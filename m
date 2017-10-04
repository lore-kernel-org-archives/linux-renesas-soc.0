Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] irqchip/renesas-intc-irqpin: Use of_device_get_match_data() helper
Date: Wed,  4 Oct 2017 14:17:58 +0200
Message-Id: <1507119478-12641-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use the of_device_get_match_data() helper instead of open coding.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-renesas-intc-irqpin.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/irq-renesas-intc-irqpin.c
index 713177d97c7aa0b6..06f29cf5018a151f 100644
--- a/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
@@ -389,9 +389,8 @@ MODULE_DEVICE_TABLE(of, intc_irqpin_dt_ids);
 
 static int intc_irqpin_probe(struct platform_device *pdev)
 {
-	const struct intc_irqpin_config *config = NULL;
+	const struct intc_irqpin_config *config;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *of_id;
 	struct intc_irqpin_priv *p;
 	struct intc_irqpin_iomem *i;
 	struct resource *io[INTC_IRQPIN_REG_NR];
@@ -422,11 +421,9 @@ static int intc_irqpin_probe(struct platform_device *pdev)
 	p->pdev = pdev;
 	platform_set_drvdata(pdev, p);
 
-	of_id = of_match_device(intc_irqpin_dt_ids, dev);
-	if (of_id && of_id->data) {
-		config = of_id->data;
+	config = of_device_get_match_data(dev);
+	if (config)
 		p->needs_clk = config->needs_clk;
-	}
 
 	p->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(p->clk)) {
-- 
2.7.4
