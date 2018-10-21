Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45738 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728368AbeJVEPw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:15:52 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Subject: [PATCH 1/9] net: dsa: bcm_sf2: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:12 +0200
Message-Id: <20181021200021.1693-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200021.1693-1-wsa+renesas@sang-engineering.com>
References: <20181021200021.1693-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/net/dsa/bcm_sf2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 3017ecf82ca5..2eb68769562c 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1190,16 +1190,14 @@ static void bcm_sf2_sw_shutdown(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int bcm_sf2_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct bcm_sf2_priv *priv = platform_get_drvdata(pdev);
+	struct bcm_sf2_priv *priv = dev_get_drvdata(dev);
 
 	return dsa_switch_suspend(priv->dev->ds);
 }
 
 static int bcm_sf2_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct bcm_sf2_priv *priv = platform_get_drvdata(pdev);
+	struct bcm_sf2_priv *priv = dev_get_drvdata(dev);
 
 	return dsa_switch_resume(priv->dev->ds);
 }
-- 
2.19.0
