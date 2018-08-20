Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:38165 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725926AbeHTGZt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 02:25:49 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: Change usb_of_get_companion_dev() place to usb/common
Date: Mon, 20 Aug 2018 12:10:26 +0900
Message-Id: <1534734626-16767-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since renesas_usb3 udc driver calls usb_of_get_companion_dev()
which is on usb/core/of.c, build error like below happens if we
disable CONFIG_USB because the usb/core/ needs CONFIG_USB:

ERROR: "usb_of_get_companion_dev" [drivers/usb/gadget/udc/renesas_usb3.ko] undefined!

According to the usb/gadget/Kconfig, "NOTE:  Gadget support
** DOES NOT ** depend on host-side CONFIG_USB !!".
So, to fix the issue, this patch changes the usb_of_get_companion_dev()
place from usb/core/of.c to usb/common/common.c to be called by both
host and gadget.

Reported-by: John Garry <john.garry@huawei.com>
Fixes: 39facfa01c9f ("usb: gadget: udc: renesas_usb3: Add register of usb role switch")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/common/common.c | 25 +++++++++++++++++++++++++
 drivers/usb/core/of.c       | 26 --------------------------
 2 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 50a2362ed..48277bb 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -246,6 +246,31 @@ int of_usb_update_otg_caps(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(of_usb_update_otg_caps);
 
+/**
+ * usb_of_get_companion_dev - Find the companion device
+ * @dev: the device pointer to find a companion
+ *
+ * Find the companion device from platform bus.
+ *
+ * Takes a reference to the returned struct device which needs to be dropped
+ * after use.
+ *
+ * Return: On success, a pointer to the companion device, %NULL on failure.
+ */
+struct device *usb_of_get_companion_dev(struct device *dev)
+{
+	struct device_node *node;
+	struct platform_device *pdev = NULL;
+
+	node = of_parse_phandle(dev->of_node, "companion", 0);
+	if (node)
+		pdev = of_find_device_by_node(node);
+
+	of_node_put(node);
+
+	return pdev ? &pdev->dev : NULL;
+}
+EXPORT_SYMBOL_GPL(usb_of_get_companion_dev);
 #endif
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
index fd77442..651708d 100644
--- a/drivers/usb/core/of.c
+++ b/drivers/usb/core/of.c
@@ -105,29 +105,3 @@ struct device_node *
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(usb_of_get_interface_node);
-
-/**
- * usb_of_get_companion_dev - Find the companion device
- * @dev: the device pointer to find a companion
- *
- * Find the companion device from platform bus.
- *
- * Takes a reference to the returned struct device which needs to be dropped
- * after use.
- *
- * Return: On success, a pointer to the companion device, %NULL on failure.
- */
-struct device *usb_of_get_companion_dev(struct device *dev)
-{
-	struct device_node *node;
-	struct platform_device *pdev = NULL;
-
-	node = of_parse_phandle(dev->of_node, "companion", 0);
-	if (node)
-		pdev = of_find_device_by_node(node);
-
-	of_node_put(node);
-
-	return pdev ? &pdev->dev : NULL;
-}
-EXPORT_SYMBOL_GPL(usb_of_get_companion_dev);
-- 
1.9.1
