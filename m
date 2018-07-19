Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42246 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbeGSMb6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 08:31:58 -0400
Received: by mail-pg1-f193.google.com with SMTP id y4-v6so3537583pgp.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 04:49:11 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 19 Jul 2018 20:51:15 +0900
Message-Id: <153200107566.13504.725250500519176904.sendpatchset@little-apple>
In-Reply-To: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
References: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
Subject: [PATCH/RFC 02/02] ravb: Clean up duplex handling
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Since only full-duplex operation is supported by the
hardware, remove duplex handling code and keep the
register setting of ECMR.DM fixed at 1.

This updates the driver implementation to follow the
data sheet text "This bit should always be set to 1."

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Written on top of renesas-drivers-2018-07-17-v4.18-rc5

 drivers/net/ethernet/renesas/ravb.h      |    1 -
 drivers/net/ethernet/renesas/ravb_main.c |   26 +-------------------------
 2 files changed, 1 insertion(+), 26 deletions(-)

--- 0001/drivers/net/ethernet/renesas/ravb.h
+++ work/drivers/net/ethernet/renesas/ravb.h	2018-07-19 19:43:11.830607110 +0900
@@ -1027,7 +1027,6 @@ struct ravb_private {
 	phy_interface_t phy_interface;
 	int msg_enable;
 	int speed;
-	int duplex;
 	int emac_irq;
 	enum ravb_chip_id chip_id;
 	int rx_irqs[NUM_RX_QUEUE];
--- 0003/drivers/net/ethernet/renesas/ravb_main.c
+++ work/drivers/net/ethernet/renesas/ravb_main.c	2018-07-19 19:44:14.370607110 +0900
@@ -85,13 +85,6 @@ static int ravb_config(struct net_device
 	return error;
 }
 
-static void ravb_set_duplex(struct net_device *ndev)
-{
-	struct ravb_private *priv = netdev_priv(ndev);
-
-	ravb_modify(ndev, ECMR, ECMR_DM, priv->duplex ? ECMR_DM : 0);
-}
-
 static void ravb_set_rate(struct net_device *ndev)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -401,13 +394,11 @@ error:
 /* E-MAC init function */
 static void ravb_emac_init(struct net_device *ndev)
 {
-	struct ravb_private *priv = netdev_priv(ndev);
-
 	/* Receive frame limit set register */
 	ravb_write(ndev, ndev->mtu + ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN, RFLR);
 
 	/* EMAC Mode: PAUSE prohibition; Duplex; RX Checksum; TX; RX */
-	ravb_write(ndev, ECMR_ZPF | (priv->duplex ? ECMR_DM : 0) |
+	ravb_write(ndev, ECMR_ZPF | ECMR_DM |
 		   (ndev->features & NETIF_F_RXCSUM ? ECMR_RCSC : 0) |
 		   ECMR_TE | ECMR_RE, ECMR);
 
@@ -982,12 +973,6 @@ static void ravb_adjust_link(struct net_
 	bool new_state = false;
 
 	if (phydev->link) {
-		if (phydev->duplex != priv->duplex) {
-			new_state = true;
-			priv->duplex = phydev->duplex;
-			ravb_set_duplex(ndev);
-		}
-
 		if (phydev->speed != priv->speed) {
 			new_state = true;
 			priv->speed = phydev->speed;
@@ -1004,7 +989,6 @@ static void ravb_adjust_link(struct net_
 		new_state = true;
 		priv->link = 0;
 		priv->speed = 0;
-		priv->duplex = -1;
 		if (priv->no_avb_link)
 			ravb_rcv_snd_disable(ndev);
 	}
@@ -1029,7 +1013,6 @@ static int ravb_phy_init(struct net_devi
 
 	priv->link = 0;
 	priv->speed = 0;
-	priv->duplex = -1;
 
 	/* Try connecting to PHY */
 	pn = of_parse_phandle(np, "phy-handle", 0);
@@ -1131,13 +1114,6 @@ static int ravb_set_link_ksettings(struc
 	if (error)
 		goto error_exit;
 
-	if (cmd->base.duplex == DUPLEX_FULL)
-		priv->duplex = 1;
-	else
-		priv->duplex = 0;
-
-	ravb_set_duplex(ndev);
-
 error_exit:
 	mdelay(1);
 
