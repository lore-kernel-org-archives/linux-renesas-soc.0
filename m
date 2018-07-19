Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:47091 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbeGSMbt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 08:31:49 -0400
Received: by mail-pf0-f196.google.com with SMTP id u24-v6so107878pfn.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 04:49:02 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 19 Jul 2018 20:51:07 +0900
Message-Id: <153200106718.13504.7319401547888522726.sendpatchset@little-apple>
In-Reply-To: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
References: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
Subject: [PATCH/RFC 01/02] ravb: Do not announce 100Mbps HDX as supported
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

According to the data sheet the Ethernet-AVB hardware in R-Car Gen3
and R-Car Gen2 SoCs do not support half duplex operation. So update
the driver to mark 100Mbit HDX as unsupported.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Written on top of renesas-drivers-2018-07-17-v4.18-rc5

 drivers/net/ethernet/renesas/ravb_main.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- 0001/drivers/net/ethernet/renesas/ravb_main.c
+++ work/drivers/net/ethernet/renesas/ravb_main.c	2018-07-19 19:18:38.210607110 +0900
@@ -1066,8 +1066,8 @@ static int ravb_phy_init(struct net_devi
 		netdev_info(ndev, "limited PHY to 100Mbit/s\n");
 	}
 
-	/* 10BASE is not supported */
-	phydev->supported &= ~PHY_10BT_FEATURES;
+	/* Nether 10BASE nor half duplex is supported */
+	phydev->supported &= ~(PHY_10BT_FEATURES | SUPPORTED_100baseT_Half);
 
 	phy_attached_info(phydev);
 
