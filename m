Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:59416 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751037AbdCQK3A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 06:29:00 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] usb: host: xhci-plat: enable clk in resume timing
Date: Fri, 17 Mar 2017 19:02:33 +0900
Message-ID: <1489744955-29553-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1489744955-29553-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1489744955-29553-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch enables the clk in resume timing when device_may_wakeup()
is false. Otherwise, kernel panic happens when R-Car resumes the system
from Suspend-to-RAM because the clk is disabled.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-plat.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index bd02a6c..3528de3 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -306,6 +306,7 @@ static int xhci_plat_suspend(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+	int ret;
 
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
@@ -315,7 +316,12 @@ static int xhci_plat_suspend(struct device *dev)
 	 * reconsider this when xhci_plat_suspend enlarges its scope, e.g.,
 	 * also applies to runtime suspend.
 	 */
-	return xhci_suspend(xhci, device_may_wakeup(dev));
+	ret = xhci_suspend(xhci, device_may_wakeup(dev));
+
+	if (!device_may_wakeup(dev) && !IS_ERR(xhci->clk))
+		clk_disable_unprepare(xhci->clk);
+
+	return ret;
 }
 
 static int xhci_plat_resume(struct device *dev)
@@ -323,6 +329,9 @@ static int xhci_plat_resume(struct device *dev)
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 
+	if (!device_may_wakeup(dev) && !IS_ERR(xhci->clk))
+		clk_prepare_enable(xhci->clk);
+
 	return xhci_resume(xhci, 0);
 }
 
-- 
1.9.1
