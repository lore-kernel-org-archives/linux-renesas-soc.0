Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:45798 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1163675AbeE1NPh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 May 2018 09:15:37 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77965: Use r8a77965-cpg-mssr binding definitions
Date: Mon, 28 May 2018 15:15:29 +0200
Message-Id: <1527513329-18780-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Replace the hardcoded clock indices by R8A77965_CLK_* symbols.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Commit 7ce36da900c0a2ff ("clk: renesas: cpg-mssr: Add support for R-Car
M3-N") providing the definitions is in v4.17-rc1.

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 486aecacb22abcf2..fad98ba6742e220b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -732,7 +732,7 @@
 			reg = <0 0xe6e60000 0 64>;
 			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 207>,
-				 <&cpg CPG_CORE 20>,
+				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac1 0x51>, <&dmac1 0x50>,
@@ -749,7 +749,7 @@
 			reg = <0 0xe6e68000 0 64>;
 			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 206>,
-				 <&cpg CPG_CORE 20>,
+				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac1 0x53>, <&dmac1 0x52>,
@@ -766,7 +766,7 @@
 			reg = <0 0xe6e88000 0 64>;
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 310>,
-				 <&cpg CPG_CORE 20>,
+				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
@@ -780,7 +780,7 @@
 			reg = <0 0xe6c50000 0 64>;
 			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 204>,
-				 <&cpg CPG_CORE 20>,
+				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x57>, <&dmac0 0x56>;
@@ -796,7 +796,7 @@
 			reg = <0 0xe6c40000 0 64>;
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 203>,
-				 <&cpg CPG_CORE 20>,
+				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x59>, <&dmac0 0x58>;
@@ -812,7 +812,7 @@
 			reg = <0 0xe6f30000 0 64>;
 			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 202>,
-				 <&cpg CPG_CORE 20>,
+				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac1 0x5b>, <&dmac1 0x5a>,
-- 
2.7.4
