Return-Path: <SRS0+ku8b=NS=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,geert+renesas@glider.be
Date: Mon, 18 Jan 2016 20:03:10 +0900
Message-Id: <20160118110310.31849.75139.sendpatchset@little-apple>
Subject: [PATCH] ARM: dts: r8a7793: gose: Add HDMI video out support
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

This patch adds r8a7793 GOSE HDMI video out support.

The r8a7793 GOSE board is similar to r8a7791 Koelsch. For those
boards an on-board HDMI encoder chip provides HDMI video out
and also a LVDS port is available for external LCD panels.

Tested on r8a7793 Gose with HDMI hooked up to a Toshiba TV.
# modetest -M rcar-du -s 33:1280x720@AR24

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2016-01-13-v4.4

 Thanks to Laurent for hooking up Gose I2C support.

 arch/arm/boot/dts/r8a7793-gose.dts |   93 ++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

--- 0001/arch/arm/boot/dts/r8a7793-gose.dts
+++ work/arch/arm/boot/dts/r8a7793-gose.dts	2016-01-18 19:23:36.490513000 +0900
@@ -129,6 +129,54 @@
 			label = "LED8";
 		};
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
+	x2_clk: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <74250000>;
+	};
+
+	x13_clk: x13-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <148500000>;
+	};
+};
+
+&du {
+	pinctrl-0 = <&du_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	clocks = <&mstp7_clks R8A7793_CLK_DU0>,
+		 <&mstp7_clks R8A7793_CLK_DU1>,
+		 <&mstp7_clks R8A7793_CLK_LVDS0>,
+		 <&x13_clk>, <&x2_clk>;
+	clock-names = "du.0", "du.1", "lvds.0",
+		      "dclkin.0", "dclkin.1";
+
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <&adv7511_in>;
+			};
+		};
+		port@1 {
+			lvds_connector: endpoint {
+			};
+		};
+	};
 };
 
 &extal_clk {
@@ -144,6 +192,11 @@
 		renesas,function = "i2c2";
 	};
 
+	du_pins: du {
+		renesas,groups = "du_rgb888", "du_sync", "du_disp", "du_clk_out_0";
+		renesas,function = "du";
+	};
+
 	scif0_pins: serial0 {
 		renesas,groups = "scif0_data_d";
 		renesas,function = "scif0";
@@ -251,6 +304,46 @@
 			};
 		};
 	};
+};
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <100000>;
+
+	hdmi@39 {
+		compatible = "adi,adv7511w";
+		reg = <0x39>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
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
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
 };
 
 &i2c2 {
