Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56846 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752591AbeDDRAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Apr 2018 13:00:40 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] mmc: renesas_sdhi_internal_dmac: fall back to PIO if scatterlist doesn't match
Date: Wed,  4 Apr 2018 19:00:35 +0200
Message-Id: <20180404170035.5507-1-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

If we detect an incompatible scatterlist, we should fall back to PIO,
too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I found this while working on the RX DMA issue. I don't see a reason why we
shouldn't fall back in this case as well. But maybe I am missing something.

Shimoda-san: what do you think?

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 380570a26a09..561e90755a3b 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -161,11 +161,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	enum dma_data_direction dir;
 	int ret;
 
-	/* This DMAC cannot handle if sg_len is not 1 */
-	WARN_ON(host->sg_len > 1);
-
-	/* This DMAC cannot handle if buffer is not 8-bytes alignment */
-	if (!IS_ALIGNED(sg->offset, 8))
+	if (WARN_ON(host->sg_len > 1) || !IS_ALIGNED(sg->offset, 8))
 		goto force_pio;
 
 	if (data->flags & MMC_DATA_READ) {
-- 
2.11.0
