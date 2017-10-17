Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39254 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753185AbdJQGKI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2017 02:10:08 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 01/11] arm64: dts: renesas: r8a7795: Use R-Car SDHI Gen3 fallback compat string
Date: Tue, 17 Oct 2017 08:09:49 +0200
Message-Id: <20171017060959.16702-2-horms+renesas@verge.net.au>
In-Reply-To: <20171017060959.16702-1-horms+renesas@verge.net.au>
References: <20171017060959.16702-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car SDHI Gen3 fallback compat string
in the DT of the r8a7795 SoC.

This should have no run-time effect as the driver matches against
the per-SoC compat string before considering the fallback compat string.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 15ef292a8d9f..42c51f2ec30b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1539,7 +1539,8 @@
 		};
 
 		sdhi0: sd@ee100000 {
-			compatible = "renesas,sdhi-r8a7795";
+			compatible = "renesas,sdhi-r8a7795",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
 			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 314>;
@@ -1550,7 +1551,8 @@
 		};
 
 		sdhi1: sd@ee120000 {
-			compatible = "renesas,sdhi-r8a7795";
+			compatible = "renesas,sdhi-r8a7795",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
 			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 313>;
@@ -1561,7 +1563,8 @@
 		};
 
 		sdhi2: sd@ee140000 {
-			compatible = "renesas,sdhi-r8a7795";
+			compatible = "renesas,sdhi-r8a7795",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
 			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 312>;
@@ -1572,7 +1575,8 @@
 		};
 
 		sdhi3: sd@ee160000 {
-			compatible = "renesas,sdhi-r8a7795";
+			compatible = "renesas,sdhi-r8a7795",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
 			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 311>;
-- 
2.11.0
