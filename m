Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH V2 2/4] mfd: Add ROHM BD9571MWV-M MFD PMIC driver
Date: Mon, 24 Apr 2017 17:21:28 +0200
Message-Id: <20170424152130.32410-2-marek.vasut+renesas@gmail.com>
In-Reply-To: <20170424152130.32410-1-marek.vasut+renesas@gmail.com>
References: <20170424152130.32410-1-marek.vasut+renesas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the MFD part of the ROHM BD9571MWV-M PMIC driver and MAINTAINERS
entry. The MFD part only specifies the regmap bits for the PMIC and
binds the subdevs together.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lee Jones <lee.jones@linaro.org>
---
V2: - Change BD9571MWV_AVS_VD09_VID0,1,2,3 to BD9571MWV_AVS_VD09_VID(n)
    - Change BD9571MWV_AVS_DVFS_VID0,1,2,3 to BD9571MWV_AVS_DVFS_VID(n)
    - Make the AVS_VD09 range RW, so it can be used by the regulator
      driver for the VD09 regulator
    - Report the regmap read return values when attempting to read ID
      registers fails
---
 MAINTAINERS                   |  11 ++
 drivers/mfd/Kconfig           |  13 +++
 drivers/mfd/Makefile          |   1 +
 drivers/mfd/bd9571mwv.c       | 230 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/bd9571mwv.h | 115 +++++++++++++++++++++
 5 files changed, 370 insertions(+)
 create mode 100644 drivers/mfd/bd9571mwv.c
 create mode 100644 include/linux/mfd/bd9571mwv.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 67280051e30a..6f19aa08375d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10917,6 +10917,17 @@ L:	linux-serial@vger.kernel.org
 S:	Odd Fixes
 F:	drivers/tty/serial/rp2.*
 
+ROHM MULTIFUNCTION BD9571MWV-M PMIC DEVICE DRIVERS
+M:	Marek Vasut <marek.vasut+renesas@gmail.com>
+L:	linux-kernel@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	drivers/mfd/bd9571mwv.c
+F:	drivers/regulator/bd9571mwv-regulator.c
+F:	drivers/gpio/gpio-bd9571mwv.c
+F:	include/linux/mfd/bd9571mwv.h
+F:	Documentation/devicetree/bindings/mfd/bd9571mwv.txt
+
 ROSE NETWORK LAYER
 M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-hams@vger.kernel.org
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index de68b5ba8741..fa1f41ef5332 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -133,6 +133,19 @@ config MFD_BCM590XX
 	help
 	  Support for the BCM590xx PMUs from Broadcom
 
+config MFD_BD9571MWV
+	tristate "ROHM BD9571MWV PMIC"
+	select MFD_CORE
+	select REGMAP_I2C
+	depends on I2C
+	help
+	  Support for the ROHM BD9571MWV PMIC, which contains single
+	  voltage regulator, voltage sampling units, GPIO block and
+	  watchdog block.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called bd9571mwv.
+
 config MFD_AC100
 	tristate "X-Powers AC100"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index fa86dbe65e52..e2c82d2b108d 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
 obj-$(CONFIG_MFD_SM501)		+= sm501.o
 obj-$(CONFIG_MFD_ASIC3)		+= asic3.o tmio_core.o
 obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
+obj-$(CONFIG_MFD_BD9571MWV)	+= bd9571mwv.o
 cros_ec_core-objs		:= cros_ec.o
 cros_ec_core-$(CONFIG_ACPI)	+= cros_ec_acpi_gpe.o
 obj-$(CONFIG_MFD_CROS_EC)	+= cros_ec_core.o
diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
new file mode 100644
index 000000000000..64e088dfe7b0
--- /dev/null
+++ b/drivers/mfd/bd9571mwv.c
@@ -0,0 +1,230 @@
+/*
+ * ROHM BD9571MWV-M MFD driver
+ *
+ * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether expressed or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License version 2 for more details.
+ *
+ * Based on the TPS65086 driver
+ */
+
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+
+#include <linux/mfd/bd9571mwv.h>
+
+static const struct mfd_cell bd9571mwv_cells[] = {
+	{ .name = "bd9571mwv-regulator", },
+	{ .name = "bd9571mwv-gpio", },
+};
+
+static const struct regmap_range bd9571mwv_readable_yes_ranges[] = {
+	regmap_reg_range(BD9571MWV_VENDOR_CODE, BD9571MWV_PRODUCT_REVISION),
+	regmap_reg_range(BD9571MWV_AVS_SET_MONI, BD9571MWV_AVS_DVFS_VID(3)),
+	regmap_reg_range(BD9571MWV_VD18_VID, BD9571MWV_VD33_VID),
+	regmap_reg_range(BD9571MWV_DVFS_VINIT, BD9571MWV_DVFS_VINIT),
+	regmap_reg_range(BD9571MWV_DVFS_SETVMAX, BD9571MWV_DVFS_MONIVDAC),
+	regmap_reg_range(BD9571MWV_GPIO_IN, BD9571MWV_GPIO_IN),
+	regmap_reg_range(BD9571MWV_GPIO_INT, BD9571MWV_GPIO_INTMASK),
+	regmap_reg_range(BD9571MWV_INT_INTREQ, BD9571MWV_INT_INTMASK),
+};
+
+static const struct regmap_access_table bd9571mwv_readable_table = {
+	.yes_ranges	= bd9571mwv_readable_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(bd9571mwv_readable_yes_ranges),
+};
+
+static const struct regmap_range bd9571mwv_writable_yes_ranges[] = {
+	regmap_reg_range(BD9571MWV_AVS_VD09_VID(0), BD9571MWV_AVS_VD09_VID(3)),
+	regmap_reg_range(BD9571MWV_DVFS_SETVID, BD9571MWV_DVFS_SETVID),
+	regmap_reg_range(BD9571MWV_GPIO_DIR, BD9571MWV_GPIO_OUT),
+	regmap_reg_range(BD9571MWV_GPIO_INT_SET, BD9571MWV_GPIO_INTMASK),
+	regmap_reg_range(BD9571MWV_INT_INTREQ, BD9571MWV_INT_INTMASK),
+};
+
+static const struct regmap_access_table bd9571mwv_writable_table = {
+	.yes_ranges	= bd9571mwv_writable_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(bd9571mwv_writable_yes_ranges),
+};
+
+static const struct regmap_range bd9571mwv_volatile_yes_ranges[] = {
+	regmap_reg_range(BD9571MWV_GPIO_IN, BD9571MWV_GPIO_IN),
+	regmap_reg_range(BD9571MWV_GPIO_INT, BD9571MWV_GPIO_INT),
+	regmap_reg_range(BD9571MWV_INT_INTREQ, BD9571MWV_INT_INTREQ),
+};
+
+static const struct regmap_access_table bd9571mwv_volatile_table = {
+	.yes_ranges	= bd9571mwv_volatile_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(bd9571mwv_volatile_yes_ranges),
+};
+
+static const struct regmap_config bd9571mwv_regmap_config = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.cache_type	= REGCACHE_RBTREE,
+	.rd_table	= &bd9571mwv_readable_table,
+	.wr_table	= &bd9571mwv_writable_table,
+	.volatile_table	= &bd9571mwv_volatile_table,
+	.max_register	= 0xff,
+};
+
+static const struct regmap_irq bd9571mwv_irqs[] = {
+	REGMAP_IRQ_REG(BD9571MWV_IRQ_MD1, 0,
+		       BD9571MWV_INT_INTREQ_MD1_INT),
+	REGMAP_IRQ_REG(BD9571MWV_IRQ_MD2_E1, 0,
+		       BD9571MWV_INT_INTREQ_MD2_E1_INT),
+	REGMAP_IRQ_REG(BD9571MWV_IRQ_MD2_E2, 0,
+		       BD9571MWV_INT_INTREQ_MD2_E2_INT),
+	REGMAP_IRQ_REG(BD9571MWV_IRQ_PROT_ERR, 0,
+		       BD9571MWV_INT_INTREQ_PROT_ERR_INT),
+	REGMAP_IRQ_REG(BD9571MWV_IRQ_GP, 0,
+		       BD9571MWV_INT_INTREQ_GP_INT),
+	REGMAP_IRQ_REG(BD9571MWV_IRQ_128H_OF, 0,
+		       BD9571MWV_INT_INTREQ_128H_OF_INT),
+	REGMAP_IRQ_REG(BD9571MWV_IRQ_WDT_OF, 0,
+		       BD9571MWV_INT_INTREQ_WDT_OF_INT),
+	REGMAP_IRQ_REG(BD9571MWV_IRQ_BKUP_TRG, 0,
+		       BD9571MWV_INT_INTREQ_BKUP_TRG_INT),
+};
+
+static struct regmap_irq_chip bd9571mwv_irq_chip = {
+	.name		= "bd9571mwv",
+	.status_base	= BD9571MWV_INT_INTREQ,
+	.mask_base	= BD9571MWV_INT_INTMASK,
+	.ack_base	= BD9571MWV_INT_INTREQ,
+	.init_ack_masked = true,
+	.num_regs	= 1,
+	.irqs		= bd9571mwv_irqs,
+	.num_irqs	= ARRAY_SIZE(bd9571mwv_irqs),
+};
+
+static int bd9571mwv_identify(struct bd9571mwv *bd)
+{
+	struct device *dev = bd->dev;
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(bd->regmap, BD9571MWV_VENDOR_CODE, &value);
+	if (ret) {
+		dev_err(dev, "Failed to read vendor code register (ret=%i)\n",
+			ret);
+		return ret;
+	}
+
+	if (value != BD9571MWV_VENDOR_CODE_VAL) {
+		dev_err(dev, "Invalid vendor code ID %02x (expected %02x)\n",
+			value, BD9571MWV_VENDOR_CODE_VAL);
+		return -EINVAL;
+	}
+
+	ret = regmap_read(bd->regmap, BD9571MWV_PRODUCT_CODE, &value);
+	if (ret) {
+		dev_err(dev, "Failed to read product code register (ret=%i)\n",
+			ret);
+		return ret;
+	}
+
+	if (value != BD9571MWV_PRODUCT_CODE_VAL) {
+		dev_err(dev, "Invalid product code ID %02x (expected %02x)\n",
+			value, BD9571MWV_PRODUCT_CODE_VAL);
+		return -EINVAL;
+	}
+
+	ret = regmap_read(bd->regmap, BD9571MWV_PRODUCT_REVISION, &value);
+	if (ret) {
+		dev_err(dev, "Failed to read revision register (ret=%i)\n",
+			ret);
+		return ret;
+	}
+
+	dev_info(dev, "Device: BD9571MWV rev. %d\n", value & 0xff);
+
+	return 0;
+}
+
+static int bd9571mwv_probe(struct i2c_client *client,
+			  const struct i2c_device_id *ids)
+{
+	struct bd9571mwv *bd;
+	int ret;
+
+	bd = devm_kzalloc(&client->dev, sizeof(*bd), GFP_KERNEL);
+	if (!bd)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, bd);
+	bd->dev = &client->dev;
+	bd->irq = client->irq;
+
+	bd->regmap = devm_regmap_init_i2c(client, &bd9571mwv_regmap_config);
+	if (IS_ERR(bd->regmap)) {
+		dev_err(bd->dev, "Failed to initialize register map\n");
+		return PTR_ERR(bd->regmap);
+	}
+
+	ret = bd9571mwv_identify(bd);
+	if (ret)
+		return ret;
+
+	ret = regmap_add_irq_chip(bd->regmap, bd->irq, IRQF_ONESHOT, 0,
+				  &bd9571mwv_irq_chip, &bd->irq_data);
+	if (ret) {
+		dev_err(bd->dev, "Failed to register IRQ chip\n");
+		return ret;
+	}
+
+	ret = mfd_add_devices(bd->dev, PLATFORM_DEVID_AUTO, bd9571mwv_cells,
+			      ARRAY_SIZE(bd9571mwv_cells), NULL, 0,
+			      regmap_irq_get_domain(bd->irq_data));
+	if (ret) {
+		regmap_del_irq_chip(bd->irq, bd->irq_data);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int bd9571mwv_remove(struct i2c_client *client)
+{
+	struct bd9571mwv *bd = i2c_get_clientdata(client);
+
+	regmap_del_irq_chip(bd->irq, bd->irq_data);
+
+	return 0;
+}
+
+static const struct of_device_id bd9571mwv_of_match_table[] = {
+	{ .compatible = "rohm,bd9571mwv", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, bd9571mwv_of_match_table);
+
+static const struct i2c_device_id bd9571mwv_id_table[] = {
+	{ "bd9571mwv", 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, bd9571mwv_id_table);
+
+static struct i2c_driver bd9571mwv_driver = {
+	.driver		= {
+		.name	= "bd9571mwv",
+		.of_match_table = bd9571mwv_of_match_table,
+	},
+	.probe		= bd9571mwv_probe,
+	.remove		= bd9571mwv_remove,
+	.id_table       = bd9571mwv_id_table,
+};
+module_i2c_driver(bd9571mwv_driver);
+
+MODULE_AUTHOR("Marek Vasut <marek.vasut+renesas@gmail.com>");
+MODULE_DESCRIPTION("BD9571MWV PMIC Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mfd/bd9571mwv.h b/include/linux/mfd/bd9571mwv.h
new file mode 100644
index 000000000000..f0708ba4cbba
--- /dev/null
+++ b/include/linux/mfd/bd9571mwv.h
@@ -0,0 +1,115 @@
+/*
+ * ROHM BD9571MWV-M driver
+ *
+ * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether expressed or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License version 2 for more details.
+ *
+ * Based on the TPS65086 driver
+ */
+
+#ifndef __LINUX_MFD_BD9571MWV_H
+#define __LINUX_MFD_BD9571MWV_H
+
+#include <linux/device.h>
+#include <linux/regmap.h>
+
+/* List of registers for BD9571MWV */
+#define BD9571MWV_VENDOR_CODE			0x00
+#define BD9571MWV_VENDOR_CODE_VAL		0xdb
+#define BD9571MWV_PRODUCT_CODE			0x01
+#define BD9571MWV_PRODUCT_CODE_VAL		0x60
+#define BD9571MWV_PRODUCT_REVISION		0x02
+
+#define BD9571MWV_I2C_FUSA_MODE			0x10
+#define BD9571MWV_I2C_MD2_E1_BIT_1		0x11
+#define BD9571MWV_I2C_MD2_E1_BIT_2		0x12
+
+#define BD9571MWV_BKUP_MODE_CNT			0x20
+#define BD9571MWV_BKUP_MODE_STATUS		0x21
+#define BD9571MWV_BKUP_RECOVERY_CNT		0x22
+#define BD9571MWV_BKUP_CTRL_TIM_CNT		0x23
+#define BD9571MWV_WAITBKUP_WDT_CNT		0x24
+#define BD9571MWV_128H_TIM_CNT			0x26
+#define BD9571MWV_QLLM_CNT			0x27
+
+#define BD9571MWV_AVS_SET_MONI			0x31
+#define BD9571MWV_AVS_SET_MONI_MASK		0x3
+#define BD9571MWV_AVS_VD09_VID(n)		(0x32 + (n))
+#define BD9571MWV_AVS_DVFS_VID(n)		(0x36 + (n))
+
+#define BD9571MWV_VD18_VID			0x42
+#define BD9571MWV_VD25_VID			0x43
+#define BD9571MWV_VD33_VID			0x44
+
+#define BD9571MWV_DVFS_VINIT			0x50
+#define BD9571MWV_DVFS_SETVMAX			0x52
+#define BD9571MWV_DVFS_BOOSTVID			0x53
+#define BD9571MWV_DVFS_SETVID			0x54
+#define BD9571MWV_DVFS_MONIVDAC			0x55
+#define BD9571MWV_DVFS_PGD_CNT			0x56
+
+#define BD9571MWV_GPIO_DIR			0x60
+#define BD9571MWV_GPIO_OUT			0x61
+#define BD9571MWV_GPIO_IN			0x62
+#define BD9571MWV_GPIO_DEB			0x63
+#define BD9571MWV_GPIO_INT_SET			0x64
+#define BD9571MWV_GPIO_INT			0x65
+#define BD9571MWV_GPIO_INTMASK			0x66
+
+#define BD9571MWV_REG_KEEP(n)			(0x70 + (n))
+
+#define BD9571MWV_PMIC_INTERNAL_STATUS		0x80
+#define BD9571MWV_PROT_ERROR_STATUS0		0x81
+#define BD9571MWV_PROT_ERROR_STATUS1		0x82
+#define BD9571MWV_PROT_ERROR_STATUS2		0x83
+#define BD9571MWV_PROT_ERROR_STATUS3		0x84
+#define BD9571MWV_PROT_ERROR_STATUS4		0x85
+
+#define BD9571MWV_INT_INTREQ			0x90
+#define BD9571MWV_INT_INTREQ_MD1_INT		BIT(0)
+#define BD9571MWV_INT_INTREQ_MD2_E1_INT		BIT(1)
+#define BD9571MWV_INT_INTREQ_MD2_E2_INT		BIT(2)
+#define BD9571MWV_INT_INTREQ_PROT_ERR_INT	BIT(3)
+#define BD9571MWV_INT_INTREQ_GP_INT		BIT(4)
+#define BD9571MWV_INT_INTREQ_128H_OF_INT	BIT(5)
+#define BD9571MWV_INT_INTREQ_WDT_OF_INT		BIT(6)
+#define BD9571MWV_INT_INTREQ_BKUP_TRG_INT	BIT(7)
+#define BD9571MWV_INT_INTMASK			0x91
+
+#define BD9571MWV_ACCESS_KEY			0xff
+
+/* Define the BD9571MWV IRQ numbers */
+enum bd9571mwv_irqs {
+	BD9571MWV_IRQ_MD1,
+	BD9571MWV_IRQ_MD2_E1,
+	BD9571MWV_IRQ_MD2_E2,
+	BD9571MWV_IRQ_PROT_ERR,
+	BD9571MWV_IRQ_GP,
+	BD9571MWV_IRQ_128H_OF,
+	BD9571MWV_IRQ_WDT_OF,
+	BD9571MWV_IRQ_BKUP_TRG,
+};
+
+/**
+ * struct bd9571mwv - state holder for the bd9571mwv driver
+ *
+ * Device data may be used to access the BD9571MWV chip
+ */
+struct bd9571mwv {
+	struct device *dev;
+	struct regmap *regmap;
+
+	/* IRQ Data */
+	int irq;
+	struct regmap_irq_chip_data *irq_data;
+};
+
+#endif /* __LINUX_MFD_BD9571MWV_H */
-- 
2.11.0
