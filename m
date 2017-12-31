Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:34574 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750945AbdLaLXb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Dec 2017 06:23:31 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 2/9] ARM: dts: lager: use demuxer for IIC3/I2C3
Date: Sun, 31 Dec 2017 12:23:13 +0100
Message-Id: <20171231112320.3461-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20171231112320.3461-1-wsa+renesas@sang-engineering.com>
References: <20171231112320.3461-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Create a separate bus for da9063 PMIC and da9210 regulator
related I2C slaves.

Based on similar work for HDMI by Wolfram Sang.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[wsa: rebased, corrected chip name in commit msg, updated aliases]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 84 +++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index e4050dae7e8e33..6f6e41c9fc4f6c 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -55,6 +55,7 @@
 		i2c10 = &i2cexio0;
 		i2c11 = &i2cexio1;
 		i2c12 = &i2chdmi;
+		i2c13 = &i2cpwr;
 	};
 
 	chosen {
@@ -410,6 +411,46 @@
 			};
 		};
 	};
+
+	/*
+	 * IIC3 and I2C3 may be switched using pinmux.
+	 * IIC3/I2C3 does not appear to support fallback to GPIO.
+	 */
+	i2cpwr: i2c-13 {
+		compatible = "i2c-demux-pinctrl";
+		i2c-parent = <&iic3>, <&i2c3>;
+		i2c-bus-name = "i2c-pwr";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmic@58 {
+			compatible = "dlg,da9063";
+			reg = <0x58>;
+			interrupt-parent = <&irqc0>;
+			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-controller;
+
+			rtc {
+				compatible = "dlg,da9063-rtc";
+			};
+
+			wdt {
+				compatible = "dlg,da9063-watchdog";
+			};
+		};
+
+		vdd_dvfs: regulator@68 {
+			compatible = "dlg,da9210";
+			reg = <0x68>;
+			interrupt-parent = <&irqc0>;
+			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+	};
 };
 
 &du {
@@ -549,6 +590,11 @@
 		function = "iic2";
 	};
 
+	i2c3_pins: i2c3 {
+		groups = "i2c3";
+		function = "i2c3";
+	};
+
 	iic3_pins: iic3 {
 		groups = "iic3";
 		function = "iic3";
@@ -764,38 +810,14 @@
 	clock-frequency = <100000>;
 };
 
-&iic3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&iic3_pins>;
-	status = "okay";
-
-	pmic@58 {
-		compatible = "dlg,da9063";
-		reg = <0x58>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-controller;
-
-		rtc {
-			compatible = "dlg,da9063-rtc";
-		};
-
-		wdt {
-			compatible = "dlg,da9063-watchdog";
-		};
-	};
-
-	vdd_dvfs: regulator@68 {
-		compatible = "dlg,da9210";
-		reg = <0x68>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+&i2c3	{
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "i2c-pwr";
+};
 
-		regulator-min-microvolt = <1000000>;
-		regulator-max-microvolt = <1000000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
+&iic3	{
+	pinctrl-0 = <&iic3_pins>;
+	pinctrl-names = "i2c-pwr";
 };
 
 &pci0 {
-- 
2.11.0
