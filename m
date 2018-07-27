Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:34316 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730290AbeG0KFr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jul 2018 06:05:47 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dan Williams <dan.j.williams@intel.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dmaengine: rcar-dmac: Make rcar_dmac_of_xlate() more robust
Date: Fri, 27 Jul 2018 10:44:47 +0200
Message-Id: <20180727084447.13984-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add an upper bound check for the MID/RID value passed from DT via the
DMA spec.

This avoids writing to reserved bits in the DMARS registers in case of
an out-of-range value in DT.

Suggested-by: Renesas BSP team via Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/dma/sh/rcar-dmac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 72572320208dbb9a..73cf1053bed90244 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1644,8 +1644,11 @@ static struct dma_chan *rcar_dmac_of_xlate(struct of_phandle_args *dma_spec,
 	struct dma_chan *chan;
 	dma_cap_mask_t mask;
 
-	if (dma_spec->args_count != 1)
+	if (dma_spec->args_count != 1 || dma_spec->args[0] > 0xff) {
+		pr_info("%s: invalid MID/RID 0x%x... for %pOF\n", __func__,
+			dma_spec->args[0], dma_spec->np);
 		return NULL;
+	}
 
 	/* Only slave DMA channels can be allocated via DT */
 	dma_cap_zero(mask);
-- 
2.17.1
