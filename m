Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47496 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754319AbeDMOKb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 10:10:31 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Simon Horman <horms@verge.net.au>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 2/5] mmc: renesas_sdhi: use helpers to access struct scatterlist members
Date: Fri, 13 Apr 2018 16:10:18 +0200
Message-Id: <20180413141021.8680-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180413141021.8680-1-wsa+renesas@sang-engineering.com>
References: <20180413141021.8680-1-wsa+renesas@sang-engineering.com>
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
index c8d479375fb6..4f67195cb5f5 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -158,7 +158,6 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 {
 	struct scatterlist *sg = host->sg_ptr;
 	u32 dtran_mode = DTRAN_MODE_BUS_WID_TH | DTRAN_MODE_ADDR_MODE;
-	enum dma_data_direction dir;
 	int ret;
 
 	/* This DMAC cannot handle if sg_len is not 1 */
@@ -170,16 +169,15 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 
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
 
@@ -189,7 +187,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_DTRAN_MODE,
 					    dtran_mode);
 	renesas_sdhi_internal_dmac_dm_write(host, DM_DTRAN_ADDR,
-					    sg->dma_address);
+					    sg_dma_address(sg));
 
 	return;
 
-- 
2.11.0
