Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:34598 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750960AbdLaLXd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Dec 2017 06:23:33 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 8/9] ARM: dts: gose: use demuxer for I2C2
Date: Sun, 31 Dec 2017 12:23:19 +0100
Message-Id: <20171231112320.3461-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20171231112320.3461-1-wsa+renesas@sang-engineering.com>
References: <20171231112320.3461-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Create a separate bus for HDMI related I2C2 and provide fallback to GPIO.

Based on work for the r8a7790/lager by Wolfram Sang.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[wsa: rebased, corrected board name in subject, fixed aliases, switched
to named GPIOs]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/r8a7793-gose.dts | 218 ++++++++++++++++++++-----------------
 1 file changed, 121 insertions(+), 97 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 51b3ffac8efaad..2b330ef71f4c17 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -48,6 +48,8 @@
 	aliases {
 		serial0 = &scif0;
 		serial1 = &scif1;
+		i2c9 = &gpioi2c2;
+		i2c11 = &i2chdmi;
 	};
 
 	chosen {
@@ -296,6 +298,124 @@
 		#clock-cells = <0>;
 		clock-frequency = <148500000>;
 	};
+
+	gpioi2c2: i2c-9 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "i2c-gpio";
+		status = "disabled";
+		scl-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <5>;
+	};
+
+	/*
+	 * A fallback to GPIO is provided for I2C2.
+	 */
+	i2chdmi: i2c-11 {
+		compatible = "i2c-demux-pinctrl";
+		i2c-parent = <&i2c2>, <&gpioi2c2>;
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
+			compatible = "adi,adv7180cp";
+			reg = <0x20>;
+			remote = <&vin1>;
+
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					adv7180_in: endpoint {
+						remote-endpoint = <&composite_con_in>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					adv7180_out: endpoint {
+						bus-width = <8>;
+						remote-endpoint = <&vin1ep>;
+					};
+				};
+			};
+		};
+
+		hdmi@39 {
+			compatible = "adi,adv7511w";
+			reg = <0x39>;
+			interrupt-parent = <&gpio3>;
+			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
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
+						remote-endpoint = <&du_out_rgb>;
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
+			interrupt-parent = <&gpio4>;
+			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+			default-input = <0>;
+
+			port {
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
+
+		eeprom@50 {
+			compatible = "renesas,r1ex24002", "atmel,24c02";
+			reg = <0x50>;
+			pagesize = <16>;
+		};
+	};
 };
 
 &du {
@@ -544,107 +664,11 @@
 
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
-	pinctrl-names = "default";
+	pinctrl-names = "i2c-hdmi";
 
 	status = "okay";
 	clock-frequency = <100000>;
 
-	ak4643: codec@12 {
-		compatible = "asahi-kasei,ak4643";
-		#sound-dai-cells = <0>;
-		reg = <0x12>;
-	};
-
-	composite-in@20 {
-		compatible = "adi,adv7180cp";
-		reg = <0x20>;
-		remote = <&vin1>;
-
-		port {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				adv7180_in: endpoint {
-					remote-endpoint = <&composite_con_in>;
-				};
-			};
-
-			port@3 {
-				reg = <3>;
-				adv7180_out: endpoint {
-					bus-width = <8>;
-					remote-endpoint = <&vin1ep>;
-				};
-			};
-		};
-	};
-
-	hdmi@39 {
-		compatible = "adi,adv7511w";
-		reg = <0x39>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
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
-					remote-endpoint = <&du_out_rgb>;
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
-		interrupt-parent = <&gpio4>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
-		default-input = <0>;
-
-		port {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				adv7612_in: endpoint {
-					remote-endpoint = <&hdmi_con_in>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-				adv7612_out: endpoint {
-					remote-endpoint = <&vin0ep2>;
-				};
-			};
-		};
-	};
-
-	eeprom@50 {
-		compatible = "renesas,r1ex24002", "atmel,24c02";
-		reg = <0x50>;
-		pagesize = <16>;
-	};
 };
 
 &i2c6 {
-- 
2.11.0
