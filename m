Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:58542 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755967AbdEDRqF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 May 2017 13:46:05 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Matt Porter <mporter@konsulko.com>, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 6/6] spi: slave: Add SPI slave handler controlling system state
Date: Thu,  4 May 2017 19:45:51 +0200
Message-Id: <1493919951-32122-7-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1493919951-32122-1-git-send-email-geert+renesas@glider.be>
References: <1493919951-32122-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add an example SPI slave handler to allow remote control of system
reboot, power off, halt, and suspend.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - No changes,

v2:
  - Use spi_async() instead of spi_read(),
  - Submit the next transfer from the previous transfer's completion
    callback, removing the need for a thread,
  - Let .remove() call spi_slave_abort() to cancel the current ongoing
    transfer, and wait for the completion to terminate,
  - Remove FIXME about hanging kthread_stop(),
  - Fix copy-and-pasted module description.
---
 drivers/spi/Kconfig                    |   6 ++
 drivers/spi/Makefile                   |   1 +
 drivers/spi/spi-slave-system-control.c | 154 +++++++++++++++++++++++++++++++++
 3 files changed, 161 insertions(+)
 create mode 100644 drivers/spi/spi-slave-system-control.c

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index ade542c5bfd87e37..e6d9e329a3801d6d 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -802,6 +802,12 @@ config SPI_SLAVE_TIME
 	  SPI slave handler responding with the time of reception of the last
 	  SPI message.
 
+config SPI_SLAVE_SYSTEM_CONTROL
+	tristate "SPI slave handler controlling system state"
+	help
+	  SPI slave handler to allow remote control of system reboot, power
+	  off, halt, and suspend.
+
 endif # SPI_SLAVE
 
 endif # SPI
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index fb078693dbe40da4..1d7923e8c63bc22b 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -108,3 +108,4 @@ obj-$(CONFIG_SPI_ZYNQMP_GQSPI)		+= spi-zynqmp-gqspi.o
 
 # SPI slave protocol handlers
 obj-$(CONFIG_SPI_SLAVE_TIME)		+= spi-slave-time.o
+obj-$(CONFIG_SPI_SLAVE_SYSTEM_CONTROL)	+= spi-slave-system-control.o
diff --git a/drivers/spi/spi-slave-system-control.c b/drivers/spi/spi-slave-system-control.c
new file mode 100644
index 0000000000000000..736dd59928cb3bc3
--- /dev/null
+++ b/drivers/spi/spi-slave-system-control.c
@@ -0,0 +1,154 @@
+/*
+ * SPI slave handler controlling system state
+ *
+ * This SPI slave handler allows remote control of system reboot, power off,
+ * halt, and suspend.
+ *
+ * Copyright (C) 2016 Glider bvba
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ */
+
+#include <linux/completion.h>
+#include <linux/module.h>
+#include <linux/reboot.h>
+#include <linux/suspend.h>
+#include <linux/spi/spi.h>
+
+/*
+ * The numbers are chosen to display something human-readable on two 7-segment
+ * displays connected to two 74HC595 shift registers
+ */
+#define CMD_REBOOT	0x507c	/* rb */
+#define CMD_POWEROFF	0x3f71	/* OF */
+#define CMD_HALT	0x7638	/* HL */
+#define CMD_SUSPEND	0x1b1b	/* ZZ */
+
+struct spi_slave_system_control_priv {
+	struct spi_device *spi;
+	struct completion finished;
+	struct spi_transfer xfer;
+	struct spi_message msg;
+	__le16 cmd;
+};
+
+static
+int spi_slave_system_control_submit(struct spi_slave_system_control_priv *priv);
+
+static void spi_slave_system_control_complete(void *arg)
+{
+	struct spi_slave_system_control_priv *priv = arg;
+	u16 cmd;
+	int ret;
+
+	if (priv->msg.status)
+		goto terminate;
+
+	cmd = le16_to_cpu(priv->cmd);
+	switch (cmd) {
+	case CMD_REBOOT:
+		pr_info("Rebooting system...\n");
+		kernel_restart(NULL);
+
+	case CMD_POWEROFF:
+		pr_info("Powering off system...\n");
+		kernel_power_off();
+		break;
+
+	case CMD_HALT:
+		pr_info("Halting system...\n");
+		kernel_halt();
+		break;
+
+	case CMD_SUSPEND:
+		pr_info("Suspending system...\n");
+		pm_suspend(PM_SUSPEND_MEM);
+		break;
+
+	default:
+		pr_warn("%s: Unknown command 0x%x\n", __func__, cmd);
+		break;
+	}
+
+	ret = spi_slave_system_control_submit(priv);
+	if (ret)
+		goto terminate;
+
+	return;
+
+terminate:
+	pr_info("%s: Terminating\n", __func__);
+	complete(&priv->finished);
+}
+
+static
+int spi_slave_system_control_submit(struct spi_slave_system_control_priv *priv)
+{
+	int ret;
+
+	spi_message_init_with_transfers(&priv->msg, &priv->xfer, 1);
+
+	priv->msg.complete = spi_slave_system_control_complete;
+	priv->msg.context = priv;
+
+	ret = spi_async(priv->spi, &priv->msg);
+	if (ret)
+		pr_err("%s: spi_async() failed %d\n", __func__, ret);
+
+	return ret;
+}
+
+static int spi_slave_system_control_probe(struct spi_device *spi)
+{
+	struct spi_slave_system_control_priv *priv;
+	int ret;
+
+	/*
+	 * bits_per_word cannot be configured in platform data
+	 */
+	spi->bits_per_word = 8;
+
+	ret = spi_setup(spi);
+	if (ret < 0)
+		return ret;
+
+	priv = devm_kzalloc(&spi->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->spi = spi;
+	init_completion(&priv->finished);
+	priv->xfer.rx_buf = &priv->cmd;
+	priv->xfer.len = sizeof(priv->cmd);
+
+	ret = spi_slave_system_control_submit(priv);
+	if (ret)
+		return ret;
+
+	spi_set_drvdata(spi, priv);
+	return 0;
+}
+
+static int spi_slave_system_control_remove(struct spi_device *spi)
+{
+	struct spi_slave_system_control_priv *priv = spi_get_drvdata(spi);
+
+	spi_slave_abort(spi);
+	wait_for_completion(&priv->finished);
+	return 0;
+}
+
+static struct spi_driver spi_slave_system_control_driver = {
+	.driver = {
+		.name	= "spi-slave-system-control",
+	},
+	.probe		= spi_slave_system_control_probe,
+	.remove		= spi_slave_system_control_remove,
+};
+module_spi_driver(spi_slave_system_control_driver);
+
+MODULE_AUTHOR("Geert Uytterhoeven <geert+renesas@glider.be>");
+MODULE_DESCRIPTION("SPI slave handler controlling system state");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4
