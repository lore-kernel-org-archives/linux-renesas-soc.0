Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57715 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753917AbcLLJL4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 04:11:56 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH renesas/devel 04/13] ARM: dts: r8a7791: Use R-Car Gen 2 fallback binding for i2c nodes
Date: Mon, 12 Dec 2016 10:11:33 +0100
Message-Id: <1481533902-14789-5-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1481533902-14789-1-git-send-email-horms+renesas@verge.net.au>
References: <1481533902-14789-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added R-Car Gen 2 fallback binding for i2c nodes in
DT for r8a7791 SoC.

This has no run-time effect for the current driver as the initialisation
sequence is the same for the SoC-specific binding for r8a7791 and the
fallback binding for R-Car Gen 2.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7791.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 93f446db6a21..48662c13f79a 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -444,7 +444,7 @@
 	i2c0: i2c@e6508000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,i2c-r8a7791";
+		compatible = "renesas,i2c-r8a7791", "renesas,rcar-gen2-i2c";
 		reg = <0 0xe6508000 0 0x40>;
 		interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7791_CLK_I2C0>;
@@ -456,7 +456,7 @@
 	i2c1: i2c@e6518000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,i2c-r8a7791";
+		compatible = "renesas,i2c-r8a7791", "renesas,rcar-gen2-i2c";
 		reg = <0 0xe6518000 0 0x40>;
 		interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7791_CLK_I2C1>;
@@ -468,7 +468,7 @@
 	i2c2: i2c@e6530000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,i2c-r8a7791";
+		compatible = "renesas,i2c-r8a7791", "renesas,rcar-gen2-i2c";
 		reg = <0 0xe6530000 0 0x40>;
 		interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7791_CLK_I2C2>;
@@ -480,7 +480,7 @@
 	i2c3: i2c@e6540000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,i2c-r8a7791";
+		compatible = "renesas,i2c-r8a7791", "renesas,rcar-gen2-i2c";
 		reg = <0 0xe6540000 0 0x40>;
 		interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7791_CLK_I2C3>;
@@ -492,7 +492,7 @@
 	i2c4: i2c@e6520000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,i2c-r8a7791";
+		compatible = "renesas,i2c-r8a7791", "renesas,rcar-gen2-i2c";
 		reg = <0 0xe6520000 0 0x40>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7791_CLK_I2C4>;
@@ -505,7 +505,7 @@
 		/* doesn't need pinmux */
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,i2c-r8a7791";
+		compatible = "renesas,i2c-r8a7791", "renesas,rcar-gen2-i2c";
 		reg = <0 0xe6528000 0 0x40>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7791_CLK_I2C5>;
-- 
2.7.0.rc3.207.g0ac5344
