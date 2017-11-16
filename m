Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36313 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932144AbdKPUSr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 15:18:47 -0500
Received: by mail-lf0-f67.google.com with SMTP id k66so280175lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Nov 2017 12:18:47 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171116201842.006310882@cogentembedded.com>
Date: Thu, 16 Nov 2017 23:18:32 +0300
To: Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] gpio: pca953x: fix vendor prefix for PCA9654
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=gpio-pca953x-fix-vendor-prefix-for-PCA9654.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Despite commit 55020c8056a8 ("of: Add vendor prefix for ON Semiconductor
Corp.") was made long ago, the latter commit 9f49f6dd0473 ("gpio: pca953x:
add onsemi,pca9654 id") made use of another, undocumented vendor prefix.
Since such prefix doesn't seem to be used in any device trees, I think we
can just fix the "compatible" string in the driver and the bindings and be
done with that...

Fixes: 9f49f6dd0473 ("gpio: pca953x: add onsemi,pca9654 id")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'fixes' branch of LinusW's 'linux-gpio.git' repo.

 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt |    2 +-
 drivers/gpio/gpio-pca953x.c                             |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Index: linux-gpio/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
===================================================================
--- linux-gpio.orig/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ linux-gpio/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -27,7 +27,7 @@ Required properties:
 	ti,tca6424
 	ti,tca9539
 	ti,tca9554
-	onsemi,pca9654
+	onnn,pca9654
 	exar,xra1202
 
 Optional properties:
Index: linux-gpio/drivers/gpio/gpio-pca953x.c
===================================================================
--- linux-gpio.orig/drivers/gpio/gpio-pca953x.c
+++ linux-gpio/drivers/gpio/gpio-pca953x.c
@@ -947,7 +947,7 @@ static const struct of_device_id pca953x
 	{ .compatible = "ti,tca6416", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "ti,tca6424", .data = OF_953X(24, PCA_INT), },
 
-	{ .compatible = "onsemi,pca9654", .data = OF_953X( 8, PCA_INT), },
+	{ .compatible = "onnn,pca9654", .data = OF_953X( 8, PCA_INT), },
 
 	{ .compatible = "exar,xra1202", .data = OF_953X( 8, 0), },
 	{ }
