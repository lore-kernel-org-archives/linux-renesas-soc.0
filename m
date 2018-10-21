Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45948 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728700AbeJVEQZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:16:25 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 2/5] thermal: rockchip_thermal: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:49 +0200
Message-Id: <20181021200053.2194-3-wsa+renesas@sang-engineering.com>
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

 drivers/thermal/rockchip_thermal.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
index f36375d5a16c..9c7643d62ed7 100644
--- a/drivers/thermal/rockchip_thermal.c
+++ b/drivers/thermal/rockchip_thermal.c
@@ -1327,8 +1327,7 @@ static int rockchip_thermal_remove(struct platform_device *pdev)
 
 static int __maybe_unused rockchip_thermal_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct rockchip_thermal_data *thermal = platform_get_drvdata(pdev);
+	struct rockchip_thermal_data *thermal = dev_get_drvdata(dev);
 	int i;
 
 	for (i = 0; i < thermal->chip->chn_num; i++)
@@ -1346,8 +1345,7 @@ static int __maybe_unused rockchip_thermal_suspend(struct device *dev)
 
 static int __maybe_unused rockchip_thermal_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct rockchip_thermal_data *thermal = platform_get_drvdata(pdev);
+	struct rockchip_thermal_data *thermal = dev_get_drvdata(dev);
 	int i;
 	int error;
 
@@ -1376,7 +1374,7 @@ static int __maybe_unused rockchip_thermal_resume(struct device *dev)
 					      id, thermal->regs,
 					      thermal->tshut_temp);
 		if (error)
-			dev_err(&pdev->dev, "%s: invalid tshut=%d, error=%d\n",
+			dev_err(dev, "%s: invalid tshut=%d, error=%d\n",
 				__func__, thermal->tshut_temp, error);
 	}
 
-- 
2.19.0
