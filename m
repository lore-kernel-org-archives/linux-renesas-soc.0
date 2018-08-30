Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:51040 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728449AbeH3S7L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 14:59:11 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77990: Add BRG support to SCIF2
Date: Thu, 30 Aug 2018 16:56:35 +0200
Message-Id: <20180830145635.7659-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Add the device node for the external SCIF_CLK, and describe the clock
inputs for the Baud Rate Generator for External Clock (BRG) for SCIF2,
which can increase serial clock accuracy.

The presence of the SCIF_CLK crystal and its clock frequency depend on
the actual board.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Enhance patch description]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note: The Ebisu board does not provide SCIF_CLK.  However, using the BRG
      increases the serial console's clock accurary from 115200+541 bps
      to 115200-257 bps.
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index e2c2d1480a68cf1b..6198768264bece81 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -63,6 +63,13 @@
 		method = "smc";
 	};
 
+	/* External SCIF clock - to be overridden by boards that provide it */
+	scif_clk: scif {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
@@ -412,8 +419,11 @@
 				     "renesas,rcar-gen3-scif", "renesas,scif";
 			reg = <0 0xe6e88000 0 64>;
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 310>;
-			clock-names = "fck";
+			clocks = <&cpg CPG_MOD 310>,
+				 <&cpg CPG_CORE R8A77990_CLK_S3D1C>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
 			status = "disabled";
-- 
2.17.1
