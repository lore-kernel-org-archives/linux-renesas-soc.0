Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <kishon@ti.com>
CC: <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3] phy: rcar-gen3-usb2: fix implementation for runtime PM
Date: Tue, 14 Mar 2017 08:37:40 +0900
Message-ID: <1489448261-4477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that this driver doesn't take care of the runtime
PM. This code assumed that devm_phy_create() called pm_runtime_enable(dev),
but it misunderstood the dev_phy_create()'s specification.
This driver should call its own pm_runtime_enable() before dev_phy_create().

Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v2:
  - revise the commit log (s/pm_runtime_pm/pm_runtime_enable)

 Changes from v1:
  - revise the commit log (s/the own/its own/)
  - simplify return code in probe().

 drivers/phy/phy-rcar-gen3-usb2.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3-usb2.c
index afb4d04..54c3429 100644
--- a/drivers/phy/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/phy-rcar-gen3-usb2.c
@@ -20,6 +20,7 @@
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/workqueue.h>
 
@@ -395,7 +396,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	struct rcar_gen3_chan *channel;
 	struct phy_provider *provider;
 	struct resource *res;
-	int irq;
+	int irq, ret = 0;
 
 	if (!dev->of_node) {
 		dev_err(dev, "This driver needs device tree\n");
@@ -434,17 +435,24 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* devm_phy_create() will call pm_runtime_enable(dev); */
+	/*
+	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
+	 * And then, phy-core will manage runtime pm for this device.
+	 */
+	pm_runtime_enable(dev);
 	channel->phy = devm_phy_create(dev, NULL, &rcar_gen3_phy_usb2_ops);
 	if (IS_ERR(channel->phy)) {
 		dev_err(dev, "Failed to create USB2 PHY\n");
-		return PTR_ERR(channel->phy);
+		ret = PTR_ERR(channel->phy);
+		goto error;
 	}
 
 	channel->vbus = devm_regulator_get_optional(dev, "vbus");
 	if (IS_ERR(channel->vbus)) {
-		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER)
-			return PTR_ERR(channel->vbus);
+		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER) {
+			ret = PTR_ERR(channel->vbus);
+			goto error;
+		}
 		channel->vbus = NULL;
 	}
 
@@ -454,15 +462,22 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (IS_ERR(provider)) {
 		dev_err(dev, "Failed to register PHY provider\n");
+		ret = PTR_ERR(provider);
+		goto error;
 	} else if (channel->has_otg) {
 		int ret;
 
 		ret = device_create_file(dev, &dev_attr_role);
 		if (ret < 0)
-			return ret;
+			goto error;
 	}
 
-	return PTR_ERR_OR_ZERO(provider);
+	return 0;
+
+error:
+	pm_runtime_disable(dev);
+
+	return ret;
 }
 
 static int rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
@@ -472,6 +487,8 @@ static int rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 	if (channel->has_otg)
 		device_remove_file(&pdev->dev, &dev_attr_role);
 
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 };
 
-- 
1.9.1
