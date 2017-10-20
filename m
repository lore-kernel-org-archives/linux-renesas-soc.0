Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752665AbdJTKaP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Oct 2017 06:30:15 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 27/42] ARM: dts: r8a7793: Use R-Car GPIO Gen2 fallback compat string
Date: Fri, 20 Oct 2017 12:28:54 +0200
Message-Id: <c37417dca041d76a66a78012f93e9a3c879706c4.1508493785.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1508493785.git.horms+renesas@verge.net.au>
References: <cover.1508493785.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car GPIO Gen2 fallback compat string
in place of now deprecated non-generation specific
R-Car GPIO fallback compat string in the DT of the r8a7793 SoC.

This should have no run-time effect as the driver matches against
the per-SoC compat string before considering the fallback compat string.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7793.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index aa19b93494bf..76418c375a10 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -115,7 +115,7 @@
 	};
 
 	gpio0: gpio@e6050000 {
-		compatible = "renesas,gpio-r8a7793", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7793", "renesas,rcar-gen2-gpio";
 		reg = <0 0xe6050000 0 0x50>;
 		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -129,7 +129,7 @@
 	};
 
 	gpio1: gpio@e6051000 {
-		compatible = "renesas,gpio-r8a7793", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7793", "renesas,rcar-gen2-gpio";
 		reg = <0 0xe6051000 0 0x50>;
 		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -143,7 +143,7 @@
 	};
 
 	gpio2: gpio@e6052000 {
-		compatible = "renesas,gpio-r8a7793", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7793", "renesas,rcar-gen2-gpio";
 		reg = <0 0xe6052000 0 0x50>;
 		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -157,7 +157,7 @@
 	};
 
 	gpio3: gpio@e6053000 {
-		compatible = "renesas,gpio-r8a7793", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7793", "renesas,rcar-gen2-gpio";
 		reg = <0 0xe6053000 0 0x50>;
 		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -171,7 +171,7 @@
 	};
 
 	gpio4: gpio@e6054000 {
-		compatible = "renesas,gpio-r8a7793", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7793", "renesas,rcar-gen2-gpio";
 		reg = <0 0xe6054000 0 0x50>;
 		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -185,7 +185,7 @@
 	};
 
 	gpio5: gpio@e6055000 {
-		compatible = "renesas,gpio-r8a7793", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7793", "renesas,rcar-gen2-gpio";
 		reg = <0 0xe6055000 0 0x50>;
 		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -199,7 +199,7 @@
 	};
 
 	gpio6: gpio@e6055400 {
-		compatible = "renesas,gpio-r8a7793", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7793", "renesas,rcar-gen2-gpio";
 		reg = <0 0xe6055400 0 0x50>;
 		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -213,7 +213,7 @@
 	};
 
 	gpio7: gpio@e6055800 {
-		compatible = "renesas,gpio-r8a7793", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7793", "renesas,rcar-gen2-gpio";
 		reg = <0 0xe6055800 0 0x50>;
 		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
-- 
2.11.0
