Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:23154 "EHLO
        bin-vsp-out-02.atm.binero.net" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751225AbeBLUBR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 15:01:17 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] ravb: add support for changing MTU
Date: Mon, 12 Feb 2018 21:00:33 +0100
Message-Id: <20180212200033.1802-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Allow for chancing the MTU within the limit of the maximum size of a
descriptor (2048 bytes). Add the callback to change MTU from user-space
and take the configurable MTU into account when configuring the
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb.h      |  1 +
 drivers/net/ethernet/renesas/ravb_main.c | 34 +++++++++++++++++++++++++-------
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 96a27b00c90e212a..b81f4faf7b10114d 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1018,6 +1018,7 @@ struct ravb_private {
 	u32 dirty_rx[NUM_RX_QUEUE];	/* Producer ring indices */
 	u32 cur_tx[NUM_TX_QUEUE];
 	u32 dirty_tx[NUM_TX_QUEUE];
+	u32 rx_buf_sz;			/* Based on MTU+slack. */
 	struct napi_struct napi[NUM_RX_QUEUE];
 	struct work_struct work;
 	/* MII transceiver section. */
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c87f57ca44371586..a4870c9e42195802 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -238,7 +238,7 @@ static void ravb_ring_free(struct net_device *ndev, int q)
 					       le32_to_cpu(desc->dptr)))
 				dma_unmap_single(ndev->dev.parent,
 						 le32_to_cpu(desc->dptr),
-						 PKT_BUF_SZ,
+						 priv->rx_buf_sz,
 						 DMA_FROM_DEVICE);
 		}
 		ring_size = sizeof(struct ravb_ex_rx_desc) *
@@ -300,9 +300,9 @@ static void ravb_ring_format(struct net_device *ndev, int q)
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
 		/* RX descriptor */
 		rx_desc = &priv->rx_ring[q][i];
-		rx_desc->ds_cc = cpu_to_le16(PKT_BUF_SZ);
+		rx_desc->ds_cc = cpu_to_le16(priv->rx_buf_sz);
 		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
-					  PKT_BUF_SZ,
+					  le16_to_cpu(rx_desc->ds_cc),
 					  DMA_FROM_DEVICE);
 		/* We just set the data size to 0 for a failed mapping which
 		 * should prevent DMA from happening...
@@ -346,6 +346,10 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 	int ring_size;
 	int i;
 
+	/* +16 gets room from the status from the card. */
+	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +
+		ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN + 16;
+
 	/* Allocate RX and TX skb rings */
 	priv->rx_skb[q] = kcalloc(priv->num_rx_ring[q],
 				  sizeof(*priv->rx_skb[q]), GFP_KERNEL);
@@ -355,7 +359,7 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 		goto error;
 
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
-		skb = netdev_alloc_skb(ndev, PKT_BUF_SZ + RAVB_ALIGN - 1);
+		skb = netdev_alloc_skb(ndev, priv->rx_buf_sz + RAVB_ALIGN - 1);
 		if (!skb)
 			goto error;
 		ravb_set_buffer_align(skb);
@@ -586,7 +590,7 @@ static bool ravb_rx(struct net_device *ndev, int *quota, int q)
 			skb = priv->rx_skb[q][entry];
 			priv->rx_skb[q][entry] = NULL;
 			dma_unmap_single(ndev->dev.parent, le32_to_cpu(desc->dptr),
-					 PKT_BUF_SZ,
+					 priv->rx_buf_sz,
 					 DMA_FROM_DEVICE);
 			get_ts &= (q == RAVB_NC) ?
 					RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
@@ -619,11 +623,12 @@ static bool ravb_rx(struct net_device *ndev, int *quota, int q)
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
@@ -1854,6 +1859,17 @@ static int ravb_do_ioctl(struct net_device *ndev, struct ifreq *req, int cmd)
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
@@ -1895,6 +1911,7 @@ static const struct net_device_ops ravb_netdev_ops = {
 	.ndo_set_rx_mode	= ravb_set_rx_mode,
 	.ndo_tx_timeout		= ravb_tx_timeout,
 	.ndo_do_ioctl		= ravb_do_ioctl,
+	.ndo_change_mtu		= ravb_change_mtu,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_set_features	= ravb_set_features,
@@ -2117,6 +2134,9 @@ static int ravb_probe(struct platform_device *pdev)
 		goto out_release;
 	}
 
+	ndev->max_mtu = 2048 - (ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN);
+	ndev->min_mtu = ETH_MIN_MTU;
+
 	/* Set function */
 	ndev->netdev_ops = &ravb_netdev_ops;
 	ndev->ethtool_ops = &ravb_ethtool_ops;
-- 
2.16.1
