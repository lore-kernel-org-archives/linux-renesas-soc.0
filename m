Return-Path: <devicetree-owner@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] ARM: dts: wheat: add DU support
Date: Fri, 23 Sep 2016 00:06:43 +0300
Message-ID: <3066182.ZErLCrPBIM@wasted.cogentembedded.com>
In-Reply-To: <34968644.DhifNderY8@wasted.cogentembedded.com>
References: <34968644.DhifNderY8@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define  the  Wheat board dependent  part of the DU device node.
Add the device nodes for the Analog Devices ADV7513 HDMI transmitters
connected to DU0/1.  Add the necessary subnodes to interconnect DU with
HDMI transmitters/connectors.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'renesas-devel-20160919-v4.8-rc7' of Simon Horman's
'renesas.git' repo...
The patch depends on the 2 DRM patches (already merged by the maintainers) in
order to work correctly.

Changes in version 2:
- refreshed the patch.

 arch/arm/boot/dts/r8a7792-wheat.dts |  126 ++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792-wheat.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792-wheat.dts
+++ renesas/arch/arm/boot/dts/r8a7792-wheat.dts
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
@@ -196,4 +234,92 @@
 			};
 		};
 	};
+};
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
 };

