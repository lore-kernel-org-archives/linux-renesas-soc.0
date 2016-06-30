Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:54540 "EHLO
	smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932421AbcF3PZJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 11:25:09 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: vinod.koul@intel.com, geert+renesas@glider.be,
	laurent.pinchart+renesas@ideasonboard.com, mfarooq@visteon.com,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 3/4] dmaengine: rcar-dmac: Fixed active descriptor initializing
Date: Thu, 30 Jun 2016 17:15:17 +0200
Message-Id: <20160630151518.32329-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20160630151518.32329-1-niklas.soderlund+renesas@ragnatech.se>
References: <20160630151518.32329-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Muhammad Hamza Farooq <mfarooq@visteon.com>

Running descriptor pointer is set to NULL upon freeing resources. Other-
wise, rcar_dmac_issue_pending might not start new transfers

Signed-off-by: Muhammad Hamza Farooq <mfarooq@visteon.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/dma/sh/rcar-dmac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 7f26576..59951fb 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -990,6 +990,8 @@ static void rcar_dmac_free_chan_resources(struct dma_chan *chan)
 	list_splice_init(&rchan->desc.done, &list);
 	list_splice_init(&rchan->desc.wait, &list);
 
+	rchan->desc.running = NULL;
+
 	list_for_each_entry(desc, &list, node)
 		rcar_dmac_realloc_hwdesc(rchan, desc, 0);
 
-- 
2.9.0
