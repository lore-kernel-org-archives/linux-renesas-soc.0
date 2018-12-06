Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbeLFV64 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:58:56 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 11/34] ARM: dts: r8a7744: Add SDHI nodes
Date: Thu,  6 Dec 2018 13:58:06 -0800
Message-Id: <b591e323b271fdc2ffdc40eaf06e926a1e272994.1544125558.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544125558.git.horms+renesas@verge.net.au>
References: <cover.1544125558.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Add SDHI nodes to the DT of the r8a7744 SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7744.dtsi | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 57e0be34b989..97b417c1b5f9 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -866,14 +866,49 @@
 			/* placeholder */
 		};
 
+		sdhi0: sd@ee100000 {
+			compatible = "renesas,sdhi-r8a7744",
+				     "renesas,rcar-gen2-sdhi";
+			reg = <0 0xee100000 0 0x328>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 314>;
+			dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
+			       <&dmac1 0xcd>, <&dmac1 0xce>;
+			dma-names = "tx", "rx", "tx", "rx";
+			max-frequency = <195000000>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 314>;
+			status = "disabled";
+		};
+
 		sdhi1: sd@ee140000 {
+			compatible = "renesas,sdhi-r8a7744",
+				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee140000 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 312>;
+			dmas = <&dmac0 0xc1>, <&dmac0 0xc2>,
+			       <&dmac1 0xc1>, <&dmac1 0xc2>;
+			dma-names = "tx", "rx", "tx", "rx";
+			max-frequency = <97500000>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 312>;
+			status = "disabled";
 		};
 
 		sdhi2: sd@ee160000 {
+			compatible = "renesas,sdhi-r8a7744",
+				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee160000 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 311>;
+			dmas = <&dmac0 0xd3>, <&dmac0 0xd4>,
+			       <&dmac1 0xd3>, <&dmac1 0xd4>;
+			dma-names = "tx", "rx", "tx", "rx";
+			max-frequency = <97500000>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 311>;
+			status = "disabled";
 		};
 
 		gic: interrupt-controller@f1001000 {
-- 
2.11.0
