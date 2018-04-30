Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: mux: demux-pinctrl: disable PM user interface
Date: Mon, 30 Apr 2018 14:08:42 +0200
Message-Id: <20180430120842.28110-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The demux device is only a logical device with no children. So, no
RuntimePM is needed, let's disable the sysfs interface for it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I think it is proper to just disable the interface without enabling RPM at all.
USB and PCIE core do this as well. Still, adding PM and Rafael to CC in case we
all got it wrong.

 drivers/i2c/muxes/i2c-demux-pinctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index 61440a9507e4..d5e7d4aa6ee1 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 
@@ -262,6 +263,8 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
+	pm_runtime_no_callbacks(&pdev->dev);
+
 	/* switch to first parent as active master */
 	i2c_demux_activate_master(priv, 0);
 
-- 
2.11.0
