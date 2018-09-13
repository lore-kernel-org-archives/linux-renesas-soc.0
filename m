Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38784 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726796AbeIMUC4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 16:02:56 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dmaengine@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] dmaengine: rcar-dmac: set scatter/gather max segment size
Date: Thu, 13 Sep 2018 16:52:56 +0200
Message-Id: <20180913145256.12261-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fix warning when running with CONFIG_DMA_API_DEBUG_SG=y by allocating a
device_dma_parameters structure and filling in the max segment size.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

According to this discussion [1], this is the intended way of setting
dma_parms. I am not 100% sure about the value, though. I took the maximum value
of the DMA Transfer Count Registers which is 16M. I'd think the real maximum
needs to be multiplied with the data length which is varying, though? Geert,
what do you think?

[1] https://www.spinics.net/lists/iommu/msg29861.html

 drivers/dma/sh/rcar-dmac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 48ee35e2bce6..bb3631f6c41c 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -198,6 +198,7 @@ struct rcar_dmac {
 	struct dma_device engine;
 	struct device *dev;
 	void __iomem *iomem;
+	struct device_dma_parameters parms;
 
 	unsigned int n_channels;
 	struct rcar_dmac_chan *channels;
@@ -1792,6 +1793,8 @@ static int rcar_dmac_probe(struct platform_device *pdev)
 
 	dmac->dev = &pdev->dev;
 	platform_set_drvdata(pdev, dmac);
+	dmac->dev->dma_parms = &dmac->parms;
+	dma_set_max_seg_size(dmac->dev, 0x01000000);
 	dma_set_mask_and_coherent(dmac->dev, DMA_BIT_MASK(40));
 
 	ret = rcar_dmac_parse_of(&pdev->dev, dmac);
-- 
2.11.0
