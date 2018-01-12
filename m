Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60444 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933709AbeALA7O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 19:59:14 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 10/10] arm64: dts: renesas: r8a7796: Convert to new LVDS DT bindings
Date: Fri, 12 Jan 2018 02:58:58 +0200
Message-Id: <20180112005858.26472-11-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The internal LVDS encoder now has DT bindings separate from the DU. Port
the device tree over to the new model.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts     |  3 +-
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  3 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 35 ++++++++++++++++++----
 3 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index daee1f1a3f68..21bd679062f3 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -33,10 +33,9 @@
 	clocks = <&cpg CPG_MOD 724>,
 		 <&cpg CPG_MOD 723>,
 		 <&cpg CPG_MOD 722>,
-		 <&cpg CPG_MOD 727>,
 		 <&versaclock5 1>,
 		 <&versaclock5 3>,
 		 <&versaclock5 2>;
-	clock-names = "du.0", "du.1", "du.2", "lvds.0",
+	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index 4088bea8d62c..ecbfbcb65df3 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -32,11 +32,10 @@
 	clocks = <&cpg CPG_MOD 724>,
 		 <&cpg CPG_MOD 723>,
 		 <&cpg CPG_MOD 722>,
-		 <&cpg CPG_MOD 727>,
 		 <&versaclock5 1>,
 		 <&x21_clk>,
 		 <&versaclock5 2>;
-	clock-names = "du.0", "du.1", "du.2", "lvds.0",
+	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index f2b2e40c655e..ed30660c367b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1826,17 +1826,15 @@
 
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7796";
-			reg = <0 0xfeb00000 0 0x70000>,
-			      <0 0xfeb90000 0 0x14>;
-			reg-names = "du", "lvds.0";
+			reg = <0 0xfeb00000 0 0x70000>;
+			reg-names = "du";
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 724>,
 				 <&cpg CPG_MOD 723>,
-				 <&cpg CPG_MOD 722>,
-				 <&cpg CPG_MOD 727>;
-			clock-names = "du.0", "du.1", "du.2", "lvds.0";
+				 <&cpg CPG_MOD 722>;
+			clock-names = "du.0", "du.1", "du.2";
 			status = "disabled";
 
 			vsps = <&vspd0 &vspd1 &vspd2>;
@@ -1859,6 +1857,31 @@
 				port@2 {
 					reg = <2>;
 					du_out_lvds0: endpoint {
+						remote-endpoint = <&lvds0_in>;
+					};
+				};
+			};
+		};
+
+		lvds0: lvds@feb90000 {
+			compatible = "renesas,lvds-r8a7796";
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
