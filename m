Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47467 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754872AbdLFKYM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 05:24:12 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 20/61] ARM: dts: r8a7745: Use R-Car SDHI Gen2 fallback compat string
Date: Wed,  6 Dec 2017 11:22:15 +0100
Message-Id: <35098dd2e37d51cdab26637479fb892c254c2555.1512555546.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512555546.git.horms+renesas@verge.net.au>
References: <cover.1512555546.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car SDHI Gen2 fallback compat string
in the DT of the r8a7745 SoC.

This should have no run-time effect as the driver matches against
the per-SoC compat string before considering the fallback compat string.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7745.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 16dc4895b455..846c27a00c54 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -870,7 +870,8 @@
 		};
 
 		sdhi0: sd@ee100000 {
-			compatible = "renesas,sdhi-r8a7745";
+			compatible = "renesas,sdhi-r8a7745",
+				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee100000 0 0x328>;
 			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 314>;
@@ -884,7 +885,8 @@
 		};
 
 		sdhi1: sd@ee140000 {
-			compatible = "renesas,sdhi-r8a7745";
+			compatible = "renesas,sdhi-r8a7745",
+				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee140000 0 0x100>;
 			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 312>;
@@ -898,7 +900,8 @@
 		};
 
 		sdhi2: sd@ee160000 {
-			compatible = "renesas,sdhi-r8a7745";
+			compatible = "renesas,sdhi-r8a7745",
+				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee160000 0 0x100>;
 			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 311>;
-- 
2.11.0
