Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:40861 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752182AbdGSHUC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2017 03:20:02 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] usb: renesas_usbhs: gadget: disable all eps when the driver stops
Date: Wed, 19 Jul 2017 16:16:55 +0900
Message-ID: <1500448615-25287-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1500448615-25287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1500448615-25287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

A gadget driver will not disable eps immediately when ->disconnect()
is called. But, since this driver assumes all eps stop after
the ->disconnect(), unexpected behavior happens (especially in system
suspend).
So, this patch disables all eps in usbhsg_try_stop(). After disabling
eps by renesas_usbhs driver, since some functions will be called by
both a gadget and renesas_usbhs driver, renesas_usbhs driver should
protect uep->pipe. To protect uep->pipe easily, this patch adds a new
lock in struct usbhsg_uep.

Fixes: 2f98382dc ("usb: renesas_usbhs: Add Renesas USBHS Gadget")
Cc: <stable@vger.kernel.org> # v3.0+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/mod_gadget.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 5bc7a61..93fba90 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -37,6 +37,7 @@ struct usbhsg_request {
 struct usbhsg_uep {
 	struct usb_ep		 ep;
 	struct usbhs_pipe	*pipe;
+	spinlock_t		lock;	/* protect the pipe */
 
 	char ep_name[EP_NAME_SIZE];
 
@@ -636,10 +637,16 @@ static int usbhsg_ep_enable(struct usb_ep *ep,
 static int usbhsg_ep_disable(struct usb_ep *ep)
 {
 	struct usbhsg_uep *uep = usbhsg_ep_to_uep(ep);
-	struct usbhs_pipe *pipe = usbhsg_uep_to_pipe(uep);
+	struct usbhs_pipe *pipe;
+	unsigned long flags;
+	int ret = 0;
 
-	if (!pipe)
-		return -EINVAL;
+	spin_lock_irqsave(&uep->lock, flags);
+	pipe = usbhsg_uep_to_pipe(uep);
+	if (!pipe) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	usbhsg_pipe_disable(uep);
 	usbhs_pipe_free(pipe);
@@ -647,6 +654,9 @@ static int usbhsg_ep_disable(struct usb_ep *ep)
 	uep->pipe->mod_private	= NULL;
 	uep->pipe		= NULL;
 
+out:
+	spin_unlock_irqrestore(&uep->lock, flags);
+
 	return 0;
 }
 
@@ -696,8 +706,11 @@ static int usbhsg_ep_dequeue(struct usb_ep *ep, struct usb_request *req)
 {
 	struct usbhsg_uep *uep = usbhsg_ep_to_uep(ep);
 	struct usbhsg_request *ureq = usbhsg_req_to_ureq(req);
-	struct usbhs_pipe *pipe = usbhsg_uep_to_pipe(uep);
+	struct usbhs_pipe *pipe;
+	unsigned long flags;
 
+	spin_lock_irqsave(&uep->lock, flags);
+	pipe = usbhsg_uep_to_pipe(uep);
 	if (pipe)
 		usbhs_pkt_pop(pipe, usbhsg_ureq_to_pkt(ureq));
 
@@ -706,6 +719,7 @@ static int usbhsg_ep_dequeue(struct usb_ep *ep, struct usb_request *req)
 	 * even if the pipe is NULL.
 	 */
 	usbhsg_queue_pop(uep, ureq, -ECONNRESET);
+	spin_unlock_irqrestore(&uep->lock, flags);
 
 	return 0;
 }
@@ -852,10 +866,10 @@ static int usbhsg_try_stop(struct usbhs_priv *priv, u32 status)
 {
 	struct usbhsg_gpriv *gpriv = usbhsg_priv_to_gpriv(priv);
 	struct usbhs_mod *mod = usbhs_mod_get_current(priv);
-	struct usbhsg_uep *dcp = usbhsg_gpriv_to_dcp(gpriv);
+	struct usbhsg_uep *uep;
 	struct device *dev = usbhs_priv_to_dev(priv);
 	unsigned long flags;
-	int ret = 0;
+	int ret = 0, i;
 
 	/********************  spin lock ********************/
 	usbhs_lock(priv, flags);
@@ -887,7 +901,9 @@ static int usbhsg_try_stop(struct usbhs_priv *priv, u32 status)
 	usbhs_sys_set_test_mode(priv, 0);
 	usbhs_sys_function_ctrl(priv, 0);
 
-	usbhsg_ep_disable(&dcp->ep);
+	/* disable all eps */
+	usbhsg_for_each_uep_with_dcp(uep, gpriv, i)
+		usbhsg_ep_disable(&uep->ep);
 
 	dev_dbg(dev, "stop gadget\n");
 
@@ -1069,6 +1085,7 @@ int usbhs_mod_gadget_probe(struct usbhs_priv *priv)
 		ret = -ENOMEM;
 		goto usbhs_mod_gadget_probe_err_gpriv;
 	}
+	spin_lock_init(&uep->lock);
 
 	gpriv->transceiver = usb_get_phy(USB_PHY_TYPE_UNDEFINED);
 	dev_info(dev, "%stransceiver found\n",
-- 
1.9.1
