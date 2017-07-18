Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:63732 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751371AbdGRM3w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 08:29:52 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] usb: gadget: udc: renesas_usb3: fix zlp transfer by the dmac
Date: Tue, 18 Jul 2017 21:26:41 +0900
Message-ID: <1500380802-26930-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1500380802-26930-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1500380802-26930-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The dedicated dmac can transfer a zero-length-packet (zlp) if some bits
of the USB_COM_CON register. However, the commit 2d4aa21a73ba ("usb:
gadget: udc: renesas_usb3: add support for dedicated DMAC") didn't set
the bits to 1. So, this patch fixes it.

Fixes: 2d4aa21a73b ("usb: gadget: udc: renesas_usb3: add support for dedicated DMAC)
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 923ad5a..1cc5f0d 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -89,6 +89,9 @@
 
 /* USB_COM_CON */
 #define USB_COM_CON_CONF		BIT(24)
+#define USB_COM_CON_PN_WDATAIF_NL	BIT(23)
+#define USB_COM_CON_PN_RDATAIF_NL	BIT(22)
+#define USB_COM_CON_PN_LSTTR_PP		BIT(21)
 #define USB_COM_CON_SPD_MODE		BIT(17)
 #define USB_COM_CON_EP0_EN		BIT(16)
 #define USB_COM_CON_DEV_ADDR_SHIFT	8
@@ -686,6 +689,9 @@ static void renesas_usb3_init_controller(struct renesas_usb3 *usb3)
 {
 	usb3_init_axi_bridge(usb3);
 	usb3_init_epc_registers(usb3);
+	usb3_set_bit(usb3, USB_COM_CON_PN_WDATAIF_NL |
+		     USB_COM_CON_PN_RDATAIF_NL | USB_COM_CON_PN_LSTTR_PP,
+		     USB3_USB_COM_CON);
 	usb3_write(usb3, USB_OTG_IDMON, USB3_USB_OTG_INT_STA);
 	usb3_write(usb3, USB_OTG_IDMON, USB3_USB_OTG_INT_ENA);
 
-- 
1.9.1
