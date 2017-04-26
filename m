Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:39490 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1949402AbdDZLwf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Apr 2017 07:52:35 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/5] usb: gadget: udc: renesas_usb3: fix pm_runtime functions calling
Date: Wed, 26 Apr 2017 20:50:07 +0900
Message-ID: <1493207411-24416-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that this driver is possible to access
the registers before pm_runtime_get_sync() if a gadget driver is
installed first. After that, oops happens on R-Car Gen3 environment.
To avoid it, this patch changes the pm_runtime call timing from
probe/remove to udc_start/udc_stop.

Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas USB3.0 peripheral controller")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 5a2d845..10585da 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -1799,6 +1799,9 @@ static int renesas_usb3_start(struct usb_gadget *gadget,
 	/* hook up the driver */
 	usb3->driver = driver;
 
+	pm_runtime_enable(usb3_to_dev(usb3));
+	pm_runtime_get_sync(usb3_to_dev(usb3));
+
 	renesas_usb3_init_controller(usb3);
 
 	return 0;
@@ -1816,6 +1819,9 @@ static int renesas_usb3_stop(struct usb_gadget *gadget)
 	renesas_usb3_stop_controller(usb3);
 	spin_unlock_irqrestore(&usb3->lock, flags);
 
+	pm_runtime_put(usb3_to_dev(usb3));
+	pm_runtime_disable(usb3_to_dev(usb3));
+
 	return 0;
 }
 
@@ -1891,9 +1897,6 @@ static int renesas_usb3_remove(struct platform_device *pdev)
 
 	device_remove_file(&pdev->dev, &dev_attr_role);
 
-	pm_runtime_put(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-
 	usb_del_gadget_udc(&usb3->gadget);
 
 	__renesas_usb3_ep_free_request(usb3->ep0_req);
@@ -2099,9 +2102,6 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 
 	usb3->workaround_for_vbus = priv->workaround_for_vbus;
 
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_sync(&pdev->dev);
-
 	dev_info(&pdev->dev, "probed\n");
 
 	return 0;
-- 
1.9.1
