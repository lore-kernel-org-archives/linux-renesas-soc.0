Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:42618 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932517AbeGDINH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 04:13:07 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>
CC: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 03/14] sh_eth: simplify link auto-negotiation by ethtool
Date: Wed, 4 Jul 2018 11:12:41 +0300
Message-ID: <20180704081245.7395-4-vladimir_zapolskiy@mentor.com>
In-Reply-To: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

There is no need to call a heavyweight phy_start_aneg() for phy
auto-negotiation by ethtool, the phy is already initialized and
link auto-negotiation is started by calling phy_start() from
sh_eth_phy_start() when a network device is opened.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 8e429e865552..1bed2ee4d709 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -2249,7 +2249,7 @@ static int sh_eth_nway_reset(struct net_device *ndev)
 	if (!ndev->phydev)
 		return -ENODEV;
 
-	return phy_start_aneg(ndev->phydev);
+	return phy_restart_aneg(ndev->phydev);
 }
 
 static u32 sh_eth_get_msglevel(struct net_device *ndev)
-- 
2.17.1
