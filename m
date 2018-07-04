Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:42964 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932517AbeGDIQa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 04:16:30 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>
CC: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 13/14] ravb: remove custom .get_link_ksettings from ethtool ops
Date: Wed, 4 Jul 2018 11:16:11 +0300
Message-ID: <20180704081612.7628-4-vladimir_zapolskiy@mentor.com>
In-Reply-To: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The generic phy_ethtool_get_link_ksettings() function from phylib can be
used instead of in-house ravb_get_link_ksettings().

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 772687a5faee..9fe01259be6f 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1106,17 +1106,6 @@ static int ravb_phy_start(struct net_device *ndev)
 	return 0;
 }
 
-static int ravb_get_link_ksettings(struct net_device *ndev,
-				   struct ethtool_link_ksettings *cmd)
-{
-	if (!ndev->phydev)
-		return -ENODEV;
-
-	phy_ethtool_ksettings_get(ndev->phydev, cmd);
-
-	return 0;
-}
-
 static int ravb_set_link_ksettings(struct net_device *ndev,
 				   const struct ethtool_link_ksettings *cmd)
 {
@@ -1348,7 +1337,7 @@ static const struct ethtool_ops ravb_ethtool_ops = {
 	.get_ringparam		= ravb_get_ringparam,
 	.set_ringparam		= ravb_set_ringparam,
 	.get_ts_info		= ravb_get_ts_info,
-	.get_link_ksettings	= ravb_get_link_ksettings,
+	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
 	.set_link_ksettings	= ravb_set_link_ksettings,
 	.get_wol		= ravb_get_wol,
 	.set_wol		= ravb_set_wol,
-- 
2.17.1
