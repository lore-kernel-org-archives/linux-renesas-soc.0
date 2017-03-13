Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:53413 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750752AbdCMG1f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 02:27:35 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/2] usb: host: ehci-platform: set hcd->phy to avoid phy_get() in usb_add_hcd()
Date: Mon, 13 Mar 2017 15:25:23 +0900
Message-ID: <1489386324-31353-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1489386324-31353-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1489386324-31353-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch sets hcd->phy from own phy context to avoid phy_get()
in usb_add_hcd(). Since core/hcd.c manages the phy only in
usb_add_hcd() and usb_remove_hcd(), there is difficult to manage
the phy in suspend/resume.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/ehci-platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index a268d9e..2a7b6cb 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -220,6 +220,9 @@ static int ehci_platform_probe(struct platform_device *dev)
 			if (IS_ERR(priv->phys[phy_num])) {
 				err = PTR_ERR(priv->phys[phy_num]);
 					goto err_put_hcd;
+			} else if (!hcd->phy) {
+				/* Avoiding phy_get() in usb_add_hcd() */
+				hcd->phy = priv->phys[phy_num];
 			}
 		}
 
-- 
1.9.1
