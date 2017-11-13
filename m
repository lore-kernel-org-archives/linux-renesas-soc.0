Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37558 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751865AbdKMKcb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 05:32:31 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH/RFC 1/2] drm: rcar-du: Set the DMA coherent mask for the DU device
Date: Mon, 13 Nov 2017 12:32:27 +0200
Message-Id: <20171113103228.23312-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20171113103228.23312-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20171113103228.23312-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The DU DMA address space is limited to 32 bits, so the DMA coherent mask
should be set accordingly. The DMA mapping implementation will
transparently map high memory buffers to 32-bit addresses through an
IOMMU when present (or through bounce buffers otherwise, which isn't a
supported use case as performances would be terrible).

However, when sourcing frames from a VSP, the situation is more
complicated. The DU delegates all memory accesses to the VSP and doesn't
perform any DMA access by itself. Due to how the GEM CMA helpers are
structured buffers are still mapped to the DU device. They are later
mapped to the VSP as well to perform DMA access, through the IOMMU
connected to the VSP.

Setting the DMA coherent mask to 32 bits for the DU when using a VSP can
cause issues when importing a dma_buf. If the buffer is located above
the 32-bit address space, the DMA mapping implementation will try to map
it to the DU's DMA address space. As the DU has no IOMMU a bounce buffer
will be allocated, which in the best case will waste memory and in the
worst case will just fail.

To work around this issue, set the DMA coherent mask to the full 40-bit
address space for the DU. All dma-buf instances will be imported without
any restriction, and will be mapped to the VSP when preparing the
associated framebuffer.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 6e02c762a557..48c166f925a3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -370,6 +370,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 	struct rcar_du_device *rcdu;
 	struct drm_device *ddev;
 	struct resource *mem;
+	unsigned int mask;
 	int ret;
 
 	/* Allocate and initialize the R-Car device structure. */
@@ -388,6 +389,16 @@ static int rcar_du_probe(struct platform_device *pdev)
 	if (IS_ERR(rcdu->mmio))
 		return PTR_ERR(rcdu->mmio);
 
+	/*
+	 * Set the DMA coherent mask to reflect the DU 32-bit DMA address space
+	 * limitations. When sourcing frames from a VSP the DU doesn't perform
+	 * any memory access so set the mask to 40 bits to accept all buffers.
+	 */
+	mask = rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE) ? 40 : 32;
+	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(mask));
+	if (ret)
+		return ret;
+
 	/* DRM/KMS objects */
 	ddev = drm_dev_alloc(&rcar_du_driver, &pdev->dev);
 	if (IS_ERR(ddev))
-- 
Regards,

Laurent Pinchart
