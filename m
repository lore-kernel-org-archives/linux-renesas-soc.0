Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54944 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934777AbdLRVdB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 16:33:01 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/2] ARM: dts: r8a7792: move timer node out of bus
Date: Mon, 18 Dec 2017 22:32:33 +0100
Message-Id: <20171218213233.3373-3-horms+renesas@verge.net.au>
In-Reply-To: <20171218213233.3373-1-horms+renesas@verge.net.au>
References: <20171218213233.3373-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The timer node does not have any register properties and thus shouldn't be
placed on the bus.

This problem is flagged by the compiler as follows:
$ make dtbs W=1
...
  DTC     arch/arm/boot/dts/r8a7792-wheat.dtb
arch/arm/boot/dts/r8a7792-blanche.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
arch/arm/boot/dts/r8a7792-wheat.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792.dtsi | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index d31258958c36..5317e353569f 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -137,18 +137,6 @@
 			resets = <&cpg 407>;
 		};
 
-		timer {
-			compatible = "arm,armv7-timer";
-			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
-				      IRQ_TYPE_LEVEL_LOW)>,
-				     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) |
-				      IRQ_TYPE_LEVEL_LOW)>,
-				     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) |
-				      IRQ_TYPE_LEVEL_LOW)>,
-				     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
-				      IRQ_TYPE_LEVEL_LOW)>;
-		};
-
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a7792-rst";
 			reg = <0 0xe6160000 0 0x0100>;
@@ -857,4 +845,12 @@
 			#reset-cells = <1>;
 		};
 	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	};
 };
-- 
2.11.0
