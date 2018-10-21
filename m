Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45990 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728747AbeJVEQ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:16:27 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: [PATCH 5/5] thermal: zx2967_thermal: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:52 +0200
Message-Id: <20181021200053.2194-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200053.2194-1-wsa+renesas@sang-engineering.com>
References: <20181021200053.2194-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/thermal/zx2967_thermal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/zx2967_thermal.c b/drivers/thermal/zx2967_thermal.c
index 6acce0bce7c0..145ebf371598 100644
--- a/drivers/thermal/zx2967_thermal.c
+++ b/drivers/thermal/zx2967_thermal.c
@@ -207,8 +207,7 @@ MODULE_DEVICE_TABLE(of, zx2967_thermal_id_table);
 #ifdef CONFIG_PM_SLEEP
 static int zx2967_thermal_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct zx2967_thermal_priv *priv = platform_get_drvdata(pdev);
+	struct zx2967_thermal_priv *priv = dev_get_drvdata(dev);
 
 	if (priv && priv->clk_topcrm)
 		clk_disable_unprepare(priv->clk_topcrm);
@@ -221,8 +220,7 @@ static int zx2967_thermal_suspend(struct device *dev)
 
 static int zx2967_thermal_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct zx2967_thermal_priv *priv = platform_get_drvdata(pdev);
+	struct zx2967_thermal_priv *priv = dev_get_drvdata(dev);
 	int error;
 
 	error = clk_prepare_enable(priv->clk_topcrm);
-- 
2.19.0
