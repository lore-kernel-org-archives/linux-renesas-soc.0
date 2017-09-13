Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:14796 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750993AbdIMGfN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2017 02:35:13 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC] usb: gadget: function: printer: avoid spinlock recursion
Date: Wed, 13 Sep 2017 15:31:33 +0900
Message-Id: <1505284293-6565-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If usb_gadget_giveback_request() is called in usb_ep_queue(),
this printer_write() is possible to cause spinlock recursion. So,
this patch adds spin_unlock() before calls usb_ep_queue() to avoid it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 The recursion can be caused by renesas_usbhs udc driver. I'm not sure
 this patch is acceptable or not. So, I marked RFC on this patch.
 Should we fix the udc driver? Or, should we fix the f_printer driver
 like this patch?

 drivers/usb/gadget/function/f_printer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 8df244f..ea0da35a 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -555,6 +555,7 @@ static void tx_complete(struct usb_ep *ep, struct usb_request *req)
 	size_t			size;	/* Amount of data in a TX request. */
 	size_t			bytes_copied = 0;
 	struct usb_request	*req;
+	int			value;
 
 	DBG(dev, "printer_write trying to send %d bytes\n", (int)len);
 
@@ -634,7 +635,11 @@ static void tx_complete(struct usb_ep *ep, struct usb_request *req)
 			return -EAGAIN;
 		}
 
-		if (usb_ep_queue(dev->in_ep, req, GFP_ATOMIC)) {
+		/* here, we unlock, and only unlock, to avoid deadlock. */
+		spin_unlock(&dev->lock);
+		value = usb_ep_queue(dev->in_ep, req, GFP_ATOMIC);
+		spin_lock(&dev->lock);
+		if (value) {
 			list_add(&req->list, &dev->tx_reqs);
 			spin_unlock_irqrestore(&dev->lock, flags);
 			mutex_unlock(&dev->lock_printer_io);
-- 
1.9.1
