Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:55220 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967742AbeEXLMG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 07:12:06 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 1/6] ravb: remove custom .nway_reset from ethtool ops
Date: Thu, 24 May 2018 14:11:53 +0300
Message-ID: <1527160318-10958-2-git-send-email-vladimir_zapolskiy@mentor.com>
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
 drivers/net/ethernet/renesas/ravb_main.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 68f122140966..4a043eb0e2aa 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1150,21 +1150,6 @@ static int ravb_set_link_ksettings(struct net_device *ndev,
 	return error;
 }
 
-static int ravb_nway_reset(struct net_device *ndev)
-{
-	struct ravb_private *priv = netdev_priv(ndev);
-	int error = -ENODEV;
-	unsigned long flags;
-
-	if (ndev->phydev) {
-		spin_lock_irqsave(&priv->lock, flags);
-		error = phy_start_aneg(ndev->phydev);
-		spin_unlock_irqrestore(&priv->lock, flags);
-	}
-
-	return error;
-}
-
 static u32 ravb_get_msglevel(struct net_device *ndev)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -1377,7 +1362,7 @@ static int ravb_set_wol(struct net_device *ndev, struct ethtool_wolinfo *wol)
 }
 
 static const struct ethtool_ops ravb_ethtool_ops = {
-	.nway_reset		= ravb_nway_reset,
+	.nway_reset		= phy_ethtool_nway_reset,
 	.get_msglevel		= ravb_get_msglevel,
 	.set_msglevel		= ravb_set_msglevel,
 	.get_link		= ethtool_op_get_link,
-- 
2.8.1
