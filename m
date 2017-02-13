Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:50190 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752194AbdBMLAf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 06:00:35 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vinod.koul@intel.com>,
        Dan Williams <dan.j.williams@intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dmaengine: rcar-dmac: Widen DMA mask to 40 bits
Date: Mon, 13 Feb 2017 12:00:26 +0100
Message-Id: <1486983626-10744-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

By default, the DMA mask covers only the low 32-bit address space, which
causes SWIOTLB on arm64 to fall back to a bounce buffer for DMA
transfers involving memory outside the 32-bit address space.

The R-Car DMA controller hardware supports a 40-bit address space, hence
widen the DMA mask to 40 bits to actually make use of this feature.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note that for proper operation in the presence of an enabled IOMMU, you
also need commit 3b6bb5b705a4051c ("iommu/ipmmu-vmsa: Restrict IOMMU
Domain Geometry to 32-bit address space") in iommu/next.

However, as the IOMMU is not enabled in upstream nor linux-next, it is
safe to apply this patch in parallel.

v2:
  - No changes.
---
 drivers/dma/sh/rcar-dmac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 2e441d0ccd79a37a..93a69b992a51a7aa 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1716,6 +1716,7 @@ static int rcar_dmac_probe(struct platform_device *pdev)
 
 	dmac->dev = &pdev->dev;
 	platform_set_drvdata(pdev, dmac);
+	dma_set_mask_and_coherent(dmac->dev, DMA_BIT_MASK(40));
 
 	ret = rcar_dmac_parse_of(&pdev->dev, dmac);
 	if (ret < 0)
-- 
1.9.1
