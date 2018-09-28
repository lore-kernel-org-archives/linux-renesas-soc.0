Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58063 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729176AbeI1QpY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 12:45:24 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/7] ARM: dts: r9a06g032: Correct UART and add all other UARTs
Date: Fri, 28 Sep 2018 12:22:08 +0200
Message-Id: <9aa2126f16daeb8cd3027a70a2629130b0e618d9.1538123642.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1538123642.git.horms+renesas@verge.net.au>
References: <cover.1538123642.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Phil Edworthy <phil.edworthy@renesas.com>

- UART0 was missing the bus clock ("apb_pclk").
- Use recently accepted r9a06g032 and rzn1 compat strings.
- Add all the other UARTs.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
[simon: updated changelog]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 83 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 3e45375b79aa..eaf94976ed6d 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -78,13 +78,90 @@
 		};
 
 		uart0: serial@40060000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
 			reg = <0x40060000 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clocks = <&sysctrl R9A06G032_CLK_UART0>;
-			clock-names = "baudclk";
+			clocks = <&sysctrl R9A06G032_CLK_UART0>, <&sysctrl R9A06G032_HCLK_UART0>;
+			clock-names = "baudclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart1: serial@40061000 {
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
+			reg = <0x40061000 0x400>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&sysctrl R9A06G032_CLK_UART1>, <&sysctrl R9A06G032_HCLK_UART1>;
+			clock-names = "baudclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart2: serial@40062000 {
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
+			reg = <0x40062000 0x400>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&sysctrl R9A06G032_CLK_UART2>, <&sysctrl R9A06G032_HCLK_UART2>;
+			clock-names = "baudclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart3: serial@50000000 {
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
+			reg = <0x50000000 0x400>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&sysctrl R9A06G032_CLK_UART3>, <&sysctrl R9A06G032_HCLK_UART3>;
+			clock-names = "baudclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart4: serial@50001000 {
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
+			reg = <0x50001000 0x400>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&sysctrl R9A06G032_CLK_UART4>, <&sysctrl R9A06G032_HCLK_UART4>;
+			clock-names = "baudclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart5: serial@50002000 {
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
+			reg = <0x50002000 0x400>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&sysctrl R9A06G032_CLK_UART5>, <&sysctrl R9A06G032_HCLK_UART5>;
+			clock-names = "baudclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart6: serial@50003000 {
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
+			reg = <0x50003000 0x400>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&sysctrl R9A06G032_CLK_UART6>, <&sysctrl R9A06G032_HCLK_UART6>;
+			clock-names = "baudclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart7: serial@50004000 {
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
+			reg = <0x50004000 0x400>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&sysctrl R9A06G032_CLK_UART7>, <&sysctrl R9A06G032_HCLK_UART7>;
+			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
 		};
 
-- 
2.11.0
