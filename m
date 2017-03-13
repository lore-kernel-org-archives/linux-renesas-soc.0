Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:44428 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751144AbdCMG1f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 02:27:35 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] usb: host: ohci-platform: set hcd->phy to avoid phy_get() in usb_add_hcd()
Date: Mon, 13 Mar 2017 15:25:24 +0900
Message-ID: <1489386324-31353-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
 drivers/usb/host/ohci-platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index 898b740..6368fce 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -183,6 +183,9 @@ static int ohci_platform_probe(struct platform_device *dev)
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
