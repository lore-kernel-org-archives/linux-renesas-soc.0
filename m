Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43774 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S940178AbdAFLTK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 06:19:10 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 23/25] ARM: dts: r8a7791: Use R-Car Gen 2 fallback binding for msiof nodes
Date: Fri,  6 Jan 2017 12:18:32 +0100
Message-Id: <fdda1f9e23f17effe32fd349aefab665b58b8d64.1483700969.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1483700969.git.horms+renesas@verge.net.au>
References: <cover.1483700969.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added R-Car Gen 2 fallback binding for msiof nodes in
DT for r8a7791 SoC.

This has no run-time effect for the current driver as the initialisation
sequence is the same for the SoC-specific binding for r8a7791 and the
fallback binding for R-Car Gen 2.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 55872fc8fa4c..06486664d754 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1521,7 +1521,8 @@
 	};
 
 	msiof0: spi@e6e20000 {
-		compatible = "renesas,msiof-r8a7791";
+		compatible = "renesas,msiof-r8a7791",
+			     "renesas,rcar-gen2-msiof";
 		reg = <0 0xe6e20000 0 0x0064>;
 		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7791_CLK_MSIOF0>;
@@ -1535,7 +1536,8 @@
 	};
 
 	msiof1: spi@e6e10000 {
-		compatible = "renesas,msiof-r8a7791";
+		compatible = "renesas,msiof-r8a7791",
+			     "renesas,rcar-gen2-msiof";
 		reg = <0 0xe6e10000 0 0x0064>;
 		interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7791_CLK_MSIOF1>;
@@ -1549,7 +1551,8 @@
 	};
 
 	msiof2: spi@e6e00000 {
-		compatible = "renesas,msiof-r8a7791";
+		compatible = "renesas,msiof-r8a7791",
+			     "renesas,rcar-gen2-msiof";
 		reg = <0 0xe6e00000 0 0x0064>;
 		interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7791_CLK_MSIOF2>;
-- 
2.7.0.rc3.207.g0ac5344
