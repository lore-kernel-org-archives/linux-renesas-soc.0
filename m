Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038EFC43444
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 14:02:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C41FB20660
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 14:02:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="GCtIADMz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728923AbfAJOCb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 09:02:31 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39719 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbfAJOCb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 09:02:31 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0649925BEF2;
        Fri, 11 Jan 2019 01:02:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547128948; bh=s51QzC+uYWlR+yjZSwNLdHw+cY3d5xJGtwXWIj+QhLM=;
        h=From:To:Cc:Subject:Date:From;
        b=GCtIADMzCwzfS7loYWPTFvR+FUdHWPRCN7fNp3/ux2CZZiOPYZ/zow6uZ2K1J3Vvk
         tdNd0KXUT5Lq5MmJQD6w2MIEaeNUvtfPuHHXg3SkU8PtVA30DsadAoNREMw7hf/nve
         JTGWUVt9a36OFGptjQ6+o90zF0x/u6nYNct7WB0Q=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 08DDD940462; Thu, 10 Jan 2019 15:02:25 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     David Miller <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH net] ravb: expand rx descriptor data to accommodate hw checksum
Date:   Thu, 10 Jan 2019 15:02:22 +0100
Message-Id: <20190110140222.32740-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

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

 Change since previous posting: drop RFC designation. I have tested this
 patch and it is ready to bring it to a wider audience is via upstream

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index ffc1ada4e6da..545633128718 100644
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
@@ -343,7 +345,7 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 	int i;
 
 	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +
-		ETH_HLEN + VLAN_HLEN;
+		ETH_HLEN + VLAN_HLEN + RAVB_CSUM_LEN;
 
 	/* Allocate RX and TX skb rings */
 	priv->rx_skb[q] = kcalloc(priv->num_rx_ring[q],
@@ -524,13 +526,15 @@ static void ravb_rx_csum(struct sk_buff *skb)
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

