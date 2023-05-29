Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA6EC7EE29
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 29 May 2023 07:38:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjE2Hic (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 29 May 2023 03:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjE2Hib (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 May 2023 03:38:31 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CB9A8A7;
        Mon, 29 May 2023 00:38:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,200,1681138800"; 
   d="scan'208";a="161237525"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 May 2023 16:38:28 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CC8E341AA0FF;
        Mon, 29 May 2023 16:38:28 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net] net: renesas: rswitch: Fix return value in error path of xmit
Date:   Mon, 29 May 2023 16:38:17 +0900
Message-Id: <20230529073817.1145208-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix return value in the error path of rswitch_start_xmit(). If TX
queues are full, this function should return NETDEV_TX_BUSY.

Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 29afaddb598d..aace87139cea 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1485,7 +1485,7 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 
 	if (rswitch_get_num_cur_queues(gq) >= gq->ring_size - 1) {
 		netif_stop_subqueue(ndev, 0);
-		return ret;
+		return NETDEV_TX_BUSY;
 	}
 
 	if (skb_put_padto(skb, ETH_ZLEN))
-- 
2.25.1

