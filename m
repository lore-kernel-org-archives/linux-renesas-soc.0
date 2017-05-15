Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:42974 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752516AbdEOXLn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 19:11:43 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/3] dmaengine: rcar-dmac: store channel IRQ in struct rcar_dmac_chan
Date: Tue, 16 May 2017 01:09:15 +0200
Message-Id: <20170515230917.31888-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20170515230917.31888-1-niklas.soderlund+renesas@ragnatech.se>
References: <20170515230917.31888-1-niklas.soderlund+renesas@ragnatech.se>
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
index db41795fe42ae6ed..c68c3336bdad44df 100644
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
@@ -1647,7 +1649,6 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
 	struct dma_chan *chan = &rchan->chan;
 	char pdev_irqname[5];
 	char *irqname;
-	int irq;
 	int ret;
 
 	rchan->index = index;
@@ -1664,8 +1665,8 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
 
 	/* Request the channel interrupt. */
 	sprintf(pdev_irqname, "ch%u", index);
-	irq = platform_get_irq_byname(pdev, pdev_irqname);
-	if (irq < 0) {
+	rchan->irq = platform_get_irq_byname(pdev, pdev_irqname);
+	if (rchan->irq < 0) {
 		dev_err(dmac->dev, "no IRQ specified for channel %u\n", index);
 		return -ENODEV;
 	}
@@ -1675,11 +1676,13 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
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
2.13.0
