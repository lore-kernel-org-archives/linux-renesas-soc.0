Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2CF6312A;
	Tue, 21 Nov 2023 21:11:51 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,217,1695654000"; 
   d="scan'208";a="183829215"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2023 14:11:49 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 00D414173A12;
	Wed, 22 Nov 2023 14:11:48 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net v3 3/3] net: rswitch: Fix missing dev_kfree_skb_any() in error path
Date: Wed, 22 Nov 2023 14:11:43 +0900
Message-Id: <20231122051143.3660780-4-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122051143.3660780-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231122051143.3660780-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before returning the rswitch_start_xmit() in the error path,
dev_kfree_skb_any() should be called. So, fix it.

Fixes: 33f5d733b589 ("net: renesas: rswitch: Improve TX timestamp accuracy")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 45bf9808c143..e77c6ff93d81 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1517,10 +1517,8 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 		return ret;
 
 	dma_addr = dma_map_single(ndev->dev.parent, skb->data, skb->len, DMA_TO_DEVICE);
-	if (dma_mapping_error(ndev->dev.parent, dma_addr)) {
-		dev_kfree_skb_any(skb);
-		return ret;
-	}
+	if (dma_mapping_error(ndev->dev.parent, dma_addr))
+		goto err_kfree;
 
 	gq->skbs[gq->cur] = skb;
 	desc = &gq->tx_ring[gq->cur];
@@ -1533,10 +1531,8 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 		struct rswitch_gwca_ts_info *ts_info;
 
 		ts_info = kzalloc(sizeof(*ts_info), GFP_ATOMIC);
-		if (!ts_info) {
-			dma_unmap_single(ndev->dev.parent, dma_addr, skb->len, DMA_TO_DEVICE);
-			return ret;
-		}
+		if (!ts_info)
+			goto err_unmap;
 
 		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
 		rdev->ts_tag++;
@@ -1558,6 +1554,14 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 	gq->cur = rswitch_next_queue_index(gq, true, 1);
 	rswitch_modify(rdev->addr, GWTRC(gq->index), 0, BIT(gq->index % 32));
 
+	return ret;
+
+err_unmap:
+	dma_unmap_single(ndev->dev.parent, dma_addr, skb->len, DMA_TO_DEVICE);
+
+err_kfree:
+	dev_kfree_skb_any(skb);
+
 	return ret;
 }
 
-- 
2.25.1

