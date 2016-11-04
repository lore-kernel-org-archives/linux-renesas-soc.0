Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41481 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760512AbcKDJoq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 05:44:46 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 09/29] ARM: dts: r8a7794: Correct SCIFB reg properties to cover all registers
Date: Fri,  4 Nov 2016 10:44:08 +0100
Message-Id: <655ea555064251e0b094848d378d4a67e8ebb0ed.1478252309.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1478252308.git.horms+renesas@verge.net.au>
References: <cover.1478252308.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Several SCIFB registers reside outside the reported register ranges.
Fortunately this works (on Linux), due to the PAGE_SIZE granularity of
ioremap().

Extend the sizes from 64 to 0x100 bytes to fix this, like is done on
SH/R-Mobile SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7794.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 57e0d27cb82e..8cfc1385f58a 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -411,7 +411,7 @@
 	scifb0: serial@e6c20000 {
 		compatible = "renesas,scifb-r8a7794",
 			     "renesas,rcar-gen2-scifb", "renesas,scifb";
-		reg = <0 0xe6c20000 0 64>;
+		reg = <0 0xe6c20000 0 0x100>;
 		interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7794_CLK_SCIFB0>;
 		clock-names = "fck";
@@ -425,7 +425,7 @@
 	scifb1: serial@e6c30000 {
 		compatible = "renesas,scifb-r8a7794",
 			     "renesas,rcar-gen2-scifb", "renesas,scifb";
-		reg = <0 0xe6c30000 0 64>;
+		reg = <0 0xe6c30000 0 0x100>;
 		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7794_CLK_SCIFB1>;
 		clock-names = "fck";
@@ -439,7 +439,7 @@
 	scifb2: serial@e6ce0000 {
 		compatible = "renesas,scifb-r8a7794",
 			     "renesas,rcar-gen2-scifb", "renesas,scifb";
-		reg = <0 0xe6ce0000 0 64>;
+		reg = <0 0xe6ce0000 0 0x100>;
 		interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7794_CLK_SCIFB2>;
 		clock-names = "fck";
-- 
2.7.0.rc3.207.g0ac5344
