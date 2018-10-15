Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44910 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726319AbeJOSkM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Oct 2018 14:40:12 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH RESEND] ARM: dma-mapping: update comment about handling dma_ops when detaching from IOMMU
Date: Mon, 15 Oct 2018 12:55:17 +0200
Message-Id: <20181015105517.28032-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Update the comment because we don't set the pointer to NULL anymore.
Also use the correct pointer name 'dma_ops' instead of 'dma_map_ops'.

Fixes: 1874619a7df4 ("ARM: dma-mapping: Set proper DMA ops in arm_iommu_detach_device()")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mm/dma-mapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 66566472c153..e3b04786838f 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -2287,7 +2287,7 @@ EXPORT_SYMBOL_GPL(arm_iommu_attach_device);
  * @dev: valid struct device pointer
  *
  * Detaches the provided device from a previously attached map.
- * This voids the dma operations (dma_map_ops pointer)
+ * This overwrites the dma_ops pointer with appropriate non-IOMMU ops.
  */
 void arm_iommu_detach_device(struct device *dev)
 {
-- 
2.11.0
