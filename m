Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: kishon@ti.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/4] phy: rcar-gen3-usb2: check dr_mode for otg mode
Date: Thu, 31 Aug 2017 17:32:44 +0900
Message-Id: <1504168367-29464-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1504168367-29464-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1504168367-29464-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The previous code assumed a channel has otg capability if a channel
has interrupt property. But, it is not good because:
 - Battery charging feature also needs interrupt property.
 - Some R-Car Gen3 SoCs (e.g. R-Car D3) doesn't have OTG capability.

So, this patch checks whether usb 2.0 host node has dr_mode property or
not. If it has 'dr_mode = "otg";', this driver enables otg capability.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 54c3429..e00e99a 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -1,7 +1,7 @@
 /*
  * Renesas R-Car Gen3 for USB2.0 PHY driver
  *
- * Copyright (C) 2015 Renesas Electronics Corporation
+ * Copyright (C) 2015-2017 Renesas Electronics Corporation
  *
  * This is based on the phy-rcar-gen2 driver:
  * Copyright (C) 2014 Renesas Solutions Corp.
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/usb/of.h>
 #include <linux/workqueue.h>
 
 /******* USB2.0 Host registers (original offset is +0x200) *******/
@@ -415,13 +416,16 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	/* call request_irq for OTG */
 	irq = platform_get_irq(pdev, 0);
 	if (irq >= 0) {
-		int ret;
-
 		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
 		irq = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
 				       IRQF_SHARED, dev_name(dev), channel);
 		if (irq < 0)
 			dev_err(dev, "No irq handler (%d)\n", irq);
+	}
+
+	if (of_usb_get_dr_mode_by_phy(dev->of_node, 0) == USB_DR_MODE_OTG) {
+		int ret;
+
 		channel->has_otg = true;
 		channel->extcon = devm_extcon_dev_allocate(dev,
 							rcar_gen3_phy_cable);
-- 
1.9.1
