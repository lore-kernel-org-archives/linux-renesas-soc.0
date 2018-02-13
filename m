Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:9609 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933805AbeBMJmK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 04:42:10 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: host: xhci-plat: revert "usb: host: xhci-plat: enable clk in resume timing"
Date: Tue, 13 Feb 2018 18:37:23 +0900
Message-Id: <1518514643-13064-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch reverts the commit 835e4241e714 ("usb: host: xhci-plat:
enable clk in resume timing") because this driver also has runtime PM
and the commit 560869100b99 ("clk: renesas: cpg-mssr: Restore module
clocks during resume") will restore the clock on R-Car H3 environment.

If the xhci_plat_suspend() disables the clk, the system cannot enable
the clk in resume like the following behavior:

< In resume >
 - genpd_resume_noirq() runs and enable the clk (enable_count = 1)
 - cpg_mssr_resume_noirq() restores the clk register.
  -- Since the clk was disabled in suspend, cpg_mssr_resume_noirq()
     will disable the clk and keep the enable_count.
 - Even if xhci_plat_resume() calls clk_prepare_enable(), since
   the enable_count is 1, the clk will be not enabled.

After this patch is applied, the cpg-mssr driver will save the clk
as enable, so the clk will be enabled in resume.

Fixes: 835e4241e714 ("usb: host: xhci-plat: enable clk in resume timing")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-plat.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6f03830..6652e2d 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -360,7 +360,6 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
-	int ret;
 
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
@@ -370,12 +369,7 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 	 * reconsider this when xhci_plat_suspend enlarges its scope, e.g.,
 	 * also applies to runtime suspend.
 	 */
-	ret = xhci_suspend(xhci, device_may_wakeup(dev));
-
-	if (!device_may_wakeup(dev) && !IS_ERR(xhci->clk))
-		clk_disable_unprepare(xhci->clk);
-
-	return ret;
+	return xhci_suspend(xhci, device_may_wakeup(dev));
 }
 
 static int __maybe_unused xhci_plat_resume(struct device *dev)
@@ -384,9 +378,6 @@ static int __maybe_unused xhci_plat_resume(struct device *dev)
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	int ret;
 
-	if (!device_may_wakeup(dev) && !IS_ERR(xhci->clk))
-		clk_prepare_enable(xhci->clk);
-
 	ret = xhci_priv_resume_quirk(hcd);
 	if (ret)
 		return ret;
-- 
1.9.1
