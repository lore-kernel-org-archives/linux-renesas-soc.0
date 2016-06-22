Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57320 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751671AbcFVDtu (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 23:49:50 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3 11/13] ARM: dts: alt: use demuxer for I2C1
Date: Wed, 22 Jun 2016 12:43:49 +0900
Message-Id: <1466567031-20381-12-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1466567031-20381-1-git-send-email-horms+renesas@verge.net.au>
References: <1466567031-20381-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Create a separate bus for HDMI related I2C1 and provide fallback to GPIO.

Based on work for the r8a7790/lager by Wolfram Sang.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v3
* New patch
---
 arch/arm/boot/dts/r8a7794-alt.dts | 54 ++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index 1ad37d431a2a..d00b1b33f6ed 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -10,6 +10,7 @@
 
 /dts-v1/;
 #include "r8a7794.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Alt";
@@ -17,6 +18,8 @@
 
 	aliases {
 		serial0 = &scif2;
+		i2c9 = "gpioi2c1";
+		i2c11 = "i2chdmi";
 	};
 
 	chosen {
@@ -77,6 +80,41 @@
 		#clock-cells = <0>;
 		clock-frequency = <148500000>;
 	};
+
+	gpioi2c1: i2c-9 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "i2c-gpio";
+		status = "disabled";
+		gpios = <&gpio4 1 GPIO_ACTIVE_HIGH /* sda */
+			 &gpio4 0 GPIO_ACTIVE_HIGH /* scl */
+			>;
+		i2c-gpio,delay-us = <5>;
+	};
+
+	/*
+	 * A fallback to GPIO is provided for I2C1.
+	 */
+	i2chdmi: i2c-11 {
+		compatible = "i2c-demux-pinctrl";
+		i2c-parent = <&i2c1>, <&gpioi2c1>;
+		i2c-bus-name = "i2c-hdmi";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		composite-in@20 {
+			compatible = "adi,adv7180";
+			reg = <0x20>;
+			remote = <&vin0>;
+
+			port {
+				adv7180: endpoint {
+					bus-width = <8>;
+					remote-endpoint = <&vin0ep>;
+				};
+			};
+		};
+	};
 };
 
 &du {
@@ -171,23 +209,9 @@
 
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins>;
-	pinctrl-names = "default";
+	pinctrl-names = "i2c-hdmi";
 
-	status = "okay";
 	clock-frequency = <400000>;
-
-	composite-in@20 {
-		compatible = "adi,adv7180";
-		reg = <0x20>;
-		remote = <&vin0>;
-
-		port {
-			adv7180: endpoint {
-				bus-width = <8>;
-				remote-endpoint = <&vin0ep>;
-			};
-		};
-	};
 };
 
 &vin0 {
-- 
2.1.4
