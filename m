Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:55239 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032915AbeEXLMN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 07:12:13 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 4/6] sh_eth: remove custom .nway_reset from ethtool ops
Date: Thu, 24 May 2018 14:11:56 +0300
Message-ID: <1527160318-10958-5-git-send-email-vladimir_zapolskiy@mentor.com>
In-Reply-To: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The change fixes a sleep in atomic context issue, which can be
always triggered by running 'ethtool -r' command, because
phy_start_aneg() protects phydev fields by a mutex.

Another note is that the change implicitly replaces phy_start_aneg()
with a newer phy_restart_aneg().

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index d9cadfb1bc4a..6d1fed2b4a4a 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -2252,22 +2252,6 @@ static void sh_eth_get_regs(struct net_device *ndev, struct ethtool_regs *regs,
 	pm_runtime_put_sync(&mdp->pdev->dev);
 }
 
-static int sh_eth_nway_reset(struct net_device *ndev)
-{
-	struct sh_eth_private *mdp = netdev_priv(ndev);
-	unsigned long flags;
-	int ret;
-
-	if (!ndev->phydev)
-		return -ENODEV;
-
-	spin_lock_irqsave(&mdp->lock, flags);
-	ret = phy_start_aneg(ndev->phydev);
-	spin_unlock_irqrestore(&mdp->lock, flags);
-
-	return ret;
-}
-
 static u32 sh_eth_get_msglevel(struct net_device *ndev)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
@@ -2418,7 +2402,7 @@ static int sh_eth_set_wol(struct net_device *ndev, struct ethtool_wolinfo *wol)
 static const struct ethtool_ops sh_eth_ethtool_ops = {
 	.get_regs_len	= sh_eth_get_regs_len,
 	.get_regs	= sh_eth_get_regs,
-	.nway_reset	= sh_eth_nway_reset,
+	.nway_reset	= phy_ethtool_nway_reset,
 	.get_msglevel	= sh_eth_get_msglevel,
 	.set_msglevel	= sh_eth_set_msglevel,
 	.get_link	= ethtool_op_get_link,
-- 
2.8.1
