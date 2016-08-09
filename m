Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36600 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932203AbcHIM3L (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 9 Aug 2016 08:29:11 -0400
Received: from avalon.bb.dnainternet.fi (85-23-193-79.bb.dnainternet.fi [85.23.193.79])
	by galahad.ideasonboard.com (Postfix) with ESMTPSA id 57811208AB
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Aug 2016 14:28:57 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: renesas: r8a7795: Add DU device to DT
Date: Tue,  9 Aug 2016 15:29:11 +0300
Message-Id: <1470745752-23738-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the DU device to r8a7795.dtsi in a disabled state.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index d9c6653471f4..7837d4b807d5 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1474,5 +1474,51 @@
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 			renesas,fcp = <&fcpf2>;
 		};
+
+		du: display@feb00000 {
+			compatible = "renesas,du-r8a7795";
+			reg = <0 0xfeb00000 0 0x80000>,
+			      <0 0xfeb90000 0 0x14>;
+			reg-names = "du", "lvds.0";
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 724>,
+				 <&cpg CPG_MOD 723>,
+				 <&cpg CPG_MOD 722>,
+				 <&cpg CPG_MOD 721>,
+				 <&cpg CPG_MOD 727>;
+			clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0";
+			status = "disabled";
+
+			vsps = <&vspd0 &vspd1 &vspd2 &vspd3>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_rgb: endpoint {
+					};
+				};
+				port@1 {
+					reg = <1>;
+					du_out_hdmi0: endpoint {
+					};
+				};
+				port@2 {
+					reg = <2>;
+					du_out_hdmi1: endpoint {
+					};
+				};
+				port@3 {
+					reg = <3>;
+					du_out_lvds0: endpoint {
+					};
+				};
+			};
+		};
 	};
 };
-- 
Regards,

Laurent Pinchart
