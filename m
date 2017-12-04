Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:54005 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752162AbdLDOOQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 09:14:16 -0500
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH] net: sh_eth: do not advertise Gigabit capabilities when not available
Date: Mon,  4 Dec 2017 15:13:46 +0100
Message-Id: <20171204141346.17410-1-thomas.petazzoni@free-electrons.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Not all variants of the sh_eth hardware have Gigabit
support. Unfortunately, the current driver doesn't update
phydev->supported depending on the MAC capabilities. Due to this, if
you have a Gigabit capable PHY, the PHY will advertise its Gigabit
capability and establish a link at 1Gbit/s, even though the MAC
doesn't support it.

In order to avoid this, we mark phydev->supported if we're running a
non-Gigabit capable hardware.

Tested on a SH7786 platform, with a Gigabit PHY.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index db72d13cebb9..0074c5998481 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -1892,6 +1892,11 @@ static int sh_eth_phy_init(struct net_device *ndev)
 		return PTR_ERR(phydev);
 	}
 
+	/* mask with MAC supported features */
+	if (mdp->cd->register_type != SH_ETH_REG_GIGABIT)
+		phydev->supported &= PHY_BASIC_FEATURES;
+	phydev->advertising = phydev->supported;
+
 	phy_attached_info(phydev);
 
 	return 0;
-- 
2.13.6
