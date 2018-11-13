Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:57504 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbeKMQma (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 11:42:30 -0500
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be
Cc: wsa@sang-engineering.com, rui.zhang@intel.com,
        niklas.soderlund@ragnatech.se, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
Subject: [PATCH] thermal: rcar_gen3_thermal: Add supports the hwmon thermal sysfs
Date: Tue, 13 Nov 2018 15:45:43 +0900
Message-Id: <1542091543-31597-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Gen3 thermal registered by devm_thermal_zone_of_sensor_register()
and this function does not enable hwmon sysfs extensions.
This patch enables it to keep compatibility to common systems

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/thermal/rcar_gen3_thermal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 75786cc..ae172db 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -19,6 +19,7 @@
 #include <linux/thermal.h>
 
 #include "thermal_core.h"
+#include "thermal_hwmon.h"
 
 /* Register offsets */
 #define REG_GEN3_IRQSTR		0x04
@@ -429,6 +430,12 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 		if (ret < 0)
 			goto error_unregister;
 
+		/* Enable hwmon thermal sysfs */
+		tsc->zone->tzp->no_hwmon = false;
+		ret = thermal_add_hwmon_sysfs(tsc->zone);
+		if (ret)
+			dev_err(dev, "Can't register hwmon sysfs\n");
+
 		dev_info(dev, "TSC%d: Loaded %d trip points\n", i, ret);
 	}
 
-- 
2.7.4
