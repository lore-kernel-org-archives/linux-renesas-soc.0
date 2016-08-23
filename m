Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:35215 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1756697AbcHWMMj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2016 08:12:39 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: gadget: udc: renesas-usb3: clear VBOUT bit in DRD_CON
Date: Tue, 23 Aug 2016 21:11:13 +0900
Message-ID: <1471954273-29729-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This driver should clear the bit. Otherwise, the VBUS will output
wrongly if the usb port on a board has VBUS output capability.

Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for
		      Renesas USB3.0 peripheral controller")
Cc: <stable@vger.kernel.org> # v4.5+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 93a3bec..fb8fc34 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -106,6 +106,7 @@
 
 /* DRD_CON */
 #define DRD_CON_PERI_CON	BIT(24)
+#define DRD_CON_VBOUT		BIT(0)
 
 /* USB_INT_ENA_1 and USB_INT_STA_1 */
 #define USB_INT_1_B3_PLLWKUP	BIT(31)
@@ -363,6 +364,7 @@ static void usb3_init_epc_registers(struct renesas_usb3 *usb3)
 {
 	/* FIXME: How to change host / peripheral mode as well? */
 	usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
+	usb3_clear_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
 
 	usb3_write(usb3, ~0, USB3_USB_INT_STA_1);
 	usb3_enable_irq_1(usb3, USB_INT_1_VBUS_CNG);
-- 
1.9.1
