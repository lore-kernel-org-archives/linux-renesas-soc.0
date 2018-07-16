Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:55359 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727857AbeGPMrF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 08:47:05 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] ravb: fix shadowing of symbol 'stats' in ravb_get_ethtool_stats()
Date: Mon, 16 Jul 2018 14:19:25 +0200
Message-Id: <20180716121927.21918-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180716121927.21918-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180716121927.21918-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Inside a loop in ravb_get_ethtool_stats() a variable 'stats' is declared
resulting in the argument also named 'stats' to be shadowed. Fix this
warning by renaming the unused argument 'stats' to 'estats'.

This fixes the sparse warning:

ravb_main.c:1225:36: originally declared here
ravb_main.c:1233:41: warning: symbol 'stats' shadows an earlier one

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 4a7f54c8e7aaad7e..e5784f0eac3df57c 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1226,7 +1226,7 @@ static int ravb_get_sset_count(struct net_device *netdev, int sset)
 }
 
 static void ravb_get_ethtool_stats(struct net_device *ndev,
-				   struct ethtool_stats *stats, u64 *data)
+				   struct ethtool_stats *estats, u64 *data)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	int i = 0;
-- 
2.17.0
