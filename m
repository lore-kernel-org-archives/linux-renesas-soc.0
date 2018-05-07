Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:52444 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752487AbeEGNUC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 May 2018 09:20:02 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 2/2] ARM: dts: r8a73a4: Correct mask for GIC PPI interrupts
Date: Mon,  7 May 2018 15:19:53 +0200
Message-Id: <1525699193-5589-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1525699193-5589-1-git-send-email-geert+renesas@glider.be>
References: <1525699193-5589-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Mobile APE6 (r8a73a4) contains four Cortex-A15 and four Cortex-A7
cores, hence the second interrupt specifier cell for Private Peripheral
Interrupts should use "GIC_CPU_MASK_SIMPLE(8)", so GIC interrupts are
delivered to all 8 processor cores.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Change one-line summary prefix to match current arm-soc practices,
  - Rebased,

v2:
  - Drop RFC status after receiving confirmation from Liviu Dudau.
---
 arch/arm/boot/dts/r8a73a4.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index 8e48090e4fdc1412..080d037f5733a8c3 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -57,10 +57,10 @@
 
 	timer {
 		compatible = "arm,armv7-timer";
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
 	dbsc1: memory-controller@e6790000 {
@@ -464,7 +464,7 @@
 			<0 0xf1002000 0 0x2000>,
 			<0 0xf1004000 0 0x2000>,
 			<0 0xf1006000 0 0x2000>;
-		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		clocks = <&mstp4_clks R8A73A4_CLK_INTC_SYS>;
 		clock-names = "clk";
 		power-domains = <&pd_c4>;
-- 
2.7.4
