Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:42825 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932290AbeGDIPX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 04:15:23 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>
CC: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 07/14] sh_eth: remove custom .set_link_ksettings from ethtool ops
Date: Wed, 4 Jul 2018 11:14:49 +0300
Message-ID: <20180704081451.7482-3-vladimir_zapolskiy@mentor.com>
In-Reply-To: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The generic phy_ethtool_set_link_ksettings() function from phylib can
be used instead of in-house sh_eth_set_link_ksettings().

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index bd4a0b9c3362..5614fd231bbe 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -2040,15 +2040,6 @@ static int sh_eth_phy_start(struct net_device *ndev)
 	return 0;
 }
 
-static int sh_eth_set_link_ksettings(struct net_device *ndev,
-				     const struct ethtool_link_ksettings *cmd)
-{
-	if (!ndev->phydev)
-		return -ENODEV;
-
-	return phy_ethtool_ksettings_set(ndev->phydev, cmd);
-}
-
 /* If it is ever necessary to increase SH_ETH_REG_DUMP_MAX_REGS, the
  * version must be bumped as well.  Just adding registers up to that
  * limit is fine, as long as the existing register indices don't
@@ -2388,7 +2379,7 @@ static const struct ethtool_ops sh_eth_ethtool_ops = {
 	.get_ringparam	= sh_eth_get_ringparam,
 	.set_ringparam	= sh_eth_set_ringparam,
 	.get_link_ksettings = phy_ethtool_get_link_ksettings,
-	.set_link_ksettings = sh_eth_set_link_ksettings,
+	.set_link_ksettings = phy_ethtool_set_link_ksettings,
 	.get_wol	= sh_eth_get_wol,
 	.set_wol	= sh_eth_set_wol,
 };
-- 
2.17.1
