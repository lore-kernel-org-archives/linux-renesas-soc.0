Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:42843 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933918AbeGDIP3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 04:15:29 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>
CC: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 09/14] ravb: fix invalid context bug while changing link options by ethtool
Date: Wed, 4 Jul 2018 11:14:51 +0300
Message-ID: <20180704081451.7482-5-vladimir_zapolskiy@mentor.com>
In-Reply-To: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The change fixes sleep in atomic context bug, which is encountered
every time when link settings are changed by ethtool.

Since commit 35b5f6b1a82b ("PHYLIB: Locking fixes for PHY I/O
potentially sleeping") phy_start_aneg() function utilizes a mutex
to serialize changes to phy state, however that helper function is
called in atomic context under a grabbed spinlock, because
phy_start_aneg() is called by phy_ethtool_ksettings_set() and by
replaced phy_ethtool_sset() helpers from phylib.

Now duplex mode setting is enforced in ravb_adjust_link() only, also
now RX/TX is disabled when link is put down or modifications to E-MAC
registers ECMR and GECMR are expected for both cases of checked and
ignored link status pin state from E-MAC interrupt handler.

Fixes: a0d2f20650e8 ("Renesas Ethernet AVB PTP clock driver")
Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 49 ++++++++----------------
 1 file changed, 15 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index e7d6d1b6e7d6..40266fe01186 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -980,6 +980,13 @@ static void ravb_adjust_link(struct net_device *ndev)
 	struct ravb_private *priv = netdev_priv(ndev);
 	struct phy_device *phydev = ndev->phydev;
 	bool new_state = false;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	/* Disable TX and RX right over here, if E-MAC change is ignored */
+	if (priv->no_avb_link)
+		ravb_rcv_snd_disable(ndev);
 
 	if (phydev->link) {
 		if (phydev->duplex != priv->duplex) {
@@ -997,18 +1004,21 @@ static void ravb_adjust_link(struct net_device *ndev)
 			ravb_modify(ndev, ECMR, ECMR_TXF, 0);
 			new_state = true;
 			priv->link = phydev->link;
-			if (priv->no_avb_link)
-				ravb_rcv_snd_enable(ndev);
 		}
 	} else if (priv->link) {
 		new_state = true;
 		priv->link = 0;
 		priv->speed = 0;
 		priv->duplex = -1;
-		if (priv->no_avb_link)
-			ravb_rcv_snd_disable(ndev);
 	}
 
+	/* Enable TX and RX right over here, if E-MAC change is ignored */
+	if (priv->no_avb_link && phydev->link)
+		ravb_rcv_snd_enable(ndev);
+
+	mmiowb();
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	if (new_state && netif_msg_link(priv))
 		phy_print_status(phydev);
 }
@@ -1115,39 +1125,10 @@ static int ravb_get_link_ksettings(struct net_device *ndev,
 static int ravb_set_link_ksettings(struct net_device *ndev,
 				   const struct ethtool_link_ksettings *cmd)
 {
-	struct ravb_private *priv = netdev_priv(ndev);
-	unsigned long flags;
-	int error;
-
 	if (!ndev->phydev)
 		return -ENODEV;
 
-	spin_lock_irqsave(&priv->lock, flags);
-
-	/* Disable TX and RX */
-	ravb_rcv_snd_disable(ndev);
-
-	error = phy_ethtool_ksettings_set(ndev->phydev, cmd);
-	if (error)
-		goto error_exit;
-
-	if (cmd->base.duplex == DUPLEX_FULL)
-		priv->duplex = 1;
-	else
-		priv->duplex = 0;
-
-	ravb_set_duplex(ndev);
-
-error_exit:
-	mdelay(1);
-
-	/* Enable TX and RX */
-	ravb_rcv_snd_enable(ndev);
-
-	mmiowb();
-	spin_unlock_irqrestore(&priv->lock, flags);
-
-	return error;
+	return phy_ethtool_ksettings_set(ndev->phydev, cmd);
 }
 
 static int ravb_nway_reset(struct net_device *ndev)
-- 
2.17.1
