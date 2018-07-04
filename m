Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:42608 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932611AbeGDINC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 04:13:02 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>
CC: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 01/14] sh_eth: fix invalid context bug while calling auto-negotiation by ethtool
Date: Wed, 4 Jul 2018 11:12:39 +0300
Message-ID: <20180704081245.7395-2-vladimir_zapolskiy@mentor.com>
In-Reply-To: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since commit 35b5f6b1a82b ("PHYLIB: Locking fixes for PHY I/O
potentially sleeping") phy_start_aneg() function utilizes a mutex
to serialize changes to phy state, however the helper function is
called in atomic context.

The bug can be reproduced by running "ethtool -r" command, the bug
is reported if CONFIG_DEBUG_ATOMIC_SLEEP build option is enabled.

Fixes: dc19e4e5e02f ("sh: sh_eth: Add support ethtool")
Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index e9007b613f17..e8aca46bb925 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -2265,18 +2265,10 @@ static void sh_eth_get_regs(struct net_device *ndev, struct ethtool_regs *regs,
 
 static int sh_eth_nway_reset(struct net_device *ndev)
 {
-	struct sh_eth_private *mdp = netdev_priv(ndev);
-	unsigned long flags;
-	int ret;
-
 	if (!ndev->phydev)
 		return -ENODEV;
 
-	spin_lock_irqsave(&mdp->lock, flags);
-	ret = phy_start_aneg(ndev->phydev);
-	spin_unlock_irqrestore(&mdp->lock, flags);
-
-	return ret;
+	return phy_start_aneg(ndev->phydev);
 }
 
 static u32 sh_eth_get_msglevel(struct net_device *ndev)
-- 
2.17.1
