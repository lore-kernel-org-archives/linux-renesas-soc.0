Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54687 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933632AbdDGP6z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 11:58:55 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 13/22] ARM: dts: r8a7794: Add Z2 clock
Date: Fri,  7 Apr 2017 11:58:14 -0400
Message-Id: <57ff9d736e05bede56fdb47599fdddb3408d4651.1491580547.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1491580547.git.horms+renesas@verge.net.au>
References: <cover.1491580547.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add the Z2 clock (Cortex-A7 CPU core clock), which uses a fixed divider,
and link the first CPU node to it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7794.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 2f6e94fd408c..a19b884fb258 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -43,6 +43,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0>;
 			clock-frequency = <1000000000>;
+			clocks = <&z2_clk>;
 			power-domains = <&sysc R8A7794_PD_CA7_CPU0>;
 			next-level-cache = <&L2_CA7>;
 		};
@@ -1064,6 +1065,13 @@
 			clock-div = <2>;
 			clock-mult = <1>;
 		};
+		z2_clk: z2 {
+			compatible = "fixed-factor-clock";
+			clocks = <&cpg_clocks R8A7794_CLK_PLL0>;
+			#clock-cells = <0>;
+			clock-div = <1>;
+			clock-mult = <1>;
+		};
 		zg_clk: zg {
 			compatible = "fixed-factor-clock";
 			clocks = <&cpg_clocks R8A7794_CLK_PLL1>;
-- 
2.7.0.rc3.207.g0ac5344
