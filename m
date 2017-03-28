Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:45677 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753237AbdC1WmI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 18:42:08 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] dmaengine: rcar-dmac: store channel IRQ in struct rcar_dmac_chan
Date: Wed, 29 Mar 2017 00:40:33 +0200
Message-Id: <20170328224035.8040-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20170328224035.8040-1-niklas.soderlund+renesas@ragnatech.se>
References: <20170328224035.8040-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The IRQ number is needed after probe to be able to add synchronisation
points in other places in the driver when freeing resources and to
implement a device_synchronize() callback. Store the IRQ number in the
struct rcar_dmac_chan so that it can be used later.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/dma/sh/rcar-dmac.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 48b22d5c86026098..3038654f11b5c6ed 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -144,6 +144,7 @@ struct rcar_dmac_chan_map {
  * @chan: base DMA channel object
  * @iomem: channel I/O memory base
  * @index: index of this channel in the controller
+ * @irq: channel IRQ
  * @src: slave memory address and size on the source side
  * @dst: slave memory address and size on the destination side
  * @mid_rid: hardware MID/RID for the DMA client using this channel
@@ -161,6 +162,7 @@ struct rcar_dmac_chan {
 	struct dma_chan chan;
 	void __iomem *iomem;
 	unsigned int index;
+	int irq;
 
 	struct rcar_dmac_chan_slave src;
 	struct rcar_dmac_chan_slave dst;
@@ -1635,7 +1637,6 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
 	struct dma_chan *chan = &rchan->chan;
 	char pdev_irqname[5];
 	char *irqname;
-	int irq;
 	int ret;
 
 	rchan->index = index;
@@ -1652,8 +1653,8 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
 
 	/* Request the channel interrupt. */
 	sprintf(pdev_irqname, "ch%u", index);
-	irq = platform_get_irq_byname(pdev, pdev_irqname);
-	if (irq < 0) {
+	rchan->irq = platform_get_irq_byname(pdev, pdev_irqname);
+	if (rchan->irq < 0) {
 		dev_err(dmac->dev, "no IRQ specified for channel %u\n", index);
 		return -ENODEV;
 	}
@@ -1663,11 +1664,13 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
 	if (!irqname)
 		return -ENOMEM;
 
-	ret = devm_request_threaded_irq(dmac->dev, irq, rcar_dmac_isr_channel,
+	ret = devm_request_threaded_irq(dmac->dev, rchan->irq,
+					rcar_dmac_isr_channel,
 					rcar_dmac_isr_channel_thread, 0,
 					irqname, rchan);
 	if (ret) {
-		dev_err(dmac->dev, "failed to request IRQ %u (%d)\n", irq, ret);
+		dev_err(dmac->dev, "failed to request IRQ %u (%d)\n",
+			rchan->irq, ret);
 		return ret;
 	}
 
-- 
2.12.0
