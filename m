Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:43245 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966410AbdAKOjw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 09:39:52 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Vinod Koul <vinod.koul@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] dmaengine: rcar-dmac: unmap slave resource when channel is freed
Date: Wed, 11 Jan 2017 15:39:31 +0100
Message-Id: <20170111143931.9611-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The slave mapping should be removed together with other channel
resources when the channel is freed. If it's not unmapped it will hang
around forever after the channel is freed.

Fixes: 9f878603dbdb7db3 ("dmaengine: rcar-dmac: add iommu support for slave transfers")
Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/dma/sh/rcar-dmac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 2e441d0ccd79..4c357d475465 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -986,6 +986,7 @@ static void rcar_dmac_free_chan_resources(struct dma_chan *chan)
 {
 	struct rcar_dmac_chan *rchan = to_rcar_dmac_chan(chan);
 	struct rcar_dmac *dmac = to_rcar_dmac(chan->device);
+	struct rcar_dmac_chan_map *map = &rchan->map;
 	struct rcar_dmac_desc_page *page, *_page;
 	struct rcar_dmac_desc *desc;
 	LIST_HEAD(list);
@@ -1019,6 +1020,13 @@ static void rcar_dmac_free_chan_resources(struct dma_chan *chan)
 		free_page((unsigned long)page);
 	}
 
+	/* Remove slave mapping if present. */
+	if (map->slave.xfer_size) {
+		dma_unmap_resource(chan->device->dev, map->addr,
+				   map->slave.xfer_size, map->dir, 0);
+		map->slave.xfer_size = 0;
+	}
+
 	pm_runtime_put(chan->device->dev);
 }
 
-- 
2.11.0
