Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:14062 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753811AbeERIh5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 04:37:57 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC] usb: gadget: function: printer: avoid wrong list handling in printer_write()
Date: Fri, 18 May 2018 17:37:21 +0900
Message-Id: <1526632641-30086-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The usb_ep_queue() in printer_write() is possible to call req->complete().
In that case, since tx_complete() calls list_add(&req->list, &dev->tx_reqs),
printer_write() should not call list_add(&req->list, &dev->tx_reqs_active)
because the transfer has already finished. So, this patch checks
the condition of req->list before adding the list in printer_write().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This issue can be caused by renesas_usbhs udc driver. I'm not sure
 this patch is acceptable or not. So, I marked RFC on this patch.

 drivers/usb/gadget/function/f_printer.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index d359efe..01de45e 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -640,10 +640,14 @@ static void tx_complete(struct usb_ep *ep, struct usb_request *req)
 			spin_unlock_irqrestore(&dev->lock, flags);
 			mutex_unlock(&dev->lock_printer_io);
 			return -EAGAIN;
+		} else if (list_empty(&req->list)) {
+			/*
+			 * Since usb_ep_queue() is possible to call complete,
+			 * we should check the req->list here, and then add
+			 * it into dev->tx_reqs_active.
+			 */
+			list_add(&req->list, &dev->tx_reqs_active);
 		}
-
-		list_add(&req->list, &dev->tx_reqs_active);
-
 	}
 
 	spin_unlock_irqrestore(&dev->lock, flags);
-- 
1.9.1
