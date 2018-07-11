Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:35658 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732284AbeGKCNT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jul 2018 22:13:19 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: vinod.koul@intel.com
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] dmaengine: sh: rcar-dmac: Add dma_pause operation
Date: Wed, 11 Jul 2018 11:10:16 +0900
Message-Id: <1531275016-9809-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1531275016-9809-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1531275016-9809-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds dma_pause operation. This patch is based on
Muhammad Hamza Farooq's patch.

After this patch applied, an issue that the sh-sci driver with
high baud rate might cause data lost disappeared because the DMAC
is possible to transmit between [1] and [2] below, and then
the residue of [1] is not true:

In rx_timer_fn() of the sh-sci.c:
	dmaengine_pause();
	...
	dmaengine_tx_status();		/* [1] */
	...
	dmaengine_terminate_all();	/* [2] */

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/dma/sh/rcar-dmac.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index d3b7388..be82d69 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -834,6 +834,17 @@ static void rcar_dmac_stop_all_chan(struct rcar_dmac *dmac)
 	}
 }
 
+static int rcar_dmac_chan_pause(struct dma_chan *chan)
+{
+	unsigned long flags;
+	struct rcar_dmac_chan *rchan = to_rcar_dmac_chan(chan);
+
+	spin_lock_irqsave(&rchan->lock, flags);
+	rcar_dmac_clear_chcr_de(rchan);
+	spin_unlock_irqrestore(&rchan->lock, flags);
+
+	return 0;
+}
 
 /* -----------------------------------------------------------------------------
  * Descriptors preparation
@@ -1864,6 +1875,7 @@ static int rcar_dmac_probe(struct platform_device *pdev)
 	engine->device_prep_slave_sg		= rcar_dmac_prep_slave_sg;
 	engine->device_prep_dma_cyclic		= rcar_dmac_prep_dma_cyclic;
 	engine->device_config			= rcar_dmac_device_config;
+	engine->device_pause			= rcar_dmac_chan_pause;
 	engine->device_terminate_all		= rcar_dmac_chan_terminate_all;
 	engine->device_tx_status		= rcar_dmac_tx_status;
 	engine->device_issue_pending		= rcar_dmac_issue_pending;
-- 
1.9.1
