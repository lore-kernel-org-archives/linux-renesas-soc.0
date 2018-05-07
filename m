Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:45950 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752007AbeEGNYy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 May 2018 09:24:54 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: r7s72100: Correct RTC interrupt types
Date: Mon,  7 May 2018 15:24:49 +0200
Message-Id: <1525699489-6172-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1525699489-6172-1-git-send-email-geert+renesas@glider.be>
References: <1525699489-6172-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to table 7.3 ("List of Interrupt IDs") in the RZ/A1H Hardware
User's Manual rev. 3.00, the realtime clock interrupts are level not
edge interrupts.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index c7b3dca6d81cc3f9..eb2e6f95a2e85862 100644
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
2.7.4
