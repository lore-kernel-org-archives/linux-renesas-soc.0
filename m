Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60446 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933671AbeALA7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 19:59:13 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 09/10] arm64: dts: renesas: r8a7795: Convert to new LVDS DT bindings
Date: Fri, 12 Jan 2018 02:58:57 +0200
Message-Id: <20180112005858.26472-10-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The internal LVDS encoder now has DT bindings separate from the DU. Port
the device tree over to the new model.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../boot/dts/renesas/r8a7795-es1-salvator-x.dts    |  3 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     |  3 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  3 +-
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts |  3 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 35 ++++++++++++++++++----
 5 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
index 9ef9a4e5f376..0dda1c0ed1ce 100644
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
index 00ad1ab53a7d..e34b986185d4 100644
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
index 79e8b65622db..31f2abaa90aa 100644
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
index 15ef292a8d9f..d6c423988ab6 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2077,9 +2077,8 @@
 
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7795";
-			reg = <0 0xfeb00000 0 0x80000>,
-			      <0 0xfeb90000 0 0x14>;
-			reg-names = "du", "lvds.0";
+			reg = <0 0xfeb00000 0 0x80000>;
+			reg-names = "du";
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
@@ -2087,9 +2086,8 @@
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
 
@@ -2117,6 +2115,31 @@
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
+			compatible = "renesas,lvds-r8a7795";
+			reg = <0 0xfeb90000 0 0x14>;
+			clocks = <&cpg CPG_MOD 727>;
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
