Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39175 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755490AbdGKM5F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2017 08:57:05 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/3] ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for vin nodes
Date: Tue, 11 Jul 2017 14:56:47 +0200
Message-Id: <1499777809-27492-2-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1499777809-27492-1-git-send-email-horms+renesas@verge.net.au>
References: <1499777809-27492-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use R-Car Gen 2 fallback binding for vind nodes in DT for r8a7790 SoC.

This has no run-time effect for the current driver as the initialisation
sequence is the same for the SoC-specific binding for r8a7790 and the
fallback binding for R-Car Gen 2

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7790.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index ff986df23b62..167fd57aea68 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -927,7 +927,7 @@
 	};
 
 	vin0: video@e6ef0000 {
-		compatible = "renesas,vin-r8a7790";
+		compatible = "renesas,vin-r8a7790", "renesas,rcar-gen2-vin";
 		reg = <0 0xe6ef0000 0 0x1000>;
 		interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp8_clks R8A7790_CLK_VIN0>;
@@ -936,7 +936,7 @@
 	};
 
 	vin1: video@e6ef1000 {
-		compatible = "renesas,vin-r8a7790";
+		compatible = "renesas,vin-r8a7790", "renesas,rcar-gen2-vin";
 		reg = <0 0xe6ef1000 0 0x1000>;
 		interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp8_clks R8A7790_CLK_VIN1>;
@@ -945,7 +945,7 @@
 	};
 
 	vin2: video@e6ef2000 {
-		compatible = "renesas,vin-r8a7790";
+		compatible = "renesas,vin-r8a7790", "renesas,rcar-gen2-vin";
 		reg = <0 0xe6ef2000 0 0x1000>;
 		interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp8_clks R8A7790_CLK_VIN2>;
@@ -954,7 +954,7 @@
 	};
 
 	vin3: video@e6ef3000 {
-		compatible = "renesas,vin-r8a7790";
+		compatible = "renesas,vin-r8a7790", "renesas,rcar-gen2-vin";
 		reg = <0 0xe6ef3000 0 0x1000>;
 		interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp8_clks R8A7790_CLK_VIN3>;
-- 
2.1.4
