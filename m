Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:45685 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753379AbdC1WmJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 18:42:09 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] dmaengine: rcar-dmac: implement device_synchronize()
Date: Wed, 29 Mar 2017 00:40:34 +0200
Message-Id: <20170328224035.8040-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20170328224035.8040-1-niklas.soderlund+renesas@ragnatech.se>
References: <20170328224035.8040-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Implement the device_synchronize() callback which wait until a dma
channel is stopped to provide a synchronization point.

This protects the driver from multiple race conditions when terminating
and freeing resources. E.g. the completion callback still running after
device_terminate_all() has completed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/dma/sh/rcar-dmac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 3038654f11b5c6ed..4b90deb40d559bed 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1353,6 +1353,13 @@ static void rcar_dmac_issue_pending(struct dma_chan *chan)
 	spin_unlock_irqrestore(&rchan->lock, flags);
 }
 
+static void rcar_dmac_device_synchronize(struct dma_chan *chan)
+{
+	struct rcar_dmac_chan *rchan = to_rcar_dmac_chan(chan);
+
+	synchronize_irq(rchan->irq);
+}
+
 /* -----------------------------------------------------------------------------
  * IRQ handling
  */
@@ -1834,6 +1841,7 @@ static int rcar_dmac_probe(struct platform_device *pdev)
 	engine->device_terminate_all = rcar_dmac_chan_terminate_all;
 	engine->device_tx_status = rcar_dmac_tx_status;
 	engine->device_issue_pending = rcar_dmac_issue_pending;
+	engine->device_synchronize = rcar_dmac_device_synchronize;
 
 	ret = dma_async_device_register(engine);
 	if (ret < 0)
-- 
2.12.0
