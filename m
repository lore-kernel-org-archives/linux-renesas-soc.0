Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:36892 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934315AbdBQPai (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2017 10:30:38 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: dts: r8a7796: Add Cortex-A53 CPU cores
Date: Fri, 17 Feb 2017 16:30:35 +0100
Message-Id: <1487345435-1088-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1487345435-1088-1-git-send-email-geert+renesas@glider.be>
References: <1487345435-1088-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds Cortex-A53 CPU cores of R8A7796 SoC, and sets a total of
6 cores (2 x Cortex-A57 + 4 x Cortex-A53).

Based on a patch by Takeshi Kihara in the BSP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 46 ++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index d848e94d7282e5aa..b902917d47ad5663 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -55,6 +55,42 @@
 			enable-method = "psci";
 		};
 
+		a53_0: cpu@100 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x100>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A7796_PD_CA53_CPU0>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+		};
+
+		a53_1: cpu@101 {
+			compatible = "arm,cortex-a53","arm,armv8";
+			reg = <0x101>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A7796_PD_CA53_CPU1>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+		};
+
+		a53_2: cpu@102 {
+			compatible = "arm,cortex-a53","arm,armv8";
+			reg = <0x102>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A7796_PD_CA53_CPU2>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+		};
+
+		a53_3: cpu@103 {
+			compatible = "arm,cortex-a53","arm,armv8";
+			reg = <0x103>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A7796_PD_CA53_CPU3>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+		};
+
 		L2_CA57: cache-controller@0 {
 			compatible = "cache";
 			reg = <0>;
@@ -117,7 +153,7 @@
 			      <0x0 0xf1040000 0 0x20000>,
 			      <0x0 0xf1060000 0 0x20000>;
 			interrupts = <GIC_PPI 9
-					(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+					(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
 			clocks = <&cpg CPG_MOD 408>;
 			clock-names = "clk";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
@@ -127,13 +163,13 @@
 		timer {
 			compatible = "arm,armv8-timer";
 			interrupts = <GIC_PPI 13
-					(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+					(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
 				     <GIC_PPI 14
-					(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+					(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
 				     <GIC_PPI 11
-					(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+					(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
 				     <GIC_PPI 10
-					(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+					(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
 		};
 
 		wdt0: watchdog@e6020000 {
-- 
1.9.1
