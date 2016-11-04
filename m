Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41481 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755983AbcKDJos (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 05:44:48 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 11/29] ARM: dts: r8a7792: add MSIOF clocks
Date: Fri,  4 Nov 2016 10:44:10 +0100
Message-Id: <5cef452bf895cc38af3a4e20f85c20c1a4d41001.1478252309.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1478252308.git.horms+renesas@verge.net.au>
References: <cover.1478252308.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Describe the MSIOF0/1 clocks and their parent, MP clock in the R8A7792
device  tree.

Based  on the original (and large) patch by Vladimir Barinov
<vladimir.barinov@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792.dtsi | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index 713141d38b3e..839cd70c4c75 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -763,6 +763,13 @@
 			clock-div = <48>;
 			clock-mult = <1>;
 		};
+		mp_clk: mp {
+			compatible = "fixed-factor-clock";
+			clocks = <&pll1_div2_clk>;
+			#clock-cells = <0>;
+			clock-div = <15>;
+			clock-mult = <1>;
+		};
 		m2_clk: m2 {
 			compatible = "fixed-factor-clock";
 			clocks = <&cpg_clocks R8A7792_CLK_PLL1>;
@@ -793,6 +800,15 @@
 		};
 
 		/* Gate clocks */
+		mstp0_clks: mstp0_clks@e6150130 {
+			compatible = "renesas,r8a7792-mstp-clocks",
+				     "renesas,cpg-mstp-clocks";
+			reg = <0 0xe6150130 0 4>, <0 0xe6150030 0 4>;
+			clocks = <&mp_clk>;
+			#clock-cells = <1>;
+			clock-indices = <R8A7792_CLK_MSIOF0>;
+			clock-output-names = "msiof0";
+		};
 		mstp1_clks: mstp1_clks@e6150134 {
 			compatible = "renesas,r8a7792-mstp-clocks",
 				     "renesas,cpg-mstp-clocks";
@@ -811,12 +827,13 @@
 			compatible = "renesas,r8a7792-mstp-clocks",
 				     "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150138 0 4>, <0 0xe6150040 0 4>;
-			clocks = <&zs_clk>, <&zs_clk>;
+			clocks = <&mp_clk>, <&zs_clk>, <&zs_clk>;
 			#clock-cells = <1>;
 			clock-indices = <
+				R8A7792_CLK_MSIOF1
 				R8A7792_CLK_SYS_DMAC1 R8A7792_CLK_SYS_DMAC0
 			>;
-			clock-output-names = "sys-dmac1", "sys-dmac0";
+			clock-output-names = "msiof1", "sys-dmac1", "sys-dmac0";
 		};
 		mstp3_clks: mstp3_clks@e615013c {
 			compatible = "renesas,r8a7792-mstp-clocks",
-- 
2.7.0.rc3.207.g0ac5344
