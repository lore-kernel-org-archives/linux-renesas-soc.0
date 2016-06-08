Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56528 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752368AbcFHBAh (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 21:00:37 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 10/30] ARM: dts: emev2: Fix W=1 dtc warnings
Date: Wed,  8 Jun 2016 09:59:40 +0900
Message-Id: <33df2753637b2d59adcfd13c35761ff13ff1c673.1465346599.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1465346599.git.horms+renesas@verge.net.au>
References: <cover.1465346599.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Warning (unit_address_vs_reg): Node /clocks@e0110000/iic0_sclkdiv has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/iic0_sclk has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/iic1_sclkdiv has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/iic1_sclk has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usia_u0_sclkdiv has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usib_u1_sclkdiv has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usib_u2_sclkdiv has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usib_u3_sclkdiv has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usia_u0_sclk has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usib_u1_sclk has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usib_u2_sclk has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usib_u3_sclk has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/sti_sclk has a reg or ranges property, but no unit name

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/emev2.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/emev2.dtsi b/arch/arm/boot/dts/emev2.dtsi
index bcce6f50c93d..cd119400f440 100644
--- a/arch/arm/boot/dts/emev2.dtsi
+++ b/arch/arm/boot/dts/emev2.dtsi
@@ -69,25 +69,25 @@
 			clock-frequency = <32768>;
 			#clock-cells = <0>;
 		};
-		iic0_sclkdiv: iic0_sclkdiv {
+		iic0_sclkdiv: iic0_sclkdiv@624,0 {
 			compatible = "renesas,emev2-smu-clkdiv";
 			reg = <0x624 0>;
 			clocks = <&pll3_fo>;
 			#clock-cells = <0>;
 		};
-		iic0_sclk: iic0_sclk {
+		iic0_sclk: iic0_sclk@48c,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x48c 1>;
 			clocks = <&iic0_sclkdiv>;
 			#clock-cells = <0>;
 		};
-		iic1_sclkdiv: iic1_sclkdiv {
+		iic1_sclkdiv: iic1_sclkdiv@624,16 {
 			compatible = "renesas,emev2-smu-clkdiv";
 			reg = <0x624 16>;
 			clocks = <&pll3_fo>;
 			#clock-cells = <0>;
 		};
-		iic1_sclk: iic1_sclk {
+		iic1_sclk: iic1_sclk@490,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x490 1>;
 			clocks = <&iic1_sclkdiv>;
@@ -100,55 +100,55 @@
 			clock-mult = <7000>;
 			#clock-cells = <0>;
 		};
-		usia_u0_sclkdiv: usia_u0_sclkdiv {
+		usia_u0_sclkdiv: usia_u0_sclkdiv@610,0 {
 			compatible = "renesas,emev2-smu-clkdiv";
 			reg = <0x610 0>;
 			clocks = <&pll3_fo>;
 			#clock-cells = <0>;
 		};
-		usib_u1_sclkdiv: usib_u1_sclkdiv {
+		usib_u1_sclkdiv: usib_u1_sclkdiv@65c,0 {
 			compatible = "renesas,emev2-smu-clkdiv";
 			reg = <0x65c 0>;
 			clocks = <&pll3_fo>;
 			#clock-cells = <0>;
 		};
-		usib_u2_sclkdiv: usib_u2_sclkdiv {
+		usib_u2_sclkdiv: usib_u2_sclkdiv@65c,16 {
 			compatible = "renesas,emev2-smu-clkdiv";
 			reg = <0x65c 16>;
 			clocks = <&pll3_fo>;
 			#clock-cells = <0>;
 		};
-		usib_u3_sclkdiv: usib_u3_sclkdiv {
+		usib_u3_sclkdiv: usib_u3_sclkdiv@660,0 {
 			compatible = "renesas,emev2-smu-clkdiv";
 			reg = <0x660 0>;
 			clocks = <&pll3_fo>;
 			#clock-cells = <0>;
 		};
-		usia_u0_sclk: usia_u0_sclk {
+		usia_u0_sclk: usia_u0_sclk@4a0,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x4a0 1>;
 			clocks = <&usia_u0_sclkdiv>;
 			#clock-cells = <0>;
 		};
-		usib_u1_sclk: usib_u1_sclk {
+		usib_u1_sclk: usib_u1_sclk@4b8,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x4b8 1>;
 			clocks = <&usib_u1_sclkdiv>;
 			#clock-cells = <0>;
 		};
-		usib_u2_sclk: usib_u2_sclk {
+		usib_u2_sclk: usib_u2_sclk@4bc,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x4bc 1>;
 			clocks = <&usib_u2_sclkdiv>;
 			#clock-cells = <0>;
 		};
-		usib_u3_sclk: usib_u3_sclk {
+		usib_u3_sclk: usib_u3_sclk@4c0,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x4c0 1>;
 			clocks = <&usib_u3_sclkdiv>;
 			#clock-cells = <0>;
 		};
-		sti_sclk: sti_sclk {
+		sti_sclk: sti_sclk@528,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x528 1>;
 			clocks = <&c32ki>;
-- 
2.1.4
