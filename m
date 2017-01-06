Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43774 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S940173AbdAFLTE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 06:19:04 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 19/25] ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for iic nodes
Date: Fri,  6 Jan 2017 12:18:28 +0100
Message-Id: <b8075eea36546f55aca0d645561b6713d9ae562e.1483700969.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1483700969.git.horms+renesas@verge.net.au>
References: <cover.1483700969.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added R-Car Gen 2 fallback binding for iic nodes in
DT for r8a7790 SoC.

This has no run-time effect for the current driver as the initialisation
sequence is the same for the SoC-specific binding for r8a7790 and the
fallback binding for R-Car Gen 2.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 823ab536175d..ddf6a8cbe6c1 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -528,7 +528,8 @@
 	iic0: i2c@e6500000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,iic-r8a7790", "renesas,rmobile-iic";
+		compatible = "renesas,iic-r8a7790", "renesas,rcar-gen2-iic",
+			     "renesas,rmobile-iic";
 		reg = <0 0xe6500000 0 0x425>;
 		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7790_CLK_IIC0>;
@@ -542,7 +543,8 @@
 	iic1: i2c@e6510000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,iic-r8a7790", "renesas,rmobile-iic";
+		compatible = "renesas,iic-r8a7790", "renesas,rcar-gen2-iic",
+			     "renesas,rmobile-iic";
 		reg = <0 0xe6510000 0 0x425>;
 		interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7790_CLK_IIC1>;
@@ -556,7 +558,8 @@
 	iic2: i2c@e6520000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,iic-r8a7790", "renesas,rmobile-iic";
+		compatible = "renesas,iic-r8a7790", "renesas,rcar-gen2-iic",
+			     "renesas,rmobile-iic";
 		reg = <0 0xe6520000 0 0x425>;
 		interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7790_CLK_IIC2>;
@@ -570,7 +573,8 @@
 	iic3: i2c@e60b0000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,iic-r8a7790", "renesas,rmobile-iic";
+		compatible = "renesas,iic-r8a7790", "renesas,rcar-gen2-iic",
+			     "renesas,rmobile-iic";
 		reg = <0 0xe60b0000 0 0x425>;
 		interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7790_CLK_IICDVFS>;
-- 
2.7.0.rc3.207.g0ac5344
