Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57088 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932441AbcLMLqU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2016 06:46:20 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 renesas/devel 07/13] ARM: dts: r8a7794: Use R-Car Gen 2 fallback binding for i2c nodes
Date: Tue, 13 Dec 2016 12:45:53 +0100
Message-Id: <1481629559-14187-8-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1481629559-14187-1-git-send-email-horms+renesas@verge.net.au>
References: <1481629559-14187-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added R-Car Gen 2 fallback binding for i2c nodes in
DT for r8a7794 SoC.

This has no run-time effect for the current driver as the initialisation
sequence is the same for the SoC-specific binding for r8a7794 and the
fallback binding for R-Car Gen 2.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7794.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 78e964d5dacb..5fd382a5a7b2 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -611,7 +611,7 @@
 
 	/* The memory map in the User's Manual maps the cores to bus numbers */
 	i2c0: i2c@e6508000 {
-		compatible = "renesas,i2c-r8a7794";
+		compatible = "renesas,i2c-r8a7794", "renesas,rcar-gen2-i2c";
 		reg = <0 0xe6508000 0 0x40>;
 		interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7794_CLK_I2C0>;
@@ -623,7 +623,7 @@
 	};
 
 	i2c1: i2c@e6518000 {
-		compatible = "renesas,i2c-r8a7794";
+		compatible = "renesas,i2c-r8a7794", "renesas,rcar-gen2-i2c";
 		reg = <0 0xe6518000 0 0x40>;
 		interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7794_CLK_I2C1>;
@@ -635,7 +635,7 @@
 	};
 
 	i2c2: i2c@e6530000 {
-		compatible = "renesas,i2c-r8a7794";
+		compatible = "renesas,i2c-r8a7794", "renesas,rcar-gen2-i2c";
 		reg = <0 0xe6530000 0 0x40>;
 		interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7794_CLK_I2C2>;
@@ -647,7 +647,7 @@
 	};
 
 	i2c3: i2c@e6540000 {
-		compatible = "renesas,i2c-r8a7794";
+		compatible = "renesas,i2c-r8a7794", "renesas,rcar-gen2-i2c";
 		reg = <0 0xe6540000 0 0x40>;
 		interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7794_CLK_I2C3>;
@@ -659,7 +659,7 @@
 	};
 
 	i2c4: i2c@e6520000 {
-		compatible = "renesas,i2c-r8a7794";
+		compatible = "renesas,i2c-r8a7794", "renesas,rcar-gen2-i2c";
 		reg = <0 0xe6520000 0 0x40>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7794_CLK_I2C4>;
@@ -671,7 +671,7 @@
 	};
 
 	i2c5: i2c@e6528000 {
-		compatible = "renesas,i2c-r8a7794";
+		compatible = "renesas,i2c-r8a7794", "renesas,rcar-gen2-i2c";
 		reg = <0 0xe6528000 0 0x40>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7794_CLK_I2C5>;
-- 
2.7.0.rc3.207.g0ac5344
