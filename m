Return-Path: <devicetree-owner@vger.kernel.org>
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
Subject: [PATCH net 08/16] net: ethernet: fs_enet: fix fixed-link phydev leaks
Date: Mon, 28 Nov 2016 19:25:01 +0100
Message-Id: <1480357509-28074-9-git-send-email-johan@kernel.org>
In-Reply-To: <1480357509-28074-1-git-send-email-johan@kernel.org>
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Make sure to deregister and free any fixed-link PHY registered using
of_phy_register_fixed_link() on probe errors and on driver unbind.

Fixes: bb74d9a4a87b ("fs_enet: use the new fixed PHY helpers")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index dc120c148d97..4b86260584a0 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -980,7 +980,7 @@ static int fs_enet_probe(struct platform_device *ofdev)
 		err = clk_prepare_enable(clk);
 		if (err) {
 			ret = err;
-			goto out_free_fpi;
+			goto out_deregister_fixed_link;
 		}
 		fpi->clk_per = clk;
 	}
@@ -1061,6 +1061,9 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	of_node_put(fpi->phy_node);
 	if (fpi->clk_per)
 		clk_disable_unprepare(fpi->clk_per);
+out_deregister_fixed_link:
+	if (of_phy_is_fixed_link(ofdev->dev.of_node))
+		of_phy_deregister_fixed_link(ofdev->dev.of_node);
 out_free_fpi:
 	kfree(fpi);
 	return ret;
@@ -1079,6 +1082,8 @@ static int fs_enet_remove(struct platform_device *ofdev)
 	of_node_put(fep->fpi->phy_node);
 	if (fep->fpi->clk_per)
 		clk_disable_unprepare(fep->fpi->clk_per);
+	if (of_phy_is_fixed_link(ofdev->dev.of_node))
+		of_phy_deregister_fixed_link(ofdev->dev.of_node);
 	free_netdev(ndev);
 	return 0;
 }
-- 
2.7.3

