Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:40323 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753723AbeDRIcc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 04:32:32 -0400
Received: by mail-pl0-f66.google.com with SMTP id t22-v6so679621plo.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Apr 2018 01:32:32 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 18 Apr 2018 17:33:14 +0900
Message-Id: <152404039431.7843.7752537511570314504.sendpatchset@little-apple>
In-Reply-To: <152404037580.7843.5140455339218102749.sendpatchset@little-apple>
References: <152404037580.7843.5140455339218102749.sendpatchset@little-apple>
Subject: [PATCH 02/03] ravb: MTU support and minor fix
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

This is a back port to v4.16 of the following commits merged in v4.17-rc1:
5c3d0fd4b2c0 ravb: remove erroneous comment
75efa06f457b ravb: add support for changing MTU

Thanks to Niklas, Sergei and Dave Miller for the upstreaming efforts.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/net/ethernet/renesas/ravb.h      |    1 
 drivers/net/ethernet/renesas/ravb_main.c |   33 +++++++++++++++++++++++-------
 2 files changed, 27 insertions(+), 7 deletions(-)

--- 0001/drivers/net/ethernet/renesas/ravb.h
+++ work/drivers/net/ethernet/renesas/ravb.h	2018-04-17 16:47:02.940607110 +0900
@@ -1018,6 +1018,7 @@ struct ravb_private {
 	u32 dirty_rx[NUM_RX_QUEUE];	/* Producer ring indices */
 	u32 cur_tx[NUM_TX_QUEUE];
 	u32 dirty_tx[NUM_TX_QUEUE];
+	u32 rx_buf_sz;			/* Based on MTU+slack. */
 	struct napi_struct napi[NUM_RX_QUEUE];
 	struct work_struct work;
 	/* MII transceiver section. */
--- 0001/drivers/net/ethernet/renesas/ravb_main.c
+++ work/drivers/net/ethernet/renesas/ravb_main.c	2018-04-17 16:47:12.030607110 +0900
@@ -238,7 +238,7 @@ static void ravb_ring_free(struct net_de
 					       le32_to_cpu(desc->dptr)))
 				dma_unmap_single(ndev->dev.parent,
 						 le32_to_cpu(desc->dptr),
-						 PKT_BUF_SZ,
+						 priv->rx_buf_sz,
 						 DMA_FROM_DEVICE);
 		}
 		ring_size = sizeof(struct ravb_ex_rx_desc) *
@@ -300,9 +300,9 @@ static void ravb_ring_format(struct net_
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
 		/* RX descriptor */
 		rx_desc = &priv->rx_ring[q][i];
-		rx_desc->ds_cc = cpu_to_le16(PKT_BUF_SZ);
+		rx_desc->ds_cc = cpu_to_le16(priv->rx_buf_sz);
 		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
-					  PKT_BUF_SZ,
+					  priv->rx_buf_sz,
 					  DMA_FROM_DEVICE);
 		/* We just set the data size to 0 for a failed mapping which
 		 * should prevent DMA from happening...
@@ -346,6 +346,9 @@ static int ravb_ring_init(struct net_dev
 	int ring_size;
 	int i;
 
+	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +
+		ETH_HLEN + VLAN_HLEN;
+
 	/* Allocate RX and TX skb rings */
 	priv->rx_skb[q] = kcalloc(priv->num_rx_ring[q],
 				  sizeof(*priv->rx_skb[q]), GFP_KERNEL);
@@ -355,7 +358,7 @@ static int ravb_ring_init(struct net_dev
 		goto error;
 
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
-		skb = netdev_alloc_skb(ndev, PKT_BUF_SZ + RAVB_ALIGN - 1);
+		skb = netdev_alloc_skb(ndev, priv->rx_buf_sz + RAVB_ALIGN - 1);
 		if (!skb)
 			goto error;
 		ravb_set_buffer_align(skb);
@@ -586,7 +589,7 @@ static bool ravb_rx(struct net_device *n
 			skb = priv->rx_skb[q][entry];
 			priv->rx_skb[q][entry] = NULL;
 			dma_unmap_single(ndev->dev.parent, le32_to_cpu(desc->dptr),
-					 PKT_BUF_SZ,
+					 priv->rx_buf_sz,
 					 DMA_FROM_DEVICE);
 			get_ts &= (q == RAVB_NC) ?
 					RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
@@ -619,11 +622,12 @@ static bool ravb_rx(struct net_device *n
 	for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) {
 		entry = priv->dirty_rx[q] % priv->num_rx_ring[q];
 		desc = &priv->rx_ring[q][entry];
-		desc->ds_cc = cpu_to_le16(PKT_BUF_SZ);
+		desc->ds_cc = cpu_to_le16(priv->rx_buf_sz);
 
 		if (!priv->rx_skb[q][entry]) {
 			skb = netdev_alloc_skb(ndev,
-					       PKT_BUF_SZ + RAVB_ALIGN - 1);
+					       priv->rx_buf_sz +
+					       RAVB_ALIGN - 1);
 			if (!skb)
 				break;	/* Better luck next round. */
 			ravb_set_buffer_align(skb);
@@ -1854,6 +1858,17 @@ static int ravb_do_ioctl(struct net_devi
 	return phy_mii_ioctl(phydev, req, cmd);
 }
 
+static int ravb_change_mtu(struct net_device *ndev, int new_mtu)
+{
+	if (netif_running(ndev))
+		return -EBUSY;
+
+	ndev->mtu = new_mtu;
+	netdev_update_features(ndev);
+
+	return 0;
+}
+
 static void ravb_set_rx_csum(struct net_device *ndev, bool enable)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -1895,6 +1910,7 @@ static const struct net_device_ops ravb_
 	.ndo_set_rx_mode	= ravb_set_rx_mode,
 	.ndo_tx_timeout		= ravb_tx_timeout,
 	.ndo_do_ioctl		= ravb_do_ioctl,
+	.ndo_change_mtu		= ravb_change_mtu,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_set_features	= ravb_set_features,
@@ -2117,6 +2133,9 @@ static int ravb_probe(struct platform_de
 		goto out_release;
 	}
 
+	ndev->max_mtu = 2048 - (ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN);
+	ndev->min_mtu = ETH_MIN_MTU;
+
 	/* Set function */
 	ndev->netdev_ops = &ravb_netdev_ops;
 	ndev->ethtool_ops = &ravb_ethtool_ops;
