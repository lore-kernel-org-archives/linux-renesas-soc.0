Return-Path: <horms@penelope.isobedori.kobe.vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 13/68] ARM: dts: silk: add DU DT support
Date: Fri, 12 Feb 2016 20:05:03 +0100
Message-Id: <84e734f497cd48f60c16c400d14b8da08cd281dc.1455303422.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1455303422.git.horms+renesas@verge.net.au>
References: <cover.1455303422.git.horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Define  the SILK board dependent part of the DU device node.
Add the device nodes for the Analog Devices ADV7511W HDMI transmitter
(connected to DU0) and ADV7123  video DAC (connected to DU1). Add the
necessary subnodes to interconnect DU, HDMI/VDAC devices, and HDMI/VGA
connectors.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7794-silk.dts | 109 +++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index 5153e3af25d9..98b8bcca84da 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -64,6 +64,61 @@
 		states = <3300000 1
 			  1800000 0>;
 	};
+
+	vga-encoder {
+		compatible = "adi,adv7123";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7123_in: endpoint {
+					remote-endpoint = <&du_out_rgb1>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				adv7123_out: endpoint {
+					remote-endpoint = <&vga_in>;
+				};
+			};
+		};
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
+	vga {
+		compatible = "vga-connector";
+
+		port {
+			vga_in: endpoint {
+				remote-endpoint = <&adv7123_out>;
+			};
+		};
+	};
+
+	x2_clk: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <148500000>;
+	};
+
+	x3_clk: x3-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <74250000>;
+	};
 };
 
 &extal_clk {
@@ -164,6 +219,38 @@
 			};
 		};
 	};
+
+	hdmi@39 {
+		compatible = "adi,adv7511w";
+		reg = <0x39>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
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
+					remote-endpoint = <&du_out_rgb0>;
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
 
 &mmcif0 {
@@ -258,3 +345,25 @@
 &usbphy {
 	status = "okay";
 };
+
+&du {
+	status = "okay";
+
+	clocks = <&mstp7_clks R8A7794_CLK_DU0>,
+		 <&mstp7_clks R8A7794_CLK_DU0>,
+		 <&x2_clk>, <&x3_clk>;
+	clock-names = "du.0", "du.1", "dclkin.0", "dclkin.1";
+
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <&adv7511_in>;
+			};
+		};
+		port@1 {
+			endpoint {
+				remote-endpoint = <&adv7123_in>;
+			};
+		};
+	};
+};
-- 
2.7.0.rc3.207.g0ac5344
