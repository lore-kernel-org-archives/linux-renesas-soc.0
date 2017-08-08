Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34711 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750818AbdHHIjy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2017 04:39:54 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 01/10] ARM: dts: r8a7778: Use R-Car GPIO Gen1 fallback compat string
Date: Tue,  8 Aug 2017 10:39:19 +0200
Message-Id: <1502181568-12299-2-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1502181568-12299-1-git-send-email-horms+renesas@verge.net.au>
References: <1502181568-12299-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car GPIO Gen1 fallback compat string
in place of now deprecated non-generation specific
R-Car GPIO fallback compat string in DT of r8a7778 SoC.

This should have no run-time effect as the driver matches against
the per-SoC compat string before considering the fallback compat string.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7778.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index 8f3156c0e575..b3975e4c75dd 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -88,7 +88,7 @@
 	};
 
 	gpio0: gpio@ffc40000 {
-		compatible = "renesas,gpio-r8a7778", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7778", "renesas,rcar-gen2-gpio";
 		reg = <0xffc40000 0x2c>;
 		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -99,7 +99,7 @@
 	};
 
 	gpio1: gpio@ffc41000 {
-		compatible = "renesas,gpio-r8a7778", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7778", "renesas,rcar-gen1-gpio";
 		reg = <0xffc41000 0x2c>;
 		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -110,7 +110,7 @@
 	};
 
 	gpio2: gpio@ffc42000 {
-		compatible = "renesas,gpio-r8a7778", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7778", "renesas,rcar-gen1-gpio";
 		reg = <0xffc42000 0x2c>;
 		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -121,7 +121,7 @@
 	};
 
 	gpio3: gpio@ffc43000 {
-		compatible = "renesas,gpio-r8a7778", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7778", "renesas,rcar-gen1-gpio";
 		reg = <0xffc43000 0x2c>;
 		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -132,7 +132,7 @@
 	};
 
 	gpio4: gpio@ffc44000 {
-		compatible = "renesas,gpio-r8a7778", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7778", "renesas,rcar-gen1-gpio";
 		reg = <0xffc44000 0x2c>;
 		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
-- 
2.1.4
