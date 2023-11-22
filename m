Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9716F110;
	Tue, 21 Nov 2023 21:11:49 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,217,1695654000"; 
   d="scan'208";a="187685063"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2023 14:11:48 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D68E74173A28;
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
Subject: [PATCH net v3 2/3] net: rswitch: Fix return value in rswitch_start_xmit()
Date: Wed, 22 Nov 2023 14:11:42 +0900
Message-Id: <20231122051143.3660780-3-yoshihiro.shimoda.uh@renesas.com>
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

This .ndo_start_xmit() function should return netdev_tx_t value,
not -ENOMEM. So, fix it.

Fixes: 33f5d733b589 ("net: renesas: rswitch: Improve TX timestamp accuracy")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index d53d90020904..45bf9808c143 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1535,7 +1535,7 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 		ts_info = kzalloc(sizeof(*ts_info), GFP_ATOMIC);
 		if (!ts_info) {
 			dma_unmap_single(ndev->dev.parent, dma_addr, skb->len, DMA_TO_DEVICE);
-			return -ENOMEM;
+			return ret;
 		}
 
 		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
-- 
2.25.1

