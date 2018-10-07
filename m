Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from stcim.de ([78.46.90.227]:49574 "EHLO stcim.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728207AbeJGWrq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Oct 2018 18:47:46 -0400
From: Stefan Lengfeld <contact@stefanchrist.eu>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        preid@electromag.com.au, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.or, j-keerthy@ti.com,
        t-kristo@ti.com, grygorii.strashko@ti.com,
        andriy.shevchenko@linux.intel.com
Subject: [RFC PATCH 2/3] watchdog: da9062: avoid regmap in restart handler
Date: Sun,  7 Oct 2018 17:39:36 +0200
Message-Id: <20181007153937.16787-3-contact@stefanchrist.eu>
In-Reply-To: <20181007153937.16787-1-contact@stefanchrist.eu>
References: <20180923202034.qugs4fxucj7h4vri@porty>
 <20181007153937.16787-1-contact@stefanchrist.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Using i2c_transfer() directly to set the shutdown bit is more reliable
than using regmap in atomic contexts, because calls to 'schedule()' or
'sleep()' must be avoided in call code paths.

Tested on a phyCORE-i.MX6 Solo board.

Signed-off-by: Stefan Lengfeld <contact@stefanchrist.eu>
---
 drivers/mfd/da9062-core.c       |  1 +
 drivers/watchdog/da9062_wdt.c   | 17 +++++++++++++----
 include/linux/mfd/da9062/core.h |  1 +
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index 9f6105906c09..b6a01054ba0f 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -609,6 +609,7 @@ static int da9062_i2c_probe(struct i2c_client *i2c,
 
 	i2c_set_clientdata(i2c, chip);
 	chip->dev = &i2c->dev;
+	chip->i2c = i2c;
 
 	if (!i2c->irq) {
 		dev_err(chip->dev, "No IRQ configured\n");
diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index fe169d8e1fb2..ad6483d25f83 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/uaccess.h>
 #include <linux/slab.h>
+#include <linux/i2c.h>
 #include <linux/delay.h>
 #include <linux/jiffies.h>
 #include <linux/mfd/da9062/registers.h>
@@ -152,12 +153,20 @@ static int da9062_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 			      void *data)
 {
 	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
+	struct i2c_client *client = wdt->hw->i2c;
+	__u8 buf[3] = {DA9062AA_CONTROL_F, DA9062AA_SHUTDOWN_MASK, 0x0};
+	struct i2c_msg msgs[1] = {
+		{
+			.addr = client->addr,
+			.flags = (client->flags & I2C_M_TEN),
+			.len = sizeof(buf),
+			.buf = buf,
+		}
+	};
 	int ret;
 
-	ret = regmap_write(wdt->hw->regmap,
-			   DA9062AA_CONTROL_F,
-			   DA9062AA_SHUTDOWN_MASK);
-	if (ret)
+	ret = i2c_transfer(client->adapter, msgs, sizeof(msgs));
+	if (ret < 0)
 		dev_alert(wdt->hw->dev, "Failed to shutdown (err = %d)\n",
 			  ret);
 
diff --git a/include/linux/mfd/da9062/core.h b/include/linux/mfd/da9062/core.h
index 74d33a01ddae..c994293b3aef 100644
--- a/include/linux/mfd/da9062/core.h
+++ b/include/linux/mfd/da9062/core.h
@@ -68,6 +68,7 @@ enum da9062_irqs {
 struct da9062 {
 	struct device *dev;
 	struct regmap *regmap;
+	struct i2c_client *i2c;
 	struct regmap_irq_chip_data *regmap_irq;
 	enum da9062_compatible_types chip_type;
 };
-- 
2.16.4
