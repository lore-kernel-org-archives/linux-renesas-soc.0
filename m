Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:52460 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752089AbeBIPRM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Feb 2018 10:17:12 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Baptiste Reynal <b.reynal@virtualopensystems.com>,
        Alex Williamson <alex.williamson@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexander Graf <agraf@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        kvm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        qemu-devel@nongnu.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 5/6] gpio: rcar: Add virtualization workarounds
Date: Fri,  9 Feb 2018 16:16:52 +0100
Message-Id: <1518189413-2761-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518189413-2761-1-git-send-email-geert+renesas@glider.be>
References: <1518189413-2761-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Allow to enable the driver if virtualization is enabled.

Handle the absence of clocks and interrupts, to support guests that
don't provide these yet.

Not-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be dropped once clocks and interrupts are supported on the guest.
---
 drivers/gpio/Kconfig     |  2 +-
 drivers/gpio/gpio-rcar.c | 28 ++++++++++++----------------
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d6a8e851ad13b8e6..50eeaa3bb0749b84 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -386,7 +386,7 @@ config GPIO_PXA
 
 config GPIO_RCAR
 	tristate "Renesas R-Car GPIO"
-	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on ARCH_RENESAS || VIRTIO_MMIO || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support GPIO on Renesas R-Car SoCs.
diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index e76de57dd617d7e2..bc205b7fbb30e892 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -442,22 +442,16 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 
 	p->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(p->clk)) {
-		if (p->needs_clk) {
-			dev_err(dev, "unable to get clock\n");
-			ret = PTR_ERR(p->clk);
-			goto err0;
-		}
+		if (p->needs_clk)
+			dev_warn(dev, "missing clock, ignoring\n");
 		p->clk = NULL;
 	}
 
 	pm_runtime_enable(dev);
 
 	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!irq) {
-		dev_err(dev, "missing IRQ\n");
-		ret = -EINVAL;
-		goto err0;
-	}
+	if (!irq)
+		dev_warn(dev, "missing IRQ, ignoring\n");
 
 	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	p->base = devm_ioremap_resource(dev, io);
@@ -502,12 +496,14 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 		goto err1;
 	}
 
-	p->irq_parent = irq->start;
-	if (devm_request_irq(dev, irq->start, gpio_rcar_irq_handler,
-			     IRQF_SHARED, name, p)) {
-		dev_err(dev, "failed to request IRQ\n");
-		ret = -ENOENT;
-		goto err1;
+	if (irq) {
+		p->irq_parent = irq->start;
+		if (devm_request_irq(dev, irq->start, gpio_rcar_irq_handler,
+				     IRQF_SHARED, name, p)) {
+			dev_err(dev, "failed to request IRQ\n");
+			ret = -ENOENT;
+			goto err1;
+		}
 	}
 
 	dev_info(dev, "driving %d GPIOs\n", npins);
-- 
2.7.4
