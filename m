Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:61336 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751166AbeEULSs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 07:18:48 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] usb: gadget: function: printer: avoid wrong list handling in printer_write()
Date: Mon, 21 May 2018 20:18:07 +0900
Message-Id: <1526901487-22438-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When printer_write() calls usb_ep_queue(), a udc driver (e.g.
renesas_usbhs driver) may call usb_gadget_giveback_request() in
the udc .queue ops immediately. Then, printer_write() calls
list_add(&req->list, &dev->tx_reqs_active) wrongly. After that,
if we do unbind the printer driver, WARN_ON() happens in
printer_func_unbind() because the list entry is not removed.

So, this patch moves list_add(&req->list, &dev->tx_reqs_active)
calling before usb_ep_queue().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>
---
 Changes from RFC (v1):
  - Modify the implementation to fix the issue.
  - Add "Acked-by Felipe Balbi".
  - Remove RFC.
  - Revise commit log.

 drivers/usb/gadget/function/f_printer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index d359efe..9c7ed25 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -631,19 +631,19 @@ static void tx_complete(struct usb_ep *ep, struct usb_request *req)
 			return -EAGAIN;
 		}
 
+		list_add(&req->list, &dev->tx_reqs_active);
+
 		/* here, we unlock, and only unlock, to avoid deadlock. */
 		spin_unlock(&dev->lock);
 		value = usb_ep_queue(dev->in_ep, req, GFP_ATOMIC);
 		spin_lock(&dev->lock);
 		if (value) {
+			list_del(&req->list);
 			list_add(&req->list, &dev->tx_reqs);
 			spin_unlock_irqrestore(&dev->lock, flags);
 			mutex_unlock(&dev->lock_printer_io);
 			return -EAGAIN;
 		}
-
-		list_add(&req->list, &dev->tx_reqs_active);
-
 	}
 
 	spin_unlock_irqrestore(&dev->lock, flags);
-- 
1.9.1
