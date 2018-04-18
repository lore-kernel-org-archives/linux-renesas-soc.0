Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37840 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752334AbeDRSVJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 14:21:09 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3 3/5] mmc: renesas_sdhi: Fix alignment check of sg buffer
Date: Wed, 18 Apr 2018 20:20:59 +0200
Message-Id: <20180418182101.5723-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180418182101.5723-1-wsa+renesas@sang-engineering.com>
References: <20180418182101.5723-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

Sometimes sg->offset is not used for buffer addresses allocated by
dma_map_sg(), so alignment checks should be done on the allocated buffer
addresses. Delete the alignment check for sg->offset that is done before
dma_map_sg(). Instead, it performs the alignment check for
sg->dma_address after dma_map_sg().

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
[Niklas: broke this commit in two and tidied small style issue]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[rebased to mmc/next]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 6a86619d3f85..b36e174a4b0c 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -157,14 +157,20 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 {
 	struct scatterlist *sg = host->sg_ptr;
 	u32 dtran_mode = DTRAN_MODE_BUS_WID_TH | DTRAN_MODE_ADDR_MODE;
-	int ret;
 
 	/* This DMAC cannot handle if sg_len is not 1 */
 	WARN_ON(host->sg_len > 1);
 
+	if (!dma_map_sg(&host->pdev->dev, sg, host->sg_len,
+			mmc_get_dma_dir(data)))
+		goto force_pio;
+
 	/* This DMAC cannot handle if buffer is not 8-bytes alignment */
-	if (!IS_ALIGNED(sg->offset, 8))
+	if (!IS_ALIGNED(sg_dma_address(sg), 8)) {
+		dma_unmap_sg(&host->pdev->dev, sg, host->sg_len,
+			     mmc_get_dma_dir(data));
 		goto force_pio;
+	}
 
 	if (data->flags & MMC_DATA_READ) {
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH1;
@@ -175,11 +181,6 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH0;
 	}
 
-	ret = dma_map_sg(&host->pdev->dev, sg, host->sg_len,
-			 mmc_get_dma_dir(data));
-	if (ret == 0)
-		goto force_pio;
-
 	renesas_sdhi_internal_dmac_enable_dma(host, true);
 
 	/* set dma parameters */
-- 
2.11.0
