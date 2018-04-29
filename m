Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41008 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753805AbeD2SlI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 Apr 2018 14:41:08 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: busses: remove superfluous ignoring of children for RPM
Date: Sun, 29 Apr 2018 20:41:04 +0200
Message-Id: <20180429184104.6680-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

These days, the I2C core ensures that the embedded adapter device
ignores the PM states of its children already. Because the adapter
device is an opaque logical device, there is no need for drivers to
repeat that again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I tested it using a Renesas Salvator-X board (M3-W) which has an EEPROM
connected to a bus driven by the i2c-sh_mobile driver. The EEPROM driver (at24)
immediately sets the RPM state to 'active'. Even with this patch applied, it
does not affect the state of the parent platform_device. Only if I remove
'pm_suspend_ignore_children' from the I2C core, too, then the 'active' state
from the client is passed on to the host adapter.

I think this is a sufficient test, but please double check.

 drivers/i2c/busses/i2c-hix5hd2.c   |  1 -
 drivers/i2c/busses/i2c-nomadik.c   |  2 --
 drivers/i2c/busses/i2c-sh_mobile.c | 11 -----------
 3 files changed, 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index bb68957d3da5..1504c3c1a1c0 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -471,7 +471,6 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	pm_suspend_ignore_children(&pdev->dev, true);
 	pm_runtime_set_autosuspend_delay(priv->dev, MSEC_PER_SEC);
 	pm_runtime_use_autosuspend(priv->dev);
 	pm_runtime_set_active(priv->dev);
diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 49c7c0c91486..0ed5a41804dc 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1012,8 +1012,6 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 		goto err_no_mem;
 	}
 
-	pm_suspend_ignore_children(&adev->dev, true);
-
 	dev->clk = devm_clk_get(&adev->dev, NULL);
 	if (IS_ERR(dev->clk)) {
 		dev_err(&adev->dev, "could not get i2c clock\n");
diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index d856bc211715..5fda4188a9e5 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -899,17 +899,6 @@ static int sh_mobile_i2c_probe(struct platform_device *dev)
 	if (resource_size(res) > 0x17)
 		pd->flags |= IIC_FLAG_HAS_ICIC67;
 
-	/* Enable Runtime PM for this device.
-	 *
-	 * Also tell the Runtime PM core to ignore children
-	 * for this device since it is valid for us to suspend
-	 * this I2C master driver even though the slave devices
-	 * on the I2C bus may not be suspended.
-	 *
-	 * The state of the I2C hardware bus is unaffected by
-	 * the Runtime PM state.
-	 */
-	pm_suspend_ignore_children(&dev->dev, true);
 	pm_runtime_enable(&dev->dev);
 	pm_runtime_get_sync(&dev->dev);
 
-- 
2.11.0
