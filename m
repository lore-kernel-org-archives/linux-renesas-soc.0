Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:34390 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752413AbeAILLf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jan 2018 06:11:35 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Russell King <rmk+kernel@armlinux.org.uk>,
        "David S . Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] net: phy: Fix phy_modify() semantic difference fallout
Date: Tue,  9 Jan 2018 12:11:21 +0100
Message-Id: <1515496281-10988-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In case of success, the return values of (__)phy_write() and
(__)phy_modify() are not compatible: (__)phy_write() returns 0, while
(__)phy_modify() returns the old PHY register value.

Apparently this change was catered for in drivers/net/phy/marvell.c, but
not in other source files.

Hence genphy_restart_aneg() now returns 4416 instead zero, which is
considered an error:

    ravb e6800000.ethernet eth0: failed to connect PHY
    IP-Config: Failed to open eth0
    IP-Config: No network devices available

Fix this by converting positive values to zero in all callers of
phy_modify().

Fixes: fea23fb591cce995 ("net: phy: convert read-modify-write to phy_modify()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Alternatively, __phy_modify() could be changed to follow __phy_write()
semantics?
---
 drivers/net/phy/at803x.c     |  4 +++-
 drivers/net/phy/phy_device.c | 29 +++++++++++++++++++++--------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index 411cf1072bae5796..6b6b9cef517f1bc3 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -230,7 +230,9 @@ static int at803x_suspend(struct phy_device *phydev)
 
 static int at803x_resume(struct phy_device *phydev)
 {
-	return phy_modify(phydev, MII_BMCR, BMCR_PDOWN | BMCR_ISOLATE, 0);
+	int ret = phy_modify(phydev, MII_BMCR, BMCR_PDOWN | BMCR_ISOLATE, 0);
+
+	return ret < 0 ? ret : 0;
 }
 
 static int at803x_probe(struct phy_device *phydev)
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 6bd11a070ec8147b..a132e845e4aec3d5 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1369,6 +1369,7 @@ static int genphy_config_eee_advert(struct phy_device *phydev)
 int genphy_setup_forced(struct phy_device *phydev)
 {
 	u16 ctl = 0;
+	int ret;
 
 	phydev->pause = 0;
 	phydev->asym_pause = 0;
@@ -1381,8 +1382,12 @@ int genphy_setup_forced(struct phy_device *phydev)
 	if (DUPLEX_FULL == phydev->duplex)
 		ctl |= BMCR_FULLDPLX;
 
-	return phy_modify(phydev, MII_BMCR,
-			  BMCR_LOOPBACK | BMCR_ISOLATE | BMCR_PDOWN, ctl);
+	ret = phy_modify(phydev, MII_BMCR,
+			 BMCR_LOOPBACK | BMCR_ISOLATE | BMCR_PDOWN, ctl);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 EXPORT_SYMBOL(genphy_setup_forced);
 
@@ -1393,8 +1398,10 @@ EXPORT_SYMBOL(genphy_setup_forced);
 int genphy_restart_aneg(struct phy_device *phydev)
 {
 	/* Don't isolate the PHY if we're negotiating */
-	return phy_modify(phydev, MII_BMCR, BMCR_ISOLATE,
-			  BMCR_ANENABLE | BMCR_ANRESTART);
+	int ret = phy_modify(phydev, MII_BMCR, BMCR_ISOLATE,
+			     BMCR_ANENABLE | BMCR_ANRESTART);
+
+	return ret < 0 ? ret : 0;
 }
 EXPORT_SYMBOL(genphy_restart_aneg);
 
@@ -1660,20 +1667,26 @@ EXPORT_SYMBOL(genphy_config_init);
 
 int genphy_suspend(struct phy_device *phydev)
 {
-	return phy_modify(phydev, MII_BMCR, 0, BMCR_PDOWN);
+	int ret = phy_modify(phydev, MII_BMCR, 0, BMCR_PDOWN);
+
+	return ret < 0 ? ret : 0;
 }
 EXPORT_SYMBOL(genphy_suspend);
 
 int genphy_resume(struct phy_device *phydev)
 {
-	return phy_modify(phydev, MII_BMCR, BMCR_PDOWN, 0);
+	int ret = phy_modify(phydev, MII_BMCR, BMCR_PDOWN, 0);
+
+	return ret < 0 ? ret : 0;
 }
 EXPORT_SYMBOL(genphy_resume);
 
 int genphy_loopback(struct phy_device *phydev, bool enable)
 {
-	return phy_modify(phydev, MII_BMCR, BMCR_LOOPBACK,
-			  enable ? BMCR_LOOPBACK : 0);
+	int ret = phy_modify(phydev, MII_BMCR, BMCR_LOOPBACK,
+			     enable ? BMCR_LOOPBACK : 0);
+
+	return ret < 0 ? ret : 0;
 }
 EXPORT_SYMBOL(genphy_loopback);
 
-- 
2.7.4
