Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:44922 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728921AbeJASzQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Oct 2018 14:55:16 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: ltsi-dev@lists.linuxfoundation.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4.14-ltsi] eeprom: at24: Add OF device ID table
Date: Mon,  1 Oct 2018 14:17:40 +0200
Message-Id: <20181001121740.19621-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Javier Martinez Canillas <javierm@redhat.com>

The driver doesn't have a struct of_device_id table but supported devices
are registered via Device Trees. This is working on the assumption that a
I2C device registered via OF will always match a legacy I2C device ID and
that the MODALIAS reported will always be of the form i2c:<device>.

But this could change in the future so the correct approach is to have an
OF device ID table if the devices are registered via OF.

To maintain backward compatibility with old Device Trees, only use the OF
device ID table .data if the device was registered via OF and the OF node
compatible matches an entry in the OF device ID table.

Suggested-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
(cherry picked from commit 7f2a2f0d0d66b2d834c793df45af3277bb5f10f4)
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Without this, EEPROMs using e.g. "renesas,r1ex24002", "atmel,24c02", as
corrected or added in several backports, fail to probe, as "r1ex24002"
is not a recognized legacy I2C device ID.
Some of these are regressions from stable/linux-4.14.y.

 drivers/misc/eeprom/at24.c | 71 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 4cc0b42f2acc5b92..87367efc8170daa0 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/mutex.h>
@@ -175,6 +176,64 @@ static const struct i2c_device_id at24_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, at24_ids);
 
+static const struct of_device_id at24_of_match[] = {
+	{
+		.compatible = "atmel,24c00",
+		.data = (void *)AT24_DEVICE_MAGIC(128 / 8, AT24_FLAG_TAKE8ADDR)
+	},
+	{
+		.compatible = "atmel,24c01",
+		.data = (void *)AT24_DEVICE_MAGIC(1024 / 8, 0)
+	},
+	{
+		.compatible = "atmel,24c02",
+		.data = (void *)AT24_DEVICE_MAGIC(2048 / 8, 0)
+	},
+	{
+		.compatible = "atmel,spd",
+		.data = (void *)AT24_DEVICE_MAGIC(2048 / 8,
+				AT24_FLAG_READONLY | AT24_FLAG_IRUGO)
+	},
+	{
+		.compatible = "atmel,24c04",
+		.data = (void *)AT24_DEVICE_MAGIC(4096 / 8, 0)
+	},
+	{
+		.compatible = "atmel,24c08",
+		.data = (void *)AT24_DEVICE_MAGIC(8192 / 8, 0)
+	},
+	{
+		.compatible = "atmel,24c16",
+		.data = (void *)AT24_DEVICE_MAGIC(16384 / 8, 0)
+	},
+	{
+		.compatible = "atmel,24c32",
+		.data = (void *)AT24_DEVICE_MAGIC(32768 / 8, AT24_FLAG_ADDR16)
+	},
+	{
+		.compatible = "atmel,24c64",
+		.data = (void *)AT24_DEVICE_MAGIC(65536 / 8, AT24_FLAG_ADDR16)
+	},
+	{
+		.compatible = "atmel,24c128",
+		.data = (void *)AT24_DEVICE_MAGIC(131072 / 8, AT24_FLAG_ADDR16)
+	},
+	{
+		.compatible = "atmel,24c256",
+		.data = (void *)AT24_DEVICE_MAGIC(262144 / 8, AT24_FLAG_ADDR16)
+	},
+	{
+		.compatible = "atmel,24c512",
+		.data = (void *)AT24_DEVICE_MAGIC(524288 / 8, AT24_FLAG_ADDR16)
+	},
+	{
+		.compatible = "atmel,24c1024",
+		.data = (void *)AT24_DEVICE_MAGIC(1048576 / 8, AT24_FLAG_ADDR16)
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, at24_of_match);
+
 static const struct acpi_device_id at24_acpi_ids[] = {
 	{ "INT3499", AT24_DEVICE_MAGIC(8192 / 8, 0) },
 	{ }
@@ -605,7 +664,16 @@ static int at24_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (client->dev.platform_data) {
 		chip = *(struct at24_platform_data *)client->dev.platform_data;
 	} else {
-		if (id) {
+		/*
+		 * The I2C core allows OF nodes compatibles to match against the
+		 * I2C device ID table as a fallback, so check not only if an OF
+		 * node is present but also if it matches an OF device ID entry.
+		 */
+		if (client->dev.of_node &&
+		    of_match_device(at24_of_match, &client->dev)) {
+			magic = (kernel_ulong_t)
+				of_device_get_match_data(&client->dev);
+		} else if (id) {
 			magic = id->driver_data;
 		} else {
 			const struct acpi_device_id *aid;
@@ -831,6 +899,7 @@ static int at24_remove(struct i2c_client *client)
 static struct i2c_driver at24_driver = {
 	.driver = {
 		.name = "at24",
+		.of_match_table = at24_of_match,
 		.acpi_match_table = ACPI_PTR(at24_acpi_ids),
 	},
 	.probe = at24_probe,
-- 
2.17.1
