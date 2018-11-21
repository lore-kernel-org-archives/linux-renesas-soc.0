Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32914 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729555AbeKUVzJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 16:55:09 -0500
From: Magnus Damm <magnus.damm@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, davem@davemloft.net,
        sergei.shtylyov@cogentembedded.com
Date: Wed, 21 Nov 2018 20:21:26 +0900
Message-Id: <154279928683.10272.8364745949300109786.sendpatchset@octo>
In-Reply-To: <154279926877.10272.700833429936129422.sendpatchset@octo>
References: <154279926877.10272.700833429936129422.sendpatchset@octo>
Subject: [PATCH v3 02/02] ravb: Clean up duplex handling
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Since only full-duplex operation is supported by the
hardware, remove duplex handling code and keep the
register setting of ECMR.DM fixed at 1.

This updates the driver implementation to follow the
data sheet text "This bit should always be set to 1."

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
---

 Applies on top of next-20181121

 drivers/net/ethernet/renesas/ravb.h      |    1 -
 drivers/net/ethernet/renesas/ravb_main.c |   19 +------------------
 2 files changed, 1 insertion(+), 19 deletions(-)

--- 0001/drivers/net/ethernet/renesas/ravb.h
+++ work/drivers/net/ethernet/renesas/ravb.h	2018-11-21 19:50:04.477121118 +0900
@@ -1032,7 +1032,6 @@ struct ravb_private {
 	phy_interface_t phy_interface;
 	int msg_enable;
 	int speed;
-	int duplex;
 	int emac_irq;
 	enum ravb_chip_id chip_id;
 	int rx_irqs[NUM_RX_QUEUE];
--- 0002/drivers/net/ethernet/renesas/ravb_main.c
+++ work/drivers/net/ethernet/renesas/ravb_main.c	2018-11-21 19:50:04.479121223 +0900
@@ -82,13 +82,6 @@ static int ravb_config(struct net_device
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
@@ -406,13 +399,11 @@ error:
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
 
@@ -995,12 +986,6 @@ static void ravb_adjust_link(struct net_
 		ravb_rcv_snd_disable(ndev);
 
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
@@ -1015,7 +1000,6 @@ static void ravb_adjust_link(struct net_
 		new_state = true;
 		priv->link = 0;
 		priv->speed = 0;
-		priv->duplex = -1;
 	}
 
 	/* Enable TX and RX right over here, if E-MAC change is ignored */
@@ -1045,7 +1029,6 @@ static int ravb_phy_init(struct net_devi
 
 	priv->link = 0;
 	priv->speed = 0;
-	priv->duplex = -1;
 
 	/* Try connecting to PHY */
 	pn = of_parse_phandle(np, "phy-handle", 0);
