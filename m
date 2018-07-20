Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:52158 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731803AbeGTNPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 09:15:55 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tejun Heo <tj@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ata: sata_rcar: Add rudimentary Runtime PM support
Date: Fri, 20 Jul 2018 14:27:39 +0200
Message-Id: <20180720122739.30056-3-geert+renesas@glider.be>
In-Reply-To: <20180720122739.30056-1-geert+renesas@glider.be>
References: <20180720122739.30056-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Replace the explicit clock handling to enable/disable the SATA module by
calls to Runtime PM.

This makes the driver independent of actual SoC clock/power hierarchies,
and is needed to support virtualization, where the guest is not in full
control of power management.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/ata/sata_rcar.c | 40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index f972c2c5ebd34aff..3b8ed10bfb8f2861 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -17,7 +17,7 @@
 #include <linux/libata.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <linux/clk.h>
+#include <linux/pm_runtime.h>
 #include <linux/err.h>
 
 #define DRV_NAME "sata_rcar"
@@ -152,7 +152,6 @@ enum sata_rcar_type {
 
 struct sata_rcar_priv {
 	void __iomem *base;
-	struct clk *clk;
 	enum sata_rcar_type type;
 };
 
@@ -897,21 +896,17 @@ static int sata_rcar_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->type = (enum sata_rcar_type)of_device_get_match_data(dev);
-	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get access to sata clock\n");
-		return PTR_ERR(priv->clk);
-	}
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret)
-		return ret;
+	pm_runtime_enable(dev);
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		goto err_pm_disable;
 
 	host = ata_host_alloc(dev, 1);
 	if (!host) {
 		dev_err(dev, "ata_host_alloc failed\n");
 		ret = -ENOMEM;
-		goto cleanup;
+		goto err_pm_put;
 	}
 
 	host->private_data = priv;
@@ -920,7 +915,7 @@ static int sata_rcar_probe(struct platform_device *pdev)
 	priv->base = devm_ioremap_resource(dev, mem);
 	if (IS_ERR(priv->base)) {
 		ret = PTR_ERR(priv->base);
-		goto cleanup;
+		goto err_pm_put;
 	}
 
 	/* setup port */
@@ -934,9 +929,10 @@ static int sata_rcar_probe(struct platform_device *pdev)
 	if (!ret)
 		return 0;
 
-cleanup:
-	clk_disable_unprepare(priv->clk);
-
+err_pm_put:
+	pm_runtime_put(dev);
+err_pm_disable:
+	pm_runtime_disable(dev);
 	return ret;
 }
 
@@ -954,7 +950,8 @@ static int sata_rcar_remove(struct platform_device *pdev)
 	iowrite32(0, base + SATAINTSTAT_REG);
 	iowrite32(0x7ff, base + SATAINTMASK_REG);
 
-	clk_disable_unprepare(priv->clk);
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	return 0;
 }
@@ -974,7 +971,7 @@ static int sata_rcar_suspend(struct device *dev)
 		/* mask */
 		iowrite32(0x7ff, base + SATAINTMASK_REG);
 
-		clk_disable_unprepare(priv->clk);
+		pm_runtime_put(dev);
 	}
 
 	return ret;
@@ -987,8 +984,8 @@ static int sata_rcar_resume(struct device *dev)
 	void __iomem *base = priv->base;
 	int ret;
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret)
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
 		return ret;
 
 	if (priv->type == RCAR_GEN3_SATA) {
@@ -1012,11 +1009,10 @@ static int sata_rcar_resume(struct device *dev)
 static int sata_rcar_restore(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
-	struct sata_rcar_priv *priv = host->private_data;
 	int ret;
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret)
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
 		return ret;
 
 	sata_rcar_setup_port(host);
-- 
2.17.1
