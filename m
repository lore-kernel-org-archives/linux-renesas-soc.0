Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:26946 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730029AbeGPMrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 08:47:09 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] ravb: fix byte order for TX descriptor tag field lower bits
Date: Mon, 16 Jul 2018 14:19:27 +0200
Message-Id: <20180716121927.21918-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180716121927.21918-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180716121927.21918-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The wrong helper is used to swap the bytes when adding the lower bits of
the TX descriptors tag field in the shared ds_tagl variable. The
variable contains the DS[11:0] field and then the TAG[3:0] bits.

The mistake was highlighted by the sparse warning:

ravb_main.c:1622:31:    left side has type restricted __le16
ravb_main.c:1622:31:    right side has type unsigned short
ravb_main.c:1622:31: warning: invalid assignment: |=
ravb_main.c:1622:34: warning: cast to restricted __le16

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index a100bccb3234bd5c..f7e649c831ad5595 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1623,7 +1623,7 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 		/* TAG and timestamp required flag */
 		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
 		desc->tagh_tsr = (ts_skb->tag >> 4) | TX_TSR;
-		desc->ds_tagl |= le16_to_cpu(ts_skb->tag << 12);
+		desc->ds_tagl |= cpu_to_le16(ts_skb->tag << 12);
 	}
 
 	skb_tx_timestamp(skb);
-- 
2.17.0
