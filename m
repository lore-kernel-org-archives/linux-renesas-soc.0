Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:41166 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754688AbeDTMGX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 08:06:23 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>
Subject: [PATCH v6 2/3] ARM: dts: r8a7791: Convert to new LVDS DT bindings
Date: Fri, 20 Apr 2018 14:57:53 +0300
Message-Id: <20180420115754.4136-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180420115754.4136-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180420115754.4136-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The internal LVDS encoder now has DT bindings separate from the DU. Port
the device tree over to the new model.

Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
Fixes: bb21803ea440 ("ARM: dts: r8a7791: add soc node")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Changes since v5:

- Removed LVDS clock from DU node in Koelsch DT

Changes since v3:

- Added power-domains and resets properties to LVDS nodes

Changes since v2:

- Fixed LVDS compatible string

Changes since v1:

- Remove the DU reg-names property
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 12 +++++++++---
 arch/arm/boot/dts/r8a7791-porter.dts  | 16 +++++++++++++---
 arch/arm/boot/dts/r8a7791.dtsi        | 36 +++++++++++++++++++++++++++++------
 3 files changed, 52 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index f40321a1c917..9d7213a0b8b8 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -468,10 +468,9 @@
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
@@ -479,6 +478,13 @@
 				remote-endpoint = <&adv7511_in>;
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
 			lvds_connector: endpoint {
 			};
diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index c14e6fe9e4f6..ae9ed9ff53ef 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -441,10 +441,9 @@
 	pinctrl-names = "default";
 	status = "okay";
 
-	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 726>,
+	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
 		 <&x3_clk>, <&x16_clk>;
-	clock-names = "du.0", "du.1", "lvds.0",
-		      "dclkin.0", "dclkin.1";
+	clock-names = "du.0", "du.1", "dclkin.0", "dclkin.1";
 
 	ports {
 		port@0 {
@@ -455,6 +454,17 @@
 	};
 };
 
+&lvds0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds_connector: endpoint {
+			};
+		};
+	};
+};
+
 &rcar_sound {
 	pinctrl-0 = <&ssi_pins &audio_clk_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index f11dab71b03a..506b20885413 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1633,15 +1633,12 @@
 
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7791";
-			reg = <0 0xfeb00000 0 0x40000>,
-			      <0 0xfeb90000 0 0x1c>;
-			reg-names = "du", "lvds.0";
+			reg = <0 0xfeb00000 0 0x40000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 724>,
-				 <&cpg CPG_MOD 723>,
-				 <&cpg CPG_MOD 726>;
-			clock-names = "du.0", "du.1", "lvds.0";
+				 <&cpg CPG_MOD 723>;
+			clock-names = "du.0", "du.1";
 			status = "disabled";
 
 			ports {
@@ -1656,6 +1653,33 @@
 				port@1 {
 					reg = <1>;
 					du_out_lvds0: endpoint {
+						remote-endpoint = <&lvds0_in>;
+					};
+				};
+			};
+		};
+
+		lvds0: lvds@feb90000 {
+			compatible = "renesas,r8a7791-lvds";
+			reg = <0 0xfeb90000 0 0x1c>;
+			clocks = <&cpg CPG_MOD 726>;
+			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
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
 					};
 				};
 			};
-- 
Regards,

Laurent Pinchart
