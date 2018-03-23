Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:39130 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752343AbeCWJRf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Mar 2018 05:17:35 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: r8a77965: Add all MSIOF device nodes
Date: Fri, 23 Mar 2018 10:17:32 +0100
Message-Id: <1521796652-26136-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Add the device nodes for all MSIOF SPI controllers.

Based on several similar patches of the R8A7796 device tree
by Geert Uytterhoeven <geert+renesas@glider.be>
and Simon Horman <horms+renesas@verge.net.au>.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Use numerical power domain indices for initial r8a77965.dtsi]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested with arch/arm64/boot/dts/renesas/salvator-x-exio-d-msiof3a-2xHC595.dtso
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/renesas-overlays&id=b52ff2b481438cedd68effcad7ea2fc85b14f5f2
and blinkenlights.

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 62 +++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 6f748e94a9016e01..4371be3e869a258f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -805,6 +805,68 @@
 			/* placeholder */
 		};
 
+		msiof0: spi@e6e90000 {
+			compatible = "renesas,msiof-r8a77965",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6e90000 0 0x0064>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 211>;
+			dmas = <&dmac1 0x41>, <&dmac1 0x40>,
+			       <&dmac2 0x41>, <&dmac2 0x40>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 211>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6ea0000 {
+			compatible = "renesas,msiof-r8a77965",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6ea0000 0 0x0064>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 210>;
+			dmas = <&dmac1 0x43>, <&dmac1 0x42>,
+			       <&dmac2 0x43>, <&dmac2 0x42>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 210>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6c00000 {
+			compatible = "renesas,msiof-r8a77965",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c00000 0 0x0064>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 209>;
+			dmas = <&dmac0 0x45>, <&dmac0 0x44>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 209>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof3: spi@e6c10000 {
+			compatible = "renesas,msiof-r8a77965",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c10000 0 0x0064>;
+			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 208>;
+			dmas = <&dmac0 0x47>, <&dmac0 0x46>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 208>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		du: display@feb00000 {
 			reg = <0 0xfeb00000 0 0x80000>,
 			      <0 0xfeb90000 0 0x14>;
-- 
2.7.4
