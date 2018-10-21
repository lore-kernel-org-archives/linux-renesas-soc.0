Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45752 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728310AbeJVEPw (ORCPT
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
Subject: [PATCH 2/9] net: dsa: qca8k: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:13 +0200
Message-Id: <20181021200021.1693-3-wsa+renesas@sang-engineering.com>
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

 drivers/net/dsa/qca8k.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/qca8k.c b/drivers/net/dsa/qca8k.c
index cdcde7f8e0b2..7e97e620bd44 100644
--- a/drivers/net/dsa/qca8k.c
+++ b/drivers/net/dsa/qca8k.c
@@ -955,8 +955,7 @@ qca8k_set_pm(struct qca8k_priv *priv, int enable)
 
 static int qca8k_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct qca8k_priv *priv = platform_get_drvdata(pdev);
+	struct qca8k_priv *priv = dev_get_drvdata(dev);
 
 	qca8k_set_pm(priv, 0);
 
@@ -965,8 +964,7 @@ static int qca8k_suspend(struct device *dev)
 
 static int qca8k_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct qca8k_priv *priv = platform_get_drvdata(pdev);
+	struct qca8k_priv *priv = dev_get_drvdata(dev);
 
 	qca8k_set_pm(priv, 1);
 
-- 
2.19.0
