Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41481 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760512AbcKDJop (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 05:44:45 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 10/29] ARM: dts: wheat: add DU support
Date: Fri,  4 Nov 2016 10:44:09 +0100
Message-Id: <f6eea82a87db2753e2f7c0454f078fb630eb72cd.1478252309.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1478252308.git.horms+renesas@verge.net.au>
References: <cover.1478252308.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Define  the  Wheat board dependent  part of the DU device node.
Add the device nodes for the Analog Devices ADV7513 HDMI transmitters
connected to DU0/1.  Add the necessary subnodes to interconnect DU with
HDMI transmitters/connectors.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792-wheat.dts | 126 ++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7792-wheat.dts b/arch/arm/boot/dts/r8a7792-wheat.dts
index 6dbb94114a93..c24f26fdab1f 100644
--- a/arch/arm/boot/dts/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/r8a7792-wheat.dts
@@ -86,6 +86,34 @@
 		gpio = <&gpio11 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	hdmi-out0 {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con0: endpoint {
+				remote-endpoint = <&adv7513_0_out>;
+			};
+		};
+	};
+
+	hdmi-out1 {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con1: endpoint {
+				remote-endpoint = <&adv7513_1_out>;
+			};
+		};
+	};
+
+	osc2_clk: osc2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <74250000>;
+	};
 };
 
 &extal_clk {
@@ -128,6 +156,16 @@
 		groups = "qspi_ctrl", "qspi_data4";
 		function = "qspi";
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
@@ -197,3 +235,91 @@
 		};
 	};
 };
+
+&i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	hdmi@3d {
+		compatible = "adi,adv7513";
+		reg = <0x3d>;
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
+				adv7513_0_in: endpoint {
+					remote-endpoint = <&du_out_rgb0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7513_0_out: endpoint {
+					remote-endpoint = <&hdmi_con0>;
+				};
+			};
+		};
+	};
+
+	hdmi@39 {
+		compatible = "adi,adv7513";
+		reg = <0x39>;
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
+				adv7513_1_in: endpoint {
+					remote-endpoint = <&du_out_rgb1>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7513_1_out: endpoint {
+					remote-endpoint = <&hdmi_con1>;
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
+		 <&osc2_clk>;
+	clock-names = "du.0", "du.1", "dclkin.0";
+	status = "okay";
+
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <&adv7513_0_in>;
+			};
+		};
+		port@1 {
+			endpoint {
+				remote-endpoint = <&adv7513_1_in>;
+			};
+		};
+	};
+};
-- 
2.7.0.rc3.207.g0ac5344
