Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:7393 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751872AbdHIK6h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 06:58:37 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: gadget: fix spin_lock_init() for &uep->lock
Date: Wed,  9 Aug 2017 19:55:24 +0900
Message-Id: <1502276124-27816-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that the spin_lock_init() is not called
for almost all pipes. Otherwise, the lockdep output the following
message when we connect a usb cable using g_ncm:

 INFO: trying to register non-static key.
 the code is fine but needs lockdep annotation.
 turning off the locking correctness validator.

Reported-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Fixes: b8b9c974afee ("usb: renesas_usbhs: gadget: disable all eps when the driver stops")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
---

 I'm sorry again and again. This patch is based on the latest Felipe's
 usb.git / testing/fixes branch (the commit id = b7d44c36a6f6d).

 Or, should I revert related patches first?
  b7d44c36a6f6 ("usb: renesas_usbhs: gadget: fix unused-but-set-variable warning")
  b8b9c974afee ("usb: renesas_usbhs: gadget: disable all eps when the driver stops")

 drivers/usb/renesas_usbhs/mod_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 2c8161b..5984fb1 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -1082,7 +1082,6 @@ int usbhs_mod_gadget_probe(struct usbhs_priv *priv)
 		ret = -ENOMEM;
 		goto usbhs_mod_gadget_probe_err_gpriv;
 	}
-	spin_lock_init(&uep->lock);
 
 	gpriv->transceiver = usb_get_phy(USB_PHY_TYPE_UNDEFINED);
 	dev_info(dev, "%stransceiver found\n",
@@ -1132,6 +1131,7 @@ int usbhs_mod_gadget_probe(struct usbhs_priv *priv)
 		uep->ep.name		= uep->ep_name;
 		uep->ep.ops		= &usbhsg_ep_ops;
 		INIT_LIST_HEAD(&uep->ep.ep_list);
+		spin_lock_init(&uep->lock);
 
 		/* init DCP */
 		if (usbhsg_is_dcp(uep)) {
-- 
1.9.1
