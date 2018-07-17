Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:40068 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731523AbeGQN6e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 09:58:34 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: r8a77470: Use r8a77470-cpg-mssr binding definitions
Date: Tue, 17 Jul 2018 15:25:49 +0200
Message-Id: <20180717132549.28793-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Replace the hardcoded clock indices by R8A77470_CLK_* symbols.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Commit 343e64a6c48a6c86 ("clk: renesas: Add r8a77470 CPG Core Clock
Definitions") is in v4.18-rc1.
---
 arch/arm/boot/dts/r8a77470.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index c85032f9605b9171..87d32d3e23de2c17 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -7,7 +7,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
+#include <dt-bindings/clock/r8a77470-cpg-mssr.h>
 / {
 	compatible = "renesas,r8a77470";
 	#address-cells = <2>;
@@ -22,7 +22,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0>;
 			clock-frequency = <1000000000>;
-			clocks = <&cpg CPG_CORE 0>;
+			clocks = <&cpg CPG_CORE R8A77470_CLK_Z2>;
 			power-domains = <&sysc 5>;
 			next-level-cache = <&L2_CA7>;
 		};
@@ -209,7 +209,7 @@
 			reg = <0 0xe6e60000 0 0x40>;
 			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 721>,
-				 <&cpg CPG_CORE 5>, <&scif_clk>;
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x29>, <&dmac0 0x2a>,
 			       <&dmac1 0x29>, <&dmac1 0x2a>;
@@ -225,7 +225,7 @@
 			reg = <0 0xe6e68000 0 0x40>;
 			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 720>,
-				 <&cpg CPG_CORE 5>, <&scif_clk>;
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x2d>, <&dmac0 0x2e>,
 			       <&dmac1 0x2d>, <&dmac1 0x2e>;
@@ -241,7 +241,7 @@
 			reg = <0 0xe6e58000 0 0x40>;
 			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 719>,
-				 <&cpg CPG_CORE 5>, <&scif_clk>;
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x2b>, <&dmac0 0x2c>,
 			       <&dmac1 0x2b>, <&dmac1 0x2c>;
@@ -257,7 +257,7 @@
 			reg = <0 0xe6ea8000 0 0x40>;
 			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 718>,
-				 <&cpg CPG_CORE 5>, <&scif_clk>;
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x2f>, <&dmac0 0x30>,
 			       <&dmac1 0x2f>, <&dmac1 0x30>;
@@ -273,7 +273,7 @@
 			reg = <0 0xe6ee0000 0 0x40>;
 			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 715>,
-				 <&cpg CPG_CORE 5>, <&scif_clk>;
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0xfb>, <&dmac0 0xfc>,
 			       <&dmac1 0xfb>, <&dmac1 0xfc>;
@@ -289,7 +289,7 @@
 			reg = <0 0xe6ee8000 0 0x40>;
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 714>,
-				 <&cpg CPG_CORE 5>, <&scif_clk>;
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0xfd>, <&dmac0 0xfe>,
 			       <&dmac1 0xfd>, <&dmac1 0xfe>;
-- 
2.17.1
