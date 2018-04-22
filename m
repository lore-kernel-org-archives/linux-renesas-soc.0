Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:54212 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750916AbeDVKfX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Apr 2018 06:35:23 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/4] ARM: dts: renesas: r8a7790: Add FDP1 instances
Date: Sun, 22 Apr 2018 13:35:25 +0300
Message-Id: <20180422103528.3402-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180422103528.3402-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180422103528.3402-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The r8a7790 has three FDP1 instances.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7790.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index e4367cecad18..9c527ddfde56 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1606,6 +1606,33 @@
 			resets = <&cpg 128>;
 		};
 
+		fdp1@fe940000 {
+			compatible = "renesas,fdp1";
+			reg = <0 0xfe940000 0 0x2400>;
+			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 119>;
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 119>;
+		};
+
+		fdp1@fe944000 {
+			compatible = "renesas,fdp1";
+			reg = <0 0xfe944000 0 0x2400>;
+			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 118>;
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 118>;
+		};
+
+		fdp1@fe948000 {
+			compatible = "renesas,fdp1";
+			reg = <0 0xfe948000 0 0x2400>;
+			interrupts = <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 117>;
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 117>;
+		};
+
 		vsp@fe938000 {
 			compatible = "renesas,vsp1";
 			reg = <0 0xfe938000 0 0x8000>;
-- 
Regards,

Laurent Pinchart
