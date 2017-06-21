Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52373 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752819AbdFUJbJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2017 05:31:09 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id EFA9B213B6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2017 11:30:32 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 5/7] arm64: dts: renesas: r8a7796: Add DU device to DT
Date: Wed, 21 Jun 2017 12:31:31 +0300
Message-Id: <20170621093133.5677-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the DU device to r8a7796.dtsi in a disabled state.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 25e51d20b7ef..2522e9301cc0 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1558,7 +1558,21 @@
 		};
 
 		du: display@feb00000 {
-			/* placeholder */
+			compatible = "renesas,du-r8a7796";
+			reg = <0 0xfeb00000 0 0x70000>,
+			      <0 0xfeb90000 0 0x14>;
+			reg-names = "du", "lvds.0";
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 724>,
+				 <&cpg CPG_MOD 723>,
+				 <&cpg CPG_MOD 722>,
+				 <&cpg CPG_MOD 727>;
+			clock-names = "du.0", "du.1", "du.2", "lvds.0";
+			status = "disabled";
+
+			vsps = <&vspd0 &vspd1 &vspd2>;
 
 			ports {
 				#address-cells = <1>;
@@ -1569,6 +1583,17 @@
 					du_out_rgb: endpoint {
 					};
 				};
+				port@1 {
+					reg = <1>;
+					du_out_hdmi0: endpoint {
+						remote-endpoint = <&dw_hdmi0_in>;
+					};
+				};
+				port@2 {
+					reg = <2>;
+					du_out_lvds0: endpoint {
+					};
+				};
 			};
 		};
 	};
-- 
Regards,

Laurent Pinchart
