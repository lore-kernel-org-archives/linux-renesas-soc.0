Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60721 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752321AbcFHHOm (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 03:14:42 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 4/4] ARM: dts: r8a7790: lager: use demuxer for IIC3/I2C3
Date: Wed,  8 Jun 2016 16:14:26 +0900
Message-Id: <1465370066-8450-5-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1465370066-8450-1-git-send-email-horms+renesas@verge.net.au>
References: <1465370066-8450-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Create a separate bus for dla98063 PMIC and da9210 regulator
related I2C slaves.

Based on similar work for HDMI by Wolfram Sang.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 80 +++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 80b0eaa93607..b75501e4c56d 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -54,6 +54,7 @@
 		i2c9 = "i2cexio1";
 		i2c10 = "i2chdmi";
 		i2c11 = "gpioi2c";
+		i2c12 = "i2cpwr";
 	};
 
 	chosen {
@@ -355,6 +356,42 @@
 			>;
 		i2c-gpio,delay-us = <5>;
 	};
+
+	i2cpwr: i2c-12 {
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
@@ -497,6 +534,11 @@
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
@@ -707,38 +749,14 @@
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
