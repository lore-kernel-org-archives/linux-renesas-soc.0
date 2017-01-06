Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43610 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S940140AbdAFLSS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 06:18:18 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 11/16] arm64: dts: r8a7796: Use R-Car Gen 3 fallback binding for i2c nodes
Date: Fri,  6 Jan 2017 12:17:53 +0100
Message-Id: <5553e2196229501346f262a9ebdc4e4ed74ff45c.1483700694.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1483700694.git.horms+renesas@verge.net.au>
References: <cover.1483700694.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added R-Car Gen 3 fallback binding for i2c nodes in
DT for r8a7796 SoC.

This has no run-time effect for the current driver as the initialisation
sequence is the same for the SoC-specific binding for r8a7796 and the
fallback binding for R-Car Gen 3.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index a37bb5eb062c..26a0506e3013 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -269,7 +269,8 @@
 		i2c0: i2c@e6500000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "renesas,i2c-r8a7796";
+			compatible = "renesas,i2c-r8a7796",
+				     "renesas,rcar-gen3-i2c";
 			reg = <0 0xe6500000 0 0x40>;
 			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 931>;
@@ -284,7 +285,8 @@
 		i2c1: i2c@e6508000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "renesas,i2c-r8a7796";
+			compatible = "renesas,i2c-r8a7796",
+				     "renesas,rcar-gen3-i2c";
 			reg = <0 0xe6508000 0 0x40>;
 			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 930>;
@@ -299,7 +301,8 @@
 		i2c2: i2c@e6510000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "renesas,i2c-r8a7796";
+			compatible = "renesas,i2c-r8a7796",
+				     "renesas,rcar-gen3-i2c";
 			reg = <0 0xe6510000 0 0x40>;
 			interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 929>;
@@ -314,7 +317,8 @@
 		i2c3: i2c@e66d0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "renesas,i2c-r8a7796";
+			compatible = "renesas,i2c-r8a7796",
+				     "renesas,rcar-gen3-i2c";
 			reg = <0 0xe66d0000 0 0x40>;
 			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 928>;
@@ -328,7 +332,8 @@
 		i2c4: i2c@e66d8000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "renesas,i2c-r8a7796";
+			compatible = "renesas,i2c-r8a7796",
+				     "renesas,rcar-gen3-i2c";
 			reg = <0 0xe66d8000 0 0x40>;
 			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 927>;
@@ -342,7 +347,8 @@
 		i2c5: i2c@e66e0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "renesas,i2c-r8a7796";
+			compatible = "renesas,i2c-r8a7796",
+				     "renesas,rcar-gen3-i2c";
 			reg = <0 0xe66e0000 0 0x40>;
 			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 919>;
@@ -356,7 +362,8 @@
 		i2c6: i2c@e66e8000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "renesas,i2c-r8a7796";
+			compatible = "renesas,i2c-r8a7796",
+				     "renesas,rcar-gen3-i2c";
 			reg = <0 0xe66e8000 0 0x40>;
 			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
-- 
2.7.0.rc3.207.g0ac5344
