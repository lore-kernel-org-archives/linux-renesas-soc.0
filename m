Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:41455 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753148AbdHBMNH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2017 08:13:07 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: gadget: udc: renesas_usb3: Fix usb_gadget_giveback_request() calling
Date: Wed,  2 Aug 2017 21:06:35 +0900
Message-Id: <1501675595-6829-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to the gadget.h, a "complete" function will always be called
with interrupts disabled. However, sometimes usb3_request_done() function
is called with interrupts enabled. So, this function should be held
by spin_lock_irqsave() to disable interruption. Also, this driver has
to call spin_unlock() to avoid spinlock recursion by this driver before
calling usb_gadget_giveback_request().

Reported-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Tested-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas USB3.0 peripheral controller")
Cc: <stable@vger.kernel.org> # v4.5+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 62dc9c7..e1de8fe 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -838,21 +838,32 @@ static struct renesas_usb3_request *usb3_get_request(struct renesas_usb3_ep
 	return usb3_req;
 }
 
-static void usb3_request_done(struct renesas_usb3_ep *usb3_ep,
-			      struct renesas_usb3_request *usb3_req, int status)
+static void __usb3_request_done(struct renesas_usb3_ep *usb3_ep,
+				struct renesas_usb3_request *usb3_req,
+				int status)
 {
 	struct renesas_usb3 *usb3 = usb3_ep_to_usb3(usb3_ep);
-	unsigned long flags;
 
 	dev_dbg(usb3_to_dev(usb3), "giveback: ep%2d, %u, %u, %d\n",
 		usb3_ep->num, usb3_req->req.length, usb3_req->req.actual,
 		status);
 	usb3_req->req.status = status;
-	spin_lock_irqsave(&usb3->lock, flags);
 	usb3_ep->started = false;
 	list_del_init(&usb3_req->queue);
-	spin_unlock_irqrestore(&usb3->lock, flags);
+	spin_unlock(&usb3->lock);
 	usb_gadget_giveback_request(&usb3_ep->ep, &usb3_req->req);
+	spin_lock(&usb3->lock);
+}
+
+static void usb3_request_done(struct renesas_usb3_ep *usb3_ep,
+			      struct renesas_usb3_request *usb3_req, int status)
+{
+	struct renesas_usb3 *usb3 = usb3_ep_to_usb3(usb3_ep);
+	unsigned long flags;
+
+	spin_lock_irqsave(&usb3->lock, flags);
+	__usb3_request_done(usb3_ep, usb3_req, status);
+	spin_unlock_irqrestore(&usb3->lock, flags);
 }
 
 static void usb3_irq_epc_pipe0_status_end(struct renesas_usb3 *usb3)
-- 
1.9.1
