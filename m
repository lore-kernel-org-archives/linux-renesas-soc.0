Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36165 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753765AbeDRIcl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 04:32:41 -0400
Received: by mail-pf0-f193.google.com with SMTP id g14so553702pfh.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Apr 2018 01:32:41 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 18 Apr 2018 17:33:22 +0900
Message-Id: <152404040278.7843.524678765267319751.sendpatchset@little-apple>
In-Reply-To: <152404037580.7843.5140455339218102749.sendpatchset@little-apple>
References: <152404037580.7843.5140455339218102749.sendpatchset@little-apple>
Subject: [PATCH 03/03] ARM: shmobile: stout: Initial support and regulator quirk
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

This is a back port to v4.16 of the following commits merged in v4.17-rc1:
ff938cd14d67 ARM: shmobile: stout: enable R-Car Gen2 regulator quirk
92bcfdb334ca ARM: dts: stout: Initial r8a7790 Stout board support

Thanks to Marek, Wolfram and Simon for the upstreaming efforts.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/Makefile                         |    1 
 arch/arm/boot/dts/r8a7790-stout.dts                |  363 ++++++++++++++++++++
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c |   23 -
 3 files changed, 380 insertions(+), 7 deletions(-)

--- 0001/arch/arm/boot/dts/Makefile
+++ work/arch/arm/boot/dts/Makefile	2018-04-17 16:49:11.080607110 +0900
@@ -784,6 +784,7 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
 	r8a7778-bockw.dtb \
 	r8a7779-marzen.dtb \
 	r8a7790-lager.dtb \
+	r8a7790-stout.dtb \
 	r8a7791-koelsch.dtb \
 	r8a7791-porter.dtb \
 	r8a7792-blanche.dtb \
--- /dev/null
+++ work/arch/arm/boot/dts/r8a7790-stout.dts	2018-04-17 16:49:12.100607110 +0900
@@ -0,0 +1,363 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Stout board
+ *
+ * Copyright (C) 2018 Marek Vasut <marek.vasut@gmail.com>
+ */
+
+/dts-v1/;
+#include "r8a7790.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Stout";
+	compatible = "renesas,stout", "renesas,r8a7790";
+
+	aliases {
+		serial0 = &scifa0;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x40000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led1 {
+			gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+		};
+		led2 {
+			gpios = <&gpio4 23 GPIO_ACTIVE_LOW>;
+		};
+		led3 {
+			gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
+		};
+		led5 {
+			gpios = <&gpio4 24 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	fixedregulator3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_sdhi0: regulator-vcc-sdhi0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "SDHI0 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio5 24 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7511_out>;
+			};
+		};
+	};
+
+	osc1_clk: osc1-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <148500000>;
+	};
+
+	osc4_clk: osc4-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+};
+
+&du {
+	pinctrl-0 = <&du_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 722>,
+		 <&cpg CPG_MOD 726>, <&cpg CPG_MOD 725>,
+		 <&osc1_clk>;
+	clock-names = "du.0", "du.1", "du.2", "lvds.0", "lvds.1", "dclkin.0";
+
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <&adv7511_in>;
+			};
+		};
+		port@1 {
+			lvds_connector0: endpoint {
+			};
+		};
+		port@2 {
+			lvds_connector1: endpoint {
+			};
+		};
+	};
+};
+
+&extal_clk {
+	clock-frequency = <20000000>;
+};
+
+&pfc {
+
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
+
+	du_pins: du {
+		groups = "du_rgb888", "du_sync_1", "du_clk_out_0";
+		function = "du";
+	};
+
+	scifa0_pins: scifa0 {
+		groups = "scifa0_data_b";
+		function = "scifa0";
+	};
+
+	scif_clk_pins: scif_clk {
+		groups = "scif_clk";
+		function = "scif_clk";
+	};
+
+	ether_pins: ether {
+		groups = "eth_link", "eth_mdio", "eth_rmii";
+		function = "eth";
+	};
+
+	phy1_pins: phy1 {
+		groups = "intc_irq1";
+		function = "intc";
+	};
+
+	sdhi0_pins: sd0 {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+		power-source = <3300>;
+	};
+
+	qspi_pins: qspi {
+		groups = "qspi_ctrl", "qspi_data4";
+		function = "qspi";
+	};
+
+	iic2_pins: iic2 {
+		groups = "iic2_b";
+		function = "iic2";
+	};
+
+	iic3_pins: iic3 {
+		groups = "iic3";
+		function = "iic3";
+	};
+
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
+};
+
+&ether {
+	pinctrl-0 = <&ether_pins &phy1_pins>;
+	pinctrl-names = "default";
+
+	phy-handle = <&phy1>;
+	renesas,ether-link-active-low;
+	status = "okay";
+
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+		interrupt-parent = <&irqc0>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+		micrel,led-mode = <1>;
+	};
+};
+
+&cmt0 {
+	status = "okay";
+};
+
+&qspi {
+	pinctrl-0 = <&qspi_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash: flash@0 {
+		compatible = "spansion,s25fl512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <30000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		spi-cpha;
+		spi-cpol;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "loader";
+				reg = <0x00000000 0x00080000>;
+				read-only;
+			};
+			partition@80000 {
+				label = "uboot";
+				reg = <0x00080000 0x00040000>;
+				read-only;
+			};
+			partition@c0000 {
+				label = "uboot-env";
+				reg = <0x000c0000 0x00040000>;
+				read-only;
+			};
+			partition@100000 {
+				label = "flash";
+				reg = <0x00100000 0x03f00000>;
+			};
+		};
+	};
+};
+
+&scifa0 {
+	pinctrl-0 = <&scifa0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <14745600>;
+};
+
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&vcc_sdhi0>;
+	cd-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&cpu0 {
+	cpu0-supply = <&vdd_dvfs>;
+};
+
+&iic2	{
+	status = "okay";
+	pinctrl-0 = <&iic2_pins>;
+	pinctrl-names = "default";
+
+	clock-frequency = <100000>;
+
+	hdmi@39 {
+		compatible = "adi,adv7511w";
+		reg = <0x39>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&osc4_clk>;
+		clock-names = "cec";
+
+		adi,input-depth = <8>;
+		adi,input-colorspace = "rgb";
+		adi,input-clock = "1x";
+		adi,input-style = <1>;
+		adi,input-justification = "evenly";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7511_in: endpoint {
+					remote-endpoint = <&du_out_rgb>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7511_out: endpoint {
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
+
+&iic3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&iic3_pins>;
+	status = "okay";
+
+	pmic@58 {
+		compatible = "dlg,da9063";
+		reg = <0x58>;
+		interrupt-parent = <&irqc0>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+
+		rtc {
+			compatible = "dlg,da9063-rtc";
+		};
+
+		wdt {
+			compatible = "dlg,da9063-watchdog";
+		};
+	};
+
+	vdd_dvfs: regulator@68 {
+		compatible = "dlg,da9210";
+		reg = <0x68>;
+		interrupt-parent = <&irqc0>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vdd: regulator@70 {
+		compatible = "dlg,da9210";
+		reg = <0x70>;
+		interrupt-parent = <&irqc0>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&pci0 {
+	status = "okay";
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+};
+
+&usbphy {
+	status = "okay";
+};
--- 0001/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ work/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c	2018-04-17 16:49:03.320607110 +0900
@@ -1,9 +1,9 @@
 /*
  * R-Car Generation 2 da9063/da9210 regulator quirk
  *
- * The r8a7790/lager and r8a7791/koelsch development boards have da9063 and
- * da9210 regulators.  Both regulators have their interrupt request lines tied
- * to the same interrupt pin (IRQ2) on the SoC.
+ * Certain Gen2 development boards have an da9063 and one or more da9210
+ * regulators. All of these regulators have their interrupt request lines
+ * tied to the same interrupt pin (IRQ2) on the SoC.
  *
  * After cold boot or da9063-induced restart, both the da9063 and da9210 seem
  * to assert their interrupt request lines.  Hence as soon as one driver
@@ -50,7 +50,7 @@ static void __iomem *irqc;
 static u8 da9063_irq_clr[] = { DA9063_REG_IRQ_MASK_A, 0xff, 0xff, 0xff, 0xff };
 static u8 da9210_irq_clr[] = { DA9210_REG_MASK_A, 0xff, 0xff };
 
-static struct i2c_msg da9xxx_msgs[2] = {
+static struct i2c_msg da9xxx_msgs[3] = {
 	{
 		.addr = 0x58,
 		.len = ARRAY_SIZE(da9063_irq_clr),
@@ -59,6 +59,10 @@ static struct i2c_msg da9xxx_msgs[2] = {
 		.addr = 0x68,
 		.len = ARRAY_SIZE(da9210_irq_clr),
 		.buf = da9210_irq_clr,
+	}, {
+		.addr = 0x70,
+		.len = ARRAY_SIZE(da9210_irq_clr),
+		.buf = da9210_irq_clr,
 	},
 };
 
@@ -85,11 +89,15 @@ static int regulator_quirk_notify(struct
 	dev_dbg(dev, "Detected %s\n", client->name);
 
 	if ((client->addr == 0x58 && !strcmp(client->name, "da9063")) ||
-	    (client->addr == 0x68 && !strcmp(client->name, "da9210"))) {
-		int ret;
+	    (client->addr == 0x68 && !strcmp(client->name, "da9210")) ||
+	    (client->addr == 0x70 && !strcmp(client->name, "da9210"))) {
+		int ret, len;
+
+		/* There are two DA9210 on Stout, one on the other boards. */
+		len = of_machine_is_compatible("renesas,stout") ? 3 : 2;
 
 		dev_info(&client->dev, "clearing da9063/da9210 interrupts\n");
-		ret = i2c_transfer(client->adapter, da9xxx_msgs, ARRAY_SIZE(da9xxx_msgs));
+		ret = i2c_transfer(client->adapter, da9xxx_msgs, len);
 		if (ret != ARRAY_SIZE(da9xxx_msgs))
 			dev_err(&client->dev, "i2c error %d\n", ret);
 	}
@@ -118,6 +126,7 @@ static int __init rcar_gen2_regulator_qu
 
 	if (!of_machine_is_compatible("renesas,koelsch") &&
 	    !of_machine_is_compatible("renesas,lager") &&
+	    !of_machine_is_compatible("renesas,stout") &&
 	    !of_machine_is_compatible("renesas,gose"))
 		return -ENODEV;
 
