Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34722 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751964AbdI2LyV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:54:21 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 08/48] ARM: dts: r8a7743: Add SDHI controllers
Date: Fri, 29 Sep 2017 13:53:00 +0200
Message-Id: <63ce8a617b5129f7cb20ed0d6d822a31ecca4696.1506683482.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506683482.git.horms+renesas@verge.net.au>
References: <cover.1506683482.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Add the SDHI controllers to the r8a7743 device tree.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7743.dtsi | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 14222c72f0e0..6dd9b0b3d818 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -779,6 +779,48 @@
 			max-frequency = <97500000>;
 			status = "disabled";
 		};
+
+		sdhi0: sd@ee100000 {
+			compatible = "renesas,sdhi-r8a7743";
+			reg = <0 0xee100000 0 0x328>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 314>;
+			dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
+			       <&dmac1 0xcd>, <&dmac1 0xce>;
+			dma-names = "tx", "rx", "tx", "rx";
+			max-frequency = <195000000>;
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 314>;
+			status = "disabled";
+		};
+
+		sdhi1: sd@ee140000 {
+			compatible = "renesas,sdhi-r8a7743";
+			reg = <0 0xee140000 0 0x100>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 312>;
+			dmas = <&dmac0 0xc1>, <&dmac0 0xc2>,
+			       <&dmac1 0xc1>, <&dmac1 0xc2>;
+			dma-names = "tx", "rx", "tx", "rx";
+			max-frequency = <97500000>;
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 312>;
+			status = "disabled";
+		};
+
+		sdhi2: sd@ee160000 {
+			compatible = "renesas,sdhi-r8a7743";
+			reg = <0 0xee160000 0 0x100>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 311>;
+			dmas = <&dmac0 0xd3>, <&dmac0 0xd4>,
+			       <&dmac1 0xd3>, <&dmac1 0xd4>;
+			dma-names = "tx", "rx", "tx", "rx";
+			max-frequency = <97500000>;
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 311>;
+			status = "disabled";
+		};
 	};
 
 	/* External root clock */
-- 
2.1.4
