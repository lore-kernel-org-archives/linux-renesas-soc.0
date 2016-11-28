Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34817 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751453AbcK1S13 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Nov 2016 13:27:29 -0500
From: Johan Hovold <johan@kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: Vince Bridgers <vbridger@opensource.altera.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Fugang Duan <fugang.duan@nxp.com>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Vitaly Bordug <vbordug@ru.mvista.com>,
        Claudiu Manoil <claudiu.manoil@freescale.com>,
        Li Yang <leoli@freescale.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Felix Fietkau <nbd@openwrt.org>,
        John Crispin <blogic@openwrt.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Lars Persson <lars.persson@axis.com>,
        Mugunthan V N <mugunthanvnm@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
        netdev@vger.kernel.org, nios2-dev@lists.rocketboards.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH net 03/16] net: ethernet: altera: fix fixed-link phydev leaks
Date: Mon, 28 Nov 2016 19:24:56 +0100
Message-Id: <1480357509-28074-4-git-send-email-johan@kernel.org>
In-Reply-To: <1480357509-28074-1-git-send-email-johan@kernel.org>
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Make sure to deregister and free any fixed-link PHY registered using
of_phy_register_fixed_link() on probe errors and on driver unbind.

Fixes: 7cdbc6f74f8e ("altera tse: add support for fixed-links.")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/net/ethernet/altera/altera_tse_main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index bda31f308cc2..6532829b70d2 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -819,6 +819,8 @@ static int init_phy(struct net_device *dev)
 
 	if (!phydev) {
 		netdev_err(dev, "Could not find the PHY\n");
+		if (fixed_link)
+			of_phy_deregister_fixed_link(priv->device->of_node);
 		return -ENODEV;
 	}
 
@@ -1545,10 +1547,15 @@ static int altera_tse_probe(struct platform_device *pdev)
 static int altera_tse_remove(struct platform_device *pdev)
 {
 	struct net_device *ndev = platform_get_drvdata(pdev);
+	struct altera_tse_private *priv = netdev_priv(ndev);
 
-	if (ndev->phydev)
+	if (ndev->phydev) {
 		phy_disconnect(ndev->phydev);
 
+		if (of_phy_is_fixed_link(priv->device->of_node))
+			of_phy_deregister_fixed_link(priv->device->of_node);
+	}
+
 	platform_set_drvdata(pdev, NULL);
 	altera_tse_mdio_destroy(ndev);
 	unregister_netdev(ndev);
-- 
2.7.3
