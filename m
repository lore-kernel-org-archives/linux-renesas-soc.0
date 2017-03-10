Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:63161 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S936366AbdCJNDj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 08:03:39 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 1/2] usb: host: ehci-platform: set hcd->phy to avoid phy_get() in usb_add_hcd()
Date: Fri, 10 Mar 2017 22:01:25 +0900
Message-ID: <1489150886-27862-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
 drivers/usb/host/ehci-platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index a268d9e..4ae27e9 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -222,6 +222,8 @@ static int ehci_platform_probe(struct platform_device *dev)
 					goto err_put_hcd;
 			}
 		}
+		/* Avoiding phy_get in usb_add_hcd() */
+		hcd->phy = priv->phys[0];
 
 		for (clk = 0; clk < EHCI_MAX_CLKS; clk++) {
 			priv->clks[clk] = of_clk_get(dev->dev.of_node, clk);
-- 
1.9.1
