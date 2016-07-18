Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36915 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751805AbcGRCjs (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 17 Jul 2016 22:39:48 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] ARM: dts: r8a7792: add PLL1 divided by 2 clock
Date: Mon, 18 Jul 2016 11:39:42 +0900
Message-Id: <4b9b7b3a2c91e1ebf8be9c7efd4839b91d66e87e.1468808109.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1468808109.git.horms+renesas@verge.net.au>
References: <cover.1468808109.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Despite the fact that QSPI clock has PLL1/VCOx1/4 clock as a parent, the
latter hasn't been added to the R8A7792 device tree. This patch corrects
that oversight.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index 75256ef4a04d..d5fd0762e2d6 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -284,6 +284,13 @@
 		};
 
 		/* Fixed factor clocks */
+		pll1_div2_clk: pll1_div2 {
+			compatible = "fixed-factor-clock";
+			clocks = <&cpg_clocks R8A7792_CLK_PLL1>;
+			#clock-cells = <0>;
+			clock-div = <2>;
+			clock-mult = <1>;
+		};
 		zs_clk: zs {
 			compatible = "fixed-factor-clock";
 			clocks = <&cpg_clocks R8A7792_CLK_PLL1>;
-- 
2.7.0.rc3.207.g0ac5344
