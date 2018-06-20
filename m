Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:45531 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750852AbeFTMBa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jun 2018 08:01:30 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: wsa@the-dreams.de, geert@linux-m68k.org, linux-spi@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: r8a77995: Add MSIOF device nodes
Date: Wed, 20 Jun 2018 14:01:20 +0200
Message-Id: <1529496081-10571-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

This patch adds MSIOF device nodes for the R8A77995 SoC.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[uli: remove unimplemented ref clock, clock-names]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
Removed clock-names and fixed the number formatting. Thanks to Geert
and Simon for the review.

CU
Uli


 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 62 +++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index eb23c85..a5c8d4a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -798,6 +798,68 @@
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
 		};
+
+		msiof0: spi@e6e90000 {
+			compatible = "renesas,msiof-r8a77995",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6e90000 0 0x64>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 211>;
+			dmas = <&dmac1 0x41>, <&dmac1 0x40>,
+			       <&dmac2 0x41>, <&dmac2 0x40>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 211>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6ea0000 {
+			compatible = "renesas,msiof-r8a77995",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6ea0000 0 0x64>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 210>;
+			dmas = <&dmac1 0x43>, <&dmac1 0x42>,
+			       <&dmac2 0x43>, <&dmac2 0x42>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 210>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6c00000 {
+			compatible = "renesas,msiof-r8a77995",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c00000 0 0x64>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 209>;
+			dmas = <&dmac0 0x45>, <&dmac0 0x44>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 209>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof3: spi@e6c10000 {
+			compatible = "renesas,msiof-r8a77995",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c10000 0 0x64>;
+			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 208>;
+			dmas = <&dmac0 0x47>, <&dmac0 0x46>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 208>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	thermal-zones {
-- 
2.7.4
