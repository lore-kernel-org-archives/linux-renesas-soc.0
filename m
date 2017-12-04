Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:54804 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752861AbdLDOSU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 09:18:20 -0500
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 2/2] net: sh_eth: make work on big endian systems
Date: Mon,  4 Dec 2017 15:17:44 +0100
Message-Id: <20171204141744.18599-3-thomas.petazzoni@free-electrons.com>
In-Reply-To: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
References: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The sh_eth driver uses cpu_to_le32() and le32_to_cpu() to manipulate
the fields of the DMA descriptors, making the assumption that the DMA
descriptors are little-endian.

However, testing on the Renesas SH7786 running in big-endian mode
reveals that the DMA descriptors are also big-endian when running
big-endian. Therefore, all the endianness conversion needs to be
removed for the sh_eth driver to work.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Note: I see that Sergei Shtylyov has done some work around endianness
on this driver back in 2015. I am not sure if it's used on other
non-SuperH platforms in platforms where the CPU might run big-endian
but the IP still be little-endian. If this is the case, then we would
need a different approach and more discussion.

Therefore, it would be useful to wait for an ACK from Sergei before
applying this patch.
---
 drivers/net/ethernet/renesas/sh_eth.c | 64 ++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index a3c48b2a713c..0de8fae143ab 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -1163,31 +1163,29 @@ static int sh_eth_tx_free(struct net_device *ndev, bool sent_only)
 	for (; mdp->cur_tx - mdp->dirty_tx > 0; mdp->dirty_tx++) {
 		entry = mdp->dirty_tx % mdp->num_tx_ring;
 		txdesc = &mdp->tx_ring[entry];
-		sent = !(txdesc->status & cpu_to_le32(TD_TACT));
+		sent = !(txdesc->status & TD_TACT);
 		if (sent_only && !sent)
 			break;
 		/* TACT bit must be checked before all the following reads */
 		dma_rmb();
 		netif_info(mdp, tx_done, ndev,
 			   "tx entry %d status 0x%08x\n",
-			   entry, le32_to_cpu(txdesc->status));
+			   entry, txdesc->status);
 		/* Free the original skb. */
 		if (mdp->tx_skbuff[entry]) {
-			dma_unmap_single(&mdp->pdev->dev,
-					 le32_to_cpu(txdesc->addr),
-					 le32_to_cpu(txdesc->len) >> 16,
-					 DMA_TO_DEVICE);
+			dma_unmap_single(&mdp->pdev->dev, txdesc->addr,
+					 txdesc->len >> 16, DMA_TO_DEVICE);
 			dev_kfree_skb_irq(mdp->tx_skbuff[entry]);
 			mdp->tx_skbuff[entry] = NULL;
 			free_num++;
 		}
-		txdesc->status = cpu_to_le32(TD_TFP);
+		txdesc->status = TD_TFP;
 		if (entry >= mdp->num_tx_ring - 1)
-			txdesc->status |= cpu_to_le32(TD_TDLE);
+			txdesc->status |= TD_TDLE;
 
 		if (sent) {
 			ndev->stats.tx_packets++;
-			ndev->stats.tx_bytes += le32_to_cpu(txdesc->len) >> 16;
+			ndev->stats.tx_bytes += txdesc->len >> 16;
 		}
 	}
 	return free_num;
@@ -1204,8 +1202,7 @@ static void sh_eth_ring_free(struct net_device *ndev)
 			if (mdp->rx_skbuff[i]) {
 				struct sh_eth_rxdesc *rxdesc = &mdp->rx_ring[i];
 
-				dma_unmap_single(&mdp->pdev->dev,
-						 le32_to_cpu(rxdesc->addr),
+				dma_unmap_single(&mdp->pdev->dev, rxdesc->addr,
 						 ALIGN(mdp->rx_buf_sz, 32),
 						 DMA_FROM_DEVICE);
 			}
@@ -1280,9 +1277,9 @@ static void sh_eth_ring_format(struct net_device *ndev)
 
 		/* RX descriptor */
 		rxdesc = &mdp->rx_ring[i];
-		rxdesc->len = cpu_to_le32(buf_len << 16);
-		rxdesc->addr = cpu_to_le32(dma_addr);
-		rxdesc->status = cpu_to_le32(RD_RACT | RD_RFP);
+		rxdesc->len = buf_len << 16;
+		rxdesc->addr = dma_addr;
+		rxdesc->status = RD_RACT | RD_RFP;
 
 		/* Rx descriptor address set */
 		if (i == 0) {
@@ -1297,7 +1294,7 @@ static void sh_eth_ring_format(struct net_device *ndev)
 
 	/* Mark the last entry as wrapping the ring. */
 	if (rxdesc)
-		rxdesc->status |= cpu_to_le32(RD_RDLE);
+		rxdesc->status |= RD_RDLE;
 
 	memset(mdp->tx_ring, 0, tx_ringsize);
 
@@ -1305,8 +1302,8 @@ static void sh_eth_ring_format(struct net_device *ndev)
 	for (i = 0; i < mdp->num_tx_ring; i++) {
 		mdp->tx_skbuff[i] = NULL;
 		txdesc = &mdp->tx_ring[i];
-		txdesc->status = cpu_to_le32(TD_TFP);
-		txdesc->len = cpu_to_le32(0);
+		txdesc->status = TD_TFP;
+		txdesc->len = 0;
 		if (i == 0) {
 			/* Tx descriptor address set */
 			sh_eth_write(ndev, mdp->tx_desc_dma, TDLAR);
@@ -1316,7 +1313,7 @@ static void sh_eth_ring_format(struct net_device *ndev)
 		}
 	}
 
-	txdesc->status |= cpu_to_le32(TD_TDLE);
+	txdesc->status |= TD_TDLE;
 }
 
 /* Get skb and descriptor buffer */
@@ -1462,7 +1459,7 @@ static void sh_eth_dev_exit(struct net_device *ndev)
 	 * packet boundary if it's currently running
 	 */
 	for (i = 0; i < mdp->num_tx_ring; i++)
-		mdp->tx_ring[i].status &= ~cpu_to_le32(TD_TACT);
+		mdp->tx_ring[i].status &= ~TD_TACT;
 
 	/* Disable TX FIFO egress to MAC */
 	sh_eth_rcv_snd_disable(ndev);
@@ -1502,11 +1499,11 @@ static int sh_eth_rx(struct net_device *ndev, u32 intr_status, int *quota)
 	boguscnt = min(boguscnt, *quota);
 	limit = boguscnt;
 	rxdesc = &mdp->rx_ring[entry];
-	while (!(rxdesc->status & cpu_to_le32(RD_RACT))) {
+	while (!(rxdesc->status & RD_RACT)) {
 		/* RACT bit must be checked before all the following reads */
 		dma_rmb();
-		desc_status = le32_to_cpu(rxdesc->status);
-		pkt_len = le32_to_cpu(rxdesc->len) & RD_RFL;
+		desc_status = rxdesc->status;
+		pkt_len = rxdesc->len & RD_RFL;
 
 		if (--boguscnt < 0)
 			break;
@@ -1544,7 +1541,7 @@ static int sh_eth_rx(struct net_device *ndev, u32 intr_status, int *quota)
 			if (desc_status & RD_RFS10)
 				ndev->stats.rx_over_errors++;
 		} else	if (skb) {
-			dma_addr = le32_to_cpu(rxdesc->addr);
+			dma_addr = rxdesc->addr;
 			if (!mdp->cd->hw_swap)
 				sh_eth_soft_swap(
 					phys_to_virt(ALIGN(dma_addr, 4)),
@@ -1573,7 +1570,7 @@ static int sh_eth_rx(struct net_device *ndev, u32 intr_status, int *quota)
 		rxdesc = &mdp->rx_ring[entry];
 		/* The size of the buffer is 32 byte boundary. */
 		buf_len = ALIGN(mdp->rx_buf_sz, 32);
-		rxdesc->len = cpu_to_le32(buf_len << 16);
+		rxdesc->len = buf_len << 16;
 
 		if (mdp->rx_skbuff[entry] == NULL) {
 			skb = netdev_alloc_skb(ndev, skbuff_size);
@@ -1589,14 +1586,13 @@ static int sh_eth_rx(struct net_device *ndev, u32 intr_status, int *quota)
 			mdp->rx_skbuff[entry] = skb;
 
 			skb_checksum_none_assert(skb);
-			rxdesc->addr = cpu_to_le32(dma_addr);
+			rxdesc->addr = dma_addr;
 		}
 		dma_wmb(); /* RACT bit must be set after all the above writes */
 		if (entry >= mdp->num_rx_ring - 1)
-			rxdesc->status |=
-				cpu_to_le32(RD_RACT | RD_RFP | RD_RDLE);
+			rxdesc->status |= RD_RACT | RD_RFP | RD_RDLE;
 		else
-			rxdesc->status |= cpu_to_le32(RD_RACT | RD_RFP);
+			rxdesc->status |= RD_RACT | RD_RFP;
 	}
 
 	/* Restart Rx engine if stopped. */
@@ -2426,8 +2422,8 @@ static void sh_eth_tx_timeout(struct net_device *ndev)
 	/* Free all the skbuffs in the Rx queue. */
 	for (i = 0; i < mdp->num_rx_ring; i++) {
 		rxdesc = &mdp->rx_ring[i];
-		rxdesc->status = cpu_to_le32(0);
-		rxdesc->addr = cpu_to_le32(0xBADF00D0);
+		rxdesc->status = 0;
+		rxdesc->addr = 0xBADF00D0;
 		dev_kfree_skb(mdp->rx_skbuff[i]);
 		mdp->rx_skbuff[i] = NULL;
 	}
@@ -2477,14 +2473,14 @@ static int sh_eth_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 		kfree_skb(skb);
 		return NETDEV_TX_OK;
 	}
-	txdesc->addr = cpu_to_le32(dma_addr);
-	txdesc->len  = cpu_to_le32(skb->len << 16);
+	txdesc->addr = dma_addr;
+	txdesc->len  = skb->len << 16;
 
 	dma_wmb(); /* TACT bit must be set after all the above writes */
 	if (entry >= mdp->num_tx_ring - 1)
-		txdesc->status |= cpu_to_le32(TD_TACT | TD_TDLE);
+		txdesc->status |= TD_TACT | TD_TDLE;
 	else
-		txdesc->status |= cpu_to_le32(TD_TACT);
+		txdesc->status |= TD_TACT;
 
 	mdp->cur_tx++;
 
-- 
2.13.6
