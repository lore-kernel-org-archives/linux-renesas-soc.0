Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41429 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730195AbeKUVzA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 16:55:00 -0500
From: Magnus Damm <magnus.damm@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, davem@davemloft.net,
        sergei.shtylyov@cogentembedded.com
Date: Wed, 21 Nov 2018 20:21:17 +0900
Message-Id: <154279927781.10272.2774991326285490398.sendpatchset@octo>
In-Reply-To: <154279926877.10272.700833429936129422.sendpatchset@octo>
References: <154279926877.10272.700833429936129422.sendpatchset@octo>
Subject: [PATCH v3 01/02] ravb: Do not announce HDX as supported
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

According to the data sheet the Ethernet-AVB hardware in R-Car Gen3
and R-Car Gen2 SoCs do not support half duplex operation. So update
the driver to mark 100Mbit and 1Gbps HDX as unsupported.

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
---

 Slightly reworked since V2 to make use of phy_remove_link_mode().
 In case Sergei wants to opt-out from the Reviewed-by tag for V2 let us know.
 
 Applies on top of next-20181121

 drivers/net/ethernet/renesas/ravb_main.c |    4 ++++
 1 file changed, 4 insertions(+)

--- 0001/drivers/net/ethernet/renesas/ravb_main.c
+++ work/drivers/net/ethernet/renesas/ravb_main.c	2018-11-21 19:47:58.165498803 +0900
@@ -1088,6 +1088,10 @@ static int ravb_phy_init(struct net_devi
 	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_Pause_BIT);
 	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_Asym_Pause_BIT);
 
+	/* Half Duplex is not supported */
+	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_1000baseT_Half_BIT);
+	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_100baseT_Half_BIT);
+
 	phy_attached_info(phydev);
 
 	return 0;
