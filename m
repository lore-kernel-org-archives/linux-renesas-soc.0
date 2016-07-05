Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:33057 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755140AbcGEWCX (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 18:02:23 -0400
Received: by mail-lf0-f53.google.com with SMTP id f6so143431168lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2016 15:02:22 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] ARM: dts: r8a7792: add GPIO support
Date: Wed, 06 Jul 2016 01:02:20 +0300
Message-ID: <11674399.J5QsPL1iTr@wasted.cogentembedded.com>
In-Reply-To: <19087307.ZHtRY0pPL5@wasted.cogentembedded.com>
References: <19087307.ZHtRY0pPL5@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe all 12 GPIO controllers in the R8A7792 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 2:
- added Geert's tag.

 arch/arm/boot/dts/r8a7792.dtsi |  168 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -113,6 +113,174 @@
 			reg = <0 0xe6060000 0 0x144>;
 		};
 
+		gpio0: gpio@e6050000 {
+			compatible = "renesas,gpio-r8a7792",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6050000 0 0x50>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 0 29>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&mstp9_clks R8A7792_CLK_GPIO0>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+		};
+
+		gpio1: gpio@e6051000 {
+			compatible = "renesas,gpio-r8a7792",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6051000 0 0x50>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 32 23>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&mstp9_clks R8A7792_CLK_GPIO1>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+		};
+
+		gpio2: gpio@e6052000 {
+			compatible = "renesas,gpio-r8a7792",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6052000 0 0x50>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 64 32>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&mstp9_clks R8A7792_CLK_GPIO2>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+		};
+
+		gpio3: gpio@e6053000 {
+			compatible = "renesas,gpio-r8a7792",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6053000 0 0x50>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 96 28>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&mstp9_clks R8A7792_CLK_GPIO3>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+		};
+
+		gpio4: gpio@e6054000 {
+			compatible = "renesas,gpio-r8a7792",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6054000 0 0x50>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 128 17>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&mstp9_clks R8A7792_CLK_GPIO4>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+		};
+
+		gpio5: gpio@e6055000 {
+			compatible = "renesas,gpio-r8a7792",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6055000 0 0x50>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 160 17>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&mstp9_clks R8A7792_CLK_GPIO5>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+		};
+
+		gpio6: gpio@e6055100 {
+			compatible = "renesas,gpio-r8a7792",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6055100 0 0x50>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 192 17>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&mstp9_clks R8A7792_CLK_GPIO6>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+		};
+
+		gpio7: gpio@e6055200 {
+			compatible = "renesas,gpio-r8a7792",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6055200 0 0x50>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 224 17>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&mstp9_clks R8A7792_CLK_GPIO7>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+		};
+
+		gpio8: gpio@e6055300 {
+			compatible = "renesas,gpio-r8a7792",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6055300 0 0x50>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 256 17>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&mstp9_clks R8A7792_CLK_GPIO8>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+		};
+
+		gpio9: gpio@e6055400 {
+			compatible = "renesas,gpio-r8a7792",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6055400 0 0x50>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 288 17>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&mstp9_clks R8A7792_CLK_GPIO9>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+		};
+
+		gpio10: gpio@e6055500 {
+			compatible = "renesas,gpio-r8a7792",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6055500 0 0x50>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 320 32>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&mstp9_clks R8A7792_CLK_GPIO10>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+		};
+
+		gpio11: gpio@e6055600 {
+			compatible = "renesas,gpio-r8a7792",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6055600 0 0x50>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 352 30>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&mstp9_clks R8A7792_CLK_GPIO11>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a7792",
 				     "renesas,rcar-dmac";
