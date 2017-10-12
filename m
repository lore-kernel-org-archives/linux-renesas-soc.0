Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:46095 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751496AbdJLVIX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 17:08:23 -0400
Received: by mail-lf0-f50.google.com with SMTP id g70so7364973lfl.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2017 14:08:23 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171012210818.806395567@cogentembedded.com>
Date: Fri, 13 Oct 2017 00:08:14 +0300
To: Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/1] gpio-rcar: use devm_ioremap_resource()
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=gpio-rcar-use-devm_ioremap_resource.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Using devm_ioremap_resource() has several advantages over devm_ioremap():
- it checks the passed resource's validity;
- it calls devm_request_mem_region() to check for the resource overlap;
- it prints an error message in case of error.

We can call devm_ioremap_resource() instead of devm_ioremap_nocache()
as ioremap() and ioremap_nocache()  are implemented identically on ARM.
Doing this saves 2 LoCs and 80 bytes (AArch64 gcc 4.8.5).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'devel' branch of Linus Walleij's 'linux-gpio.git'
repo.

 drivers/gpio/gpio-rcar.c |   14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

Index: linux-gpio/drivers/gpio/gpio-rcar.c
===================================================================
--- linux-gpio.orig/drivers/gpio/gpio-rcar.c
+++ linux-gpio/drivers/gpio/gpio-rcar.c
@@ -452,19 +452,17 @@ static int gpio_rcar_probe(struct platfo
 
 	pm_runtime_enable(dev);
 
-	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-
-	if (!io || !irq) {
-		dev_err(dev, "missing IRQ or IOMEM\n");
+	if (!irq) {
+		dev_err(dev, "missing IRQ\n");
 		ret = -EINVAL;
 		goto err0;
 	}
 
-	p->base = devm_ioremap_nocache(dev, io->start, resource_size(io));
-	if (!p->base) {
-		dev_err(dev, "failed to remap I/O memory\n");
-		ret = -ENXIO;
+	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	p->base = devm_ioremap_resource(dev, io);
+	if (IS_ERR(p->base)) {
+		ret = PTR_ERR(p->base);
 		goto err0;
 	}
 
