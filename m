Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:61005 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752195AbeBEE34 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 4 Feb 2018 23:29:56 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/resend] usb: gadget: udc: renesas_usb3: fix oops in renesas_usb3_remove()
Date: Mon,  5 Feb 2018 13:25:14 +0900
Message-Id: <1517804714-5554-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that the renesas_usb3_remove() causes
NULL pointer dereference because the usb3_to_dev() macro will use
the gadget instance and it will be deleted before.

Fixes: cf06df3fae28 ("usb: gadget: udc: renesas_usb3: move pm_runtime_{en,dis}able()")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 6e87af2..409cde4 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2410,7 +2410,7 @@ static int renesas_usb3_remove(struct platform_device *pdev)
 	__renesas_usb3_ep_free_request(usb3->ep0_req);
 	if (usb3->phy)
 		phy_put(usb3->phy);
-	pm_runtime_disable(usb3_to_dev(usb3));
+	pm_runtime_disable(&pdev->dev);
 
 	return 0;
 }
-- 
1.9.1
