Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:46592 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754173AbeF2JMv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 05:12:51 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/2] i2c: gpio: fault-injector: refactor incomplete transfer
Date: Fri, 29 Jun 2018 11:12:46 +0200
Message-Id: <20180629091247.32568-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180629091247.32568-1-wsa+renesas@sang-engineering.com>
References: <20180629091247.32568-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Make the incomplete_transfer routine reusable, so we can add other test
cases with different patterns later. Prepare the docs for that, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/gpio-fault-injection | 30 +++++++++++++++++-----------
 drivers/i2c/busses/i2c-gpio.c          | 36 +++++++++++++++++++++-------------
 2 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/Documentation/i2c/gpio-fault-injection b/Documentation/i2c/gpio-fault-injection
index e0c4f775e239..37542461cea4 100644
--- a/Documentation/i2c/gpio-fault-injection
+++ b/Documentation/i2c/gpio-fault-injection
@@ -34,21 +34,29 @@ I2C specification version 4, section 3.1.16) using the helpers of the Linux I2C
 core (see 'struct bus_recovery_info'). However, the bus recovery will not
 succeed because SDA is still pinned low until you manually release it again
 with "echo 1 > sda". A test with an automatic release can be done with the
-'incomplete_transfer' file.
+following class of fault injectors.
 
-"incomplete_transfer"
----------------------
+Introduction to incomplete transfers
+------------------------------------
+
+The following fault injectors create situations where SDA will be held low by a
+device. Bus recovery should be able to fix these situations. But please note:
+there are I2C client devices which detect a stuck SDA on their side and release
+it on their own after a few milliseconds. Also, there might be an external
+device deglitching and monitoring the I2C bus. It could also detect a stuck SDA
+and will init a bus recovery on its own. If you want to implement bus recovery
+in a bus master driver, make sure you checked your hardware setup for such
+devices before. And always verify with a scope or logic analyzer!
+
+"incomplete_address_phase"
+--------------------------
 
 This file is write only and you need to write the address of an existing I2C
-client device to it. Then, a transfer to this device will be started, but it
-will stop at the ACK phase after the address of the client has been
+client device to it. Then, a read transfer to this device will be started, but
+it will stop at the ACK phase after the address of the client has been
 transmitted. Because the device will ACK its presence, this results in SDA
 being pulled low by the device while SCL is high. So, similar to the "sda" file
 above, the bus master under test should detect this condition and try a bus
 recovery. This time, however, it should succeed and the device should release
-SDA after toggling SCL. Please note: there are I2C client devices which detect
-a stuck SDA on their side and release it on their own after a few milliseconds.
-Also, there are external devices deglitching and monitoring the I2C bus. They
-can also detect a stuck SDA and will init a bus recovery on their own. If you
-want to implement bus recovery in a bus master driver, make sure you checked
-your hardware setup carefully before.
+SDA after toggling SCL.
+
diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index 66f85bbf3591..b69bb46bdb9d 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -101,17 +101,11 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_##wire, fops_##wire##_get, fops_##wire##_set, "%ll
 WIRE_ATTRIBUTE(scl);
 WIRE_ATTRIBUTE(sda);
 
-static int fops_incomplete_transfer_set(void *data, u64 addr)
+static void i2c_gpio_incomplete_transfer(struct i2c_gpio_private_data *priv,
+					u32 pattern, u8 pattern_size)
 {
-	struct i2c_gpio_private_data *priv = data;
 	struct i2c_algo_bit_data *bit_data = &priv->bit_data;
-	int i, pattern;
-
-	if (addr > 0x7f)
-		return -EINVAL;
-
-	/* ADDR (7 bit) + RD (1 bit) + SDA hi (1 bit) */
-	pattern = (addr << 2) | 3;
+	int i;
 
 	i2c_lock_adapter(&priv->adap);
 
@@ -119,8 +113,8 @@ static int fops_incomplete_transfer_set(void *data, u64 addr)
 	setsda(bit_data, 0);
 	udelay(bit_data->udelay);
 
-	/* Send ADDR+RD, request ACK, don't send STOP */
-	for (i = 8; i >= 0; i--) {
+	/* Send pattern, request ACK, don't send STOP */
+	for (i = pattern_size - 1; i >= 0; i--) {
 		setscl(bit_data, 0);
 		udelay(bit_data->udelay / 2);
 		setsda(bit_data, (pattern >> i) & 1);
@@ -130,10 +124,24 @@ static int fops_incomplete_transfer_set(void *data, u64 addr)
 	}
 
 	i2c_unlock_adapter(&priv->adap);
+}
+
+static int fops_incomplete_addr_phase_set(void *data, u64 addr)
+{
+	struct i2c_gpio_private_data *priv = data;
+	u32 pattern;
+
+	if (addr > 0x7f)
+		return -EINVAL;
+
+	/* ADDR (7 bit) + RD (1 bit) + Client ACK, keep SDA hi (1 bit) */
+	pattern = (addr << 2) | 3;
+
+	i2c_gpio_incomplete_transfer(priv, pattern, 9);
 
 	return 0;
 }
-DEFINE_DEBUGFS_ATTRIBUTE(fops_incomplete_transfer, NULL, fops_incomplete_transfer_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_incomplete_addr_phase, NULL, fops_incomplete_addr_phase_set, "%llu\n");
 
 static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 {
@@ -156,8 +164,8 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 
 	debugfs_create_file_unsafe("scl", 0600, priv->debug_dir, priv, &fops_scl);
 	debugfs_create_file_unsafe("sda", 0600, priv->debug_dir, priv, &fops_sda);
-	debugfs_create_file_unsafe("incomplete_transfer", 0200, priv->debug_dir,
-				   priv, &fops_incomplete_transfer);
+	debugfs_create_file_unsafe("incomplete_address_phase", 0200, priv->debug_dir,
+				   priv, &fops_incomplete_addr_phase);
 }
 
 static void i2c_gpio_fault_injector_exit(struct platform_device *pdev)
-- 
2.11.0
