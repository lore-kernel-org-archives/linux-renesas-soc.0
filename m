Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:17996 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1949594AbdDZLwh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Apr 2017 07:52:37 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/5] usb: gadget: udc: renesas_usb3: Fix PN_INT_ENA disabling timing
Date: Wed, 26 Apr 2017 20:50:10 +0900
Message-ID: <1493207411-24416-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The PN_INT_ENA register should be used after usb3_pn_change() is called.
So, this patch moves the access from renesas_usb3_stop_controller() to
usb3_disable_pipe_n().

Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas USB3.0 peripheral controller")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index c05097b..cd4c885 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -623,7 +623,6 @@ static void renesas_usb3_stop_controller(struct renesas_usb3 *usb3)
 {
 	usb3_disconnect(usb3);
 	usb3_write(usb3, 0, USB3_P0_INT_ENA);
-	usb3_write(usb3, 0, USB3_PN_INT_ENA);
 	usb3_write(usb3, 0, USB3_USB_OTG_INT_ENA);
 	usb3_write(usb3, 0, USB3_USB_INT_ENA_1);
 	usb3_write(usb3, 0, USB3_USB_INT_ENA_2);
@@ -1682,6 +1681,7 @@ static int usb3_disable_pipe_n(struct renesas_usb3_ep *usb3_ep)
 
 	spin_lock_irqsave(&usb3->lock, flags);
 	if (!usb3_pn_change(usb3, usb3_ep->num)) {
+		usb3_write(usb3, 0, USB3_PN_INT_ENA);
 		usb3_write(usb3, 0, USB3_PN_RAMMAP);
 		usb3_clear_bit(usb3, PN_CON_EN, USB3_PN_CON);
 	}
-- 
1.9.1
