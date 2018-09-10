Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:5791 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728043AbeIJU5x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 16:57:53 -0400
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v2] ARM: dts: r9a06g032: Correct UART and add all other UARTs
Date: Mon, 10 Sep 2018 17:02:54 +0100
Message-Id: <20180910160254.3882-1-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

- UART0 was missing the bus clock ("apb_pclk").
- Now that the relevant rzn1 bindings have been added, replace the Synopsys
  compat string with the rzn1 strings.
- Add all the other UARTs.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
v2:
 - Keep the "snps,dw-apb-uart" fallback for uarts 0..2 as these are unmodified
   peripherals.
---
 arch/arm/boot/dts/r9a06g032.dtsi | 83 ++++++++++++++++++++++++++++++--
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
2.17.1
