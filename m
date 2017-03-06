Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:47814 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753939AbdCFQ6c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 11:58:32 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/6] ARM: dts: r8a7792: Add INTC-SYS clock to device tree
Date: Mon,  6 Mar 2017 17:58:09 +0100
Message-Id: <1488819491-26097-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1488819491-26097-1-git-send-email-geert+renesas@glider.be>
References: <1488819491-26097-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Link the ARM GIC to the INTC-SYS module clock, and add it to the "always
on" PM Domain, so it can be power managed using that clock.

Note that currently the GIC-400 driver doesn't support module clocks nor
Runtime PM, so this must be handled as a critical clock.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/arm/boot/dts/r8a7792.dtsi            | 11 ++++++++---
 include/dt-bindings/clock/r8a7792-clock.h |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index c762f44f7732f352..6c0797ebc08f029c 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -92,6 +92,9 @@
 			      <0 0xf1006000 0 0x2000>;
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) |
 				      IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&mstp4_clks R8A7792_CLK_INTC_SYS>;
+			clock-names = "clk";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
 		};
 
 		irqc: interrupt-controller@e61c0000 {
@@ -895,10 +898,12 @@
 			compatible = "renesas,r8a7792-mstp-clocks",
 				     "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150140 0 4>, <0 0xe615004c 0 4>;
-			clocks = <&cp_clk>;
+			clocks = <&cp_clk>, <&zs_clk>;
 			#clock-cells = <1>;
-			clock-indices = <R8A7792_CLK_IRQC>;
-			clock-output-names = "irqc";
+			clock-indices = <
+				R8A7792_CLK_IRQC R8A7792_CLK_INTC_SYS
+			>;
+			clock-output-names = "irqc", "intc-sys";
 		};
 		mstp7_clks: mstp7_clks@e615014c {
 			compatible = "renesas,r8a7792-mstp-clocks",
diff --git a/include/dt-bindings/clock/r8a7792-clock.h b/include/dt-bindings/clock/r8a7792-clock.h
index 9a8b392ceb000fc3..94dd16a1e6e6963d 100644
--- a/include/dt-bindings/clock/r8a7792-clock.h
+++ b/include/dt-bindings/clock/r8a7792-clock.h
@@ -45,6 +45,7 @@
 
 /* MSTP4 */
 #define R8A7792_CLK_IRQC		7
+#define R8A7792_CLK_INTC_SYS		8
 
 /* MSTP5 */
 #define R8A7792_CLK_AUDIO_DMAC0		2
-- 
2.7.4
