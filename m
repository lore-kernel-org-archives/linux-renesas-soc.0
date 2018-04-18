Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37824 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752166AbeDRSVI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 14:21:08 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3 2/5] mmc: renesas_sdhi: use helpers to access struct scatterlist members
Date: Wed, 18 Apr 2018 20:20:58 +0200
Message-Id: <20180418182101.5723-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180418182101.5723-1-wsa+renesas@sang-engineering.com>
References: <20180418182101.5723-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Instead of directly accessing the members of struct scatterlist use the
helpers mmc_get_dma_dir() and sg_dma_address() in
renesas_sdhi_internal_dmac_start_dma(). Based on previous work by
Masaharu Hayakawa.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[rebased to mmc/next]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 6af946d16d24..6a86619d3f85 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -157,7 +157,6 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 {
 	struct scatterlist *sg = host->sg_ptr;
 	u32 dtran_mode = DTRAN_MODE_BUS_WID_TH | DTRAN_MODE_ADDR_MODE;
-	enum dma_data_direction dir;
 	int ret;
 
 	/* This DMAC cannot handle if sg_len is not 1 */
@@ -169,16 +168,15 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 
 	if (data->flags & MMC_DATA_READ) {
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH1;
-		dir = DMA_FROM_DEVICE;
 		if (test_bit(SDHI_INTERNAL_DMAC_ONE_RX_ONLY, &global_flags) &&
 		    test_and_set_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags))
 			goto force_pio;
 	} else {
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH0;
-		dir = DMA_TO_DEVICE;
 	}
 
-	ret = dma_map_sg(&host->pdev->dev, sg, host->sg_len, dir);
+	ret = dma_map_sg(&host->pdev->dev, sg, host->sg_len,
+			 mmc_get_dma_dir(data));
 	if (ret == 0)
 		goto force_pio;
 
@@ -188,7 +186,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_DTRAN_MODE,
 					    dtran_mode);
 	renesas_sdhi_internal_dmac_dm_write(host, DM_DTRAN_ADDR,
-					    sg->dma_address);
+					    sg_dma_address(sg));
 
 	return;
 
-- 
2.11.0
