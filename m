Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752092AbdJTK3o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Oct 2017 06:29:44 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 30/31] arm64: dts: r8a7796: Use R-Car GPIO Gen3 fallback compat string
Date: Fri, 20 Oct 2017 12:28:33 +0200
Message-Id: <c8ee880415894e75b5289618dc2b8108bdd96a23.1508495040.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1508495040.git.horms+renesas@verge.net.au>
References: <cover.1508495040.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car GPIO Gen3 fallback compat string
in place of now deprecated non-generation specific
R-Car GPIO fallback compat string in the DT of the r8a7796 SoC.

This should have no run-time effect as the driver matches against
the per-SoC compat string before considering the fallback compat string.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 8085fd91811e..f2b2e40c655e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -214,7 +214,7 @@
 
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a7796",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6050000 0 0x50>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -229,7 +229,7 @@
 
 		gpio1: gpio@e6051000 {
 			compatible = "renesas,gpio-r8a7796",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6051000 0 0x50>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -244,7 +244,7 @@
 
 		gpio2: gpio@e6052000 {
 			compatible = "renesas,gpio-r8a7796",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6052000 0 0x50>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -259,7 +259,7 @@
 
 		gpio3: gpio@e6053000 {
 			compatible = "renesas,gpio-r8a7796",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6053000 0 0x50>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -274,7 +274,7 @@
 
 		gpio4: gpio@e6054000 {
 			compatible = "renesas,gpio-r8a7796",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6054000 0 0x50>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -289,7 +289,7 @@
 
 		gpio5: gpio@e6055000 {
 			compatible = "renesas,gpio-r8a7796",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6055000 0 0x50>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -304,7 +304,7 @@
 
 		gpio6: gpio@e6055400 {
 			compatible = "renesas,gpio-r8a7796",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6055400 0 0x50>;
 			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -319,7 +319,7 @@
 
 		gpio7: gpio@e6055800 {
 			compatible = "renesas,gpio-r8a7796",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6055800 0 0x50>;
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
-- 
2.11.0
