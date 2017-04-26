Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:15818 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1949623AbdDZLwh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Apr 2017 07:52:37 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/5] usb: gadget: udc: renesas_usb3: lock for PN_ registers access
Date: Wed, 26 Apr 2017 20:50:09 +0900
Message-ID: <1493207411-24416-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This controller disallows to change the PIPE until reading/writing
a packet finishes. However. the previous code is not enough to hold
the lock in some functions. So, this patch fixes it.

Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas USB3.0 peripheral controller")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index e27d948..c05097b 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -1475,7 +1475,13 @@ static void usb3_request_done_pipen(struct renesas_usb3 *usb3,
 				    struct renesas_usb3_request *usb3_req,
 				    int status)
 {
-	usb3_pn_stop(usb3);
+	unsigned long flags;
+
+	spin_lock_irqsave(&usb3->lock, flags);
+	if (usb3_pn_change(usb3, usb3_ep->num))
+		usb3_pn_stop(usb3);
+	spin_unlock_irqrestore(&usb3->lock, flags);
+
 	usb3_disable_pipe_irq(usb3, usb3_ep->num);
 	usb3_request_done(usb3_ep, usb3_req, status);
 
@@ -1504,30 +1510,46 @@ static void usb3_irq_epc_pipen_bfrdy(struct renesas_usb3 *usb3, int num)
 {
 	struct renesas_usb3_ep *usb3_ep = usb3_get_ep(usb3, num);
 	struct renesas_usb3_request *usb3_req = usb3_get_request(usb3_ep);
+	bool done = false;
 
 	if (!usb3_req)
 		return;
 
+	spin_lock(&usb3->lock);
+	if (usb3_pn_change(usb3, num))
+		goto out;
+
 	if (usb3_ep->dir_in) {
 		/* Do not stop the IN pipe here to detect LSTTR interrupt */
 		if (!usb3_write_pipe(usb3_ep, usb3_req, USB3_PN_WRITE))
 			usb3_clear_bit(usb3, PN_INT_BFRDY, USB3_PN_INT_ENA);
 	} else {
 		if (!usb3_read_pipe(usb3_ep, usb3_req, USB3_PN_READ))
-			usb3_request_done_pipen(usb3, usb3_ep, usb3_req, 0);
+			done = true;
 	}
+
+out:
+	/* need to unlock because usb3_request_done_pipen() locks it */
+	spin_unlock(&usb3->lock);
+
+	if (done)
+		usb3_request_done_pipen(usb3, usb3_ep, usb3_req, 0);
 }
 
 static void usb3_irq_epc_pipen(struct renesas_usb3 *usb3, int num)
 {
 	u32 pn_int_sta;
 
-	if (usb3_pn_change(usb3, num) < 0)
+	spin_lock(&usb3->lock);
+	if (usb3_pn_change(usb3, num) < 0) {
+		spin_unlock(&usb3->lock);
 		return;
+	}
 
 	pn_int_sta = usb3_read(usb3, USB3_PN_INT_STA);
 	pn_int_sta &= usb3_read(usb3, USB3_PN_INT_ENA);
 	usb3_write(usb3, pn_int_sta, USB3_PN_INT_STA);
+	spin_unlock(&usb3->lock);
 	if (pn_int_sta & PN_INT_LSTTR)
 		usb3_irq_epc_pipen_lsttr(usb3, num);
 	if (pn_int_sta & PN_INT_BFRDY)
-- 
1.9.1
