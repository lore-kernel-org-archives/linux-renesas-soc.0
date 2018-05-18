Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752600AbeERLT3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:19:29 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 59/69] ARM: dts: r7s72100: Correct RTC interrupt types
Date: Fri, 18 May 2018 13:17:32 +0200
Message-Id: <cad8e5a7a1e27e9efe4e706ace75e0826a79707f.1526641667.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526641667.git.horms+renesas@verge.net.au>
References: <cover.1526641667.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

According to table 7.3 ("List of Interrupt IDs") in the RZ/A1H Hardware
User's Manual rev. 3.00, the realtime clock interrupts are level not
edge interrupts.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index c7b3dca6d81c..eb2e6f95a2e8 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -682,9 +682,9 @@
 		rtc: rtc@fcff1000 {
 			compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
 			reg = <0xfcff1000 0x2e>;
-			interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
-				      GIC_SPI 277 IRQ_TYPE_EDGE_RISING
-				      GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "alarm", "period", "carry";
 			clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
 				 <&rtc_x3_clk>, <&extal_clk>;
-- 
2.11.0
