Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf1-f171.google.com ([209.85.210.171]:38962 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbeHTSPs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 14:15:48 -0400
Received: by mail-pf1-f171.google.com with SMTP id j8-v6so6899692pff.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Aug 2018 07:59:49 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 20 Aug 2018 23:59:45 +0900
Message-Id: <153477718520.16950.10138071667883935510.sendpatchset@octo>
In-Reply-To: <153477717610.16950.5787705338176325405.sendpatchset@octo>
References: <153477717610.16950.5787705338176325405.sendpatchset@octo>
Subject: [PATCH/RFC v2 01/02] ravb: Do not announce HDX as supported
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

According to the data sheet the Ethernet-AVB hardware in R-Car Gen3
and R-Car Gen2 SoCs do not support half duplex operation. So update
the driver to mark 100Mbit and 1Gbps HDX as unsupported.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
---

 Written on top of next-20180820

 drivers/net/ethernet/renesas/ravb_main.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- 0001/drivers/net/ethernet/renesas/ravb_main.c
+++ work/drivers/net/ethernet/renesas/ravb_main.c	2018-08-20 23:42:46.670859449 +0900
@@ -1076,8 +1076,9 @@ static int ravb_phy_init(struct net_devi
 		netdev_info(ndev, "limited PHY to 100Mbit/s\n");
 	}
 
-	/* 10BASE is not supported */
-	phydev->supported &= ~PHY_10BT_FEATURES;
+	/* Neither 10BASE nor half duplex are supported */
+	phydev->supported &= ~(PHY_10BT_FEATURES | SUPPORTED_100baseT_Half |
+			       SUPPORTED_1000baseT_Half);
 
 	phy_attached_info(phydev);
 
