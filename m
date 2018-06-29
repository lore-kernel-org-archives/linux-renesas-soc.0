Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:46598 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754382AbeF2JMv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 05:12:51 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/2] i2c: gpio: fault-injector: add incomplete_write_byte
Date: Fri, 29 Jun 2018 11:12:47 +0200
Message-Id: <20180629091247.32568-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180629091247.32568-1-wsa+renesas@sang-engineering.com>
References: <20180629091247.32568-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add another injector for an incomplete transfer. As mentioned in the
docs, this one is important to check bus recovery algorithms with it.
Otherwise random data may be sent to devices!

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/gpio-fault-injection | 19 +++++++++++++++++++
 drivers/i2c/busses/i2c-gpio.c          | 21 +++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/i2c/gpio-fault-injection b/Documentation/i2c/gpio-fault-injection
index 37542461cea4..a4ce62090fd5 100644
--- a/Documentation/i2c/gpio-fault-injection
+++ b/Documentation/i2c/gpio-fault-injection
@@ -60,3 +60,22 @@ above, the bus master under test should detect this condition and try a bus
 recovery. This time, however, it should succeed and the device should release
 SDA after toggling SCL.
 
+"incomplete_write_byte"
+-----------------------
+
+Similar to above, this file is write only and you need to write the address of
+an existing I2C client device to it.
+
+The injector will again stop at one ACK phase, so the device will keep SDA low
+because it acknowledges data. However, there are two differences compared to
+'incomplete_address_phase':
+
+a) the message sent out will be a write message
+b) after the address byte, a 0x00 byte will be transferred. Then, stop at ACK.
+
+This is a highly delicate state, the device is set up to write any data to
+register 0x00 (if it has registers) when further clock pulses happen on SCL.
+This is why bus recovery (up to 9 clock pulses) must either check SDA or send
+additional STOP conditions to ensure the bus has been released. Otherwise
+random data will be written to a device!
+
diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index b69bb46bdb9d..ac00b8e08251 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -143,6 +143,25 @@ static int fops_incomplete_addr_phase_set(void *data, u64 addr)
 }
 DEFINE_DEBUGFS_ATTRIBUTE(fops_incomplete_addr_phase, NULL, fops_incomplete_addr_phase_set, "%llu\n");
 
+static int fops_incomplete_write_byte_set(void *data, u64 addr)
+{
+	struct i2c_gpio_private_data *priv = data;
+	u32 pattern;
+
+	if (addr > 0x7f)
+		return -EINVAL;
+
+	/* ADDR (7 bit) + WR (1 bit) + Client ACK (1 bit) */
+	pattern = (addr << 2) | 1;
+	/* 0x00 (8 bit) + Client ACK, keep SDA hi (1 bit) */
+	pattern = (pattern << 9) | 1;
+
+	i2c_gpio_incomplete_transfer(priv, pattern, 18);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_incomplete_write_byte, NULL, fops_incomplete_write_byte_set, "%llu\n");
+
 static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 {
 	struct i2c_gpio_private_data *priv = platform_get_drvdata(pdev);
@@ -166,6 +185,8 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 	debugfs_create_file_unsafe("sda", 0600, priv->debug_dir, priv, &fops_sda);
 	debugfs_create_file_unsafe("incomplete_address_phase", 0200, priv->debug_dir,
 				   priv, &fops_incomplete_addr_phase);
+	debugfs_create_file_unsafe("incomplete_write_byte", 0200, priv->debug_dir,
+				   priv, &fops_incomplete_write_byte);
 }
 
 static void i2c_gpio_fault_injector_exit(struct platform_device *pdev)
-- 
2.11.0
