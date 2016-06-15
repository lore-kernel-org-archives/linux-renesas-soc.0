Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:48145 "EHLO
	smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753100AbcFOLVb (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 07:21:31 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: vinod.koul@intel.com, geert+renesas@glider.be,
	laurent.pinchart+renesas@ideasonboard.com, mfarooq@visteon.com,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/4] dma: rcar-dma: use result of updated get_residue in tx_status
Date: Wed, 15 Jun 2016 13:13:05 +0200
Message-Id: <20160615111308.28739-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20160615111308.28739-1-niklas.soderlund+renesas@ragnatech.se>
References: <20160615111308.28739-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Muhammad Hamza Farooq <mfarooq@visteon.com>

The hardware might have complete the transfer but the interrupt handler
might not have had a chance to run. If rcar_dmac_chan_get_residue()
which reads HW registers finds that there is no residue return
DMA_COMPLETE.

Signed-off-by: Muhammad Hamza Farooq <mfarooq@visteon.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[Niklas: add explanation in commit message]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/dma/sh/rcar-dmac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index dfb1792..791a064 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1202,6 +1202,10 @@ static enum dma_status rcar_dmac_tx_status(struct dma_chan *chan,
 	residue = rcar_dmac_chan_get_residue(rchan, cookie);
 	spin_unlock_irqrestore(&rchan->lock, flags);
 
+	/* if there's no residue, the cookie is complete */
+	if (!residue)
+		return DMA_COMPLETE;
+
 	dma_set_residue(txstate, residue);
 
 	return status;
-- 
2.8.3
