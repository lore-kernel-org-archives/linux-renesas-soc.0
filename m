Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39358 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964879AbeFMPJ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 11:09:59 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH/RFT v2 2/2] arm64: dts: r8a77995: Add all HSCIF nodes
Date: Wed, 13 Jun 2018 17:09:51 +0200
Message-Id: <20180613150951.32322-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds the device nodes all HSCIF serial ports
incl. clocks and power domain to the R8A77995 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
[simon: updated internal clock from S3D1 to S3D1C to match documentation]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

 Based on renesas-devel-20180613-v4.17

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 16cbb34692ad..0a9caf9cdc86 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -242,6 +242,41 @@
 			resets = <&cpg 407>;
 		};
 
+		hscif0: serial@e6540000 {
+			compatible = "renesas,hscif-r8a77995",
+				     "renesas,rcar-gen3-hscif",
+				     "renesas,hscif";
+			reg = <0 0xe6540000 0 0x60>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 520>,
+				 <&cpg CPG_CORE R8A77995_CLK_S3D1C>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x31>, <&dmac1 0x30>,
+			       <&dmac2 0x31>, <&dmac2 0x30>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 520>;
+			status = "disabled";
+		};
+
+		hscif3: serial@e66a0000 {
+			compatible = "renesas,hscif-r8a77995",
+				     "renesas,rcar-gen3-hscif",
+				     "renesas,hscif";
+			reg = <0 0xe66a0000 0 0x60>;
+			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 517>,
+				 <&cpg CPG_CORE R8A77995_CLK_S3D1C>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x37>, <&dmac0 0x36>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 517>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@e6500000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.11.0
