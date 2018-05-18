Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751473AbeERLT1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:19:27 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 58/69] ARM: dts: r7s72100: Correct watchdog timer interrupt type
Date: Fri, 18 May 2018 13:17:31 +0200
Message-Id: <c02cc235a215e9c518f98da25753b9e02bb7144f.1526641667.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526641667.git.horms+renesas@verge.net.au>
References: <cover.1526641667.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

According to table 7.3 ("List of Interrupt IDs") in the RZ/A1H Hardware
User's Manual rev. 3.00, the watchdog timer interrupt is a level
interrupt.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 4a1aade0e751..c7b3dca6d81c 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -387,7 +387,7 @@
 		wdt: watchdog@fcfe0000 {
 			compatible = "renesas,r7s72100-wdt", "renesas,rza-wdt";
 			reg = <0xfcfe0000 0x6>;
-			interrupts = <GIC_SPI 106 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&p0_clk>;
 		};
 
-- 
2.11.0
