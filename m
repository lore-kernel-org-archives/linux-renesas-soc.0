Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47526 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754561AbeDMOKd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 10:10:33 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 5/5] mmc: renesas_sdhi_internal_dmac: remove superfluous WARN
Date: Fri, 13 Apr 2018 16:10:21 +0200
Message-Id: <20180413141021.8680-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180413141021.8680-1-wsa+renesas@sang-engineering.com>
References: <20180413141021.8680-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The WARN can never trigger because we limited the max_seg number in
renesas_sdhi_of_data already. Remove it and update the comment.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 4b275225aa9d..0415ecbfeb43 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -91,7 +91,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 	.scc_offset	= 0x1000,
 	.taps		= rcar_gen3_scc_taps,
 	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
-	/* Gen3 SDHI DMAC can handle 0xffffffff blk count, but seg = 1 */
+	/* DMAC can handle 0xffffffff blk count but only 1 segment */
 	.max_blk_count	= 0xffffffff,
 	.max_segs	= 1,
 };
@@ -159,9 +159,6 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	struct scatterlist *sg = host->sg_ptr;
 	u32 dtran_mode = DTRAN_MODE_BUS_WID_TH | DTRAN_MODE_ADDR_MODE;
 
-	/* This DMAC cannot handle if sg_len is not 1 */
-	WARN_ON(host->sg_len > 1);
-
 	if (!dma_map_sg(&host->pdev->dev, sg, host->sg_len,
 			mmc_get_dma_dir(data)))
 		goto force_pio;
-- 
2.11.0
