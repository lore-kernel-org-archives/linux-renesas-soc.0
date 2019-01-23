Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0FFC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 11:17:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0BB120870
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 11:17:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="KnPUyssY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbfAWLRA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 06:17:00 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:52046 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbfAWLRA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 06:17:00 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E91DA25BE34;
        Wed, 23 Jan 2019 22:16:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548242218; bh=882809KqWSSl89h+qn2DAix2I1qDUSfnXF7IEXVbXg4=;
        h=From:To:Cc:Subject:Date:From;
        b=KnPUyssYu8GQyu1Ij5A7Hjecm0ahLeCenwGjD8IQEiN1lwOjxm2ulvE03H4rhjQMz
         nuA1Pp3oQPvSiKxtTKxRWx1x3z8yvRV4oXihMO/JpUb9xZyIFyYX83N7a6N6etwJmm
         cDpSV2Dg3ZXIhW1Mhyk038P2w65BfoJLpFrHwOtE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4107B940462; Wed, 23 Jan 2019 12:16:56 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     David Miller <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 net] ravb: expand rx descriptor data to accommodate hw checksum
Date:   Wed, 23 Jan 2019 12:14:52 +0100
Message-Id: <20190123111452.27845-1-horms+renesas@verge.net.au>
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

A work around is to disable RX checksum offload
 # ethtool -K eth0 rx off

This patch resolves this problem by increasing the size available for
packet data in RX descriptors by two bytes.

Tested on R-Car E3 (r8a77990) ES1.0 based Ebisu-4D board

v2
* Use sizeof(__sum16) directly rather than adding a driver-local
  #define for the size of the checksum provided by the hw (2 bytes).

Fixes: 4d86d3818627 ("ravb: RX checksum offload")
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/net/ethernet/renesas/ravb_main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index ffc1ada4e6da..d28c8f9ca55b 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -343,7 +343,7 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 	int i;
 
 	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +
-		ETH_HLEN + VLAN_HLEN;
+		ETH_HLEN + VLAN_HLEN + sizeof(__sum16);
 
 	/* Allocate RX and TX skb rings */
 	priv->rx_skb[q] = kcalloc(priv->num_rx_ring[q],
@@ -524,13 +524,15 @@ static void ravb_rx_csum(struct sk_buff *skb)
 {
 	u8 *hw_csum;
 
-	/* The hardware checksum is 2 bytes appended to packet data */
-	if (unlikely(skb->len < 2))
+	/* The hardware checksum is contained in sizeof(__sum16) (2) bytes
+	 * appended to packet data
+	 */
+	if (unlikely(skb->len < sizeof(__sum16)))
 		return;
-	hw_csum = skb_tail_pointer(skb) - 2;
+	hw_csum = skb_tail_pointer(skb) - sizeof(__sum16);
 	skb->csum = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
 	skb->ip_summed = CHECKSUM_COMPLETE;
-	skb_trim(skb, skb->len - 2);
+	skb_trim(skb, skb->len - sizeof(__sum16));
 }
 
 /* Packet receive function for Ethernet AVB */
-- 
2.11.0

