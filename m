Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38076 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751791AbeBTXKU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 18:10:20 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 13/16] ARM: dts: r8a7793: Convert to new LVDS DT bindings
Date: Wed, 21 Feb 2018 01:10:43 +0200
Message-Id: <20180220231046.32638-14-laurent.pinchart+renesas@ideasonboard.com>
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
 arch/arm/boot/dts/r8a7793-gose.dts | 10 +++++++---
 arch/arm/boot/dts/r8a7793.dtsi     | 37 +++++++++++++++++++++++++++++++------
 2 files changed, 38 insertions(+), 9 deletions(-)

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
index 039b22517526..d3dc3e4a694b 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -976,15 +976,12 @@
 
 	du: display@feb00000 {
 		compatible = "renesas,du-r8a7793";
-		reg = <0 0xfeb00000 0 0x40000>,
-		      <0 0xfeb90000 0 0x1c>;
-		reg-names = "du", "lvds.0";
+		reg = <0 0xfeb00000 0 0x40000>;
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
@@ -999,6 +996,34 @@
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
+		compatible = "renesas,r8a7793-lvds";
+		reg = <0 0xfeb90000 0 0x1c>;
+		clocks = <&cpg CPG_MOD 726>;
+		power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
+		resets = <&cpg 726>;
+
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
