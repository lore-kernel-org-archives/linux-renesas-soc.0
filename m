Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:22611 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751468AbdBFMcT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Feb 2017 07:32:19 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <vinod.koul@intel.com>
CC: <dmaengine@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dmaengine: rcar: Fix release resources after interrupt process
Date: Mon, 6 Feb 2017 21:30:14 +0900
Message-ID: <1486384214-23580-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>

This patch fixes the problem that occasionally released resources
before the end of interrupt processing.

[   58.156412] Unable to handle kernel NULL pointer dereference at virtual
 address 00000000
[   58.166155] pgd = ffff8006f78b0000
[   58.169822] [00000000] *pgd=000000073773b003 , *pud=0000000737c70003 ,
 *pmd=0000000000000000
[   58.179738]
[   58.181548] Internal error: Oops: 96000046 [#1] PREEMPT SMP
[   58.187484] Modules linked in:
[   58.190919] CPU: 0 PID: 2898 Comm: dma_ioctl Not tainted 4.9.0-00002-g501
07f2-dirty #147
[   58.199438] Hardware name: Renesas Salvator-X board based on r8a7795 (DT)
[   58.206680] task: ffff8006f77b1900 task.stack: ffff8006f7bd4000
[   58.213090] PC is at rcar_dmac_chan_prep_sg+0xa4/0x3f0
[   58.218725] LR is at rcar_dmac_chan_prep_sg+0x6c/0x3f0

Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/dma/sh/rcar-dmac.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 2e441d0..2e0a0d4 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -986,8 +986,11 @@ static void rcar_dmac_free_chan_resources(struct dma_chan *chan)
 {
 	struct rcar_dmac_chan *rchan = to_rcar_dmac_chan(chan);
 	struct rcar_dmac *dmac = to_rcar_dmac(chan->device);
+	struct platform_device *pdev = to_platform_device(dmac->dev);
 	struct rcar_dmac_desc_page *page, *_page;
 	struct rcar_dmac_desc *desc;
+	int irq;
+	char pdev_irqname[5];
 	LIST_HEAD(list);
 
 	/* Protect against ISR */
@@ -995,6 +998,14 @@ static void rcar_dmac_free_chan_resources(struct dma_chan *chan)
 	rcar_dmac_chan_halt(rchan);
 	spin_unlock_irq(&rchan->lock);
 
+	sprintf(pdev_irqname, "ch%u", rchan->index);
+	irq = platform_get_irq_byname(pdev, pdev_irqname);
+	if (irq < 0) {
+		dev_err(dmac->dev, "no IRQ specified for channel %u\n",
+			rchan->index);
+		return;
+	}
+	synchronize_irq(irq);
 	/* Now no new interrupts will occur */
 
 	if (rchan->mid_rid >= 0) {
-- 
1.9.1
