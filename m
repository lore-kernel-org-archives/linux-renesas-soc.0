Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:54180 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752437AbeFERRS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 13:17:18 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77990: Add secondary CA53 CPU core
Date: Tue,  5 Jun 2018 19:17:13 +0200
Message-Id: <1528219033-28788-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a device node for the second Cortex-A53 CPU core on the Renesas
R-Car E3 (r8a77990) SoC, and adjust the interrupt delivery masks for ARM
Generic Interrupt Controller and Architectured Timer.

Based on a patch in the BSP by Takeshi Kihara.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note that the PSCI implementation on Ebisu may be a preliminary version
with some familiar quirks:
  - SMP bringup works, and both CPUs can be used,
  - CPU1 can be offlined, but trying to bring it online again crashes
    the system.

I'm confident this will be fixed in future firmware versions, just like
on H3/Salvator-X.
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index be4f519711a1b029..6d597a1c7636784f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -17,16 +17,24 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		/* 1 core only at this point */
 		a53_0: cpu@0 {
 			compatible = "arm,cortex-a53", "arm,armv8";
-			reg = <0x0>;
+			reg = <0>;
 			device_type = "cpu";
 			power-domains = <&sysc 5>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
 		};
 
+		a53_1: cpu@1 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <1>;
+			device_type = "cpu";
+			power-domains = <&sysc 6>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+		};
+
 		L2_CA53: cache-controller-0 {
 			compatible = "cache";
 			power-domains = <&sysc 21>;
@@ -44,8 +52,9 @@
 
 	pmu_a53 {
 		compatible = "arm,cortex-a53-pmu";
-		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-affinity = <&a53_0>;
+		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&a53_0>, <&a53_1>;
 	};
 
 	psci {
@@ -258,7 +267,7 @@
 			      <0x0 0xf1040000 0 0x20000>,
 			      <0x0 0xf1060000 0 0x20000>;
 			interrupts = <GIC_PPI 9
-					(GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
+					(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
 			clocks = <&cpg CPG_MOD 408>;
 			clock-names = "clk";
 			power-domains = <&sysc 32>;
@@ -273,9 +282,9 @@
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 };
-- 
2.7.4
