Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:7803 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933470AbeGBJWz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 05:22:55 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: vinod.koul@intel.com
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] dma: sh: rcar-dmac: add a new function to clear CHCR.DE with barrier
Date: Mon,  2 Jul 2018 18:21:51 +0900
Message-Id: <1530523312-2253-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1530523312-2253-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1530523312-2253-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds a new function rcar_dmac_clear_chcr_de() to simplify
adding pause function later.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/dma/sh/rcar-dmac.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 279c930..afd8c7b 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -762,18 +762,25 @@ static void rcar_dmac_chcr_de_barrier(struct rcar_dmac_chan *chan)
 	dev_err(chan->chan.device->dev, "CHCR DE check error\n");
 }
 
-static void rcar_dmac_sync_tcr(struct rcar_dmac_chan *chan)
+static void rcar_dmac_clear_chcr_de(struct rcar_dmac_chan *chan)
 {
 	u32 chcr = rcar_dmac_chan_read(chan, RCAR_DMACHCR);
 
-	if (!(chcr & RCAR_DMACHCR_DE))
-		return;
-
 	/* set DE=0 and flush remaining data */
 	rcar_dmac_chan_write(chan, RCAR_DMACHCR, (chcr & ~RCAR_DMACHCR_DE));
 
 	/* make sure all remaining data was flushed */
 	rcar_dmac_chcr_de_barrier(chan);
+}
+
+static void rcar_dmac_sync_tcr(struct rcar_dmac_chan *chan)
+{
+	u32 chcr = rcar_dmac_chan_read(chan, RCAR_DMACHCR);
+
+	if (!(chcr & RCAR_DMACHCR_DE))
+		return;
+
+	rcar_dmac_clear_chcr_de(chan);
 
 	/* back DE */
 	rcar_dmac_chan_write(chan, RCAR_DMACHCR, chcr);
-- 
1.9.1
