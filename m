Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:65316 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751348AbdGRM3w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 08:29:52 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] usb: gadget: udc: renesas_usb3: fix free size in renesas_usb3_dma_free_prd()
Date: Tue, 18 Jul 2017 21:26:40 +0900
Message-ID: <1500380802-26930-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1500380802-26930-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1500380802-26930-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The commit 2d4aa21a73ba ("usb: gadget: udc: renesas_usb3: add support
for dedicated DMAC") has a bug in the renesas_usb3_dma_free_prd().
The size of dma_free_coherent() should be the same with dma_alloc_coherent()
Otherwise, this code causes a WARNING by mm/page_alloc.c when
renesas_usb3_dma_free_prd() is called. So, this patch fixes it.

Fixes: 2d4aa21a73ba ("usb: gadget: udc: renesas_usb3: add support for dedicated DMAC")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index d827832..923ad5a 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -1369,7 +1369,7 @@ static int renesas_usb3_dma_free_prd(struct renesas_usb3 *usb3,
 
 	usb3_for_each_dma(usb3, dma, i) {
 		if (dma->prd) {
-			dma_free_coherent(dev, USB3_DMA_MAX_XFER_SIZE,
+			dma_free_coherent(dev, USB3_DMA_PRD_SIZE,
 					  dma->prd, dma->prd_dma);
 			dma->prd = NULL;
 		}
-- 
1.9.1
