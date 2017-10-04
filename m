Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:46500 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751947AbdJDMZI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 08:25:08 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] usb: host: xhci-plat: Use of_device_get_match_data() helper
Date: Wed,  4 Oct 2017 14:25:03 +0200
Message-Id: <1507119903-13148-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use the of_device_get_match_data() helper instead of open coding.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/host/xhci-plat.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 163bafde709f79bf..a1b42348e0c8c6c8 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/usb/phy.h>
 #include <linux/slab.h>
@@ -152,7 +153,7 @@ MODULE_DEVICE_TABLE(of, usb_xhci_of_match);
 
 static int xhci_plat_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
+	const struct xhci_plat_priv *priv_match;
 	const struct hc_driver	*driver;
 	struct device		*sysdev;
 	struct xhci_hcd		*xhci;
@@ -238,9 +239,8 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	}
 
 	xhci = hcd_to_xhci(hcd);
-	match = of_match_node(usb_xhci_of_match, pdev->dev.of_node);
-	if (match) {
-		const struct xhci_plat_priv *priv_match = match->data;
+	priv_match = of_device_get_match_data(&pdev->dev);
+	if (priv_match) {
 		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 
 		/* Just copy data for now */
-- 
2.7.4
