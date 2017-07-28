Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:33987 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751822AbdG1KcJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2017 06:32:09 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: gadget: fix unused-but-set-variable warning
Date: Fri, 28 Jul 2017 19:28:57 +0900
Message-Id: <1501237737-498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The commit b8b9c974afee ("usb: renesas_usbhs: gadget: disable all eps
when the driver stops") causes the unused-but-set-variable warning.
But, if the usbhsg_ep_disable() will return non-zero value, udc/core.c
doesn't clear the ep->enabled flag. So, this driver should not return
non-zero value, if the pipe is zero because this means the pipe is
already disabled. Otherwise, the ep->enabled flag is never cleared
when the usbhsg_ep_disable() is called by the renesas_usbhs driver first.

Fixes: b8b9c974afee ("usb: renesas_usbhs: gadget: disable all eps when the driver stops")
Fixes: 11432050f070 ("usb: renesas_usbhs: gadget: fix NULL pointer dereference in ep_disable()")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Or, should I revert the commit b8b9c974afee first?

 drivers/usb/renesas_usbhs/mod_gadget.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 93fba90..2c8161b 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -639,14 +639,11 @@ static int usbhsg_ep_disable(struct usb_ep *ep)
 	struct usbhsg_uep *uep = usbhsg_ep_to_uep(ep);
 	struct usbhs_pipe *pipe;
 	unsigned long flags;
-	int ret = 0;
 
 	spin_lock_irqsave(&uep->lock, flags);
 	pipe = usbhsg_uep_to_pipe(uep);
-	if (!pipe) {
-		ret = -EINVAL;
+	if (!pipe)
 		goto out;
-	}
 
 	usbhsg_pipe_disable(uep);
 	usbhs_pipe_free(pipe);
-- 
1.9.1
