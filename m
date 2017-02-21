Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:41626 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751623AbdBULBx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Feb 2017 06:01:53 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] usb: host: ehci-platform: fix usb 1.1 device is not connected in system resume
Date: Tue, 21 Feb 2017 19:59:48 +0900
Message-ID: <1487674788-12599-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1487674788-12599-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1487674788-12599-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that a usb 1.1 device is not connected in
system resume and then the following message appeared if debug messages
are enabled:
	usb 2-1: Waited 2000ms for CONNECT

To resolve this issue, the EHCI controller must be resumed after its
companion controllers. So, this patch adds such code on the driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/ehci-platform.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index a268d9e..3214300 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -34,6 +34,7 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/ehci_pdriver.h>
+#include <linux/usb/of.h>
 
 #include "ehci.h"
 
@@ -297,6 +298,7 @@ static int ehci_platform_probe(struct platform_device *dev)
 		goto err_power;
 
 	device_wakeup_enable(hcd->self.controller);
+	device_enable_async_suspend(hcd->self.controller);
 	platform_set_drvdata(dev, hcd);
 
 	return err;
@@ -370,6 +372,7 @@ static int ehci_platform_resume(struct device *dev)
 	struct usb_ehci_pdata *pdata = dev_get_platdata(dev);
 	struct platform_device *pdev = to_platform_device(dev);
 	struct ehci_platform_priv *priv = hcd_to_ehci_priv(hcd);
+	struct device *companion_dev;
 
 	if (pdata->power_on) {
 		int err = pdata->power_on(pdev);
@@ -377,6 +380,10 @@ static int ehci_platform_resume(struct device *dev)
 			return err;
 	}
 
+	companion_dev = usb_of_get_companion_dev(hcd->self.controller);
+	if (companion_dev)
+		device_pm_wait_for_dev(hcd->self.controller, companion_dev);
+
 	ehci_resume(hcd, priv->reset_on_resume);
 	return 0;
 }
-- 
1.9.1
