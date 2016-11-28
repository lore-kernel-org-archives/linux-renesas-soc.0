Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33722 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751332AbcK1S12 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Nov 2016 13:27:28 -0500
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
Subject: [PATCH net 01/16] net: dsa: slave: fix of-node leak and phy priority
Date: Mon, 28 Nov 2016 19:24:54 +0100
Message-Id: <1480357509-28074-2-git-send-email-johan@kernel.org>
In-Reply-To: <1480357509-28074-1-git-send-email-johan@kernel.org>
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Make sure to drop the reference taken by of_parse_phandle() before
returning from dsa_slave_phy_setup().

Note that this also modifies the PHY priority so that any fixed-link
node is only parsed when no phy-handle is given, which is in accordance
with the common scheme for this.

Fixes: 0d8bcdd383b8 ("net: dsa: allow for more complex PHY setups")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 net/dsa/slave.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index 6b1282c006b1..2a5c20a13fe4 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -1125,7 +1125,7 @@ static int dsa_slave_phy_setup(struct dsa_slave_priv *p,
 	p->phy_interface = mode;
 
 	phy_dn = of_parse_phandle(port_dn, "phy-handle", 0);
-	if (of_phy_is_fixed_link(port_dn)) {
+	if (!phy_dn && of_phy_is_fixed_link(port_dn)) {
 		/* In the case of a fixed PHY, the DT node associated
 		 * to the fixed PHY is the Port DT node
 		 */
@@ -1135,7 +1135,7 @@ static int dsa_slave_phy_setup(struct dsa_slave_priv *p,
 			return ret;
 		}
 		phy_is_fixed = true;
-		phy_dn = port_dn;
+		phy_dn = of_node_get(port_dn);
 	}
 
 	if (ds->ops->get_phy_flags)
@@ -1154,6 +1154,7 @@ static int dsa_slave_phy_setup(struct dsa_slave_priv *p,
 			ret = dsa_slave_phy_connect(p, slave_dev, phy_id);
 			if (ret) {
 				netdev_err(slave_dev, "failed to connect to phy%d: %d\n", phy_id, ret);
+				of_node_put(phy_dn);
 				return ret;
 			}
 		} else {
@@ -1162,6 +1163,8 @@ static int dsa_slave_phy_setup(struct dsa_slave_priv *p,
 						phy_flags,
 						p->phy_interface);
 		}
+
+		of_node_put(phy_dn);
 	}
 
 	if (p->phy && phy_is_fixed)
-- 
2.7.3
