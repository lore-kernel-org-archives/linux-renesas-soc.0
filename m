Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:41608 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751923AbeEGNYx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 May 2018 09:24:53 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: dts: r7s72100: Correct watchdog timer interrupt type
Date: Mon,  7 May 2018 15:24:48 +0200
Message-Id: <1525699489-6172-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1525699489-6172-1-git-send-email-geert+renesas@glider.be>
References: <1525699489-6172-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to table 7.3 ("List of Interrupt IDs") in the RZ/A1H Hardware
User's Manual rev. 3.00, the watchdog timer interrupt is a level
interrupt.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 4a1aade0e751c3ff..c7b3dca6d81cc3f9 100644
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
2.7.4
