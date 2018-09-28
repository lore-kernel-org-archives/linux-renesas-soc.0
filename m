Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57700 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729111AbeI1Qns (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 12:43:48 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 11/14] arm64: dts: renesas: r8a77995: Add LVDS support
Date: Fri, 28 Sep 2018 12:20:22 +0200
Message-Id: <0dc733988b813b4054e2243539855ef535d3c9dd.1538125184.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1538125184.git.horms+renesas@verge.net.au>
References: <cover.1538125184.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The r8a77995 D3 platform has 2 LVDS channels connected to the DU.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
[uli: moved lvds* into the soc node, added PM domains, resets]
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 56 +++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 89a04a4496fd..214f4954b321 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -972,12 +972,68 @@
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
+		lvds0: lvds-encoder@feb90000 {
+			compatible = "renesas,r8a77995-lvds";
+			reg = <0 0xfeb90000 0 0x20>;
+			clocks = <&cpg CPG_MOD 727>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
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
+
+				port@1 {
+					reg = <1>;
+					lvds0_out: endpoint {
+					};
+				};
+			};
+		};
+
+		lvds1: lvds-encoder@feb90100 {
+			compatible = "renesas,r8a77995-lvds";
+			reg = <0 0xfeb90100 0 0x20>;
+			clocks = <&cpg CPG_MOD 727>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 726>;
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
+
+				port@1 {
+					reg = <1>;
+					lvds1_out: endpoint {
 					};
 				};
 			};
-- 
2.11.0
