Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:42942 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932517AbeGDIQZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 04:16:25 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>
CC: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 11/14] ravb: remove custom .nway_reset from ethtool ops
Date: Wed, 4 Jul 2018 11:16:09 +0300
Message-ID: <20180704081612.7628-2-vladimir_zapolskiy@mentor.com>
In-Reply-To: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The generic phy_ethtool_nway_reset() function from phylib can be used
instead of in-house ravb_nway_reset().

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 31913a469001..6002132093cd 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1131,16 +1131,6 @@ static int ravb_set_link_ksettings(struct net_device *ndev,
 	return phy_ethtool_ksettings_set(ndev->phydev, cmd);
 }
 
-static int ravb_nway_reset(struct net_device *ndev)
-{
-	int error = -ENODEV;
-
-	if (ndev->phydev)
-		error = phy_restart_aneg(ndev->phydev);
-
-	return error;
-}
-
 static u32 ravb_get_msglevel(struct net_device *ndev)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -1353,7 +1343,7 @@ static int ravb_set_wol(struct net_device *ndev, struct ethtool_wolinfo *wol)
 }
 
 static const struct ethtool_ops ravb_ethtool_ops = {
-	.nway_reset		= ravb_nway_reset,
+	.nway_reset		= phy_ethtool_nway_reset,
 	.get_msglevel		= ravb_get_msglevel,
 	.set_msglevel		= ravb_set_msglevel,
 	.get_link		= ethtool_op_get_link,
-- 
2.17.1
