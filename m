Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:55230 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968151AbeEXLMI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 07:12:08 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 2/6] ravb: remove custom .get_link_ksettings from ethtool ops
Date: Thu, 24 May 2018 14:11:54 +0300
Message-ID: <1527160318-10958-3-git-send-email-vladimir_zapolskiy@mentor.com>
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
 drivers/net/ethernet/renesas/ravb_main.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 4a043eb0e2aa..3d91caa44176 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1096,22 +1096,6 @@ static int ravb_phy_start(struct net_device *ndev)
 	return 0;
 }
 
-static int ravb_get_link_ksettings(struct net_device *ndev,
-				   struct ethtool_link_ksettings *cmd)
-{
-	struct ravb_private *priv = netdev_priv(ndev);
-	unsigned long flags;
-
-	if (!ndev->phydev)
-		return -ENODEV;
-
-	spin_lock_irqsave(&priv->lock, flags);
-	phy_ethtool_ksettings_get(ndev->phydev, cmd);
-	spin_unlock_irqrestore(&priv->lock, flags);
-
-	return 0;
-}
-
 static int ravb_set_link_ksettings(struct net_device *ndev,
 				   const struct ethtool_link_ksettings *cmd)
 {
@@ -1372,7 +1356,7 @@ static const struct ethtool_ops ravb_ethtool_ops = {
 	.get_ringparam		= ravb_get_ringparam,
 	.set_ringparam		= ravb_set_ringparam,
 	.get_ts_info		= ravb_get_ts_info,
-	.get_link_ksettings	= ravb_get_link_ksettings,
+	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
 	.set_link_ksettings	= ravb_set_link_ksettings,
 	.get_wol		= ravb_get_wol,
 	.set_wol		= ravb_set_wol,
-- 
2.8.1
