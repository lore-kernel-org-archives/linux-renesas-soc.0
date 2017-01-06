Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43610 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S940144AbdAFLSZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 06:18:25 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 15/16] arm64: dts: r8a7796: Use R-Car Gen 3 fallback binding for msiof nodes
Date: Fri,  6 Jan 2017 12:17:57 +0100
Message-Id: <8b51f97138ca22b6ae728a434215a05b7e5bbc63.1483700694.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1483700694.git.horms+renesas@verge.net.au>
References: <cover.1483700694.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added R-Car Gen 3 fallback binding for msiof nodes in
DT for r8a7796 SoC.

This has no run-time effect for the current driver as the initialisation
sequence is the same for the SoC-specific binding for r8a7796 and the
fallback binding for R-Car Gen 3.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index d4beb15b076a..eb446d966621 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -485,7 +485,8 @@
 		};
 
 		msiof0: spi@e6e90000 {
-			compatible = "renesas,msiof-r8a7796";
+			compatible = "renesas,msiof-r8a7796",
+				     "renesas,rcar-gen3-msiof";
 			reg = <0 0xe6e90000 0 0x0064>;
 			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 211>;
@@ -499,7 +500,8 @@
 		};
 
 		msiof1: spi@e6ea0000 {
-			compatible = "renesas,msiof-r8a7796";
+			compatible = "renesas,msiof-r8a7796",
+				     "renesas,rcar-gen3-msiof";
 			reg = <0 0xe6ea0000 0 0x0064>;
 			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 210>;
@@ -513,7 +515,8 @@
 		};
 
 		msiof2: spi@e6c00000 {
-			compatible = "renesas,msiof-r8a7796";
+			compatible = "renesas,msiof-r8a7796",
+				     "renesas,rcar-gen3-msiof";
 			reg = <0 0xe6c00000 0 0x0064>;
 			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 209>;
@@ -526,7 +529,8 @@
 		};
 
 		msiof3: spi@e6c10000 {
-			compatible = "renesas,msiof-r8a7796";
+			compatible = "renesas,msiof-r8a7796",
+				     "renesas,rcar-gen3-msiof";
 			reg = <0 0xe6c10000 0 0x0064>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 208>;
-- 
2.7.0.rc3.207.g0ac5344
