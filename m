Return-Path: <horms@penelope.isobedori.kobe.vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 42/70] ARM: dts: r8a7779: Add SCIF fallback compatibility strings
Date: Thu,  4 Feb 2016 15:29:36 +0100
Message-Id: <2add0b94bb9db2ba387108461e432de339eb2608.1454595846.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1454595846.git.horms+renesas@verge.net.au>
References: <cover.1454595846.git.horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7779.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 93f3fdf95e31..1671839f55a6 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -211,7 +211,8 @@
 	};
 
 	scif0: serial@ffe40000 {
-		compatible = "renesas,scif-r8a7779", "renesas,scif";
+		compatible = "renesas,scif-r8a7779", "renesas,rcar-gen1-scif",
+			     "renesas,scif";
 		reg = <0xffe40000 0x100>;
 		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7779_CLK_SCIF0>;
@@ -221,7 +222,8 @@
 	};
 
 	scif1: serial@ffe41000 {
-		compatible = "renesas,scif-r8a7779", "renesas,scif";
+		compatible = "renesas,scif-r8a7779", "renesas,rcar-gen1-scif",
+			     "renesas,scif";
 		reg = <0xffe41000 0x100>;
 		interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7779_CLK_SCIF1>;
@@ -231,7 +233,8 @@
 	};
 
 	scif2: serial@ffe42000 {
-		compatible = "renesas,scif-r8a7779", "renesas,scif";
+		compatible = "renesas,scif-r8a7779", "renesas,rcar-gen1-scif",
+			     "renesas,scif";
 		reg = <0xffe42000 0x100>;
 		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7779_CLK_SCIF2>;
@@ -241,7 +244,8 @@
 	};
 
 	scif3: serial@ffe43000 {
-		compatible = "renesas,scif-r8a7779", "renesas,scif";
+		compatible = "renesas,scif-r8a7779", "renesas,rcar-gen1-scif",
+			     "renesas,scif";
 		reg = <0xffe43000 0x100>;
 		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7779_CLK_SCIF3>;
@@ -251,7 +255,8 @@
 	};
 
 	scif4: serial@ffe44000 {
-		compatible = "renesas,scif-r8a7779", "renesas,scif";
+		compatible = "renesas,scif-r8a7779", "renesas,rcar-gen1-scif",
+			     "renesas,scif";
 		reg = <0xffe44000 0x100>;
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7779_CLK_SCIF4>;
@@ -261,7 +266,8 @@
 	};
 
 	scif5: serial@ffe45000 {
-		compatible = "renesas,scif-r8a7779", "renesas,scif";
+		compatible = "renesas,scif-r8a7779", "renesas,rcar-gen1-scif",
+			     "renesas,scif";
 		reg = <0xffe45000 0x100>;
 		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7779_CLK_SCIF5>;
-- 
2.7.0.rc3.207.g0ac5344
