Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34095 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761896AbcINQr3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 12:47:29 -0400
Received: by mail-wm0-f67.google.com with SMTP id g141so3383266wmd.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 09:47:29 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: magnus.damm@gmail.com, horms@verge.net.au,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 3/4] arm64: renesas: r8a7796 dtsi: Add all HSCIF nodes
Date: Wed, 14 Sep 2016 18:47:15 +0200
Message-Id: <20160914164716.31512-4-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <20160914164716.31512-1-ulrich.hecht+renesas@gmail.com>
References: <20160914164716.31512-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the device nodes for all HSCIF serial ports, incl. clocks, and
clock domain.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 70 ++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index d2bbf92..df3b7df 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -347,6 +347,76 @@
 			status = "disabled";
 		};
 
+		hscif0: serial@e6540000 {
+			compatible = "renesas,hscif-r8a7796",
+				     "renesas,rcar-gen3-hscif",
+				     "renesas,hscif";
+			reg = <0 0xe6540000 0 96>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 520>,
+				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		hscif1: serial@e6550000 {
+			compatible = "renesas,hscif-r8a7796",
+				     "renesas,rcar-gen3-hscif",
+				     "renesas,hscif";
+			reg = <0 0xe6550000 0 96>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 519>,
+				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		hscif2: serial@e6560000 {
+			compatible = "renesas,hscif-r8a7796",
+				     "renesas,rcar-gen3-hscif",
+				     "renesas,hscif";
+			reg = <0 0xe6560000 0 96>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 518>,
+				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		hscif3: serial@e66a0000 {
+			compatible = "renesas,hscif-r8a7796",
+				     "renesas,rcar-gen3-hscif",
+				     "renesas,hscif";
+			reg = <0 0xe66a0000 0 96>;
+			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 517>,
+				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		hscif4: serial@e66b0000 {
+			compatible = "renesas,hscif-r8a7796",
+				     "renesas,rcar-gen3-hscif",
+				     "renesas,hscif";
+			reg = <0 0xe66b0000 0 96>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 516>,
+				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		scif0: serial@e6e60000 {
 			compatible = "renesas,scif-r8a7796",
 				     "renesas,rcar-gen3-scif", "renesas,scif";
-- 
2.9.3
