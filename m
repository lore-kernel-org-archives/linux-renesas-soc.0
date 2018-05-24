Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:55564 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968650AbeEXLOy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 07:14:54 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 6/6] sh_eth: remove custom .set_link_ksettings from ethtool ops
Date: Thu, 24 May 2018 14:14:44 +0300
Message-ID: <1527160484-11087-2-git-send-email-vladimir_zapolskiy@mentor.com>
In-Reply-To: <1527160484-11087-1-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160484-11087-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The change replaces a custom implementation of .set_link_ksettings
callback with a shared phy_ethtool_set_link_ksettings(), this fixes
sleep in atomic context bug, which is encountered every time when link
settings are changed by ethtool.

Now duplex mode setting is enforced in ravb_adjust_link() only, also
now TX/RX is disabled when link is put down or modifications to E-MAC
registers ECMR and GECMR are expected for both cases of checked and
ignored link status pin state from E-MAC interrupt handler.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 58 +++++++++--------------------------
 1 file changed, 15 insertions(+), 43 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index e627b2b6c3b3..a3115888bd04 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -1916,8 +1916,15 @@ static void sh_eth_adjust_link(struct net_device *ndev)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
 	struct phy_device *phydev = ndev->phydev;
+	unsigned long flags;
 	int new_state = 0;
 
+	spin_lock_irqsave(&mdp->lock, flags);
+
+	/* Disable TX and RX right over here, if E-MAC change is ignored */
+	if (mdp->cd->no_psr || mdp->no_ether_link)
+		sh_eth_rcv_snd_disable(ndev);
+
 	if (phydev->link) {
 		if (phydev->duplex != mdp->duplex) {
 			new_state = 1;
@@ -1936,18 +1943,21 @@ static void sh_eth_adjust_link(struct net_device *ndev)
 			sh_eth_modify(ndev, ECMR, ECMR_TXF, 0);
 			new_state = 1;
 			mdp->link = phydev->link;
-			if (mdp->cd->no_psr || mdp->no_ether_link)
-				sh_eth_rcv_snd_enable(ndev);
 		}
 	} else if (mdp->link) {
 		new_state = 1;
 		mdp->link = 0;
 		mdp->speed = 0;
 		mdp->duplex = -1;
-		if (mdp->cd->no_psr || mdp->no_ether_link)
-			sh_eth_rcv_snd_disable(ndev);
 	}
 
+	/* Enable TX and RX right over here, if E-MAC change is ignored */
+	if ((mdp->cd->no_psr || mdp->no_ether_link) && phydev->link)
+		sh_eth_rcv_snd_enable(ndev);
+
+	mmiowb();
+	spin_unlock_irqrestore(&mdp->lock, flags);
+
 	if (new_state && netif_msg_link(mdp))
 		phy_print_status(phydev);
 }
@@ -2019,44 +2029,6 @@ static int sh_eth_phy_start(struct net_device *ndev)
 	return 0;
 }
 
-static int sh_eth_set_link_ksettings(struct net_device *ndev,
-				     const struct ethtool_link_ksettings *cmd)
-{
-	struct sh_eth_private *mdp = netdev_priv(ndev);
-	unsigned long flags;
-	int ret;
-
-	if (!ndev->phydev)
-		return -ENODEV;
-
-	spin_lock_irqsave(&mdp->lock, flags);
-
-	/* disable tx and rx */
-	sh_eth_rcv_snd_disable(ndev);
-
-	ret = phy_ethtool_ksettings_set(ndev->phydev, cmd);
-	if (ret)
-		goto error_exit;
-
-	if (cmd->base.duplex == DUPLEX_FULL)
-		mdp->duplex = 1;
-	else
-		mdp->duplex = 0;
-
-	if (mdp->cd->set_duplex)
-		mdp->cd->set_duplex(ndev);
-
-error_exit:
-	mdelay(1);
-
-	/* enable tx and rx */
-	sh_eth_rcv_snd_enable(ndev);
-
-	spin_unlock_irqrestore(&mdp->lock, flags);
-
-	return ret;
-}
-
 /* If it is ever necessary to increase SH_ETH_REG_DUMP_MAX_REGS, the
  * version must be bumped as well.  Just adding registers up to that
  * limit is fine, as long as the existing register indices don't
@@ -2396,7 +2368,7 @@ static const struct ethtool_ops sh_eth_ethtool_ops = {
 	.get_ringparam	= sh_eth_get_ringparam,
 	.set_ringparam	= sh_eth_set_ringparam,
 	.get_link_ksettings = phy_ethtool_get_link_ksettings,
-	.set_link_ksettings = sh_eth_set_link_ksettings,
+	.set_link_ksettings = phy_ethtool_set_link_ksettings,
 	.get_wol	= sh_eth_get_wol,
 	.set_wol	= sh_eth_set_wol,
 };
-- 
2.8.1
