Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:52132 "EHLO
	relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753676AbcHDLDm (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 07:03:42 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <vinod.koul@intel.com>, <dan.j.williams@intel.com>
CC: <dmaengine@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	<stable@vger.kernel.org>
Subject: [PATCH] dmaengine: usb-dmac: check CHCR.DE bit in usb_dmac_isr_channel()
Date: Thu, 4 Aug 2016 19:59:41 +0900
Message-ID: <1470308381-11206-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The USB-DMAC's interruption happens even if the CHCR.DE is not set to 1
because CHCR.NULLE is set to 1. So, this driver should call
usb_dmac_isr_transfer_end() if the DE bit is set to 1 only. Otherwise,
the desc is possible to be NULL in the usb_dmac_isr_transfer_end().

Fixes: 0c1c8ff32fa2 ("dmaengine: usb-dmac: Add Renesas USB DMA Controller (USB-DMAC) driver)
Cc: <stable@vger.kernel.org> # v4.1+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/dma/sh/usb-dmac.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
index 749f1bd..06ecdc3 100644
--- a/drivers/dma/sh/usb-dmac.c
+++ b/drivers/dma/sh/usb-dmac.c
@@ -600,27 +600,30 @@ static irqreturn_t usb_dmac_isr_channel(int irq, void *dev)
 {
 	struct usb_dmac_chan *chan = dev;
 	irqreturn_t ret = IRQ_NONE;
-	u32 mask = USB_DMACHCR_TE;
-	u32 check_bits = USB_DMACHCR_TE | USB_DMACHCR_SP;
+	u32 mask = 0;
 	u32 chcr;
+	bool xfer_end = false;
 
 	spin_lock(&chan->vc.lock);
 
 	chcr = usb_dmac_chan_read(chan, USB_DMACHCR);
-	if (chcr & check_bits)
-		mask |= USB_DMACHCR_DE | check_bits;
+	if (chcr & (USB_DMACHCR_TE | USB_DMACHCR_SP)) {
+		mask |= USB_DMACHCR_DE | USB_DMACHCR_TE | USB_DMACHCR_SP;
+		if (chcr & USB_DMACHCR_DE)
+			xfer_end = true;
+		ret |= IRQ_HANDLED;
+	}
 	if (chcr & USB_DMACHCR_NULL) {
 		/* An interruption of TE will happen after we set FTE */
 		mask |= USB_DMACHCR_NULL;
 		chcr |= USB_DMACHCR_FTE;
 		ret |= IRQ_HANDLED;
 	}
-	usb_dmac_chan_write(chan, USB_DMACHCR, chcr & ~mask);
+	if (mask)
+		usb_dmac_chan_write(chan, USB_DMACHCR, chcr & ~mask);
 
-	if (chcr & check_bits) {
+	if (xfer_end)
 		usb_dmac_isr_transfer_end(chan);
-		ret |= IRQ_HANDLED;
-	}
 
 	spin_unlock(&chan->vc.lock);
 
-- 
1.9.1
