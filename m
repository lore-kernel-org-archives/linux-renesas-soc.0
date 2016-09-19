Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:58801 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751449AbcISOTA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 10:19:00 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] ARM: dts: r8a7791: Correct SCIFB reg properties to cover all registers
Date: Mon, 19 Sep 2016 16:18:54 +0200
Message-Id: <1474294736-24339-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1474294736-24339-1-git-send-email-geert+renesas@glider.be>
References: <1474294736-24339-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Several SCIFB registers reside outside the reported register ranges.
Fortunately this works (on Linux), due to the PAGE_SIZE granularity of
ioremap().

Extend the sizes from 64 to 0x100 bytes to fix this, like is done on
SH/R-Mobile SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 4e64be751bf2dafa..5d81a2d1c88434f2 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -702,7 +702,7 @@
 	scifb0: serial@e6c20000 {
 		compatible = "renesas,scifb-r8a7791",
 			     "renesas,rcar-gen2-scifb", "renesas,scifb";
-		reg = <0 0xe6c20000 0 64>;
+		reg = <0 0xe6c20000 0 0x100>;
 		interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7791_CLK_SCIFB0>;
 		clock-names = "fck";
@@ -716,7 +716,7 @@
 	scifb1: serial@e6c30000 {
 		compatible = "renesas,scifb-r8a7791",
 			     "renesas,rcar-gen2-scifb", "renesas,scifb";
-		reg = <0 0xe6c30000 0 64>;
+		reg = <0 0xe6c30000 0 0x100>;
 		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7791_CLK_SCIFB1>;
 		clock-names = "fck";
@@ -730,7 +730,7 @@
 	scifb2: serial@e6ce0000 {
 		compatible = "renesas,scifb-r8a7791",
 			     "renesas,rcar-gen2-scifb", "renesas,scifb";
-		reg = <0 0xe6ce0000 0 64>;
+		reg = <0 0xe6ce0000 0 0x100>;
 		interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7791_CLK_SCIFB2>;
 		clock-names = "fck";
-- 
1.9.1
