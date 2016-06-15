Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:48171 "EHLO
	smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753101AbcFOLVd (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 07:21:33 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: vinod.koul@intel.com, geert+renesas@glider.be,
	laurent.pinchart+renesas@ideasonboard.com, mfarooq@visteon.com,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/4] dmaengine: rcar-dmac: Fix residue reporting for pending descriptors
Date: Wed, 15 Jun 2016 13:13:08 +0200
Message-Id: <20160615111308.28739-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20160615111308.28739-1-niklas.soderlund+renesas@ragnatech.se>
References: <20160615111308.28739-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Cookies corresponding to pending transfers have a residue value equal to
the full size of the corresponding descriptor. The driver miscomputes
that and uses the size of the active descriptor instead. Fix it.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
[geert: Also check desc.active list]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/dma/sh/rcar-dmac.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 59951fb..86aef28 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1145,19 +1145,47 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 	struct rcar_dmac_desc *desc = chan->desc.running;
 	struct rcar_dmac_xfer_chunk *running = NULL;
 	struct rcar_dmac_xfer_chunk *chunk;
+	enum dma_status status;
 	unsigned int residue = 0;
 	unsigned int dptr = 0;
 
 	if (!desc)
 		return 0;
 
+
+	/*
+	 * If the cookie corresponds to a descriptor that has been completed
+	 * there is no residue. The same check has already been performed by the
+	 * caller but without holding the channel lock, so the descriptor could
+	 * now be complete.
+	 */
+	status = dma_cookie_status(&chan->chan, cookie, NULL);
+	if (status == DMA_COMPLETE)
+		return 0;
+
 	/*
 	 * If the cookie doesn't correspond to the currently running transfer
 	 * then the descriptor hasn't been processed yet, and the residue is
 	 * equal to the full descriptor size.
 	 */
-	if (cookie != desc->async_tx.cookie)
-		return desc->size;
+	if (cookie != desc->async_tx.cookie) {
+		list_for_each_entry(desc, &chan->desc.pending, node) {
+			if (cookie == desc->async_tx.cookie)
+				return desc->size;
+		}
+		list_for_each_entry(desc, &chan->desc.active, node) {
+			if (cookie == desc->async_tx.cookie)
+				return desc->size;
+		}
+
+		/*
+		 * No descriptor found for the cookie, there's thus no residue.
+		 * This shouldn't happen if the calling driver passes a correct
+		 * cookie value.
+		 */
+		WARN(1, "No descriptor for cookie!");
+		return 0;
+	}
 
 	/*
 	 * In descriptor mode the descriptor running pointer is not maintained
-- 
2.8.3
