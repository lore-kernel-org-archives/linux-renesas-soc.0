Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57433 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936243AbcKWUP7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 15:15:59 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 22/31] ARM: dts: r8a7745: add IRQC support
Date: Wed, 23 Nov 2016 21:14:29 +0100
Message-Id: <28c43fbb3ca0a9a8f547aece94dac8d791358444.1479931687.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1479931686.git.horms+renesas@verge.net.au>
References: <cover.1479931686.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Describe the IRQC interrupt controller in the R8A7745 device tree.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7745.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 6fe48157f906..0b2e2f37150f 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -62,6 +62,25 @@
 						 IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		irqc: interrupt-controller@e61c0000 {
+			compatible = "renesas,irqc-r8a7745", "renesas,irqc";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			reg = <0 0xe61c0000 0 0x200>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 407>;
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+		};
+
 		timer {
 			compatible = "arm,armv7-timer";
 			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
-- 
2.7.0.rc3.207.g0ac5344
