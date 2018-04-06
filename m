Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35734 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752105AbeDFTOm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Apr 2018 15:14:42 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>
Subject: [PATCH v5 1/3] ARM: dts: r8a7790: Convert to new LVDS DT bindings
Date: Fri,  6 Apr 2018 22:14:36 +0300
Message-Id: <20180406191438.3630-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180406191438.3630-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180406191438.3630-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The internal LVDS encoder now has DT bindings separate from the DU. Port
the device tree over to the new model.

Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
Fixes: 4bdb7aa7dcd0 ("ARM: dts: r8a7790: add soc node")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v3:

- Added power-domains and resets properties to LVDS nodes

Changes since v2:

- Fixed LVDS compatible string

Changes since v1:

- Remove the DU reg-names property
---
 arch/arm/boot/dts/r8a7790-lager.dts | 22 ++++++++++---
 arch/arm/boot/dts/r8a7790.dtsi      | 65 ++++++++++++++++++++++++++++++++-----
 2 files changed, 74 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 063fdb65dc60..f07f9018c3e7 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -379,7 +379,7 @@
 				port@0 {
 					reg = <0>;
 					adv7511_in: endpoint {
-						remote-endpoint = <&du_out_lvds0>;
+						remote-endpoint = <&lvds0_out>;
 					};
 				};
 
@@ -467,10 +467,8 @@
 	status = "okay";
 
 	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 722>,
-		 <&cpg CPG_MOD 726>, <&cpg CPG_MOD 725>,
 		 <&x13_clk>, <&x2_clk>;
-	clock-names = "du.0", "du.1", "du.2", "lvds.0", "lvds.1",
-		      "dclkin.0", "dclkin.1";
+	clock-names = "du.0", "du.1", "du.2", "dclkin.0", "dclkin.1";
 
 	ports {
 		port@0 {
@@ -478,12 +476,26 @@
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
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index e4367cecad18..05a0fc23ac88 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1627,18 +1627,13 @@
 
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7790";
-			reg = <0 0xfeb00000 0 0x70000>,
-			      <0 0xfeb90000 0 0x1c>,
-			      <0 0xfeb94000 0 0x1c>;
-			reg-names = "du", "lvds.0", "lvds.1";
+			reg = <0 0xfeb00000 0 0x70000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
-				 <&cpg CPG_MOD 722>, <&cpg CPG_MOD 726>,
-				 <&cpg CPG_MOD 725>;
-			clock-names = "du.0", "du.1", "du.2", "lvds.0",
-				      "lvds.1";
+				 <&cpg CPG_MOD 722>;
+			clock-names = "du.0", "du.1", "du.2";
 			status = "disabled";
 
 			ports {
@@ -1653,11 +1648,65 @@
 				port@1 {
 					reg = <1>;
 					du_out_lvds0: endpoint {
+						remote-endpoint = <&lvds0_in>;
 					};
 				};
 				port@2 {
 					reg = <2>;
 					du_out_lvds1: endpoint {
+						remote-endpoint = <&lvds1_in>;
+					};
+				};
+			};
+		};
+
+		lvds0: lvds@feb90000 {
+			compatible = "renesas,r8a7790-lvds";
+			reg = <0 0xfeb90000 0 0x1c>;
+			clocks = <&cpg CPG_MOD 726>;
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 726>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds0_in: endpoint {
+						remote-endpoint = <&du_out_lvds0>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					lvds0_out: endpoint {
+					};
+				};
+			};
+		};
+
+		lvds1: lvds@feb94000 {
+			compatible = "renesas,r8a7790-lvds";
+			reg = <0 0xfeb94000 0 0x1c>;
+			clocks = <&cpg CPG_MOD 725>;
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 725>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds1_in: endpoint {
+						remote-endpoint = <&du_out_lvds1>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					lvds1_out: endpoint {
 					};
 				};
 			};
-- 
Regards,

Laurent Pinchart
