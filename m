Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35674 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752488AbdLGJy2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 04:54:28 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 03/54] arm64: dts: renesas: r8a7796: Use R-Car SDHI Gen3 fallback compat string
Date: Thu,  7 Dec 2017 10:53:06 +0100
Message-Id: <e871efc9a4f48c9b52d0a2980bf0cac9ecfd310c.1512640145.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512640145.git.horms+renesas@verge.net.au>
References: <cover.1512640145.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car SDHI Gen3 fallback compat string
in the DT of the r8a7796 SoC.

This should have no run-time effect as the driver matches against
the per-SoC compat string before considering the fallback compat string.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index f2b2e40c655e..8c94a313d9e1 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1380,7 +1380,8 @@
 		};
 
 		sdhi0: sd@ee100000 {
-			compatible = "renesas,sdhi-r8a7796";
+			compatible = "renesas,sdhi-r8a7796",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
 			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 314>;
@@ -1391,7 +1392,8 @@
 		};
 
 		sdhi1: sd@ee120000 {
-			compatible = "renesas,sdhi-r8a7796";
+			compatible = "renesas,sdhi-r8a7796",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
 			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 313>;
@@ -1402,7 +1404,8 @@
 		};
 
 		sdhi2: sd@ee140000 {
-			compatible = "renesas,sdhi-r8a7796";
+			compatible = "renesas,sdhi-r8a7796",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
 			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 312>;
@@ -1413,7 +1416,8 @@
 		};
 
 		sdhi3: sd@ee160000 {
-			compatible = "renesas,sdhi-r8a7796";
+			compatible = "renesas,sdhi-r8a7796",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
 			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 311>;
-- 
2.11.0
