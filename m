Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57589 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751002AbcFVD64 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 23:58:56 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3 04/13] ARM: dts: lager: use demuxer for IIC3/I2C3
Date: Wed, 22 Jun 2016 12:43:42 +0900
Message-Id: <1466567031-20381-5-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1466567031-20381-1-git-send-email-horms+renesas@verge.net.au>
References: <1466567031-20381-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Create a separate bus for dla98063 PMIC and da9210 regulator
related I2C slaves.

Based on similar work for HDMI by Wolfram Sang.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v3
* Add a small commend documenting that IIC3/I2C3 may be switched
  and that a GPIO fallback not provided.

v2
* No change
---
 arch/arm/boot/dts/r8a7790-lager.dts | 84 +++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 862d766b932b..626b55369871 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -55,6 +55,7 @@
 		i2c10 = "i2cexio0";
 		i2c11 = "i2cexio1";
 		i2c12 = "i2chdmi";
+		i2c13 = "i2cpwr";
 	};
 
 	chosen {
@@ -374,6 +375,46 @@
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
@@ -516,6 +557,11 @@
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
@@ -726,38 +772,14 @@
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
2.1.4
