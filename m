Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37489 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758685AbdEMXQX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 May 2017 19:16:23 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 1E29420218
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 May 2017 01:16:21 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 1/6] arm64: dts: renesas: r8a7795: Add HDMI encoder support
Date: Sun, 14 May 2017 02:16:13 +0300
Message-Id: <20170513231618.1715-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Add DT nodes for the two HDMI encoders in disabled state.

Based on work by Koji Matsuoka.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v4:

- Added resets property
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7d87dff70ac8..1aad7433b460 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1758,6 +1758,56 @@
 			renesas,fcp = <&fcpf2>;
 		};
 
+		hdmi0: hdmi0@fead0000 {
+			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
+			reg = <0 0xfead0000 0 0x10000>;
+			interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
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
+			interrupts = <0 436 IRQ_TYPE_LEVEL_HIGH>;
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
Regards,

Laurent Pinchart
