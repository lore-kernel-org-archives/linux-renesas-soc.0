Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:42833 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933746AbeGDIP0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 04:15:26 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>
CC: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 08/14] ravb: fix invalid context bug while calling auto-negotiation by ethtool
Date: Wed, 4 Jul 2018 11:14:50 +0300
Message-ID: <20180704081451.7482-4-vladimir_zapolskiy@mentor.com>
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

Fixes: a0d2f20650e8 ("Renesas Ethernet AVB PTP clock driver")
Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 68f122140966..e7d6d1b6e7d6 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1152,15 +1152,10 @@ static int ravb_set_link_ksettings(struct net_device *ndev,
 
 static int ravb_nway_reset(struct net_device *ndev)
 {
-	struct ravb_private *priv = netdev_priv(ndev);
 	int error = -ENODEV;
-	unsigned long flags;
 
-	if (ndev->phydev) {
-		spin_lock_irqsave(&priv->lock, flags);
+	if (ndev->phydev)
 		error = phy_start_aneg(ndev->phydev);
-		spin_unlock_irqrestore(&priv->lock, flags);
-	}
 
 	return error;
 }
-- 
2.17.1
