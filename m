Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:50758 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752256AbdDCJxL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 05:53:11 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: r8a7792: Correct Z clock
Date: Mon,  3 Apr 2017 11:53:08 +0200
Message-Id: <1491213188-7305-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Unlike other R-Car Gen2 SoCs with Cortex-A15 CPU cores, R-Car V2H does
not have a programmable Z clock (Cortex-A15 CPU core clock), but uses a
fixed divider.
This is similar to the Z2 clock (Cortex-A7 CPU core clock) on R-Car E2.

Hence:
  - Remove the Z clock output from the cpg_clocks node, as this implied
    a programmable clock,
  - Add the Z clock as a fixed factor clock,
  - Let the first CPU node point to the new Z clock,
  - Remove the Z clock index from the bindings (this definition was used
    by r8a7792.dtsi only, and was not a contract between DT and driver).

Fixes: 7c4163aae3d8e5b9 ("ARM: dts: r8a7792: initial SoC device tree")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7792.dtsi            | 11 +++++++++--
 include/dt-bindings/clock/r8a7792-clock.h |  1 -
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index 6c0797ebc08f029c..0efecb232ee52ce0 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -46,7 +46,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <0>;
 			clock-frequency = <1000000000>;
-			clocks = <&cpg_clocks R8A7792_CLK_Z>;
+			clocks = <&z_clk>;
 			power-domains = <&sysc R8A7792_PD_CA15_CPU0>;
 			next-level-cache = <&L2_CA15>;
 		};
@@ -766,7 +766,7 @@
 			clocks = <&extal_clk>;
 			#clock-cells = <1>;
 			clock-output-names = "main", "pll0", "pll1", "pll3",
-					     "lb", "qspi", "z";
+					     "lb", "qspi";
 			#power-domain-cells = <0>;
 		};
 
@@ -778,6 +778,13 @@
 			clock-div = <2>;
 			clock-mult = <1>;
 		};
+		z_clk: z {
+			compatible = "fixed-factor-clock";
+			clocks = <&cpg_clocks R8A7792_CLK_PLL0>;
+			#clock-cells = <0>;
+			clock-div = <1>;
+			clock-mult = <1>;
+		};
 		zx_clk: zx {
 			compatible = "fixed-factor-clock";
 			clocks = <&cpg_clocks R8A7792_CLK_PLL1>;
diff --git a/include/dt-bindings/clock/r8a7792-clock.h b/include/dt-bindings/clock/r8a7792-clock.h
index 94dd16a1e6e6963d..5be90bc23bd79097 100644
--- a/include/dt-bindings/clock/r8a7792-clock.h
+++ b/include/dt-bindings/clock/r8a7792-clock.h
@@ -17,7 +17,6 @@
 #define R8A7792_CLK_PLL3		3
 #define R8A7792_CLK_LB			4
 #define R8A7792_CLK_QSPI		5
-#define R8A7792_CLK_Z			6
 
 /* MSTP0 */
 #define R8A7792_CLK_MSIOF0		0
-- 
2.7.4
