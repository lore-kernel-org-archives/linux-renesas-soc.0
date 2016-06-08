Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56528 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751684AbcFHBAZ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 21:00:25 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 11/30] ARM: dts: r8a73a4: Fix W=1 dtc warnings
Date: Wed,  8 Jun 2016 09:59:41 +0900
Message-Id: <b0da45c60d2f7b08128a6cd1216ac0ac7d8954c7.1465346599.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1465346599.git.horms+renesas@verge.net.au>
References: <cover.1465346599.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Warning (unit_address_vs_reg): Node /cache-controller@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /cache-controller@1 has a unit name, but no reg property

Move the cache-controller nodes under the cpus node, and make their
unit names and reg properties match the MPIDR values.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a73a4.dtsi | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index 6954912a3753..ca8672778fe0 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -31,6 +31,24 @@
 			power-domains = <&pd_a2sl>;
 			next-level-cache = <&L2_CA15>;
 		};
+
+		L2_CA15: cache-controller@0 {
+			compatible = "cache";
+			reg = <0>;
+			clocks = <&cpg_clocks R8A73A4_CLK_Z>;
+			power-domains = <&pd_a3sm>;
+			cache-unified;
+			cache-level = <2>;
+		};
+
+		L2_CA7: cache-controller@100 {
+			compatible = "cache";
+			reg = <0x100>;
+			clocks = <&cpg_clocks R8A73A4_CLK_Z2>;
+			power-domains = <&pd_a3km>;
+			cache-unified;
+			cache-level = <2>;
+		};
 	};
 
 	ptm {
@@ -46,22 +64,6 @@
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-	L2_CA15: cache-controller@0 {
-		compatible = "cache";
-		clocks = <&cpg_clocks R8A73A4_CLK_Z>;
-		power-domains = <&pd_a3sm>;
-		cache-unified;
-		cache-level = <2>;
-	};
-
-	L2_CA7: cache-controller@1 {
-		compatible = "cache";
-		clocks = <&cpg_clocks R8A73A4_CLK_Z2>;
-		power-domains = <&pd_a3km>;
-		cache-unified;
-		cache-level = <2>;
-	};
-
 	dbsc1: memory-controller@e6790000 {
 		compatible = "renesas,dbsc-r8a73a4";
 		reg = <0 0xe6790000 0 0x10000>;
-- 
2.1.4
