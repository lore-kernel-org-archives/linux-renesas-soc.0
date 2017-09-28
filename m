Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:46582 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752025AbdI1Px5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2017 11:53:57 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: "David S . Miller" <davem@davemloft.net>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] ravb: Add optional PHY reset during system resume
Date: Thu, 28 Sep 2017 17:53:32 +0200
Message-Id: <1506614014-4398-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1506614014-4398-1-git-send-email-geert+renesas@glider.be>
References: <1506614014-4398-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If the optional "reset-gpios" property is specified in DT, the generic
MDIO bus code takes care of resetting the PHY during device probe.
However, the PHY may still have to be reset explicitly after system
resume.

This allows to restore Ethernet operation after resume from s2ram on
Salvator-XS, where the enable pin of the regulator providing PHY power
is connected to PRESETn, and PSCI suspend powers down the SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/ethernet/renesas/ravb_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index fdf30bfa403bf416..96d1d48e302f8c9a 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -19,6 +19,7 @@
 #include <linux/etherdevice.h>
 #include <linux/ethtool.h>
 #include <linux/if_vlan.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -2268,6 +2269,7 @@ static int __maybe_unused ravb_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
+	struct mii_bus *bus = priv->mii_bus;
 	int ret = 0;
 
 	if (priv->wol_enabled) {
@@ -2302,6 +2304,13 @@ static int __maybe_unused ravb_resume(struct device *dev)
 	 * reopen device if it was running before system suspended.
 	 */
 
+	/* PHY reset */
+	if (bus->reset_gpiod) {
+		gpiod_set_value_cansleep(bus->reset_gpiod, 1);
+		udelay(bus->reset_delay_us);
+		gpiod_set_value_cansleep(bus->reset_gpiod, 0);
+	}
+
 	/* Set AVB config mode */
 	ravb_set_config_mode(ndev);
 
-- 
2.7.4
