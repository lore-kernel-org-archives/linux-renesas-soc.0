Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:64541 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751398AbdGRM3y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 08:29:54 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] usb: gadget: udc: renesas_usb3: protect usb3_ep->started in usb3_start_pipen()
Date: Tue, 18 Jul 2017 21:26:42 +0900
Message-ID: <1500380802-26930-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1500380802-26930-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1500380802-26930-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that unexpected behavior happens when
both the interrupt handler and renesas_usb3_ep_enable() are called.
In this case, since usb3_start_pipen() checked the usb3_ep->started,
but the flags was not protected. So, this patch protects the flag
by usb3->lock. Since renesas_usb3_ep_enable() for EP0 will be not called,
this patch doesn't take care of usb3_start_pipe0().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 1cc5f0d..62dc9c7 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -1415,12 +1415,12 @@ static void usb3_start_pipen(struct renesas_usb3_ep *usb3_ep,
 	int ret = -EAGAIN;
 	u32 enable_bits = 0;
 
+	spin_lock_irqsave(&usb3->lock, flags);
 	if (usb3_ep->halt || usb3_ep->started)
-		return;
+		goto out;
 	if (usb3_req != usb3_req_first)
-		return;
+		goto out;
 
-	spin_lock_irqsave(&usb3->lock, flags);
 	if (usb3_pn_change(usb3, usb3_ep->num) < 0)
 		goto out;
 
-- 
1.9.1
