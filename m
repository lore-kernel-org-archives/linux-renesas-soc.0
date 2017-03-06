Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60049 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752515AbdCFA3l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Mar 2017 19:29:41 -0500
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 9B810202B9
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2017 01:18:54 +0100 (CET)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/5] arm64: dts: r8a7795: Add HDMI encoder support
Date: Mon,  6 Mar 2017 02:20:22 +0200
Message-Id: <20170306002026.15066-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170306002026.15066-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170306002026.15066-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Add DT nodes for the two HDMI encoders in disabled state.

Based on work by Koji Matsuoka.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index eac4f29aa5cd..0887cc6b1f6c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1637,11 +1637,13 @@
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
@@ -1709,5 +1711,53 @@
 				};
 			};
 		};
+
+		hdmi0: hdmi0@fead0000 {
+			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
+			reg = <0 0xfead0000 0 0x10000>;
+			interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 729>, <&cpg CPG_CORE R8A7795_CLK_HDMI>;
+			clock-names = "iahb", "isfr";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
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
+			interrupts = <0 436 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 728>, <&cpg CPG_CORE R8A7795_CLK_HDMI>;
+			clock-names = "iahb", "isfr";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
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
 	};
 };
-- 
Regards,

Laurent Pinchart
