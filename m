Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44354 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752398AbdGaPUf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:20:35 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 26/38] ARM: dts: r8a7791: Use R-Car Gen 2 fallback binding for vin nodes
Date: Mon, 31 Jul 2017 17:19:38 +0200
Message-Id: <b5595f2ffec64cce76fd1c6e4bfeb7a0109517a7.1501514100.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501514100.git.horms+renesas@verge.net.au>
References: <cover.1501514100.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use R-Car Gen 2 fallback binding for vind nodes in DT for r8a7791 SoC.

This has no run-time effect for the current driver as the initialisation
sequence is the same for the SoC-specific binding for r8a7791 and the
fallback binding for R-Car Gen 2

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index e135da440eed..ea4a8147d995 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -987,7 +987,7 @@
 	};
 
 	vin0: video@e6ef0000 {
-		compatible = "renesas,vin-r8a7791";
+		compatible = "renesas,vin-r8a7791", "renesas,rcar-gen2-vin";
 		reg = <0 0xe6ef0000 0 0x1000>;
 		interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp8_clks R8A7791_CLK_VIN0>;
@@ -996,7 +996,7 @@
 	};
 
 	vin1: video@e6ef1000 {
-		compatible = "renesas,vin-r8a7791";
+		compatible = "renesas,vin-r8a7791", "renesas,rcar-gen2-vin";
 		reg = <0 0xe6ef1000 0 0x1000>;
 		interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp8_clks R8A7791_CLK_VIN1>;
@@ -1005,7 +1005,7 @@
 	};
 
 	vin2: video@e6ef2000 {
-		compatible = "renesas,vin-r8a7791";
+		compatible = "renesas,vin-r8a7791", "renesas,rcar-gen2-vin";
 		reg = <0 0xe6ef2000 0 0x1000>;
 		interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp8_clks R8A7791_CLK_VIN2>;
-- 
2.1.4
