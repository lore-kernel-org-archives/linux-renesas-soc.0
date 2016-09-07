Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57254 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933438AbcIGHuc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 03:50:32 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 08/26] ARM: dts: blanche: add DU support
Date: Wed,  7 Sep 2016 09:49:55 +0200
Message-Id: <a66f74f464fb1e501d1b448c99e8f9ae4e64da2b.1473234371.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1473234371.git.horms+renesas@verge.net.au>
References: <cover.1473234371.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Define  the  Blanche board dependent part of the DU device node.
Add the device nodes for the  Analog Devices ADV7511W  HDMI transmitter
(connected to DU0) and ADV7123 video DAC (connected to DU1).  Add the
necessary subnodes to interconnect DU, HDMI/VDAC devices, and HDMI/VGA
connectors.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792-blanche.dts | 125 ++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7792-blanche.dts b/arch/arm/boot/dts/r8a7792-blanche.dts
index 436d44ea3c12..3c6f42b9fe9f 100644
--- a/arch/arm/boot/dts/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -57,6 +57,61 @@
 		pinctrl-names = "default";
 	};
 
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
+	x1_clk: x1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <74250000>;
+	};
+
+	x2_clk: x2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <65000000>;
+	};
+
 	keyboard {
 		compatible = "gpio-keys";
 
@@ -155,6 +210,16 @@
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
 	};
+
+	du0_pins: du0 {
+		groups = "du0_rgb888", "du0_sync", "du0_disp";
+		function = "du0";
+	};
+
+	du1_pins: du1 {
+		groups = "du1_rgb666", "du1_sync", "du1_disp";
+		function = "du1";
+	};
 };
 
 &scif0 {
@@ -186,3 +251,63 @@
 	cd-gpios = <&gpio11 11 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
+
+&i2c1 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	hdmi@39 {
+		compatible = "adi,adv7511w";
+		reg = <0x39>;
+		interrupt-parent = <&irqc>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
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
+};
+
+&du {
+	pinctrl-0 = <&du0_pins &du1_pins>;
+	pinctrl-names = "default";
+
+	clocks = <&mstp7_clks R8A7792_CLK_DU0>, <&mstp7_clks R8A7792_CLK_DU1>,
+		 <&x1_clk>, <&x2_clk>;
+	clock-names = "du.0", "du.1", "dclkin.0", "dclkin.1";
+	status = "okay";
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
