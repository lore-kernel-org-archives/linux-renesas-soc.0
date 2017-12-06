Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47467 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754879AbdLFKXh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 05:23:37 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 22/61] ARM: dts: r8a7779: Use R-Car SDHI Gen1 fallback compat string
Date: Wed,  6 Dec 2017 11:22:17 +0100
Message-Id: <0863a6ef429790f4a44031b52f313480e25fb9f0.1512555546.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512555546.git.horms+renesas@verge.net.au>
References: <cover.1512555546.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car SDHI Gen1 fallback compat string
in the DT of the r8a7779 SoC.

This should have no run-time effect as the driver matches against
the per-SoC compat string before considering the fallback compat string.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7779.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index e8eb94748b27..e79ae306eedd 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -355,7 +355,8 @@
 	};
 
 	sdhi0: sd@ffe4c000 {
-		compatible = "renesas,sdhi-r8a7779";
+		compatible = "renesas,sdhi-r8a7779",
+			     "renesas,rcar-gen1-sdhi";
 		reg = <0xffe4c000 0x100>;
 		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7779_CLK_SDHI0>;
@@ -364,7 +365,8 @@
 	};
 
 	sdhi1: sd@ffe4d000 {
-		compatible = "renesas,sdhi-r8a7779";
+		compatible = "renesas,sdhi-r8a7779",
+			     "renesas,rcar-gen1-sdhi";
 		reg = <0xffe4d000 0x100>;
 		interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7779_CLK_SDHI1>;
@@ -373,7 +375,8 @@
 	};
 
 	sdhi2: sd@ffe4e000 {
-		compatible = "renesas,sdhi-r8a7779";
+		compatible = "renesas,sdhi-r8a7779",
+			     "renesas,rcar-gen1-sdhi";
 		reg = <0xffe4e000 0x100>;
 		interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7779_CLK_SDHI2>;
@@ -382,7 +385,8 @@
 	};
 
 	sdhi3: sd@ffe4f000 {
-		compatible = "renesas,sdhi-r8a7779";
+		compatible = "renesas,sdhi-r8a7779",
+			     "renesas,rcar-gen1-sdhi";
 		reg = <0xffe4f000 0x100>;
 		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7779_CLK_SDHI3>;
-- 
2.11.0
