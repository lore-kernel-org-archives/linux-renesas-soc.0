Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34761 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750818AbdHHIkK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2017 04:40:10 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 06/10] ARM: dts: r8a7792: Use R-Car GPIO Gen2 fallback compat string
Date: Tue,  8 Aug 2017 10:39:24 +0200
Message-Id: <1502181568-12299-7-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1502181568-12299-1-git-send-email-horms+renesas@verge.net.au>
References: <1502181568-12299-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car GPIO Gen2 fallback compat string
in place of now deprecated non-generation specific
R-Car GPIO fallback compat string in the DT of the r8a7792 SoC.

This should have no run-time effect as the driver matches against
the per-SoC compat string before considering the fallback compat string.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index 2623f39bed2b..7fa5d835dbe9 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -145,7 +145,7 @@
 
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a7792",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen2-gpio";
 			reg = <0 0xe6050000 0 0x50>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -159,7 +159,7 @@
 
 		gpio1: gpio@e6051000 {
 			compatible = "renesas,gpio-r8a7792",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen2-gpio";
 			reg = <0 0xe6051000 0 0x50>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -173,7 +173,7 @@
 
 		gpio2: gpio@e6052000 {
 			compatible = "renesas,gpio-r8a7792",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen2-gpio";
 			reg = <0 0xe6052000 0 0x50>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -187,7 +187,7 @@
 
 		gpio3: gpio@e6053000 {
 			compatible = "renesas,gpio-r8a7792",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen2-gpio";
 			reg = <0 0xe6053000 0 0x50>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -201,7 +201,7 @@
 
 		gpio4: gpio@e6054000 {
 			compatible = "renesas,gpio-r8a7792",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen2-gpio";
 			reg = <0 0xe6054000 0 0x50>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -215,7 +215,7 @@
 
 		gpio5: gpio@e6055000 {
 			compatible = "renesas,gpio-r8a7792",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen2-gpio";
 			reg = <0 0xe6055000 0 0x50>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -229,7 +229,7 @@
 
 		gpio6: gpio@e6055100 {
 			compatible = "renesas,gpio-r8a7792",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen2-gpio";
 			reg = <0 0xe6055100 0 0x50>;
 			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -243,7 +243,7 @@
 
 		gpio7: gpio@e6055200 {
 			compatible = "renesas,gpio-r8a7792",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen2-gpio";
 			reg = <0 0xe6055200 0 0x50>;
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -257,7 +257,7 @@
 
 		gpio8: gpio@e6055300 {
 			compatible = "renesas,gpio-r8a7792",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen2-gpio";
 			reg = <0 0xe6055300 0 0x50>;
 			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -271,7 +271,7 @@
 
 		gpio9: gpio@e6055400 {
 			compatible = "renesas,gpio-r8a7792",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen2-gpio";
 			reg = <0 0xe6055400 0 0x50>;
 			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -285,7 +285,7 @@
 
 		gpio10: gpio@e6055500 {
 			compatible = "renesas,gpio-r8a7792",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen2-gpio";
 			reg = <0 0xe6055500 0 0x50>;
 			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -299,7 +299,7 @@
 
 		gpio11: gpio@e6055600 {
 			compatible = "renesas,gpio-r8a7792",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen2-gpio";
 			reg = <0 0xe6055600 0 0x50>;
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
-- 
2.1.4
