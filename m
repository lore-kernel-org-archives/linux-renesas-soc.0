Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52446 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751355AbdIEIH6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 04:07:58 -0400
From: Simon Horman <horms@verge.net.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 11/13] usb: host: ehci-platform: set hcd->phy to avoid phy_get() in usb_add_hcd()
Date: Tue,  5 Sep 2017 10:06:46 +0200
Message-Id: <1504598808-19810-12-git-send-email-horms@verge.net.au>
In-Reply-To: <1504598808-19810-1-git-send-email-horms@verge.net.au>
References: <1504598808-19810-1-git-send-email-horms@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

This patch sets hcd->phy from own phy context to avoid phy_get()
in usb_add_hcd(). Since core/hcd.c manages the phy only in
usb_add_hcd() and usb_remove_hcd(), there is difficult to manage
the phy in suspend/resume.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
(cherry picked from commit 42a58c9949ddf16e557f5c2e22566f3440e7b60f)
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/usb/host/ehci-platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index 3214300396a0..bc7b9be12f54 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -221,6 +221,9 @@ static int ehci_platform_probe(struct platform_device *dev)
 			if (IS_ERR(priv->phys[phy_num])) {
 				err = PTR_ERR(priv->phys[phy_num]);
 					goto err_put_hcd;
+			} else if (!hcd->phy) {
+				/* Avoiding phy_get() in usb_add_hcd() */
+				hcd->phy = priv->phys[phy_num];
 			}
 		}
 
-- 
2.1.4
