Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34748 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726835AbeIMOTA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 10:19:00 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 20/58] arm64: dts: renesas: condor/v3hsk: add DU/LVDS/HDMI support
Date: Thu, 13 Sep 2018 11:09:15 +0200
Message-Id: <70fd8b6a4846362991ead7b68f951d519a9c71df.1536828567.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1536828567.git.horms+renesas@verge.net.au>
References: <cover.1536828567.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Define the Condor/V3HSK board dependent parts of the DU and  LVDS device
nodes. Also add the device nodes for Thine THC63LVD1024 LVDS decoder and
Analog Devices ADV7511W HDMI transmitter...

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts | 106 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  | 129 ++++++++++++++++++++++++
 2 files changed, 235 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
index 494f4ef37a4e..59db4c152fb8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -45,6 +45,56 @@
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	d1_8v: regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "D1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&adv7511_out>;
+			};
+		};
+	};
+
+	lvds-decoder {
+		compatible = "thine,thc63lvd1024";
+		vcc-supply = <&d3_3v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				thc63lvd1024_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				thc63lvd1024_out: endpoint {
+					remote-endpoint = <&adv7511_in>;
+				};
+			};
+		};
+	};
+
+	x1_clk: x1-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <148500000>;
+	};
 };
 
 &avb {
@@ -74,6 +124,13 @@
 	};
 };
 
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&x1_clk>;
+	clock-names = "du.0", "dclkin.0";
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -102,6 +159,55 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
+
+	hdmi@39 {
+		compatible = "adi,adv7511w";
+		reg = <0x39>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		avdd-supply = <&d1_8v>;
+		dvdd-supply = <&d1_8v>;
+		pvdd-supply = <&d1_8v>;
+		bgvdd-supply = <&d1_8v>;
+		dvdd-3v-supply = <&d3_3v>;
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
+					remote-endpoint = <&thc63lvd1024_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7511_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&lvds0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds0_out: endpoint {
+				remote-endpoint = <&thc63lvd1024_in>;
+			};
+		};
+	};
 };
 
 &mmc0 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index 9147d8564557..44ab7344f8aa 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -27,6 +27,72 @@
 		/* first 128MB is reserved for secure area. */
 		reg = <0 0x48000000 0 0x78000000>;
 	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&adv7511_out>;
+			};
+		};
+	};
+
+	lvds-decoder {
+		compatible = "thine,thc63lvd1024";
+		vcc-supply = <&vcc3v3_d5>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				thc63lvd1024_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				thc63lvd1024_out: endpoint {
+					remote-endpoint = <&adv7511_in>;
+				};
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
+	vcc1v8_d4: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC1V8_D4";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc3v3_d5: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC3V3_D5";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&osc1_clk>;
+	clock-names = "du.0", "dclkin.0";
+	status = "okay";
 };
 
 &extal_clk {
@@ -53,6 +119,64 @@
 	};
 };
 
+&lvds0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds0_out: endpoint {
+				remote-endpoint = <&thc63lvd1024_in>;
+			};
+		};
+	};
+};
+
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	hdmi@39 {
+		compatible = "adi,adv7511w";
+		#sound-dai-cells = <0>;
+		reg = <0x39>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		avdd-supply = <&vcc1v8_d4>;
+		dvdd-supply = <&vcc1v8_d4>;
+		pvdd-supply = <&vcc1v8_d4>;
+		bgvdd-supply = <&vcc1v8_d4>;
+		dvdd-3v-supply = <&vcc3v3_d5>;
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
+					remote-endpoint = <&thc63lvd1024_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7511_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
 &pfc {
 	gether_pins: gether {
 		groups = "gether_mdio_a", "gether_rgmii",
@@ -60,6 +184,11 @@
 		function = "gether";
 	};
 
+	i2c0_pins: i2c0 {
+		groups = "i2c0";
+		function = "i2c0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
-- 
2.11.0
