Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52446 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751607AbdIEIID (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 04:08:03 -0400
From: Simon Horman <horms@verge.net.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 10/13] usb: host: ehci-platform: fix usb 1.1 device is not connected in system resume
Date: Tue,  5 Sep 2017 10:06:45 +0200
Message-Id: <1504598808-19810-11-git-send-email-horms@verge.net.au>
In-Reply-To: <1504598808-19810-1-git-send-email-horms@verge.net.au>
References: <1504598808-19810-1-git-send-email-horms@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

This patch fixes an issue that a usb 1.1 device is not connected in
system resume and then the following message appeared if debug messages
are enabled:
	usb 2-1: Waited 2000ms for CONNECT

To resolve this issue, the EHCI controller must be resumed after its
companion controllers. So, this patch adds such code on the driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
(cherry picked from commit d4d75128b8fd727d42c775a16b41634d09409dba)
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/usb/host/ehci-platform.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index a268d9e8d6cf..3214300396a0 100644
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
2.1.4
