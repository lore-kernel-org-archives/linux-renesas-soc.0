Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60444 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932169AbeALA7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 19:59:13 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 08/10] ARM: dts: r8a7793: Convert to new LVDS DT bindings
Date: Fri, 12 Jan 2018 02:58:56 +0200
Message-Id: <20180112005858.26472-9-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The internal LVDS encoder now has DT bindings separate from the DU. Port
the device tree over to the new model.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7793-gose.dts | 10 +++++++---
 arch/arm/boot/dts/r8a7793.dtsi     | 35 +++++++++++++++++++++++++++++------
 2 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 51b3ffac8efa..c6121f9b72a8 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -303,10 +303,9 @@
 	pinctrl-names = "default";
 	status = "okay";
 
-	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 726>,
+	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
 		 <&x13_clk>, <&x2_clk>;
-	clock-names = "du.0", "du.1", "lvds.0",
-		      "dclkin.0", "dclkin.1";
+	clock-names = "du.0", "du.1", "dclkin.0", "dclkin.1";
 
 	ports {
 		port@0 {
@@ -314,6 +313,11 @@
 				remote-endpoint = <&adv7511_in>;
 			};
 		};
+	};
+};
+
+&lvds0 {
+	ports {
 		port@1 {
 			lvds_connector: endpoint {
 			};
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 0cd1035de1a4..c044291bb2a2 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -976,15 +976,13 @@
 
 	du: display@feb00000 {
 		compatible = "renesas,du-r8a7793";
-		reg = <0 0xfeb00000 0 0x40000>,
-		      <0 0xfeb90000 0 0x1c>;
-		reg-names = "du", "lvds.0";
+		reg = <0 0xfeb00000 0 0x40000>;
+		reg-names = "du";
 		interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 724>,
-			 <&cpg CPG_MOD 723>,
-			 <&cpg CPG_MOD 726>;
-		clock-names = "du.0", "du.1", "lvds.0";
+			 <&cpg CPG_MOD 723>;
+		clock-names = "du.0", "du.1";
 		status = "disabled";
 
 		ports {
@@ -999,6 +997,31 @@
 			port@1 {
 				reg = <1>;
 				du_out_lvds0: endpoint {
+					remote-endpoint = <&lvds0_in>;
+				};
+			};
+		};
+	};
+
+	lvds0: lvds@feb90000 {
+		compatible = "renesas,lvds-r8a7793";
+		reg = <0 0xfeb90000 0 0x1c>;
+		clocks = <&cpg CPG_MOD 726>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lvds0_in: endpoint {
+					remote-endpoint = <&du_out_lvds0>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				lvds0_out: endpoint {
 				};
 			};
 		};
-- 
Regards,

Laurent Pinchart
