Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39080 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbeLJI7c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 03:59:32 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFT net] ravb: expand rx descriptor data to accommodate hw checksum
Date: Mon, 10 Dec 2018 09:59:17 +0100
Message-Id: <20181210085917.23056-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Simon Horman <horms@verge.net.au>

EtherAVB may provide a checksum of packet data appended to packet data. In
order to allow this checksum to be received by the host descriptor data
needs to be enlarged by 2 bytes to accommodate the checksum.

In the case of MTU-sized packets without a VLAN tag the
checksum were already accommodated by virtue of the space reserved for the
VLAN tag. However, a packet of MTU-size with a  VLAN tag consumed all
packet data space provided by a descriptor leaving no space for the
trailing checksum.

This was not detected by the driver which incorrectly used the last two
bytes of packet data as the checksum and truncate the packet by two bytes.
This resulted all such packets being dropped.

A work around is to disable rx checksum offload
 # ethtool -K eth0 rx off

This patch resolves this problem by increasing the size available for
packet data in rx descriptors by two bytes. It also introduces
RAVB_CSUM_LEN to make things a little clearer than "2" sprinkled lightly
over the driver.

Tested on R-Car E3 (r8a77990) ES1.0 based Ebisu-4D board

Fixes: 4d86d3818627 ("ravb: RX checksum offload")
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/net/ethernet/renesas/ravb_main.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

 I have marked this patch as RTF as I would like it to see further testing
 before being applied.

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index defed0d0c51d..f7f130cf61e4 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -40,6 +40,8 @@
 		 NETIF_MSG_RX_ERR | \
 		 NETIF_MSG_TX_ERR)
 
+#define RAVB_CSUM_LEN 2
+
 static const char *ravb_rx_irqs[NUM_RX_QUEUE] = {
 	"ch0", /* RAVB_BE */
 	"ch1", /* RAVB_NC */
@@ -350,7 +352,7 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 	int i;
 
 	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +
-		ETH_HLEN + VLAN_HLEN;
+		ETH_HLEN + VLAN_HLEN + RAVB_CSUM_LEN;
 
 	/* Allocate RX and TX skb rings */
 	priv->rx_skb[q] = kcalloc(priv->num_rx_ring[q],
@@ -533,13 +535,15 @@ static void ravb_rx_csum(struct sk_buff *skb)
 {
 	u8 *hw_csum;
 
-	/* The hardware checksum is 2 bytes appended to packet data */
-	if (unlikely(skb->len < 2))
+	/* The hardware checksum is contained in RAVB_CSUM_LEN (2) bytes
+	 * appended to packet data
+	 */
+	if (unlikely(skb->len < RAVB_CSUM_LEN))
 		return;
-	hw_csum = skb_tail_pointer(skb) - 2;
+	hw_csum = skb_tail_pointer(skb) - RAVB_CSUM_LEN;
 	skb->csum = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
 	skb->ip_summed = CHECKSUM_COMPLETE;
-	skb_trim(skb, skb->len - 2);
+	skb_trim(skb, skb->len - RAVB_CSUM_LEN);
 }
 
 /* Packet receive function for Ethernet AVB */
-- 
2.11.0
