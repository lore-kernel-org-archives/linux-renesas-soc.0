Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37806 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751878AbeDRSVI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 14:21:08 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
Subject: [PATCH v3 1/5] mmc: renesas_sdhi_internal_dmac: limit DMA RX for old SoCs
Date: Wed, 18 Apr 2018 20:20:57 +0200
Message-Id: <20180418182101.5723-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180418182101.5723-1-wsa+renesas@sang-engineering.com>
References: <20180418182101.5723-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Early revisions of certain SoCs cannot do multiple DMA RX streams in
parallel. To avoid data corruption, only allow one DMA RX channel and
fall back to PIO, if needed.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 39 ++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 8e0acd197c43..6af946d16d24 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -9,6 +9,7 @@
  * published by the Free Software Foundation.
  */
 
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/io-64-nonatomic-hi-lo.h>
@@ -62,6 +63,17 @@
  *   need a custom accessor.
  */
 
+static unsigned long global_flags;
+/*
+ * Workaround for avoiding to use RX DMAC by multiple channels.
+ * On R-Car H3 ES1.* and M3-W ES1.0, when multiple SDHI channels use
+ * RX DMAC simultaneously, sometimes hundreds of bytes data are not
+ * stored into the system memory even if the DMAC interrupt happened.
+ * So, this driver then uses one RX DMAC channel only.
+ */
+#define SDHI_INTERNAL_DMAC_ONE_RX_ONLY	0
+#define SDHI_INTERNAL_DMAC_RX_IN_USE	1
+
 /* Definitions for sampling clocks */
 static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	{
@@ -126,6 +138,9 @@ renesas_sdhi_internal_dmac_abort_dma(struct tmio_mmc_host *host) {
 	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_RST,
 					    RST_RESERVED_BITS | val);
 
+	if (host->data && host->data->flags & MMC_DATA_READ)
+		clear_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags);
+
 	renesas_sdhi_internal_dmac_enable_dma(host, true);
 }
 
@@ -155,6 +170,9 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	if (data->flags & MMC_DATA_READ) {
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH1;
 		dir = DMA_FROM_DEVICE;
+		if (test_bit(SDHI_INTERNAL_DMAC_ONE_RX_ONLY, &global_flags) &&
+		    test_and_set_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags))
+			goto force_pio;
 	} else {
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH0;
 		dir = DMA_TO_DEVICE;
@@ -208,6 +226,9 @@ static void renesas_sdhi_internal_dmac_complete_tasklet_fn(unsigned long arg)
 	renesas_sdhi_internal_dmac_enable_dma(host, false);
 	dma_unmap_sg(&host->pdev->dev, host->sg_ptr, host->sg_len, dir);
 
+	if (dir == DMA_FROM_DEVICE)
+		clear_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags);
+
 	tmio_mmc_do_data_irq(host);
 out:
 	spin_unlock_irq(&host->lock);
@@ -251,18 +272,24 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
  * implementation as others may use a different implementation.
  */
 static const struct soc_device_attribute gen3_soc_whitelist[] = {
-        { .soc_id = "r8a7795", .revision = "ES1.*" },
-        { .soc_id = "r8a7795", .revision = "ES2.0" },
-        { .soc_id = "r8a7796", .revision = "ES1.0" },
-        { .soc_id = "r8a77995", .revision = "ES1.0" },
-        { /* sentinel */ }
+	{ .soc_id = "r8a7795", .revision = "ES1.*",
+	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
+	{ .soc_id = "r8a7795", .revision = "ES2.0" },
+	{ .soc_id = "r8a7796", .revision = "ES1.0",
+	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
+	{ .soc_id = "r8a77995", .revision = "ES1.0" },
+	{ /* sentinel */ }
 };
 
 static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
 {
-	if (!soc_device_match(gen3_soc_whitelist))
+	const struct soc_device_attribute *soc = soc_device_match(gen3_soc_whitelist);
+
+	if (!soc)
 		return -ENODEV;
 
+	global_flags |= (unsigned long)soc->data;
+
 	return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops);
 }
 
-- 
2.11.0
