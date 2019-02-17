Return-Path: <SRS0=hAs+=QY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92DBC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 12:41:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A43C12192C
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 12:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbfBQMld (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Feb 2019 07:41:33 -0500
Received: from sauhun.de ([88.99.104.3]:51112 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728712AbfBQMlc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Feb 2019 07:41:32 -0500
Received: from localhost (unknown [195.52.228.164])
        by pokefinder.org (Postfix) with ESMTPSA id 5D5D22E354E;
        Sun, 17 Feb 2019 13:41:30 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: gpio: fault-injector: add 'inject_panic' injector
Date:   Sun, 17 Feb 2019 13:41:26 +0100
Message-Id: <20190217124126.7257-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190217124126.7257-1-wsa+renesas@sang-engineering.com>
References: <20190217124126.7257-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a fault injector simulating a Kernel panic happening after starting
a transfer. Read the docs for its usage.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/gpio-fault-injection | 26 ++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-gpio.c          | 28 +++++++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/Documentation/i2c/gpio-fault-injection b/Documentation/i2c/gpio-fault-injection
index 5262801438e6..fc85c1ab6f68 100644
--- a/Documentation/i2c/gpio-fault-injection
+++ b/Documentation/i2c/gpio-fault-injection
@@ -108,3 +108,29 @@ idle bus is:
 
 # echo 200 > lose_arbitration &
 # i2cget -y <bus_to_test> 0x3f
+
+Panic during transfer
+=====================
+
+This fault injector will create a Kernel panic once the master under test
+started a transfer. This usually means that the state machine of the bus master
+driver will be ungracefully interrupted and the bus may end up in an unusual
+state. Use this to check if your shutdown/reboot/boot code can handle this
+scenario.
+
+"inject_panic"
+--------------
+
+This file is write only and you need to write the delay between the detected
+start of a transmission and the induced Kernel panic (in us). The calling
+process will then sleep and wait for the next bus clock. The process is
+interruptible, though.
+
+Start of a transfer is detected by waiting for SCL going down by the master
+under test.  A good starting point for using this fault injector is:
+
+# echo 0 > inject_panic &
+# i2cget -y <bus_to_test> <some_address>
+
+Note that there doesn't need to be a device listening to the address you are
+using. Results may vary depending on that, though.
diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f3645148d120..a07544dc2da5 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -228,6 +228,29 @@ static int fops_lose_arbitration_set(void *data, u64 duration)
 }
 DEFINE_DEBUGFS_ATTRIBUTE(fops_lose_arbitration, NULL, fops_lose_arbitration_set, "%llu\n");
 
+static irqreturn_t inject_panic_irq(int irq, void *dev_id)
+{
+	struct i2c_gpio_private_data *priv = dev_id;
+
+	udelay(priv->scl_irq_data);
+	panic("I2C fault injector induced panic");
+
+	return IRQ_HANDLED;
+}
+
+static int fops_inject_panic_set(void *data, u64 duration)
+{
+	struct i2c_gpio_private_data *priv = data;
+
+	priv->scl_irq_data = duration;
+	/*
+	 * Interrupt on falling SCL. This ensures that the master under test has
+	 * really started the transfer.
+	 */
+	return i2c_gpio_fi_act_on_scl_irq(priv, inject_panic_irq);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_inject_panic, NULL, fops_inject_panic_set, "%llu\n");
+
 static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 {
 	struct i2c_gpio_private_data *priv = platform_get_drvdata(pdev);
@@ -253,9 +276,12 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 				   priv, &fops_incomplete_addr_phase);
 	debugfs_create_file_unsafe("incomplete_write_byte", 0200, priv->debug_dir,
 				   priv, &fops_incomplete_write_byte);
-	if (priv->bit_data.getscl)
+	if (priv->bit_data.getscl) {
+		debugfs_create_file_unsafe("inject_panic", 0200, priv->debug_dir,
+					   priv, &fops_inject_panic);
 		debugfs_create_file_unsafe("lose_arbitration", 0200, priv->debug_dir,
 					   priv, &fops_lose_arbitration);
+	}
 	debugfs_create_file_unsafe("scl", 0600, priv->debug_dir, priv, &fops_scl);
 	debugfs_create_file_unsafe("sda", 0600, priv->debug_dir, priv, &fops_sda);
 }
-- 
2.11.0

