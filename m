Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:34863 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753112AbcLGQoj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 11:44:39 -0500
Received: by mail-wj0-f193.google.com with SMTP id he10so36606093wjc.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Dec 2016 08:44:38 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
Cc: magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 2/3] arm64: renesas: r8a7796: Add all SCIF nodes
Date: Wed,  7 Dec 2016 17:44:26 +0100
Message-Id: <1481129067-21949-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1481129067-21949-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1481129067-21949-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the device nodes for all R-Car H3 SCIF serial ports, incl. clocks
and clock domain.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 65 ++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 7bf0f2f..c5f0df5 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -421,6 +421,32 @@
 			};
 		};
 
+		scif0: serial@e6e60000 {
+			compatible = "renesas,scif-r8a7796",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6e60000 0 64>;
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 207>,
+				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif1: serial@e6e68000 {
+			compatible = "renesas,scif-r8a7796",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6e68000 0 64>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 206>,
+				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		scif2: serial@e6e88000 {
 			compatible = "renesas,scif-r8a7796",
 				     "renesas,rcar-gen3-scif", "renesas,scif";
@@ -434,6 +460,45 @@
 			status = "disabled";
 		};
 
+		scif3: serial@e6c50000 {
+			compatible = "renesas,scif-r8a7796",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6c50000 0 64>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 204>,
+				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif4: serial@e6c40000 {
+			compatible = "renesas,scif-r8a7796",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6c40000 0 64>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 203>,
+				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif5: serial@e6f30000 {
+			compatible = "renesas,scif-r8a7796",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6f30000 0 64>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 202>,
+				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		msiof0: spi@e6e90000 {
 			compatible = "renesas,msiof-r8a7796";
 			reg = <0 0xe6e90000 0 0x0064>;
-- 
2.7.4
