Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:42625 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933919AbeGDINK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 04:13:10 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>
CC: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 04/14] sh_eth: remove custom .nway_reset from ethtool ops
Date: Wed, 4 Jul 2018 11:12:42 +0300
Message-ID: <20180704081245.7395-5-vladimir_zapolskiy@mentor.com>
In-Reply-To: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The generic phy_ethtool_nway_reset() function from phylib can be used
instead of in-house sh_eth_nway_reset().

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 1bed2ee4d709..50ff18870be2 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -2244,14 +2244,6 @@ static void sh_eth_get_regs(struct net_device *ndev, struct ethtool_regs *regs,
 	pm_runtime_put_sync(&mdp->pdev->dev);
 }
 
-static int sh_eth_nway_reset(struct net_device *ndev)
-{
-	if (!ndev->phydev)
-		return -ENODEV;
-
-	return phy_restart_aneg(ndev->phydev);
-}
-
 static u32 sh_eth_get_msglevel(struct net_device *ndev)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
@@ -2402,7 +2394,7 @@ static int sh_eth_set_wol(struct net_device *ndev, struct ethtool_wolinfo *wol)
 static const struct ethtool_ops sh_eth_ethtool_ops = {
 	.get_regs_len	= sh_eth_get_regs_len,
 	.get_regs	= sh_eth_get_regs,
-	.nway_reset	= sh_eth_nway_reset,
+	.nway_reset	= phy_ethtool_nway_reset,
 	.get_msglevel	= sh_eth_get_msglevel,
 	.set_msglevel	= sh_eth_set_msglevel,
 	.get_link	= ethtool_op_get_link,
-- 
2.17.1
