Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:55554 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968624AbeEXLOw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 07:14:52 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 5/6] sh_eth: remove custom .get_link_ksettings from ethtool ops
Date: Thu, 24 May 2018 14:14:43 +0300
Message-ID: <1527160484-11087-1-git-send-email-vladimir_zapolskiy@mentor.com>
In-Reply-To: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The change replaces a custom implementation of .get_link_ksettings
callback with a shared phy_ethtool_get_link_ksettings(), note that
&priv->lock wrapping is not needed, because the lock does not
serialize access to phydev fields.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 6d1fed2b4a4a..e627b2b6c3b3 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -2019,22 +2019,6 @@ static int sh_eth_phy_start(struct net_device *ndev)
 	return 0;
 }
 
-static int sh_eth_get_link_ksettings(struct net_device *ndev,
-				     struct ethtool_link_ksettings *cmd)
-{
-	struct sh_eth_private *mdp = netdev_priv(ndev);
-	unsigned long flags;
-
-	if (!ndev->phydev)
-		return -ENODEV;
-
-	spin_lock_irqsave(&mdp->lock, flags);
-	phy_ethtool_ksettings_get(ndev->phydev, cmd);
-	spin_unlock_irqrestore(&mdp->lock, flags);
-
-	return 0;
-}
-
 static int sh_eth_set_link_ksettings(struct net_device *ndev,
 				     const struct ethtool_link_ksettings *cmd)
 {
@@ -2411,7 +2395,7 @@ static const struct ethtool_ops sh_eth_ethtool_ops = {
 	.get_sset_count     = sh_eth_get_sset_count,
 	.get_ringparam	= sh_eth_get_ringparam,
 	.set_ringparam	= sh_eth_set_ringparam,
-	.get_link_ksettings = sh_eth_get_link_ksettings,
+	.get_link_ksettings = phy_ethtool_get_link_ksettings,
 	.set_link_ksettings = sh_eth_set_link_ksettings,
 	.get_wol	= sh_eth_get_wol,
 	.set_wol	= sh_eth_set_wol,
-- 
2.8.1
