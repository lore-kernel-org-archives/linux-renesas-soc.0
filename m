Return-Path: <devicetree-owner@vger.kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
        "David S. Miller" <davem@davemloft.net>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Fugang Duan <fugang.duan@nxp.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Woojung Huh <woojung.huh@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Antoine Tenart <antoine.tenart@free-electrons.com>,
        Tobias Jordan <Tobias.Jordan@elektrobit.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>,
        Maxim Uvarov <muvarov@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-renesas-soc@vger.kernel.org (open list:RENESAS ETHERNET DRIVERS),
        linux-omap@vger.kernel.org (open list:TI ETHERNET SWITCH DRIVER (CPSW)),
        linux-usb@vger.kernel.org (open list:USB NETWORKING DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE)
Subject: [PATCH net-next 1/2] of: mdio: Fall back to mdiobus_register() with np is NULL
Date: Tue, 15 May 2018 14:59:29 -0700
Message-Id: <20180515215930.12115-2-f.fainelli@gmail.com>
In-Reply-To: <20180515215930.12115-1-f.fainelli@gmail.com>
References: <20180515215930.12115-1-f.fainelli@gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When the Device Tree node specified is NULL, fall back to
mdiobus_register(). We have a number of drivers having a similar pattern
which is:

if (np)
	of_mdiobus_register()
else
	mdiobus_register()

so incorporate that behavior within the core of_mdiobus_register()
function. This is also consistent with the stub version that we defined
when CONFIG_OF=n.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/of/of_mdio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 8c0c92712fc9..2341dbf675bf 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -204,6 +204,12 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 	bool scanphys = false;
 	int addr, rc;
 
+	/* If the Device Tree node does not exist, fall back to traditional
+	 * registration
+	 */
+	if (!np)
+		return mdiobus_register(mdio);
+
 	/* Do not continue if the node is disabled */
 	if (!of_device_is_available(np))
 		return -ENODEV;
-- 
2.14.1

