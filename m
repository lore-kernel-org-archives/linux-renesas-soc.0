Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:42953 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932517AbeGDIQ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 04:16:28 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>
CC: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 12/14] ravb: remove useless serialization in ravb_get_link_ksettings()
Date: Wed, 4 Jul 2018 11:16:10 +0300
Message-ID: <20180704081612.7628-3-vladimir_zapolskiy@mentor.com>
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
 drivers/net/ethernet/renesas/ravb_main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 6002132093cd..772687a5faee 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1109,15 +1109,10 @@ static int ravb_phy_start(struct net_device *ndev)
 static int ravb_get_link_ksettings(struct net_device *ndev,
 				   struct ethtool_link_ksettings *cmd)
 {
-	struct ravb_private *priv = netdev_priv(ndev);
-	unsigned long flags;
-
 	if (!ndev->phydev)
 		return -ENODEV;
 
-	spin_lock_irqsave(&priv->lock, flags);
 	phy_ethtool_ksettings_get(ndev->phydev, cmd);
-	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
 }
-- 
2.17.1
