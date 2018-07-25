Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:25073 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728357AbeGYJi6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 05:38:58 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: vinod.koul@intel.com
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dmaengine: sh: rcar-dmac: Should not stop the DMAC by rcar_dmac_sync_tcr()
Date: Wed, 25 Jul 2018 17:27:04 +0900
Message-Id: <1532507224-4213-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

rcar_dmac_chan_get_residue() should not stop the DMAC, because
the commit 538603c6026c ("dmaengine: sh: rcar-dmac: avoid to write
CHCR.TE to 1 if TCR is set to 0") had fixed unexpected re-transferring
issue. But it had caused the next issue which might stop the cyclic
mode transferring. Thus, for example R-Car sound might be stopped
suddenly.

According to the commit 73a47bd0da66 ("dmaengine: rcar-dmac: use TCRB
instead of TCR for residue"), the purpose of clearing CHCR.DE bit is
flushing buffered data to calculate the exact residue.

Such the "exact" residue had been required by sh-sci driver. sh-sci
driver is calling dmaengine_pause() to stop transferring, and get
"exact" residue. Otherwise, it might receive extra data during
getting residue without pausing.

In rx_timer_fn() of sh-sci driver:
	dmaengine_tx_status();		/* For checking roughly */
 	dmaengine_pause();
	dmaengine_tx_status();		/* For getting residue */
	dmaengine_terminate_all();

But, unfortunately the rcar-dmac driver didn't support dmaengine_pause()
at that time. So, the sh-sci driver cannot get the "exact" residue
without stopping the transferring, because rcar-dmac is buffering data
inside.

Because of these backgrounds, rcar-dmac had been cleared/set CHCR.DE
bit in rcar_dmac_chan_get_residue() to synchronizing data and getting
"exact" residue.

However, rcar-dmac driver has rcar_dmac_chan_pause() now, and clearing
CHCR.DE bit in rcar_dmac_chan_get_residue() doesn't need anymore.
So, this patch removes the rcar_dmac_sync_tcr().

Fixes: 73a47bd0da66 ("dmaengine: rcar-dmac: use TCRB instead of TCR for residue")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
---
 drivers/dma/sh/rcar-dmac.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index be82d69..48ee35e 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -770,20 +770,6 @@ static void rcar_dmac_clear_chcr_de(struct rcar_dmac_chan *chan)
 	rcar_dmac_chcr_de_barrier(chan);
 }
 
-static void rcar_dmac_sync_tcr(struct rcar_dmac_chan *chan)
-{
-	u32 chcr = rcar_dmac_chan_read(chan, RCAR_DMACHCR);
-
-	if (!(chcr & RCAR_DMACHCR_DE))
-		return;
-
-	rcar_dmac_clear_chcr_de(chan);
-
-	/* back DE if remain data exists */
-	if (rcar_dmac_chan_read(chan, RCAR_DMATCR))
-		rcar_dmac_chan_write(chan, RCAR_DMACHCR, chcr);
-}
-
 static void rcar_dmac_chan_halt(struct rcar_dmac_chan *chan)
 {
 	u32 chcr = rcar_dmac_chan_read(chan, RCAR_DMACHCR);
@@ -1367,9 +1353,6 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 		residue += chunk->size;
 	}
 
-	if (desc->direction == DMA_DEV_TO_MEM)
-		rcar_dmac_sync_tcr(chan);
-
 	/* Add the residue for the current chunk. */
 	residue += rcar_dmac_chan_read(chan, RCAR_DMATCRB) << desc->xfer_shift;
 
-- 
1.9.1
