Return-Path: <horms@penelope.isobedori.kobe.vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 41/70] ARM: dts: r8a7778: Add SCIF fallback compatibility strings
Date: Thu,  4 Feb 2016 15:29:35 +0100
Message-Id: <53149a68df5ef39cebce5dae7344b3f59f3df13c.1454595846.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1454595846.git.horms+renesas@verge.net.au>
References: <cover.1454595846.git.horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7778.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index fc5e7243467a..8ea1792c5146 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -297,7 +297,8 @@
 	};
 
 	scif0: serial@ffe40000 {
-		compatible = "renesas,scif-r8a7778", "renesas,scif";
+		compatible = "renesas,scif-r8a7778", "renesas,rcar-gen1-scif",
+			     "renesas,scif";
 		reg = <0xffe40000 0x100>;
 		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7778_CLK_SCIF0>;
@@ -307,7 +308,8 @@
 	};
 
 	scif1: serial@ffe41000 {
-		compatible = "renesas,scif-r8a7778", "renesas,scif";
+		compatible = "renesas,scif-r8a7778", "renesas,rcar-gen1-scif",
+			     "renesas,scif";
 		reg = <0xffe41000 0x100>;
 		interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7778_CLK_SCIF1>;
@@ -317,7 +319,8 @@
 	};
 
 	scif2: serial@ffe42000 {
-		compatible = "renesas,scif-r8a7778", "renesas,scif";
+		compatible = "renesas,scif-r8a7778", "renesas,rcar-gen1-scif",
+			     "renesas,scif";
 		reg = <0xffe42000 0x100>;
 		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7778_CLK_SCIF2>;
@@ -327,7 +330,8 @@
 	};
 
 	scif3: serial@ffe43000 {
-		compatible = "renesas,scif-r8a7778", "renesas,scif";
+		compatible = "renesas,scif-r8a7778", "renesas,rcar-gen1-scif",
+			     "renesas,scif";
 		reg = <0xffe43000 0x100>;
 		interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7778_CLK_SCIF3>;
@@ -337,7 +341,8 @@
 	};
 
 	scif4: serial@ffe44000 {
-		compatible = "renesas,scif-r8a7778", "renesas,scif";
+		compatible = "renesas,scif-r8a7778", "renesas,rcar-gen1-scif",
+			     "renesas,scif";
 		reg = <0xffe44000 0x100>;
 		interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7778_CLK_SCIF4>;
@@ -347,7 +352,8 @@
 	};
 
 	scif5: serial@ffe45000 {
-		compatible = "renesas,scif-r8a7778", "renesas,scif";
+		compatible = "renesas,scif-r8a7778", "renesas,rcar-gen1-scif",
+			     "renesas,scif";
 		reg = <0xffe45000 0x100>;
 		interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7778_CLK_SCIF5>;
-- 
2.7.0.rc3.207.g0ac5344
