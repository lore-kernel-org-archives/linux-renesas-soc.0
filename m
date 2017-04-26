Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:39488 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1949599AbdDZLwg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Apr 2017 07:52:36 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/5] usb: gadget: udc: renesas_usb3: fix deadlock by spinlock
Date: Wed, 26 Apr 2017 20:50:08 +0900
Message-ID: <1493207411-24416-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that this driver is possible to cause
deadlock by double-spinclocked in renesas_usb3_stop_controller().
So, this patch removes spinlock API calling in renesas_usb3_stop().
(In other words, the previous code had a redundant lock.)

Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas USB3.0 peripheral controller")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 10585da..e27d948 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -1810,14 +1810,11 @@ static int renesas_usb3_start(struct usb_gadget *gadget,
 static int renesas_usb3_stop(struct usb_gadget *gadget)
 {
 	struct renesas_usb3 *usb3 = gadget_to_renesas_usb3(gadget);
-	unsigned long flags;
 
-	spin_lock_irqsave(&usb3->lock, flags);
 	usb3->softconnect = false;
 	usb3->gadget.speed = USB_SPEED_UNKNOWN;
 	usb3->driver = NULL;
 	renesas_usb3_stop_controller(usb3);
-	spin_unlock_irqrestore(&usb3->lock, flags);
 
 	pm_runtime_put(usb3_to_dev(usb3));
 	pm_runtime_disable(usb3_to_dev(usb3));
-- 
1.9.1
