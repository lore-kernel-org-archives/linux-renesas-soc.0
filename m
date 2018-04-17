Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46723 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752231AbeDQIvA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 04:51:00 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFC net-next 5/5] ravb: remove tx buffer addr 4byte alilgnment restriction for R-Car Gen3
Date: Tue, 17 Apr 2018 10:50:30 +0200
Message-Id: <20180417085030.32650-6-horms+renesas@verge.net.au>
In-Reply-To: <20180417085030.32650-1-horms+renesas@verge.net.au>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

This patch sets from two descriptor to one descriptor because R-Car Gen3
does not have the 4 bytes alignment restriction of the transmission buffer.

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/net/ethernet/renesas/ravb.h      |   6 +-
 drivers/net/ethernet/renesas/ravb_main.c | 131 +++++++++++++++++++------------
 2 files changed, 85 insertions(+), 52 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index fcd04dbc7dde..3d0985305c26 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -964,7 +964,10 @@ enum RAVB_QUEUE {
 #define RX_QUEUE_OFFSET	4
 #define NUM_RX_QUEUE	2
 #define NUM_TX_QUEUE	2
-#define NUM_TX_DESC	2	/* TX descriptors per packet */
+
+/* TX descriptors per packet */
+#define NUM_TX_DESC_GEN2	2
+#define NUM_TX_DESC_GEN3	1
 
 struct ravb_tstamp_skb {
 	struct list_head list;
@@ -1043,6 +1046,7 @@ struct ravb_private {
 	unsigned no_avb_link:1;
 	unsigned avb_link_active_low:1;
 	unsigned wol_enabled:1;
+	int num_tx_desc;	/* TX descriptors per packet */
 };
 
 static inline u32 ravb_read(struct net_device *ndev, enum ravb_reg reg)
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 88056dd912ed..f137b62d5b52 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -189,12 +189,13 @@ static int ravb_tx_free(struct net_device *ndev, int q, bool free_txed_only)
 	int free_num = 0;
 	int entry;
 	u32 size;
+	int num_tx_desc = priv->num_tx_desc;
 
 	for (; priv->cur_tx[q] - priv->dirty_tx[q] > 0; priv->dirty_tx[q]++) {
 		bool txed;
 
 		entry = priv->dirty_tx[q] % (priv->num_tx_ring[q] *
-					     NUM_TX_DESC);
+					     num_tx_desc);
 		desc = &priv->tx_ring[q][entry];
 		txed = desc->die_dt == DT_FEMPTY;
 		if (free_txed_only && !txed)
@@ -203,12 +204,12 @@ static int ravb_tx_free(struct net_device *ndev, int q, bool free_txed_only)
 		dma_rmb();
 		size = le16_to_cpu(desc->ds_tagl) & TX_DS;
 		/* Free the original skb. */
-		if (priv->tx_skb[q][entry / NUM_TX_DESC]) {
+		if (priv->tx_skb[q][entry / num_tx_desc]) {
 			dma_unmap_single(ndev->dev.parent, le32_to_cpu(desc->dptr),
 					 size, DMA_TO_DEVICE);
 			/* Last packet descriptor? */
-			if (entry % NUM_TX_DESC == NUM_TX_DESC - 1) {
-				entry /= NUM_TX_DESC;
+			if (entry % num_tx_desc == num_tx_desc - 1) {
+				entry /= num_tx_desc;
 				dev_kfree_skb_any(priv->tx_skb[q][entry]);
 				priv->tx_skb[q][entry] = NULL;
 				if (txed)
@@ -229,6 +230,7 @@ static void ravb_ring_free(struct net_device *ndev, int q)
 	struct ravb_private *priv = netdev_priv(ndev);
 	int ring_size;
 	int i;
+	int num_tx_desc = priv->num_tx_desc;
 
 	if (priv->rx_ring[q]) {
 		for (i = 0; i < priv->num_rx_ring[q]; i++) {
@@ -252,7 +254,7 @@ static void ravb_ring_free(struct net_device *ndev, int q)
 		ravb_tx_free(ndev, q, false);
 
 		ring_size = sizeof(struct ravb_tx_desc) *
-			    (priv->num_tx_ring[q] * NUM_TX_DESC + 1);
+			    (priv->num_tx_ring[q] * num_tx_desc + 1);
 		dma_free_coherent(ndev->dev.parent, ring_size, priv->tx_ring[q],
 				  priv->tx_desc_dma[q]);
 		priv->tx_ring[q] = NULL;
@@ -284,9 +286,10 @@ static void ravb_ring_format(struct net_device *ndev, int q)
 	struct ravb_ex_rx_desc *rx_desc;
 	struct ravb_tx_desc *tx_desc;
 	struct ravb_desc *desc;
+	int num_tx_desc = priv->num_tx_desc;
 	int rx_ring_size = sizeof(*rx_desc) * priv->num_rx_ring[q];
 	int tx_ring_size = sizeof(*tx_desc) * priv->num_tx_ring[q] *
-			   NUM_TX_DESC;
+			   num_tx_desc;
 	dma_addr_t dma_addr;
 	int i;
 
@@ -321,8 +324,10 @@ static void ravb_ring_format(struct net_device *ndev, int q)
 	for (i = 0, tx_desc = priv->tx_ring[q]; i < priv->num_tx_ring[q];
 	     i++, tx_desc++) {
 		tx_desc->die_dt = DT_EEMPTY;
-		tx_desc++;
-		tx_desc->die_dt = DT_EEMPTY;
+		if (num_tx_desc >= 2) {
+			tx_desc++;
+			tx_desc->die_dt = DT_EEMPTY;
+		}
 	}
 	tx_desc->dptr = cpu_to_le32((u32)priv->tx_desc_dma[q]);
 	tx_desc->die_dt = DT_LINKFIX; /* type */
@@ -345,6 +350,7 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 	struct sk_buff *skb;
 	int ring_size;
 	int i;
+	int num_tx_desc = priv->num_tx_desc;
 
 	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +
 		ETH_HLEN + VLAN_HLEN;
@@ -383,7 +389,7 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 
 	/* Allocate all TX descriptors. */
 	ring_size = sizeof(struct ravb_tx_desc) *
-		    (priv->num_tx_ring[q] * NUM_TX_DESC + 1);
+		    (priv->num_tx_ring[q] * num_tx_desc + 1);
 	priv->tx_ring[q] = dma_alloc_coherent(ndev->dev.parent, ring_size,
 					      &priv->tx_desc_dma[q],
 					      GFP_KERNEL);
@@ -1533,10 +1539,11 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 	void *buffer;
 	u32 entry;
 	u32 len;
+	int num_tx_desc = priv->num_tx_desc;
 
 	spin_lock_irqsave(&priv->lock, flags);
 	if (priv->cur_tx[q] - priv->dirty_tx[q] > (priv->num_tx_ring[q] - 1) *
-	    NUM_TX_DESC) {
+	    num_tx_desc) {
 		netif_err(priv, tx_queued, ndev,
 			  "still transmitting with the full ring!\n");
 		netif_stop_subqueue(ndev, q);
@@ -1547,41 +1554,55 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 	if (skb_put_padto(skb, ETH_ZLEN))
 		goto exit;
 
-	entry = priv->cur_tx[q] % (priv->num_tx_ring[q] * NUM_TX_DESC);
-	priv->tx_skb[q][entry / NUM_TX_DESC] = skb;
-
-	buffer = PTR_ALIGN(priv->tx_align[q], DPTR_ALIGN) +
-		 entry / NUM_TX_DESC * DPTR_ALIGN;
-	len = PTR_ALIGN(skb->data, DPTR_ALIGN) - skb->data;
-	/* Zero length DMA descriptors are problematic as they seem to
-	 * terminate DMA transfers. Avoid them by simply using a length of
-	 * DPTR_ALIGN (4) when skb data is aligned to DPTR_ALIGN.
-	 *
-	 * As skb is guaranteed to have at least ETH_ZLEN (60) bytes of
-	 * data by the call to skb_put_padto() above this is safe with
-	 * respect to both the length of the first DMA descriptor (len)
-	 * overflowing the available data and the length of the second DMA
-	 * descriptor (skb->len - len) being negative.
-	 */
-	if (len == 0)
-		len = DPTR_ALIGN;
+	entry = priv->cur_tx[q] % (priv->num_tx_ring[q] * num_tx_desc);
+	priv->tx_skb[q][entry / num_tx_desc] = skb;
+
+	if (num_tx_desc >= 2) {
+		buffer = PTR_ALIGN(priv->tx_align[q], DPTR_ALIGN) +
+			 entry / num_tx_desc * DPTR_ALIGN;
+		len = PTR_ALIGN(skb->data, DPTR_ALIGN) - skb->data;
+
+		/* Zero length DMA descriptors are problematic as they seem
+		 * to terminate DMA transfers. Avoid them by simply using a
+		 * length of DPTR_ALIGN (4) when skb data is aligned to
+		 * DPTR_ALIGN.
+		 *
+		 * As skb is guaranteed to have at least ETH_ZLEN (60)
+		 * bytes of data by the call to skb_put_padto() above this
+		 * is safe with respect to both the length of the first DMA
+		 * descriptor (len) overflowing the available data and the
+		 * length of the second DMA descriptor (skb->len - len)
+		 * being negative.
+		 */
+		if (len == 0)
+			len = DPTR_ALIGN;
 
-	memcpy(buffer, skb->data, len);
-	dma_addr = dma_map_single(ndev->dev.parent, buffer, len, DMA_TO_DEVICE);
-	if (dma_mapping_error(ndev->dev.parent, dma_addr))
-		goto drop;
+		memcpy(buffer, skb->data, len);
+		dma_addr = dma_map_single(ndev->dev.parent, buffer, len,
+					  DMA_TO_DEVICE);
+		if (dma_mapping_error(ndev->dev.parent, dma_addr))
+			goto drop;
 
-	desc = &priv->tx_ring[q][entry];
-	desc->ds_tagl = cpu_to_le16(len);
-	desc->dptr = cpu_to_le32(dma_addr);
+		desc = &priv->tx_ring[q][entry];
+		desc->ds_tagl = cpu_to_le16(len);
+		desc->dptr = cpu_to_le32(dma_addr);
 
-	buffer = skb->data + len;
-	len = skb->len - len;
-	dma_addr = dma_map_single(ndev->dev.parent, buffer, len, DMA_TO_DEVICE);
-	if (dma_mapping_error(ndev->dev.parent, dma_addr))
-		goto unmap;
+		buffer = skb->data + len;
+		len = skb->len - len;
+		dma_addr = dma_map_single(ndev->dev.parent, buffer, len,
+					  DMA_TO_DEVICE);
+		if (dma_mapping_error(ndev->dev.parent, dma_addr))
+			goto unmap;
 
-	desc++;
+		desc++;
+	} else {
+		desc = &priv->tx_ring[q][entry];
+		len = skb->len;
+		dma_addr = dma_map_single(ndev->dev.parent, skb->data, skb->len,
+					  DMA_TO_DEVICE);
+		if (dma_mapping_error(ndev->dev.parent, dma_addr))
+			goto drop;
+	}
 	desc->ds_tagl = cpu_to_le16(len);
 	desc->dptr = cpu_to_le32(dma_addr);
 
@@ -1589,9 +1610,11 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 	if (q == RAVB_NC) {
 		ts_skb = kmalloc(sizeof(*ts_skb), GFP_ATOMIC);
 		if (!ts_skb) {
-			desc--;
-			dma_unmap_single(ndev->dev.parent, dma_addr, len,
-					 DMA_TO_DEVICE);
+			if (num_tx_desc >= 2) {
+				desc--;
+				dma_unmap_single(ndev->dev.parent, dma_addr,
+						 len, DMA_TO_DEVICE);
+			}
 			goto unmap;
 		}
 		ts_skb->skb = skb;
@@ -1608,15 +1631,18 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 	skb_tx_timestamp(skb);
 	/* Descriptor type must be set after all the above writes */
 	dma_wmb();
-	desc->die_dt = DT_FEND;
-	desc--;
-	desc->die_dt = DT_FSTART;
-
+	if (num_tx_desc > 1) {
+		desc->die_dt = DT_FEND;
+		desc--;
+		desc->die_dt = DT_FSTART;
+	} else {
+		desc->die_dt = DT_FSINGLE;
+	}
 	ravb_modify(ndev, TCCR, TCCR_TSRQ0 << q, TCCR_TSRQ0 << q);
 
-	priv->cur_tx[q] += NUM_TX_DESC;
+	priv->cur_tx[q] += num_tx_desc;
 	if (priv->cur_tx[q] - priv->dirty_tx[q] >
-	    (priv->num_tx_ring[q] - 1) * NUM_TX_DESC &&
+	    (priv->num_tx_ring[q] - 1) * num_tx_desc &&
 	    !ravb_tx_free(ndev, q, true))
 		netif_stop_subqueue(ndev, q);
 
@@ -1630,7 +1656,7 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 			 le16_to_cpu(desc->ds_tagl), DMA_TO_DEVICE);
 drop:
 	dev_kfree_skb_any(skb);
-	priv->tx_skb[q][entry / NUM_TX_DESC] = NULL;
+	priv->tx_skb[q][entry / num_tx_desc] = NULL;
 	goto exit;
 }
 
@@ -2106,6 +2132,9 @@ static int ravb_probe(struct platform_device *pdev)
 	ndev->max_mtu = 2048 - (ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN);
 	ndev->min_mtu = ETH_MIN_MTU;
 
+	priv->num_tx_desc = (chip_id == RCAR_GEN2) ?
+		NUM_TX_DESC_GEN2 : NUM_TX_DESC_GEN3;
+
 	/* Set function */
 	ndev->netdev_ops = &ravb_netdev_ops;
 	ndev->ethtool_ops = &ravb_ethtool_ops;
-- 
2.11.0
