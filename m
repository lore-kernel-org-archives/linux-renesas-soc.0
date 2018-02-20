Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38076 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751765AbeBTXKW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 18:10:22 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 15/16] arm64: dts: renesas: r8a7795: Convert to new LVDS DT bindings
Date: Wed, 21 Feb 2018 01:10:45 +0200
Message-Id: <20180220231046.32638-16-laurent.pinchart+renesas@ideasonboard.com>
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
 .../boot/dts/renesas/r8a7795-es1-salvator-x.dts    |  3 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     |  3 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  3 +-
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts |  3 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 36 ++++++++++++++++++----
 5 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
index 4af9504489ee..c0faef1be32d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
@@ -43,12 +43,11 @@
 		 <&cpg CPG_MOD 723>,
 		 <&cpg CPG_MOD 722>,
 		 <&cpg CPG_MOD 721>,
-		 <&cpg CPG_MOD 727>,
 		 <&versaclock5 1>,
 		 <&x21_clk>,
 		 <&x22_clk>,
 		 <&versaclock5 2>;
-	clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0",
+	clock-names = "du.0", "du.1", "du.2", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index 0afe777973de..f0d6528c05eb 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -44,11 +44,10 @@
 		 <&cpg CPG_MOD 723>,
 		 <&cpg CPG_MOD 722>,
 		 <&cpg CPG_MOD 721>,
-		 <&cpg CPG_MOD 727>,
 		 <&versaclock5 1>,
 		 <&versaclock5 3>,
 		 <&versaclock5 4>,
 		 <&versaclock5 2>;
-	clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0",
+	clock-names = "du.0", "du.1", "du.2", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index cd9587ef90f4..eb2a9f3e4f28 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -43,12 +43,11 @@
 		 <&cpg CPG_MOD 723>,
 		 <&cpg CPG_MOD 722>,
 		 <&cpg CPG_MOD 721>,
-		 <&cpg CPG_MOD 727>,
 		 <&versaclock5 1>,
 		 <&x21_clk>,
 		 <&x22_clk>,
 		 <&versaclock5 2>;
-	clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0",
+	clock-names = "du.0", "du.1", "du.2", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index 15617e30356a..db3afa438543 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -43,12 +43,11 @@
 		 <&cpg CPG_MOD 723>,
 		 <&cpg CPG_MOD 722>,
 		 <&cpg CPG_MOD 721>,
-		 <&cpg CPG_MOD 727>,
 		 <&versaclock6 1>,
 		 <&x21_clk>,
 		 <&x22_clk>,
 		 <&versaclock6 2>;
-	clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0",
+	clock-names = "du.0", "du.1", "du.2", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index d12df6f2ff09..86ac1e4d3b5e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2273,9 +2273,7 @@
 
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7795";
-			reg = <0 0xfeb00000 0 0x80000>,
-			      <0 0xfeb90000 0 0x14>;
-			reg-names = "du", "lvds.0";
+			reg = <0 0xfeb00000 0 0x80000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
@@ -2283,9 +2281,8 @@
 			clocks = <&cpg CPG_MOD 724>,
 				 <&cpg CPG_MOD 723>,
 				 <&cpg CPG_MOD 722>,
-				 <&cpg CPG_MOD 721>,
-				 <&cpg CPG_MOD 727>;
-			clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0";
+				 <&cpg CPG_MOD 721>;
+			clock-names = "du.0", "du.1", "du.2", "du.3";
 			vsps = <&vspd0 0 &vspd1 0 &vspd2 0 &vspd0 1>;
 			status = "disabled";
 
@@ -2313,6 +2310,33 @@
 				port@3 {
 					reg = <3>;
 					du_out_lvds0: endpoint {
+						remote-endpoint = <&lvds0_in>;
+					};
+				};
+			};
+		};
+
+		lvds0: lvds@feb90000 {
+			compatible = "renesas,r8a7795-lvds";
+			reg = <0 0xfeb90000 0 0x14>;
+			clocks = <&cpg CPG_MOD 727>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 727>;
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
