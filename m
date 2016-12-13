Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57088 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932369AbcLMLqS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2016 06:46:18 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 renesas/devel 01/13] ARM: dts: r8a7779: Use R-Car Gen 1 fallback binding for i2c nodes
Date: Tue, 13 Dec 2016 12:45:47 +0100
Message-Id: <1481629559-14187-2-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1481629559-14187-1-git-send-email-horms+renesas@verge.net.au>
References: <1481629559-14187-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added R-Car Gen 1 fallback binding for i2c nodes in
DT for r8a7779 SoC.

This has no run-time effect for the current driver as the initialisation
sequence is the same for the SoC-specific binding for r8a7779 and the
fallback binding for R-Car Gen 1.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7779.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 55a7c1e37c57..f47a0edc26d4 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -173,7 +173,7 @@
 	i2c0: i2c@ffc70000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,i2c-r8a7779";
+		compatible = "renesas,i2c-r8a7779", "renesas,rcar-gen1-i2c";
 		reg = <0xffc70000 0x1000>;
 		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7779_CLK_I2C0>;
@@ -184,7 +184,7 @@
 	i2c1: i2c@ffc71000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,i2c-r8a7779";
+		compatible = "renesas,i2c-r8a7779", "renesas,rcar-gen1-i2c";
 		reg = <0xffc71000 0x1000>;
 		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7779_CLK_I2C1>;
@@ -195,7 +195,7 @@
 	i2c2: i2c@ffc72000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,i2c-r8a7779";
+		compatible = "renesas,i2c-r8a7779", "renesas,rcar-gen1-i2c";
 		reg = <0xffc72000 0x1000>;
 		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7779_CLK_I2C2>;
@@ -206,7 +206,7 @@
 	i2c3: i2c@ffc73000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "renesas,i2c-r8a7779";
+		compatible = "renesas,i2c-r8a7779", "renesas,rcar-gen1-i2c";
 		reg = <0xffc73000 0x1000>;
 		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7779_CLK_I2C3>;
-- 
2.7.0.rc3.207.g0ac5344
