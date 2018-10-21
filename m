Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45776 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728391AbeJVEPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:15:55 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Subject: [PATCH 5/9] net: ethernet: smsc: smc91x: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:16 +0200
Message-Id: <20181021200021.1693-6-wsa+renesas@sang-engineering.com>
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

 drivers/net/ethernet/smsc/smc91x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smc91x.c b/drivers/net/ethernet/smsc/smc91x.c
index 8d6cff8bd162..4823b6a51134 100644
--- a/drivers/net/ethernet/smsc/smc91x.c
+++ b/drivers/net/ethernet/smsc/smc91x.c
@@ -2447,8 +2447,7 @@ static int smc_drv_remove(struct platform_device *pdev)
 
 static int smc_drv_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct net_device *ndev = platform_get_drvdata(pdev);
+	struct net_device *ndev = dev_get_drvdata(dev);
 
 	if (ndev) {
 		if (netif_running(ndev)) {
-- 
2.19.0
