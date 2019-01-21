Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD07C2F3A0
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 14:28:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9376E20823
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 14:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbfAUO2s (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 09:28:48 -0500
Received: from sauhun.de ([88.99.104.3]:44496 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728801AbfAUO2s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 09:28:48 -0500
Received: from localhost (p54B3319E.dip0.t-ipconnect.de [84.179.49.158])
        by pokefinder.org (Postfix) with ESMTPSA id DF1342CF60A;
        Mon, 21 Jan 2019 15:28:45 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] i2c: gpio: fault-injector: add 'lose_arbitration' injector
Date:   Mon, 21 Jan 2019 15:28:39 +0100
Message-Id: <20190121142839.19011-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is a fault injector simulating 'arbitration lost' from multi-master
setups. Read the docs for its usage.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This is the most reliable result I came up with so far for simulating lost
arbitration (after playing a lot with falling SDA as trigger first, but SCL
seems the way to go). Works fine with the i2c-sh_mobile driver on a Renesas
Lager board. I am not super-happy with the interrupt latency causing some bits
to be non-disturbed, but for now, I don't see a way around it except for
busy-polling which I think is too excessive. RFC for now because someone still
might have a better idea :)

Needs my previous fault-injector cleanup patches, a branch for consuming is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/iic-arbitration-lost

Now let's see how to fix the sh_mobile driver...

 Documentation/i2c/gpio-fault-injection | 26 +++++++++++++++
 drivers/i2c/busses/i2c-gpio.c          | 61 ++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/i2c/gpio-fault-injection b/Documentation/i2c/gpio-fault-injection
index 1a44e3edc0c4..b6f36ffe55e1 100644
--- a/Documentation/i2c/gpio-fault-injection
+++ b/Documentation/i2c/gpio-fault-injection
@@ -83,3 +83,29 @@ This is why bus recovery (up to 9 clock pulses) must either check SDA or send
 additional STOP conditions to ensure the bus has been released. Otherwise
 random data will be written to a device!
 
+Lost arbitration
+================
+
+Here, we want to simulate the condition where the master under tests loses the
+bus arbitration against another master in a multi-master setup.
+
+"lose_arbitration"
+------------------
+
+This file is write only and you need to write the number of desired lost
+arbitrations in a row. The calling process will then sleep and interfere with
+transfers from the master under test when they appear until that number is
+reached. The process is interruptible, though.
+
+Arbitration lost is achieved by waiting for SCL going down by the master under
+test and then pulling SDA low for some time. So, the I2C address sent out
+should be corrupted and that should be detected properly. That means that the
+address sent out should have a lot of '1' bits to be able to detect corruption.
+There doesn't need to be a device at this address because arbitration lost
+should be detected beforehand. Also note, that SCL going down is monitored
+using interrupts, so the interrupt latency might cause the first bits to be not
+corrupted. A good starting script for using this fault injector:
+
+# echo 1 > lose_arbitration &
+# i2cget -y <bus_to_test> 0x3f
+
diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index ca04fa25a141..c630172b4787 100644
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
@@ -27,6 +29,7 @@ struct i2c_gpio_private_data {
 	struct i2c_gpio_platform_data pdata;
 #ifdef CONFIG_I2C_GPIO_FAULT_INJECTOR
 	struct dentry *debug_dir;
+	struct completion irq_happened;
 #endif
 };
 
@@ -162,6 +165,59 @@ static int fops_incomplete_write_byte_set(void *data, u64 addr)
 }
 DEFINE_DEBUGFS_ATTRIBUTE(fops_incomplete_write_byte, NULL, fops_incomplete_write_byte_set, "%llu\n");
 
+static irqreturn_t lose_arbitration_irq(int irq, void *dev_id)
+{
+	struct i2c_gpio_private_data *priv = dev_id;
+
+	setsda(&priv->bit_data, 0);
+	udelay(200);
+	setsda(&priv->bit_data, 1);
+
+	complete(&priv->irq_happened);
+	return IRQ_HANDLED;
+}
+
+static int fops_lose_arbitration_set(void *data, u64 num_faults)
+{
+	struct i2c_gpio_private_data *priv = data;
+	int irq = gpiod_to_irq(priv->scl);
+	int ret, i;
+
+	i2c_lock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
+
+	/*
+	 * Interrupt on falling SCL. This ensures that the master under test has
+	 * really started the transfer. Interrupt on falling SDA did only
+	 * exercise 'bus busy' detection on some HW but not 'arbitration lost'.
+	 * Note that the interrupt latency may cause the first bits to be
+	 * transmitted correctly.
+	 */
+	ret = gpiod_direction_input(priv->scl);
+	if (ret)
+		goto unlock;
+
+	ret = request_irq(irq, lose_arbitration_irq, IRQF_TRIGGER_FALLING,
+			  "i2c-gpio-fi", priv);
+	if (ret)
+		goto output;
+
+	for (i = 0; i < num_faults; i++) {
+		ret = wait_for_completion_interruptible(&priv->irq_happened);
+		if (ret)
+			break;
+		reinit_completion(&priv->irq_happened);
+	}
+
+	free_irq(irq, priv);
+ output:
+	ret = gpiod_direction_output(priv->scl, 1);
+ unlock:
+	i2c_unlock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
+
+	return ret;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_lose_arbitration, NULL, fops_lose_arbitration_set, "%llu\n");
+
 static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 {
 	struct i2c_gpio_private_data *priv = platform_get_drvdata(pdev);
@@ -181,10 +237,15 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 	if (!priv->debug_dir)
 		return;
 
+	init_completion(&priv->irq_happened);
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

