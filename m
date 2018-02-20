Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38070 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750998AbeBTXKT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 18:10:19 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 10/16] ARM: dts: r8a7790: Convert to new LVDS DT bindings
Date: Wed, 21 Feb 2018 01:10:40 +0200
Message-Id: <20180220231046.32638-11-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180220231046.32638-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180220231046.32638-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The internal LVDS encoder now has DT bindings separate from the DU. Port
the device tree over to the new model.

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
 arch/arm/boot/dts/r8a7790.dtsi      | 64 +++++++++++++++++++++++++++++++++----
 2 files changed, 74 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 169da676c4ba..b51ee84309bf 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -316,10 +316,8 @@
 	status = "okay";
 
 	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 722>,
-		 <&cpg CPG_MOD 726>, <&cpg CPG_MOD 725>,
 		 <&x13_clk>, <&x2_clk>;
-	clock-names = "du.0", "du.1", "du.2", "lvds.0", "lvds.1",
-		      "dclkin.0", "dclkin.1";
+	clock-names = "du.0", "du.1", "du.2", "dclkin.0", "dclkin.1";
 
 	ports {
 		port@0 {
@@ -327,12 +325,26 @@
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
@@ -688,7 +700,7 @@
 			port@0 {
 				reg = <0>;
 				adv7511_in: endpoint {
-					remote-endpoint = <&du_out_lvds0>;
+					remote-endpoint = <&lvds0_out>;
 				};
 			};
 
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index ed9a68538a55..e688dd831e4e 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1068,17 +1068,13 @@
 
 	du: display@feb00000 {
 		compatible = "renesas,du-r8a7790";
-		reg = <0 0xfeb00000 0 0x70000>,
-		      <0 0xfeb90000 0 0x1c>,
-		      <0 0xfeb94000 0 0x1c>;
-		reg-names = "du", "lvds.0", "lvds.1";
+		reg = <0 0xfeb00000 0 0x70000>;
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
@@ -1093,11 +1089,65 @@
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
+		compatible = "renesas,r8a7790-lvds";
+		reg = <0 0xfeb90000 0 0x1c>;
+		clocks = <&cpg CPG_MOD 726>;
+		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+		resets = <&cpg 726>;
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
+		compatible = "renesas,r8a7790-lvds";
+		reg = <0 0xfeb94000 0 0x1c>;
+		clocks = <&cpg CPG_MOD 725>;
+		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+		resets = <&cpg 725>;
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
