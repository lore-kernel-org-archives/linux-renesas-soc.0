Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:42805 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932290AbeGDIPT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 04:15:19 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>
CC: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 05/14] sh_eth: remove useless serialization in sh_eth_get_link_ksettings()
Date: Wed, 4 Jul 2018 11:14:47 +0300
Message-ID: <20180704081451.7482-1-vladimir_zapolskiy@mentor.com>
In-Reply-To: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

phy_ethtool_ksettings_get() call does not modify device state or device
driver state, hence there is no need to utilize a driver specific
spinlock.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 50ff18870be2..152edd1e9a23 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -2043,15 +2043,10 @@ static int sh_eth_phy_start(struct net_device *ndev)
 static int sh_eth_get_link_ksettings(struct net_device *ndev,
 				     struct ethtool_link_ksettings *cmd)
 {
-	struct sh_eth_private *mdp = netdev_priv(ndev);
-	unsigned long flags;
-
 	if (!ndev->phydev)
 		return -ENODEV;
 
-	spin_lock_irqsave(&mdp->lock, flags);
 	phy_ethtool_ksettings_get(ndev->phydev, cmd);
-	spin_unlock_irqrestore(&mdp->lock, flags);
 
 	return 0;
 }
-- 
2.17.1
