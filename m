Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:18525 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1758946AbdEOIwb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 04:52:31 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <vinod.koul@intel.com>
CC: <dmaengine@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        <stable@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dmaengine: usb-dmac: Fix DMAOR AE bit definition
Date: Mon, 15 May 2017 17:49:52 +0900
Message-ID: <1494838192-17062-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>

This patch fixes the register definition of AE (Address Error flag) bit.

Fixes: 0c1c8ff32fa2 ("dmaengine: usb-dmac: Add Renesas USB DMA Controller (USB-DMAC) driver")
Cc: <stable@vger.kernel.org> # v4.1+
Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
[Shimoda: add Fixes and Cc tags in the commit log]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/dma/sh/usb-dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
index 72c6497..31a1451 100644
--- a/drivers/dma/sh/usb-dmac.c
+++ b/drivers/dma/sh/usb-dmac.c
@@ -117,7 +117,7 @@ struct usb_dmac {
 #define USB_DMASWR			0x0008
 #define USB_DMASWR_SWR			(1 << 0)
 #define USB_DMAOR			0x0060
-#define USB_DMAOR_AE			(1 << 2)
+#define USB_DMAOR_AE			(1 << 1)
 #define USB_DMAOR_DME			(1 << 0)
 
 #define USB_DMASAR			0x0000
-- 
1.9.1
