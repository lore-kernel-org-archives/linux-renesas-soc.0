Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36294 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932124AbcF3ORV (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 10:17:21 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 24/41] ARM: dts: r8a7792: add [H]SCIF support
Date: Thu, 30 Jun 2016 16:15:44 +0200
Message-Id: <e66796b9bb87d2c48f68e5eb27dcfbc4c26c18d4.1467294011.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1467294011.git.horms+renesas@verge.net.au>
References: <cover.1467294011.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Describe [H]SCIFs in the R8A7792 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792.dtsi | 90 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index 6017ea5280a0..b6e34b431a51 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -143,6 +143,96 @@
 			dma-channels = <15>;
 		};
 
+		scif0: serial@e6e60000 {
+			compatible = "renesas,scif-r8a7792",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6e60000 0 64>;
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7792_CLK_SCIF0>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x29>, <&dmac0 0x2a>,
+			       <&dmac1 0x29>, <&dmac1 0x2a>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif1: serial@e6e68000 {
+			compatible = "renesas,scif-r8a7792",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6e68000 0 64>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7792_CLK_SCIF1>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2d>, <&dmac0 0x2e>,
+			       <&dmac1 0x2d>, <&dmac1 0x2e>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif2: serial@e6e58000 {
+			compatible = "renesas,scif-r8a7792",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6e58000 0 64>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7792_CLK_SCIF2>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2b>, <&dmac0 0x2c>,
+			       <&dmac1 0x2b>, <&dmac1 0x2c>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif3: serial@e6ea8000 {
+			compatible = "renesas,scif-r8a7792",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6ea8000 0 64>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7792_CLK_SCIF3>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2f>, <&dmac0 0x30>,
+			       <&dmac1 0x2f>, <&dmac1 0x30>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		hscif0: serial@e62c0000 {
+			compatible = "renesas,hscif-r8a7792",
+				     "renesas,rcar-gen2-hscif", "renesas,hscif";
+			reg = <0 0xe62c0000 0 96>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7792_CLK_HSCIF0>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x39>, <&dmac0 0x3a>,
+			       <&dmac1 0x39>, <&dmac1 0x3a>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		hscif1: serial@e62c8000 {
+			compatible = "renesas,hscif-r8a7792",
+				     "renesas,rcar-gen2-hscif", "renesas,hscif";
+			reg = <0 0xe62c8000 0 96>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7792_CLK_HSCIF1>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x4d>, <&dmac0 0x4e>,
+			       <&dmac1 0x4d>, <&dmac1 0x4e>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		/* Special CPG clocks */
 		cpg_clocks: cpg_clocks@e6150000 {
 			compatible = "renesas,r8a7792-cpg-clocks",
-- 
2.7.0.rc3.207.g0ac5344
