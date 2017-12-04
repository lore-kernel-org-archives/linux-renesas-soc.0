Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:52435 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753978AbdLDNjI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 08:39:08 -0500
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 1/2] net: sh_eth: use correct "struct device" when calling DMA mapping functions
Date: Mon,  4 Dec 2017 14:33:26 +0100
Message-Id: <20171204133327.3505-2-thomas.petazzoni@free-electrons.com>
In-Reply-To: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com>
References: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

There are two types of "struct device": the one representing the
physical device on its physical bus (platform, SPI, PCI, etc.), and
the one representing the logical device in its device class (net,
etc.).

The DMA mapping API expects to receive as argument a "struct device"
representing the physical device, as the "struct device" contains
information about the bus that the DMA API needs.

However, the sh_eth driver mistakenly uses the "struct device"
representing the logical device (embedded in "struct net_device")
rather than the "struct device" representing the physical device on
its bus.

This commit fixes that by adjusting all calls to the DMA mapping API.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 7e060aa9fbed..91e918e654fe 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -1149,7 +1149,8 @@ static int sh_eth_tx_free(struct net_device *ndev, bool sent_only)
 			   entry, le32_to_cpu(txdesc->status));
 		/* Free the original skb. */
 		if (mdp->tx_skbuff[entry]) {
-			dma_unmap_single(&ndev->dev, le32_to_cpu(txdesc->addr),
+			dma_unmap_single(&mdp->pdev->dev,
+					 le32_to_cpu(txdesc->addr),
 					 le32_to_cpu(txdesc->len) >> 16,
 					 DMA_TO_DEVICE);
 			dev_kfree_skb_irq(mdp->tx_skbuff[entry]);
@@ -1179,7 +1180,7 @@ static void sh_eth_ring_free(struct net_device *ndev)
 			if (mdp->rx_skbuff[i]) {
 				struct sh_eth_rxdesc *rxdesc = &mdp->rx_ring[i];
 
-				dma_unmap_single(&ndev->dev,
+				dma_unmap_single(&mdp->pdev->dev,
 						 le32_to_cpu(rxdesc->addr),
 						 ALIGN(mdp->rx_buf_sz, 32),
 						 DMA_FROM_DEVICE);
@@ -1245,9 +1246,9 @@ static void sh_eth_ring_format(struct net_device *ndev)
 
 		/* The size of the buffer is a multiple of 32 bytes. */
 		buf_len = ALIGN(mdp->rx_buf_sz, 32);
-		dma_addr = dma_map_single(&ndev->dev, skb->data, buf_len,
+		dma_addr = dma_map_single(&mdp->pdev->dev, skb->data, buf_len,
 					  DMA_FROM_DEVICE);
-		if (dma_mapping_error(&ndev->dev, dma_addr)) {
+		if (dma_mapping_error(&mdp->pdev->dev, dma_addr)) {
 			kfree_skb(skb);
 			break;
 		}
@@ -1527,7 +1528,7 @@ static int sh_eth_rx(struct net_device *ndev, u32 intr_status, int *quota)
 			mdp->rx_skbuff[entry] = NULL;
 			if (mdp->cd->rpadir)
 				skb_reserve(skb, NET_IP_ALIGN);
-			dma_unmap_single(&ndev->dev, dma_addr,
+			dma_unmap_single(&mdp->pdev->dev, dma_addr,
 					 ALIGN(mdp->rx_buf_sz, 32),
 					 DMA_FROM_DEVICE);
 			skb_put(skb, pkt_len);
@@ -1555,9 +1556,9 @@ static int sh_eth_rx(struct net_device *ndev, u32 intr_status, int *quota)
 			if (skb == NULL)
 				break;	/* Better luck next round. */
 			sh_eth_set_receive_align(skb);
-			dma_addr = dma_map_single(&ndev->dev, skb->data,
+			dma_addr = dma_map_single(&mdp->pdev->dev, skb->data,
 						  buf_len, DMA_FROM_DEVICE);
-			if (dma_mapping_error(&ndev->dev, dma_addr)) {
+			if (dma_mapping_error(&mdp->pdev->dev, dma_addr)) {
 				kfree_skb(skb);
 				break;
 			}
@@ -2441,9 +2442,9 @@ static int sh_eth_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 	/* soft swap. */
 	if (!mdp->cd->hw_swap)
 		sh_eth_soft_swap(PTR_ALIGN(skb->data, 4), skb->len + 2);
-	dma_addr = dma_map_single(&ndev->dev, skb->data, skb->len,
+	dma_addr = dma_map_single(&mdp->pdev->dev, skb->data, skb->len,
 				  DMA_TO_DEVICE);
-	if (dma_mapping_error(&ndev->dev, dma_addr)) {
+	if (dma_mapping_error(&mdp->pdev->dev, dma_addr)) {
 		kfree_skb(skb);
 		return NETDEV_TX_OK;
 	}
-- 
2.13.6
