Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47786 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933920AbdEVOAJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 10:00:09 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 28/35] arm64: dts: renesas: r8a7795: Add HDMI encoder support
Date: Mon, 22 May 2017 15:59:01 +0200
Message-Id: <12daaf78a723ef7cb7ec46bc604844f31111bc7b.1495457812.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1495457812.git.horms+renesas@verge.net.au>
References: <cover.1495457812.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Add DT nodes for the two HDMI encoders in disabled state.

Based on work by Koji Matsuoka.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7d87dff70ac8..ee0129634cdf 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1758,6 +1758,56 @@
 			renesas,fcp = <&fcpf2>;
 		};
 
+		hdmi0: hdmi0@fead0000 {
+			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
+			reg = <0 0xfead0000 0 0x10000>;
+			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 729>, <&cpg CPG_CORE R8A7795_CLK_HDMI>;
+			clock-names = "iahb", "isfr";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 729>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					dw_hdmi0_in: endpoint {
+						remote-endpoint = <&du_out_hdmi0>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		hdmi1: hdmi1@feae0000 {
+			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
+			reg = <0 0xfeae0000 0 0x10000>;
+			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 728>, <&cpg CPG_CORE R8A7795_CLK_HDMI>;
+			clock-names = "iahb", "isfr";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 728>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					dw_hdmi1_in: endpoint {
+						remote-endpoint = <&du_out_hdmi1>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7795";
 			reg = <0 0xfeb00000 0 0x80000>,
@@ -1789,11 +1839,13 @@
 				port@1 {
 					reg = <1>;
 					du_out_hdmi0: endpoint {
+						remote-endpoint = <&dw_hdmi0_in>;
 					};
 				};
 				port@2 {
 					reg = <2>;
 					du_out_hdmi1: endpoint {
+						remote-endpoint = <&dw_hdmi1_in>;
 					};
 				};
 				port@3 {
-- 
2.1.4
