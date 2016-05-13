Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:60625 "EHLO
	michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752148AbcEMH4H (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 13 May 2016 03:56:07 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/23] ARM: dts: emev2: Fix W=1 dtc warnings
Date: Fri, 13 May 2016 09:55:41 +0200
Message-Id: <1463126163-29423-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
References: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

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
---
 arch/arm/boot/dts/emev2.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/emev2.dtsi b/arch/arm/boot/dts/emev2.dtsi
index bcce6f50c93d9d25..cd119400f440bb5a 100644
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
1.9.1
