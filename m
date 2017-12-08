Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:46358 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753786AbdLHPf4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Dec 2017 10:35:56 -0500
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v3] net: sh_eth: do not advertise Gigabit capabilities when not available
Date: Fri,  8 Dec 2017 16:35:40 +0100
Message-Id: <20171208153540.3323-1-thomas.petazzoni@free-electrons.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Not all variants of the sh_eth hardware have Gigabit
support. Unfortunately, the current driver doesn't tell the PHY about
the limited MAC capabilities. Due to this, if you have a Gigabit
capable PHY, the PHY will advertise its Gigabit capability and
establish a link at 1Gbit/s, even though the MAC doesn't support it.

In order to avoid this, we use the recently introduced
phy_set_max_speed() to tell the PHY to not advertise speed higher than
100 MBit/s.

Tested on a SH7786 platform, with a Gigabit PHY.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v2:
 - Drop goto construction used in the phy_set_max_speed() error
   handling, as it is not needed. Suggested by Sergei Shtylyov.

Changes since v1:
 - Use phy_set_max_speed(), as suggested by Sergei Shtylyov
   <sergei.shtylyov@cogentembedded.com>.
---
 drivers/net/ethernet/renesas/sh_eth.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index db72d13cebb9..75323000c364 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -1892,6 +1892,16 @@ static int sh_eth_phy_init(struct net_device *ndev)
 		return PTR_ERR(phydev);
 	}
 
+	/* mask with MAC supported features */
+	if (mdp->cd->register_type != SH_ETH_REG_GIGABIT) {
+		int err = phy_set_max_speed(phydev, SPEED_100);
+		if (err) {
+			netdev_err(ndev, "failed to limit PHY to 100 Mbit/s\n");
+			phy_disconnect(phydev);
+			return err;
+		}
+	}
+
 	phy_attached_info(phydev);
 
 	return 0;
-- 
2.14.3
