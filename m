Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33422 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756858AbdGLIng (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jul 2017 04:43:36 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Simon Horman <horms@verge.net.au>
Subject: [RESEND] [PATCH v2.1 1/2] dt-bindings: display: rcar-du: Add a VSP channel index to the vsps DT property
Date: Wed, 12 Jul 2017 11:43:36 +0300
Message-ID: <1596663.83UpNEdgHK@avalon>
In-Reply-To: <20170626162930.30240-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20170626162930.30240-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On some R-Car SoCs a single VSP can serve multiple DU channels through
multiple LIF instances in the VSP. The current DT bindings don't support
specifying that kind of SoC integration scheme. Extend them with a VSP
channel index.

Backward compatibility can be ensured in drivers by checking the length
of the vsps property and setting the channel to 0 when the property
doesn't contain channel indices.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/renesas,du.txt     | 51 +++++++++++++---------
 1 file changed, 30 insertions(+), 21 deletions(-)

Changes since v2:

- Used proper prefix for subject line
- Fixed type in vsps property description
- Increase visibility in the vsps example

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index c6cb96a4fa93..4bbd1e9bf3be 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -36,8 +36,10 @@ Required Properties:
       When supplied they must be named "dclkin.x" with "x" being the input
       clock numerical index.
 
-  - vsps: A list of phandles to the VSP nodes that handle the memory
-    interfaces for the DU channels.
+  - vsps: A list of phandle and channel index tuples to the VSPs that handle
+    the memory interfaces for the DU channels. The phandle identifies the VSP
+    instance that serves the DU channel, and the channel index identifies the
+    LIF instance in that VSP.
 
 Required nodes:
 
@@ -59,24 +61,24 @@ corresponding to each DU output.
  R8A7796 (M3-W)	DPAD		HDMI		LVDS		-
 
 
-Example: R8A7790 (R-Car H2) DU
+Example: R8A7795 (R-Car H3) ES2.0 DU
 
-	du: du@feb00000 {
-		compatible = "renesas,du-r8a7790";
-		reg = <0 0xfeb00000 0 0x70000>,
-		      <0 0xfeb90000 0 0x1c>,
-		      <0 0xfeb94000 0 0x1c>;
-		reg-names = "du", "lvds.0", "lvds.1";
-		interrupt-parent = <&gic>;
-		interrupts = <0 256 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 268 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 269 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp7_clks R8A7790_CLK_DU0>,
-		         <&mstp7_clks R8A7790_CLK_DU1>,
-		         <&mstp7_clks R8A7790_CLK_DU2>,
-		         <&mstp7_clks R8A7790_CLK_LVDS0>,
-		         <&mstp7_clks R8A7790_CLK_LVDS1>;
-		clock-names = "du.0", "du.1", "du.2", "lvds.0", "lvds.1";
+	du: display@feb00000 {
+		compatible = "renesas,du-r8a7795";
+		reg = <0 0xfeb00000 0 0x80000>,
+		      <0 0xfeb90000 0 0x14>;
+		reg-names = "du", "lvds.0";
+		interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 724>,
+			 <&cpg CPG_MOD 723>,
+			 <&cpg CPG_MOD 722>,
+			 <&cpg CPG_MOD 721>,
+			 <&cpg CPG_MOD 727>;
+		clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0";
+		vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
 
 		ports {
 			#address-cells = <1>;
@@ -89,12 +91,19 @@ Example: R8A7790 (R-Car H2) DU
 			};
 			port@1 {
 				reg = <1>;
-				du_out_lvds0: endpoint {
+				du_out_hdmi0: endpoint {
+					remote-endpoint = <&dw_hdmi0_in>;
 				};
 			};
 			port@2 {
 				reg = <2>;
-				du_out_lvds1: endpoint {
+				du_out_hdmi1: endpoint {
+					remote-endpoint = <&dw_hdmi1_in>;
+				};
+			};
+			port@3 {
+				reg = <3>;
+				du_out_lvds0: endpoint {
 				};
 			};
 		};
-- 
Regards,

Laurent Pinchart
