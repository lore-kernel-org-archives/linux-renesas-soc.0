Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:60972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727323AbeIDQfg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Sep 2018 12:35:36 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 16/16] arm64: dts: renesas: r8a77995: draak: Enable HDMI display output
Date: Tue,  4 Sep 2018 15:10:27 +0300
Message-Id: <20180904121027.24031-17-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Ulrich Hecht <uli+renesas@fpond.eu>

Adds LVDS decoder, HDMI encoder and connector for the Draak board.

The LVDS0 and LVDS1 encoders can use the DU_DOTCLKIN0, DU_DOTCLKIN1 and
EXTAL externals clocks. Two of them are provided to the SoC on the Draak
board, hook them up in DT.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 98 +++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index a8e8f2669d4c..3055c39bbe07 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -2,7 +2,7 @@
 /*
  * Device Tree Source for the Draak board
  *
- * Copyright (C) 2016 Renesas Electronics Corp.
+ * Copyright (C) 2016-2018 Renesas Electronics Corp.
  * Copyright (C) 2017 Glider bvba
  */
 
@@ -24,6 +24,41 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	lvds-decoder {
+		compatible = "thine,thc63lvd1024";
+		vcc-supply = <&reg_3p3v>;
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
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7511_out>;
+			};
+		};
+	};
+
 	vga {
 		compatible = "vga-connector";
 
@@ -218,6 +253,43 @@
 
 	};
 
+	hdmi-encoder@39 {
+		compatible = "adi,adv7511w";
+		reg = <0x39>, <0x3f>, <0x38>, <0x3c>;
+		reg-names = "main", "edid", "packet", "cec";
+		interrupt-parent = <&gpio1>;
+		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+
+		/* Depends on LVDS */
+		max-clock = <135000000>;
+		min-vrefresh = <50>;
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
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
+
 	hdmi-decoder@4c {
 		compatible = "adi,adv7612";
 		reg = <0x4c>;
@@ -281,6 +353,30 @@
 	};
 };
 
+&lvds0 {
+	status = "okay";
+
+	clocks = <&cpg CPG_MOD 727>,
+		 <&x12_clk>,
+		 <&extal_clk>;
+	clock-names = "fck", "dclkin.0", "extal";
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
+&lvds1 {
+	clocks = <&cpg CPG_MOD 727>,
+		 <&x12_clk>,
+		 <&extal_clk>;
+	clock-names = "fck", "dclkin.0", "extal";
+};
+
 &ehci0 {
 	status = "okay";
 };
-- 
Regards,

Laurent Pinchart
