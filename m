Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:6065 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726898AbeHCFIR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Aug 2018 01:08:17 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: gadget: udc: renesas_usb3: fix maxpacket size of ep0
Date: Fri,  3 Aug 2018 12:12:46 +0900
Message-Id: <1533265966-5766-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that maxpacket size of ep0 is incorrect
for SuperSpeed. Otherwise, CDC NCM class with SuperSpeed doesn't
work correctly on this driver because its control read data size
is more than 64 bytes.

Reported-by: Junki Kato <junki.kato.xk@renesas.com>
Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas USB3.0 peripheral controller")
Cc: <stable@vger.kernel.org> # v4.5+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Junki Kato <junki.kato.xk@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 7cf98c7..5b5f1c8 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -787,12 +787,15 @@ static void usb3_irq_epc_int_1_speed(struct renesas_usb3 *usb3)
 	switch (speed) {
 	case USB_STA_SPEED_SS:
 		usb3->gadget.speed = USB_SPEED_SUPER;
+		usb3->gadget.ep0->maxpacket = USB3_EP0_SS_MAX_PACKET_SIZE;
 		break;
 	case USB_STA_SPEED_HS:
 		usb3->gadget.speed = USB_SPEED_HIGH;
+		usb3->gadget.ep0->maxpacket = USB3_EP0_HSFS_MAX_PACKET_SIZE;
 		break;
 	case USB_STA_SPEED_FS:
 		usb3->gadget.speed = USB_SPEED_FULL;
+		usb3->gadget.ep0->maxpacket = USB3_EP0_HSFS_MAX_PACKET_SIZE;
 		break;
 	default:
 		usb3->gadget.speed = USB_SPEED_UNKNOWN;
@@ -2451,7 +2454,7 @@ static int renesas_usb3_init_ep(struct renesas_usb3 *usb3, struct device *dev,
 			/* for control pipe */
 			usb3->gadget.ep0 = &usb3_ep->ep;
 			usb_ep_set_maxpacket_limit(&usb3_ep->ep,
-						USB3_EP0_HSFS_MAX_PACKET_SIZE);
+						USB3_EP0_SS_MAX_PACKET_SIZE);
 			usb3_ep->ep.caps.type_control = true;
 			usb3_ep->ep.caps.dir_in = true;
 			usb3_ep->ep.caps.dir_out = true;
-- 
1.9.1
