Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:60090 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753684AbdCFQ6c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 11:58:32 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 5/6] ARM: dts: r8a7793: Add INTC-SYS clock to device tree
Date: Mon,  6 Mar 2017 17:58:10 +0100
Message-Id: <1488819491-26097-6-git-send-email-geert+renesas@glider.be>
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
  - Drop RFC status,
  - Rebased on top of CPG Clock Domain support,
  - Add clock-names property,
  - Change one-line summary prefix to match current arm-soc practices.
  - Rebased on top of R-Car SYSC PM Domain support,
  - s/GIC driver/GIC-400 driver/,
  - Document critical clock dependency.
---
 arch/arm/boot/dts/r8a7793.dtsi            | 11 ++++++++---
 include/dt-bindings/clock/r8a7793-clock.h |  5 +++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 38506f563b2b2e5a..f36772a642c008ef 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -108,6 +108,9 @@
 			<0 0xf1004000 0 0x2000>,
 			<0 0xf1006000 0 0x2000>;
 		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+		clocks = <&mstp4_clks R8A7793_CLK_INTC_SYS>;
+		clock-names = "clk";
+		power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
 	};
 
 	gpio0: gpio@e6050000 {
@@ -1178,10 +1181,12 @@
 		mstp4_clks: mstp4_clks@e6150140 {
 			compatible = "renesas,r8a7793-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150140 0 4>, <0 0xe615004c 0 4>;
-			clocks = <&cp_clk>;
+			clocks = <&cp_clk>, <&zs_clk>;
 			#clock-cells = <1>;
-			clock-indices = <R8A7793_CLK_IRQC>;
-			clock-output-names = "irqc";
+			clock-indices = <
+				R8A7793_CLK_IRQC R8A7793_CLK_INTC_SYS
+			>;
+			clock-output-names = "irqc", "intc-sys";
 		};
 		mstp5_clks: mstp5_clks@e6150144 {
 			compatible = "renesas,r8a7793-mstp-clocks", "renesas,cpg-mstp-clocks";
diff --git a/include/dt-bindings/clock/r8a7793-clock.h b/include/dt-bindings/clock/r8a7793-clock.h
index efcbc594fe82e683..7318d45d4e7e9888 100644
--- a/include/dt-bindings/clock/r8a7793-clock.h
+++ b/include/dt-bindings/clock/r8a7793-clock.h
@@ -77,10 +77,11 @@
 
 /* MSTP4 */
 #define R8A7793_CLK_IRQC		7
+#define R8A7793_CLK_INTC_SYS		8
 
 /* MSTP5 */
-#define R8A7793_CLK_AUDIO_DMAC1         1
-#define R8A7793_CLK_AUDIO_DMAC0         2
+#define R8A7793_CLK_AUDIO_DMAC1		1
+#define R8A7793_CLK_AUDIO_DMAC0		2
 #define R8A7793_CLK_ADSP_MOD		6
 #define R8A7793_CLK_THERMAL		22
 #define R8A7793_CLK_PWM			23
-- 
2.7.4
