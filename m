Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:54541 "EHLO
	smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932451AbcF3PZJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 11:25:09 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: vinod.koul@intel.com, geert+renesas@glider.be,
	laurent.pinchart+renesas@ideasonboard.com, mfarooq@visteon.com,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 2/4] dmaengine: rcar-dmac: warn if transfer cannot start as TE = 1
Date: Thu, 30 Jun 2016 17:15:16 +0200
Message-Id: <20160630151518.32329-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20160630151518.32329-1-niklas.soderlund+renesas@ragnatech.se>
References: <20160630151518.32329-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The documentation states one should make sure both DE and TE are cleared
before starting a transaction. This patch extends the current warning to
look at both DE and TE.

Based on previous work from Muhammad Hamza Farooq.

Suggested-by: Muhammad Hamza Farooq <mfarooq@visteon.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/dma/sh/rcar-dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 791a064..7f26576 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -311,7 +311,7 @@ static bool rcar_dmac_chan_is_busy(struct rcar_dmac_chan *chan)
 {
 	u32 chcr = rcar_dmac_chan_read(chan, RCAR_DMACHCR);
 
-	return (chcr & (RCAR_DMACHCR_DE | RCAR_DMACHCR_TE)) == RCAR_DMACHCR_DE;
+	return !!(chcr & (RCAR_DMACHCR_DE | RCAR_DMACHCR_TE));
 }
 
 static void rcar_dmac_chan_start_xfer(struct rcar_dmac_chan *chan)
-- 
2.9.0
