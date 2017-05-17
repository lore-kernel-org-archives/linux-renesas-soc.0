Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34530 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754043AbdEQR61 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 May 2017 13:58:27 -0400
Received: by mail-wm0-f65.google.com with SMTP id d127so5317736wmf.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 May 2017 10:58:26 -0700 (PDT)
From: Petre Pircalabu <petre.pircalabu@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com
Cc: mirea_bogdan@mentor.com,
        Petre Pircalabu <Petre_Pircalabu@mentor.com>
Subject: [PATCH] phy: rcar-gen3-usb3: Initial support for xhci phy
Date: Wed, 17 May 2017 20:58:08 +0300
Message-Id: <1495043888-20934-1-git-send-email-Petre_Pircalabu@mentor.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The USB30PHY of a RCAR-Gen3 XHCI device can select the reference clock
source. The 2 available options are the differential input clock pair
supplied on pins USB3S0_CLK_P / USB3S0_CLK_M (default) and the on-chip
clock source supplied through USB_XTAL/USB_EXTAL.

The device can be configured to use the on-chip source by adding the
"renesas,use-on-chip-clk" option in the corresponding device tree node.

Signed-off-by: Petre Pircalabu <Petre_Pircalabu@mentor.com>
---
 .../devicetree/bindings/phy/rcar-gen3-phy-usb3.txt |  22 +++
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi       |   8 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/phy/Kconfig                                |   8 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-rcar-gen3-usb3.c                   | 166 +++++++++++++++++++++
 6 files changed, 206 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
 create mode 100644 drivers/phy/phy-rcar-gen3-usb3.c

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
new file mode 100644
index 0000000..aa9657c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
@@ -0,0 +1,22 @@
+* Renesas R-Car generation 3 USB 3.0 PHY
+
+This file provides information on what the device node for the R-Car generation
+3 USB 3.0 PHY contains.
+
+Required properties:
+- compatible: "renesas,rcar-gen3-usb3-phy" for a generic R-Car Gen3 compatible device.
+- reg: offset and length of the partial USB 3.0 Host PHY register block.
+- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
+
+Optional properties:
+
+Example (R-Car H3):
+
+	usb3_phy0: usb-phy@e65ee000 {
+		compatible = "renesas,rcar-gen3-usb3-phy";
+		reg = <0 0xe65ee000 0 0x100>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		#phy-cells = <0>;
+		renesas,use-on-chip-clk;
+		status = "okay";
+	};
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 2bf5911..33fe114 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -2499,6 +2499,14 @@
 			status = "disabled";
 		};
 
+		usb3_phy0: usb-phy@e65ee000 {
+			compatible = "renesas,rcar-gen3-usb3-phy";
+			reg = <0 0xe65ee000 0 0x100>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		ehci0: usb@ee080100 {
 			compatible = "generic-ehci";
 			reg = <0 0xee080100 0 0x100>;
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4e030c8..df9ca01 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -441,6 +441,7 @@ CONFIG_PWM=y
 CONFIG_PWM_TEGRA=m
 CONFIG_COMMON_RESET_HI6220=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
+CONFIG_PHY_RCAR_GEN3_USB3=y
 CONFIG_PHY_HI6220_USB=y
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_TEGRA_XUSB=y
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index fe00f91..4c8a207 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -154,6 +154,14 @@ config PHY_RCAR_GEN3_USB2
 	help
 	  Support for USB 2.0 PHY found on Renesas R-Car generation 3 SoCs.
 
+config PHY_RCAR_GEN3_USB3
+	tristate "Renesas R-Car generation 3 USB 3.0 PHY driver"
+	depends on ARCH_RENESAS
+	select GENERIC_PHY
+	help
+	  Enable this to add support for the USB 3.0 PHY found on
+	  Renesas R-Car generation 3 SoCs.
+
 config OMAP_CONTROL_PHY
 	tristate "OMAP CONTROL PHY Driver"
 	depends on ARCH_OMAP2PLUS || COMPILE_TEST
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index a534cf5..aeda949 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_PHY_MIPHY28LP) 		+= phy-miphy28lp.o
 obj-$(CONFIG_PHY_MIPHY365X)		+= phy-miphy365x.o
 obj-$(CONFIG_PHY_RCAR_GEN2)		+= phy-rcar-gen2.o
 obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+= phy-rcar-gen3-usb2.o
+obj-$(CONFIG_PHY_RCAR_GEN3_USB3)	+= phy-rcar-gen3-usb3.o
 obj-$(CONFIG_OMAP_CONTROL_PHY)		+= phy-omap-control.o
 obj-$(CONFIG_OMAP_USB2)			+= phy-omap-usb2.o
 obj-$(CONFIG_TI_PIPE3)			+= phy-ti-pipe3.o
diff --git a/drivers/phy/phy-rcar-gen3-usb3.c b/drivers/phy/phy-rcar-gen3-usb3.c
new file mode 100644
index 0000000..87fa24d
--- /dev/null
+++ b/drivers/phy/phy-rcar-gen3-usb3.c
@@ -0,0 +1,166 @@
+/*
+ * Renesas R-Car Gen3 for USB3.0 PHY driver
+ *
+ * Copyright (C) 2017 Mentor Graphics Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+ * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+ * for more details.
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define USB30_CLKSET0 0x34
+#define USB30_CLKSET1 0x36
+
+#define USB30_CLKSET0_FSEL_MASK                 0x003F
+#define USB30_CLKSET0_FSEL_USB_XTAL             0x0002
+#define USB30_CLKSET0_FSEL_USB3S0_CLK           0x0027
+
+#define USB30_CLKSET1_PLL_MULTI_MASK            0x1FC0
+#define USB30_CLKSET1_PLL_MULTI_USB_XTAL        (0x64 << 6)
+#define USB30_CLKSET1_PLL_MULTI_USB3S0_CLK      (0x00 << 6)
+#define USB30_CLKSET1_REF_CLKDIV                BIT(3)
+#define USB30_CLKSET1_USB_SEL                   BIT(0)
+
+struct rcar_gen3_usb3_phy {
+	void __iomem *base;
+	struct phy *phy;
+	u8 use_on_chip_clk;
+};
+
+static int rcar_gen3_phy_usb3_init(struct phy *p)
+{
+	struct rcar_gen3_usb3_phy *phy_dev = phy_get_drvdata(p);
+	void __iomem *usb3_base = phy_dev->base;
+
+	u16 clkset0, clkset1;
+
+	clkset0 = readw(usb3_base + USB30_CLKSET0);
+	clkset1 = readw(usb3_base + USB30_CLKSET1);
+
+	dev_dbg(&p->dev, "USB30_CLKSET0 initial value = 0x%04X\n", clkset0);
+	dev_dbg(&p->dev, "USB30_CLKSET1 initial value = 0x%04X\n", clkset1);
+
+	clkset0 &= ~USB30_CLKSET0_FSEL_MASK;
+	clkset1 &= ~(USB30_CLKSET1_PLL_MULTI_MASK | USB30_CLKSET1_REF_CLKDIV |
+			USB30_CLKSET1_USB_SEL);
+
+	if (phy_dev->use_on_chip_clk) {
+		/* Select 50MHz clock */
+		dev_info(&p->dev, "USE USB_XTAL clock (50MHz)\n");
+		clkset0 |= USB30_CLKSET0_FSEL_USB_XTAL;
+		clkset1 |= USB30_CLKSET1_PLL_MULTI_USB_XTAL |
+			USB30_CLKSET1_REF_CLKDIV;
+		clkset1 &= ~USB30_CLKSET1_USB_SEL;
+	} else {
+		/* Select 100MHz clock */
+		dev_info(&p->dev, "USE USB3S0_CLK reference (100MHz)\n");
+		clkset0 |= USB30_CLKSET0_FSEL_USB3S0_CLK;
+		clkset1 |= USB30_CLKSET1_PLL_MULTI_USB3S0_CLK |
+			USB30_CLKSET1_USB_SEL;
+		clkset1 &= ~USB30_CLKSET1_REF_CLKDIV;
+	}
+
+	dev_dbg(&p->dev, "USB30_CLKSET0 new value = 0x%04X\n", clkset0);
+	dev_dbg(&p->dev, "USB30_CLKSET1 new value = 0x%04X\n", clkset1);
+
+	writew(clkset0, usb3_base + USB30_CLKSET0);
+	writew(clkset1, usb3_base + USB30_CLKSET1);
+
+	return 0;
+}
+
+static int rcar_gen3_phy_usb3_exit(struct phy *p)
+{
+	return 0;
+}
+
+
+static struct phy_ops rcar_gen3_phy_usb3_ops = {
+	.init		= rcar_gen3_phy_usb3_init,
+	.exit		= rcar_gen3_phy_usb3_exit,
+	.owner		= THIS_MODULE,
+};
+
+static const struct of_device_id rcar_gen3_phy_usb3_match_table[] = {
+	{ .compatible = "renesas,rcar-gen3-usb3-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rcar_gen3_phy_usb3_match_table);
+
+static int rcar_gen3_phy_usb3_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rcar_gen3_usb3_phy *phy_dev;
+	struct phy_provider *provider;
+	struct resource *res;
+
+	if (!dev->of_node) {
+		dev_err(dev, "This driver needs a device tree node\n");
+		return -EINVAL;
+	}
+
+	phy_dev = devm_kzalloc(dev, sizeof(*phy_dev), GFP_KERNEL);
+	if (!phy_dev)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	phy_dev->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(phy_dev->base))
+		return PTR_ERR(phy_dev->base);
+
+	phy_dev->use_on_chip_clk = device_property_read_bool(dev,
+			"renesas,use-on-chip-clk");
+
+	pm_runtime_enable(dev);
+	phy_dev->phy = devm_phy_create(dev, NULL, &rcar_gen3_phy_usb3_ops);
+	if (IS_ERR(phy_dev->phy)) {
+		dev_err(dev, "Failed to create Rcar Gen3 USB3 PHY\n");
+		return PTR_ERR(phy_dev->phy);
+	}
+
+	platform_set_drvdata(pdev, phy_dev);
+	phy_set_drvdata(phy_dev->phy, phy_dev);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider)) {
+		dev_err(dev, "Failed to register PHY provider\n");
+		return PTR_ERR(provider);
+	}
+
+	dev_info(&pdev->dev, "Initialized RCAR Gen3 USB3 PHY module\n");
+	return 0;
+}
+
+static int rcar_gen3_phy_usb3_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	return 0;
+}
+
+static struct platform_driver rcar_gen3_phy_usb3_driver = {
+	.driver = {
+		.name		= "phy_rcar_gen3_usb3",
+		.of_match_table	= rcar_gen3_phy_usb3_match_table,
+	},
+	.probe	= rcar_gen3_phy_usb3_probe,
+	.remove	= rcar_gen3_phy_usb3_remove,
+};
+module_platform_driver(rcar_gen3_phy_usb3_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Renesas R-Car Gen3 USB 3.0 PHY");
+MODULE_AUTHOR("Petre Pircalabu <petre_pircalabu@mentor.com>");
-- 
1.9.1
