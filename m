Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:46469 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752050AbeF2KCr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 06:02:47 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/2] mmc: renesas_sdhi_internal_dmac: Fix missing unmap in error patch
Date: Fri, 29 Jun 2018 19:01:44 +0900
Message-Id: <1530266505-19953-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1530266505-19953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1530266505-19953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that lacks the dma_unmap_sg() calling in
the error patch of renesas_sdhi_internal_dmac_start_dma().

Fixes: 0cbc94daa554 ("mmc: renesas_sdhi_internal_dmac: limit DMA RX for old SoCs")
Cc: <stable@vger.kernel.org> # v4.17+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index f7f9773..d676a20 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -164,17 +164,14 @@
 		goto force_pio;
 
 	/* This DMAC cannot handle if buffer is not 8-bytes alignment */
-	if (!IS_ALIGNED(sg_dma_address(sg), 8)) {
-		dma_unmap_sg(&host->pdev->dev, sg, host->sg_len,
-			     mmc_get_dma_dir(data));
-		goto force_pio;
-	}
+	if (!IS_ALIGNED(sg_dma_address(sg), 8))
+		goto force_pio_with_unmap;
 
 	if (data->flags & MMC_DATA_READ) {
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH1;
 		if (test_bit(SDHI_INTERNAL_DMAC_ONE_RX_ONLY, &global_flags) &&
 		    test_and_set_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags))
-			goto force_pio;
+			goto force_pio_with_unmap;
 	} else {
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH0;
 	}
@@ -189,6 +186,9 @@
 
 	return;
 
+force_pio_with_unmap:
+	dma_unmap_sg(&host->pdev->dev, sg, host->sg_len, mmc_get_dma_dir(data));
+
 force_pio:
 	host->force_pio = true;
 	renesas_sdhi_internal_dmac_enable_dma(host, false);
-- 
1.9.1
