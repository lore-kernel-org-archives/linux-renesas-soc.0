Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34703 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750818AbdHHIjw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2017 04:39:52 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 02/10] ARM: dts: r8a7779: Use R-Car GPIO Gen1 fallback compat string
Date: Tue,  8 Aug 2017 10:39:20 +0200
Message-Id: <1502181568-12299-3-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1502181568-12299-1-git-send-email-horms+renesas@verge.net.au>
References: <1502181568-12299-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car GPIO Gen1 fallback compat string
in place of now deprecated non-generation specific
R-Car GPIO fallback compat string in DT of r8a7779 SoC.

This should have no run-time effect as the driver matches against
the per-SoC compat string before considering the fallback compat string.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7779.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 8ee0b2ca5d39..ccef2cfab6e0 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -76,7 +76,7 @@
 	};
 
 	gpio0: gpio@ffc40000 {
-		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
 		reg = <0xffc40000 0x2c>;
 		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -87,7 +87,7 @@
 	};
 
 	gpio1: gpio@ffc41000 {
-		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
 		reg = <0xffc41000 0x2c>;
 		interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -98,7 +98,7 @@
 	};
 
 	gpio2: gpio@ffc42000 {
-		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
 		reg = <0xffc42000 0x2c>;
 		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -109,7 +109,7 @@
 	};
 
 	gpio3: gpio@ffc43000 {
-		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
 		reg = <0xffc43000 0x2c>;
 		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -120,7 +120,7 @@
 	};
 
 	gpio4: gpio@ffc44000 {
-		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
 		reg = <0xffc44000 0x2c>;
 		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -131,7 +131,7 @@
 	};
 
 	gpio5: gpio@ffc45000 {
-		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
 		reg = <0xffc45000 0x2c>;
 		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
@@ -142,7 +142,7 @@
 	};
 
 	gpio6: gpio@ffc46000 {
-		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
 		reg = <0xffc46000 0x2c>;
 		interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
-- 
2.1.4
