Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:45691 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753119AbdC1WmI (ORCPT
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
Subject: [PATCH 3/3] dmaengine: rcar-dmac: wait for ISR to finish before freeing resources
Date: Wed, 29 Mar 2017 00:40:35 +0200
Message-Id: <20170328224035.8040-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20170328224035.8040-1-niklas.soderlund+renesas@ragnatech.se>
References: <20170328224035.8040-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This fixes a race condition where the channel resources could be freed
before the ISR had finished running resulting in a NULL pointer
reference from the ISR.

[  167.148934] Unable to handle kernel NULL pointer dereference at virtual address 00000000
[  167.157051] pgd = ffff80003c641000
[  167.160449] [00000000] *pgd=000000007c507003, *pud=000000007c4ff003, *pmd=0000000000000000
[  167.168719] Internal error: Oops: 96000046 [#1] PREEMPT SMP
[  167.174289] Modules linked in:
[  167.177348] CPU: 3 PID: 10547 Comm: dma_ioctl Not tainted 4.11.0-rc1-00001-g8d92afddc2f6633a #73
[  167.186131] Hardware name: Renesas Salvator-X board based on r8a7795 (DT)
[  167.192917] task: ffff80003a411a00 task.stack: ffff80003bcd4000
[  167.198850] PC is at rcar_dmac_chan_prep_sg+0xe0/0x400
[  167.203985] LR is at rcar_dmac_chan_prep_sg+0x48/0x400

Based of previous work by:
    Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/dma/sh/rcar-dmac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 4b90deb40d559bed..0ec63600ebcc3a27 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -998,7 +998,11 @@ static void rcar_dmac_free_chan_resources(struct dma_chan *chan)
 	rcar_dmac_chan_halt(rchan);
 	spin_unlock_irq(&rchan->lock);
 
-	/* Now no new interrupts will occur */
+	/*
+	 * Now no new interrupts will occur, but one might already be
+	 * running. Wait for it to finish before freeing resources.
+	 */
+	synchronize_irq(rchan->irq);
 
 	if (rchan->mid_rid >= 0) {
 		/* The caller is holding dma_list_mutex */
-- 
2.12.0
