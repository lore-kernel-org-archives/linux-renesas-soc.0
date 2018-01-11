Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:33971 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932361AbeAKI53 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 03:57:29 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC] usb: host: xhci-plat and rcar: reinitialize the xhci when the mode changes
Date: Thu, 11 Jan 2018 17:52:58 +0900
Message-Id: <1515660778-11043-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds extcon notifier to reinitialize the xhci when the mode
of R-Car USB 3.0 controller changes from peripheral to host. Otherwise,
the host controller cannot detect Super Speed after changed the mode
because the PORTSC.PLS for usb3.0 will be set to Disabled.

TODO in this RFC version:
 - Needs to avoid double usb_remove_hcd() calling by rmmod or unbind and
   the xhci_rcar_work().
 - Needs to divide this patch (this patch has many feature changes).

If this approach is acceptable for upstream, I'll improve the patch.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-plat.c | 21 +++++++++++++++++++++
 drivers/usb/host/xhci-plat.h | 13 +++++++++++++
 drivers/usb/host/xhci-rcar.c | 37 +++++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-rcar.h |  7 +++++++
 4 files changed, 78 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6f03830..231f4a4 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -10,6 +10,7 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
+#include <linux/extcon.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/of.h>
@@ -108,6 +109,7 @@ static int xhci_plat_start(struct usb_hcd *hcd)
 	.init_quirk = xhci_rcar_init_quirk,
 	.plat_start = xhci_rcar_start,
 	.resume_quirk = xhci_rcar_resume_quirk,
+	.notifier = xhci_rcar_notifier,
 };
 
 static const struct of_device_id usb_xhci_of_match[] = {
@@ -274,6 +276,25 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	device_property_read_u32(sysdev, "imod-interval-ns",
 				 &xhci->imod_interval);
 
+	if (of_property_read_bool(pdev->dev.of_node, "extcon")) {
+		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+
+		priv->edev = extcon_get_edev_by_phandle(&pdev->dev, 0);
+		if (IS_ERR(priv->edev)) {
+			ret = PTR_ERR(priv->edev);
+			goto put_usb3_hcd;
+		}
+		priv->nb.notifier_call = priv->notifier;
+		priv->hcd = hcd;
+		priv->shared_hcd = xhci->shared_hcd;
+		priv->irq = irq;
+		ret = devm_extcon_register_notifier(&pdev->dev, priv->edev,
+						    EXTCON_USB_HOST,
+						    &priv->nb);
+		if (ret < 0)
+			dev_err(&pdev->dev, "no notifier registered\n");
+	}
+
 	hcd->usb_phy = devm_usb_get_phy_by_phandle(sysdev, "usb-phy", 0);
 	if (IS_ERR(hcd->usb_phy)) {
 		ret = PTR_ERR(hcd->usb_phy);
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index ae29f22..6807809 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -8,13 +8,26 @@
 #ifndef _XHCI_PLAT_H
 #define _XHCI_PLAT_H
 
+#include <linux/extcon.h>
+#include <linux/usb/hcd.h>
+#include <linux/workqueue.h>
 #include "xhci.h"	/* for hcd_to_xhci() */
 
 struct xhci_plat_priv {
+	struct extcon_dev *edev;
+	struct notifier_block nb;
+	struct usb_hcd *hcd;		/* for rcar */
+	struct usb_hcd *shared_hcd;	/* for rcar */
+	int irq;			/* for rcar */
+	unsigned long event;		/* for rcar */
+	struct work_struct work;	/* for rcar */
+	bool halted_by_peri;		/* for rcar */
 	const char *firmware_name;
 	void (*plat_start)(struct usb_hcd *);
 	int (*init_quirk)(struct usb_hcd *);
 	int (*resume_quirk)(struct usb_hcd *);
+	int (*notifier)(struct notifier_block *nb, unsigned long event,
+			void *data);
 };
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index f0b5596..9cdb631 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/usb/phy.h>
 #include <linux/sys_soc.h>
+#include <linux/workqueue.h>
 
 #include "xhci.h"
 #include "xhci-plat.h"
@@ -242,3 +243,39 @@ int xhci_rcar_resume_quirk(struct usb_hcd *hcd)
 
 	return ret;
 }
+
+static void xhci_rcar_work(struct work_struct *work)
+{
+	struct xhci_plat_priv *priv = container_of(work, struct xhci_plat_priv,
+						   work);
+	struct usb_hcd *hcd = priv->hcd;
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	int irq = priv->irq;
+	int ret;
+
+	if (!priv->event) {
+		xhci->xhc_state |= XHCI_STATE_REMOVING;
+		usb_remove_hcd(xhci->shared_hcd);
+		usb_phy_shutdown(hcd->usb_phy);
+		usb_remove_hcd(hcd);
+		priv->halted_by_peri = true;
+	} else if (priv->halted_by_peri) {
+		ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
+		xhci->shared_hcd = priv->shared_hcd;
+		ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
+		priv->halted_by_peri = 0;
+	}
+}
+
+int xhci_rcar_notifier(struct notifier_block *nb, unsigned long event,
+		       void *data)
+{
+	struct xhci_plat_priv *priv = container_of(nb, struct xhci_plat_priv,
+						   nb);
+
+	priv->event = event;
+	INIT_WORK(&priv->work, xhci_rcar_work);
+	schedule_work(&priv->work);
+
+	return NOTIFY_OK;
+}
diff --git a/drivers/usb/host/xhci-rcar.h b/drivers/usb/host/xhci-rcar.h
index 804b6ab..3fbc69f 100644
--- a/drivers/usb/host/xhci-rcar.h
+++ b/drivers/usb/host/xhci-rcar.h
@@ -16,6 +16,8 @@
 void xhci_rcar_start(struct usb_hcd *hcd);
 int xhci_rcar_init_quirk(struct usb_hcd *hcd);
 int xhci_rcar_resume_quirk(struct usb_hcd *hcd);
+int xhci_rcar_notifier(struct notifier_block *nb, unsigned long event,
+		       void *data);
 #else
 static inline void xhci_rcar_start(struct usb_hcd *hcd)
 {
@@ -30,5 +32,10 @@ static inline int xhci_rcar_resume_quirk(struct usb_hcd *hcd)
 {
 	return 0;
 }
+static inline int xhci_rcar_notifier(struct notifier_block *nb,
+				     unsigned long event, void *data)
+{
+	return 0;
+}
 #endif
 #endif /* _XHCI_RCAR_H */
-- 
1.9.1
