Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60444 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933267AbeALA7L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 19:59:11 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 06/10] ARM: dts: r8a7790: Convert to new LVDS DT bindings
Date: Fri, 12 Jan 2018 02:58:54 +0200
Message-Id: <20180112005858.26472-7-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The internal LVDS encoder now has DT bindings separate from the DU. Port
the device tree over to the new model.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 22 ++++++++++---
 arch/arm/boot/dts/r8a7790.dtsi      | 61 ++++++++++++++++++++++++++++++++-----
 2 files changed, 71 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 7d5cd01069a3..f84963cb6785 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -317,10 +317,8 @@
 	status = "okay";
 
 	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 722>,
-		 <&cpg CPG_MOD 726>, <&cpg CPG_MOD 725>,
 		 <&x13_clk>, <&x2_clk>;
-	clock-names = "du.0", "du.1", "du.2", "lvds.0", "lvds.1",
-		      "dclkin.0", "dclkin.1";
+	clock-names = "du.0", "du.1", "du.2", "dclkin.0", "dclkin.1";
 
 	ports {
 		port@0 {
@@ -328,12 +326,26 @@
 				remote-endpoint = <&adv7123_in>;
 			};
 		};
+	};
+};
+
+&lvds0 {
+	status = "okay";
+
+	ports {
 		port@1 {
 			endpoint {
 				remote-endpoint = <&adv7511_in>;
 			};
 		};
-		port@2 {
+	};
+};
+
+&lvds1 {
+	status = "okay";
+
+	ports {
+		port@1 {
 			lvds_connector: endpoint {
 			};
 		};
@@ -689,7 +701,7 @@
 			port@0 {
 				reg = <0>;
 				adv7511_in: endpoint {
-					remote-endpoint = <&du_out_lvds0>;
+					remote-endpoint = <&lvds0_out>;
 				};
 			};
 
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 62baabd757b6..ccb3e4fb36ed 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1067,17 +1067,14 @@
 
 	du: display@feb00000 {
 		compatible = "renesas,du-r8a7790";
-		reg = <0 0xfeb00000 0 0x70000>,
-		      <0 0xfeb90000 0 0x1c>,
-		      <0 0xfeb94000 0 0x1c>;
-		reg-names = "du", "lvds.0", "lvds.1";
+		reg = <0 0xfeb00000 0 0x70000>;
+		reg-names = "du";
 		interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
-			 <&cpg CPG_MOD 722>, <&cpg CPG_MOD 726>,
-			 <&cpg CPG_MOD 725>;
-		clock-names = "du.0", "du.1", "du.2", "lvds.0", "lvds.1";
+			 <&cpg CPG_MOD 722>;
+		clock-names = "du.0", "du.1", "du.2";
 		status = "disabled";
 
 		ports {
@@ -1092,11 +1089,61 @@
 			port@1 {
 				reg = <1>;
 				du_out_lvds0: endpoint {
+					remote-endpoint = <&lvds0_in>;
 				};
 			};
 			port@2 {
 				reg = <2>;
 				du_out_lvds1: endpoint {
+					remote-endpoint = <&lvds1_in>;
+				};
+			};
+		};
+	};
+
+	lvds0: lvds@feb90000 {
+		compatible = "renesas,lvds-r8a7790";
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
+				};
+			};
+		};
+	};
+
+	lvds1: lvds@feb94000 {
+		compatible = "renesas,lvds-r8a7790";
+		reg = <0 0xfeb94000 0 0x1c>;
+		clocks = <&cpg CPG_MOD 725>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lvds1_in: endpoint {
+					remote-endpoint = <&du_out_lvds1>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				lvds1_out: endpoint {
 				};
 			};
 		};
-- 
Regards,

Laurent Pinchart
