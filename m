Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39786 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752351AbeCPQj1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 12:39:27 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 33/47] ARM: dts: lager: use demuxer for IIC2/I2C2
Date: Fri, 16 Mar 2018 17:38:30 +0100
Message-Id: <4e65e1b6721aafca073a308ae7f32e1cdddfdcd8.1521218085.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521218085.git.horms+renesas@verge.net.au>
References: <cover.1521218085.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Create a separate bus for HDMI related I2C slaves.

Based on work by Wolfram Sang.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[wsa: rebased, removed typo in comment, fixed aliases, switched to
named GPIOS, sort SCL pins first]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 213 +++++++++++++++++++++---------------
 1 file changed, 124 insertions(+), 89 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 7892b113ecaa..9f511d4fac10 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -51,8 +51,10 @@
 		serial0 = &scif0;
 		serial1 = &scifa1;
 		i2c8 = &gpioi2c1;
+		i2c9 = &gpioi2c2;
 		i2c10 = &i2cexio0;
 		i2c11 = &i2cexio1;
+		i2c12 = &i2chdmi;
 	};
 
 	chosen {
@@ -272,8 +274,18 @@
 		#size-cells = <0>;
 		compatible = "i2c-gpio";
 		status = "disabled";
-		sda-gpios = <&gpio1 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio1 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&gpio1 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <5>;
+	};
+
+	gpioi2c2: i2c-9 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "i2c-gpio";
+		status = "disabled";
+		scl-gpios = <&gpio5 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&gpio5 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <5>;
 	};
 
@@ -308,6 +320,104 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
+
+        /*
+         * IIC2 and I2C2 may be switched using pinmux.
+         * A fallback to GPIO is also provided.
+         */
+	i2chdmi: i2c-12 {
+		compatible = "i2c-demux-pinctrl";
+		i2c-parent = <&iic2>, <&i2c2>, <&gpioi2c2>;
+		i2c-bus-name = "i2c-hdmi";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ak4643: codec@12 {
+			compatible = "asahi-kasei,ak4643";
+			#sound-dai-cells = <0>;
+			reg = <0x12>;
+		};
+
+		composite-in@20 {
+			compatible = "adi,adv7180";
+			reg = <0x20>;
+			remote = <&vin1>;
+
+			port {
+				adv7180: endpoint {
+					bus-width = <8>;
+					remote-endpoint = <&vin1ep0>;
+				};
+			};
+		};
+
+		cec_clock: cec-clock {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <12000000>;
+		};
+
+		hdmi@39 {
+			compatible = "adi,adv7511w";
+			reg = <0x39>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&cec_clock>;
+			clock-names = "cec";
+
+			adi,input-depth = <8>;
+			adi,input-colorspace = "rgb";
+			adi,input-clock = "1x";
+			adi,input-style = <1>;
+			adi,input-justification = "evenly";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					adv7511_in: endpoint {
+						remote-endpoint = <&du_out_lvds0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					adv7511_out: endpoint {
+						remote-endpoint = <&hdmi_con_out>;
+					};
+				};
+			};
+		};
+
+		hdmi-in@4c {
+			compatible = "adi,adv7612";
+			reg = <0x4c>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+			default-input = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					adv7612_in: endpoint {
+						remote-endpoint = <&hdmi_con_in>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					adv7612_out: endpoint {
+						remote-endpoint = <&vin0ep2>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &du {
@@ -437,6 +547,11 @@
 		function = "iic1";
 	};
 
+	i2c2_pins: i2c2 {
+		groups = "i2c2";
+		function = "i2c2";
+	};
+
 	iic2_pins: iic2 {
 		groups = "iic2";
 		function = "iic2";
@@ -643,98 +758,18 @@
 	pinctrl-names = "i2c-exio1";
 };
 
-&iic2	{
-	status = "okay";
-	pinctrl-0 = <&iic2_pins>;
-	pinctrl-names = "default";
+&i2c2	{
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "i2c-hdmi";
 
 	clock-frequency = <100000>;
+};
 
-	ak4643: codec@12 {
-		compatible = "asahi-kasei,ak4643";
-		#sound-dai-cells = <0>;
-		reg = <0x12>;
-	};
-
-	composite-in@20 {
-		compatible = "adi,adv7180";
-		reg = <0x20>;
-		remote = <&vin1>;
-
-		port {
-			adv7180: endpoint {
-				bus-width = <8>;
-				remote-endpoint = <&vin1ep0>;
-			};
-		};
-	};
-
-	cec_clock: cec-clock {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <12000000>;
-	};
-
-	hdmi@39 {
-		compatible = "adi,adv7511w";
-		reg = <0x39>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&cec_clock>;
-		clock-names = "cec";
-
-		adi,input-depth = <8>;
-		adi,input-colorspace = "rgb";
-		adi,input-clock = "1x";
-		adi,input-style = <1>;
-		adi,input-justification = "evenly";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				adv7511_in: endpoint {
-					remote-endpoint = <&du_out_lvds0>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				adv7511_out: endpoint {
-					remote-endpoint = <&hdmi_con_out>;
-				};
-			};
-		};
-	};
-
-	hdmi-in@4c {
-		compatible = "adi,adv7612";
-		reg = <0x4c>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
-		default-input = <0>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				adv7612_in: endpoint {
-					remote-endpoint = <&hdmi_con_in>;
-				};
-			};
+&iic2	{
+	pinctrl-0 = <&iic2_pins>;
+	pinctrl-names = "i2c-hdmi";
 
-			port@2 {
-				reg = <2>;
-				adv7612_out: endpoint {
-					remote-endpoint = <&vin0ep2>;
-				};
-			};
-		};
-	};
+	clock-frequency = <100000>;
 };
 
 &iic3 {
-- 
2.11.0
