Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:32235 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S935500AbdCJNDr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 08:03:47 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 2/2] usb: host: ehci-platform: set hcd->phy to avoid phy_get() in usb_add_hcd()
Date: Fri, 10 Mar 2017 22:01:26 +0900
Message-ID: <1489150886-27862-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1489150886-27862-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1489150886-27862-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch sets hcd->phy from own phy context to avoid phy_get()
in usb_add_hcd(). Since hcd.c manage the phy only in usb_add_hcd()
and usb_remove_hcd(), there is difficult to manage the phy in
suspend/resume.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/ohci-platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index 898b740..00cc841 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -185,6 +185,8 @@ static int ohci_platform_probe(struct platform_device *dev)
 				goto err_put_hcd;
 			}
 		}
+		/* Avoiding phy_get in usb_add_hcd() */
+		hcd->phy = priv->phys[0];
 
 		for (clk = 0; clk < OHCI_MAX_CLKS; clk++) {
 			priv->clks[clk] = of_clk_get(dev->dev.of_node, clk);
-- 
1.9.1
