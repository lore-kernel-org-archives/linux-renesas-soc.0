Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38383 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761327AbcLTKcw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 05:32:52 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH renesas/devel 3/4] ARM: dts: r8a7792: Use R-Car Gen 2 fallback binding for msiof nodes
Date: Tue, 20 Dec 2016 11:32:38 +0100
Message-Id: <1482229959-25584-4-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1482229959-25584-1-git-send-email-horms+renesas@verge.net.au>
References: <1482229959-25584-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added R-Car Gen 2 fallback binding for msiof nodes in
DT for r8a7792 SoC.

This has no run-time effect for the current driver as the initialisation
sequence is the same for the SoC-specific binding for r8a7792 and the
fallback binding for R-Car Gen 2.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index c5e834073cb3..a43eb857ba80 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -585,7 +585,8 @@
 		};
 
 		msiof0: spi@e6e20000 {
-			compatible = "renesas,msiof-r8a7792";
+			compatible = "renesas,msiof-r8a7792",
+				     "renesas,rcar-gen2-msiof";
 			reg = <0 0xe6e20000 0 0x0064>;
 			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&mstp0_clks R8A7792_CLK_MSIOF0>;
@@ -599,7 +600,8 @@
 		};
 
 		msiof1: spi@e6e10000 {
-			compatible = "renesas,msiof-r8a7792";
+			compatible = "renesas,msiof-r8a7792",
+				     "renesas,rcar-gen2-msiof";
 			reg = <0 0xe6e10000 0 0x0064>;
 			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&mstp2_clks R8A7792_CLK_MSIOF1>;
-- 
2.7.0.rc3.207.g0ac5344
