Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45764 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728391AbeJVEP7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:15:59 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Jon Mason <jonmason@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 9/9] net: phy: mdio-mux-bcm-iproc: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:20 +0200
Message-Id: <20181021200021.1693-10-wsa+renesas@sang-engineering.com>
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

 drivers/net/phy/mdio-mux-bcm-iproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/mdio-mux-bcm-iproc.c b/drivers/net/phy/mdio-mux-bcm-iproc.c
index c017486e9b86..696bdf1e4576 100644
--- a/drivers/net/phy/mdio-mux-bcm-iproc.c
+++ b/drivers/net/phy/mdio-mux-bcm-iproc.c
@@ -289,8 +289,7 @@ static int mdio_mux_iproc_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int mdio_mux_iproc_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct iproc_mdiomux_desc *md = platform_get_drvdata(pdev);
+	struct iproc_mdiomux_desc *md = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(md->core_clk);
 
@@ -299,8 +298,7 @@ static int mdio_mux_iproc_suspend(struct device *dev)
 
 static int mdio_mux_iproc_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct iproc_mdiomux_desc *md = platform_get_drvdata(pdev);
+	struct iproc_mdiomux_desc *md = dev_get_drvdata(dev);
 
 	clk_prepare_enable(md->core_clk);
 	mdio_mux_iproc_config(md);
-- 
2.19.0
