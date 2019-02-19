Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB923C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 16:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B623421738
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 16:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbfBSQjz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 11:39:55 -0500
Received: from sauhun.de ([88.99.104.3]:47622 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727048AbfBSQjz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 11:39:55 -0500
Received: from localhost (p54B338D8.dip0.t-ipconnect.de [84.179.56.216])
        by pokefinder.org (Postfix) with ESMTPSA id 635CE3E6060;
        Tue, 19 Feb 2019 17:39:52 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/2] i2c: gpio: fault-injector: add 'lose_arbitration' injector
Date:   Tue, 19 Feb 2019 17:39:45 +0100
Message-Id: <20190219163946.13559-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190219163946.13559-1-wsa+renesas@sang-engineering.com>
References: <20190219163946.13559-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a fault injector simulating 'arbitration lost' from multi-master
setups. Read the docs for its usage.

A helper function for future fault injectors using SCL interrupts is
created to achieve this.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/gpio-fault-injection | 25 ++++++++++++
 drivers/i2c/busses/i2c-gpio.c          | 74 ++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/Documentation/i2c/gpio-fault-injection b/Documentation/i2c/gpio-fault-injection
index 1a44e3edc0c4..1f1bb96a64bd 100644
--- a/Documentation/i2c/gpio-fault-injection
+++ b/Documentation/i2c/gpio-fault-injection
@@ -83,3 +83,28 @@ This is why bus recovery (up to 9 clock pulses) must either check SDA or send
 additional STOP conditions to ensure the bus has been released. Otherwise
 random data will be written to a device!
 
+Lost arbitration
+================
+
+Here, we want to simulate the condition where the master under test loses the
+bus arbitration against another master in a multi-master setup.
+
+"lose_arbitration"
+------------------
+
+This file is write only and you need to write the duration of the arbitration
+intereference (in µs, maximum is 100ms). The calling process will then sleep
+and wait for the next bus clock. The process is interruptible, though.
+
+Arbitration lost is achieved by waiting for SCL going down by the master under
+test and then pulling SDA low for some time. So, the I2C address sent out
+should be corrupted and that should be detected properly. That means that the
+address sent out should have a lot of '1' bits to be able to detect corruption.
+There doesn't need to be a device at this address because arbitration lost
+should be detected beforehand. Also note, that SCL going down is monitored
+using interrupts, so the interrupt latency might cause the first bits to be not
+corrupted. A good starting point for using this fault injector on an otherwise
+idle bus is:
+
+# echo 200 > lose_arbitration &
+# i2cget -y <bus_to_test> 0x3f
diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index 2d532cc042f5..76e43783f50f 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -7,12 +7,14 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
+#include <linux/completion.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c-algo-bit.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_data/i2c-gpio.h>
@@ -27,6 +29,9 @@ struct i2c_gpio_private_data {
 	struct i2c_gpio_platform_data pdata;
 #ifdef CONFIG_I2C_GPIO_FAULT_INJECTOR
 	struct dentry *debug_dir;
+	/* these must be protected by bus lock */
+	struct completion scl_irq_completion;
+	u64 scl_irq_data;
 #endif
 };
 
@@ -162,6 +167,70 @@ static int fops_incomplete_write_byte_set(void *data, u64 addr)
 }
 DEFINE_DEBUGFS_ATTRIBUTE(fops_incomplete_write_byte, NULL, fops_incomplete_write_byte_set, "%llu\n");
 
+static int i2c_gpio_fi_act_on_scl_irq(struct i2c_gpio_private_data *priv,
+				       irqreturn_t handler(int, void*))
+{
+	int ret, irq = gpiod_to_irq(priv->scl);
+
+	if (irq < 0)
+		return irq;
+
+	i2c_lock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
+
+	ret = gpiod_direction_input(priv->scl);
+	if (ret)
+		goto unlock;
+
+	reinit_completion(&priv->scl_irq_completion);
+
+	ret = request_irq(irq, handler, IRQF_TRIGGER_FALLING,
+			  "i2c_gpio_fault_injector_scl_irq", priv);
+	if (ret)
+		goto output;
+
+	wait_for_completion_interruptible(&priv->scl_irq_completion);
+
+	free_irq(irq, priv);
+ output:
+	ret = gpiod_direction_output(priv->scl, 1) ?: ret;
+ unlock:
+	i2c_unlock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
+
+	return ret;
+}
+
+static irqreturn_t lose_arbitration_irq(int irq, void *dev_id)
+{
+	struct i2c_gpio_private_data *priv = dev_id;
+
+	setsda(&priv->bit_data, 0);
+	udelay(priv->scl_irq_data);
+	setsda(&priv->bit_data, 1);
+
+	complete(&priv->scl_irq_completion);
+
+	return IRQ_HANDLED;
+}
+
+static int fops_lose_arbitration_set(void *data, u64 duration)
+{
+	struct i2c_gpio_private_data *priv = data;
+
+	if (duration > 100 * 1000)
+		return -EINVAL;
+
+	priv->scl_irq_data = duration;
+	/*
+	 * Interrupt on falling SCL. This ensures that the master under test has
+	 * really started the transfer. Interrupt on falling SDA did only
+	 * exercise 'bus busy' detection on some HW but not 'arbitration lost'.
+	 * Note that the interrupt latency may cause the first bits to be
+	 * transmitted correctly.
+	 */
+	return i2c_gpio_fi_act_on_scl_irq(priv, lose_arbitration_irq);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_lose_arbitration, NULL, fops_lose_arbitration_set, "%llu\n");
+
 static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 {
 	struct i2c_gpio_private_data *priv = platform_get_drvdata(pdev);
@@ -181,10 +250,15 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 	if (!priv->debug_dir)
 		return;
 
+	init_completion(&priv->scl_irq_completion);
+
 	debugfs_create_file_unsafe("incomplete_address_phase", 0200, priv->debug_dir,
 				   priv, &fops_incomplete_addr_phase);
 	debugfs_create_file_unsafe("incomplete_write_byte", 0200, priv->debug_dir,
 				   priv, &fops_incomplete_write_byte);
+	if (priv->bit_data.getscl)
+		debugfs_create_file_unsafe("lose_arbitration", 0200, priv->debug_dir,
+					   priv, &fops_lose_arbitration);
 	debugfs_create_file_unsafe("scl", 0600, priv->debug_dir, priv, &fops_scl);
 	debugfs_create_file_unsafe("sda", 0600, priv->debug_dir, priv, &fops_sda);
 }
-- 
2.11.0

