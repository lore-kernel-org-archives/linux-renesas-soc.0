Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH V2 4/4] regulator: Add ROHM BD9571MWV-M PMIC regulator driver
Date: Mon, 24 Apr 2017 17:21:30 +0200
Message-Id: <20170424152130.32410-4-marek.vasut+renesas@gmail.com>
In-Reply-To: <20170424152130.32410-1-marek.vasut+renesas@gmail.com>
References: <20170424152130.32410-1-marek.vasut+renesas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add driver for the regulator block in the ROHM BD9571MWV-W MFD PMIC.
This block supports three voltage monitors, VD18, VD25, VD33 for the
1V8, 2V5, 3V3 voltage rails and a single voltage regulator for the
DVFS rail.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: linux-kernel@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
---
V2: - Do not open-code the .is_enabled as the regulators are always enabled
    - Add the VD09 regulator
---
 drivers/regulator/Kconfig               |  11 ++
 drivers/regulator/Makefile              |   1 +
 drivers/regulator/bd9571mwv-regulator.c | 178 ++++++++++++++++++++++++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 drivers/regulator/bd9571mwv-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 290eeb88832c..b6e512df6df4 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -163,6 +163,17 @@ config REGULATOR_BCM590XX
 	  BCM590xx PMUs. This will enable support for the software
 	  controllable LDO/Switching regulators.
 
+config REGULATOR_BD9571MWV
+	tristate "ROHM BD9571MWV Regulators"
+	depends on MFD_BD9571MWV
+	help
+	  This driver provides support for the voltage regulators on the
+	  ROHM BD9571MWV PMIC. This will enable support for the software
+	  controllable regulator and voltage sampling units.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called bd9571mwv-regulator.
+
 config REGULATOR_CPCAP
 	tristate "Motorola CPCAP regulator"
 	depends on MFD_CPCAP
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index bf5ed7a9df99..c777c8493bf7 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_REGULATOR_AS3711) += as3711-regulator.o
 obj-$(CONFIG_REGULATOR_AS3722) += as3722-regulator.o
 obj-$(CONFIG_REGULATOR_AXP20X) += axp20x-regulator.o
 obj-$(CONFIG_REGULATOR_BCM590XX) += bcm590xx-regulator.o
+obj-$(CONFIG_REGULATOR_BD9571MWV) += bd9571mwv-regulator.o
 obj-$(CONFIG_REGULATOR_DA903X)	+= da903x.o
 obj-$(CONFIG_REGULATOR_DA9052)	+= da9052-regulator.o
 obj-$(CONFIG_REGULATOR_DA9055)	+= da9055-regulator.o
diff --git a/drivers/regulator/bd9571mwv-regulator.c b/drivers/regulator/bd9571mwv-regulator.c
new file mode 100644
index 000000000000..8ba206fec31e
--- /dev/null
+++ b/drivers/regulator/bd9571mwv-regulator.c
@@ -0,0 +1,178 @@
+/*
+ * ROHM BD9571MWV-M regulator driver
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
+ *
+ * NOTE: VD09 is missing
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+
+#include <linux/mfd/bd9571mwv.h>
+
+enum bd9571mwv_regulators { VD09, VD18, VD25, VD33, DVFS };
+
+#define BD9571MWV_REG(_name, _of, _id, _ops, _vr, _vm, _nv, _min, _step, _lmin)\
+	{							\
+		.name			= _name,		\
+		.of_match		= of_match_ptr(_of),	\
+		.regulators_node	= "regulators",		\
+		.id			= _id,			\
+		.ops			= &_ops,		\
+		.n_voltages		= _nv,			\
+		.type			= REGULATOR_VOLTAGE,	\
+		.owner			= THIS_MODULE,		\
+		.vsel_reg		= _vr,			\
+		.vsel_mask		= _vm,			\
+		.min_uV			= _min,			\
+		.uV_step		= _step,		\
+		.linear_min_sel		= _lmin,		\
+	}
+
+int bd9571mwv_avs_get_moni_state(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(rdev->regmap, BD9571MWV_AVS_SET_MONI, &val);
+	if (ret != 0)
+		return ret;
+
+	return val & BD9571MWV_AVS_SET_MONI_MASK;
+}
+
+int bd9571mwv_avs_set_voltage_sel_regmap(struct regulator_dev *rdev,
+					 unsigned int sel)
+{
+	int ret;
+
+	ret = bd9571mwv_avs_get_moni_state(rdev);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write_bits(rdev->regmap, BD9571MWV_AVS_VD09_VID(ret),
+				 rdev->desc->vsel_mask, sel);
+}
+
+int bd9571mwv_avs_get_voltage_sel_regmap(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	int ret;
+
+	ret = bd9571mwv_avs_get_moni_state(rdev);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_read(rdev->regmap, BD9571MWV_AVS_VD09_VID(ret), &val);
+	if (ret != 0)
+		return ret;
+
+	val &= rdev->desc->vsel_mask;
+	val >>= ffs(rdev->desc->vsel_mask) - 1;
+
+	return val;
+}
+
+int bd9571mwv_reg_set_voltage_sel_regmap(struct regulator_dev *rdev,
+					 unsigned int sel)
+{
+	return regmap_write_bits(rdev->regmap, BD9571MWV_DVFS_SETVID,
+				 rdev->desc->vsel_mask, sel);
+}
+
+/* Operations permitted on AVS voltage regulator */
+static struct regulator_ops avs_ops = {
+	.set_voltage_sel	= bd9571mwv_avs_set_voltage_sel_regmap,
+	.map_voltage		= regulator_map_voltage_linear,
+	.get_voltage_sel	= bd9571mwv_avs_get_voltage_sel_regmap,
+	.list_voltage		= regulator_list_voltage_linear,
+};
+
+/* Operations permitted on voltage regulators */
+static struct regulator_ops reg_ops = {
+	.set_voltage_sel	= bd9571mwv_reg_set_voltage_sel_regmap,
+	.map_voltage		= regulator_map_voltage_linear,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.list_voltage		= regulator_list_voltage_linear,
+};
+
+/* Operations permitted on voltage monitors */
+static struct regulator_ops vid_ops = {
+	.map_voltage		= regulator_map_voltage_linear,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.list_voltage		= regulator_list_voltage_linear,
+};
+
+static struct regulator_desc regulators[] = {
+	BD9571MWV_REG("VD09", "vd09", VD09, avs_ops, 0, 0x7f,
+		      0x80, 600000, 10000, 0x3c),
+	BD9571MWV_REG("VD18", "vd18", VD18, vid_ops, BD9571MWV_VD18_VID, 0xf,
+		      16, 1625000, 25000, 0),
+	BD9571MWV_REG("VD25", "vd25", VD25, vid_ops, BD9571MWV_VD25_VID, 0xf,
+		      16, 2150000, 50000, 0),
+	BD9571MWV_REG("VD33", "vd33", VD33, vid_ops, BD9571MWV_VD33_VID, 0xf,
+		      11, 2800000, 100000, 0),
+	BD9571MWV_REG("DVFS", "dvfs", DVFS, reg_ops,
+		      BD9571MWV_DVFS_MONIVDAC, 0x7f,
+		      0x80, 600000, 10000, 0x3c),
+};
+
+static int bd9571mwv_regulator_probe(struct platform_device *pdev)
+{
+	struct bd9571mwv *bd = dev_get_drvdata(pdev->dev.parent);
+	struct regulator_config config = { };
+	struct regulator_dev *rdev;
+	int i;
+
+	platform_set_drvdata(pdev, bd);
+
+	config.dev = &pdev->dev;
+	config.dev->of_node = bd->dev->of_node;
+	config.driver_data = bd;
+	config.regmap = bd->regmap;
+
+	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
+		rdev = devm_regulator_register(&pdev->dev, &regulators[i],
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(bd->dev, "failed to register %s regulator\n",
+				pdev->name);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id bd9571mwv_regulator_id_table[] = {
+	{ "bd9571mwv-regulator", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, bd9571mwv_regulator_id_table);
+
+static struct platform_driver bd9571mwv_regulator_driver = {
+	.driver = {
+		.name = "bd9571mwv-regulator",
+	},
+	.probe = bd9571mwv_regulator_probe,
+	.id_table = bd9571mwv_regulator_id_table,
+};
+module_platform_driver(bd9571mwv_regulator_driver);
+
+MODULE_AUTHOR("Marek Vasut <marek.vasut+renesas@gmail.com>");
+MODULE_DESCRIPTION("BD9571MWV Regulator driver");
+MODULE_LICENSE("GPL v2");
-- 
2.11.0
