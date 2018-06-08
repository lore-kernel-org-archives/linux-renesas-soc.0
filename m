Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:58310 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751679AbeFHMVC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jun 2018 08:21:02 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>
Subject: [PATCH] arm64: dts: renesas: Fix VSPD registers range
Date: Fri,  8 Jun 2018 15:21:15 +0300
Message-Id: <20180608122115.21138-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The VSPD and FCPVD nodes have overlapping register ranges, as the FCPVD
devices are mapped in the memory range usually used by the VSP LUT and
CLU, which are not present in the VSPD. Fix this by shortening the VSPD
registers range to 0x5000.

Fixes: 9f8573e38a0b ("arm64: dts: renesas: r8a7795: Add VSP instances")
Fixes: 291e0c4994d0 ("arm64: dts: r8a7795: Add support for R-Car H3 ES2.0")
Fixes: f06ffdfbdd90 ("arm64: dts: r8a7796: Add VSP instances")
Fixes: b4f92030d5d3 ("arm64: dts: renesas: r8a77970: add VSPD support")
Fixes: 295952a183d3 ("arm64: dts: renesas: r8a77995: add VSP instances")
Fixes: 85cb3229218a ("arm64: dts: renesas: r8a77965: Add VSP instances")
Reported-by: Simon Horman <horms+renesas@verge.net.au>
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Fix H3, M3-W and M3-N in addition to V3H and D3
- Don't touch the VSPBS instance of D3 as there's no overlap
- Squash all patches together
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 6 +++---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi     | 6 +++---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi    | 4 ++--
 arch/arm64/boot/dts/renesas/r8a77970.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi    | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index e19dcd6cb767..0a42b016f257 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -80,7 +80,7 @@
 
 	vspd3: vsp@fea38000 {
 		compatible = "renesas,vsp2";
-		reg = <0 0xfea38000 0 0x8000>;
+		reg = <0 0xfea38000 0 0x5000>;
 		interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 620>;
 		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 9b154ff33e67..6803c0075d51 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2539,7 +2539,7 @@
 
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea20000 0 0x8000>;
+			reg = <0 0xfea20000 0 0x5000>;
 			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 623>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -2550,7 +2550,7 @@
 
 		vspd1: vsp@fea28000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea28000 0 0x8000>;
+			reg = <0 0xfea28000 0 0x5000>;
 			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 622>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -2561,7 +2561,7 @@
 
 		vspd2: vsp@fea30000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea30000 0 0x8000>;
+			reg = <0 0xfea30000 0 0x5000>;
 			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 621>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 3ca3f56110fe..636090ce3ee8 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -2256,7 +2256,7 @@
 
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea20000 0 0x8000>;
+			reg = <0 0xfea20000 0 0x5000>;
 			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 623>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
@@ -2267,7 +2267,7 @@
 
 		vspd1: vsp@fea28000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea28000 0 0x8000>;
+			reg = <0 0xfea28000 0 0x5000>;
 			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 622>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
@@ -2278,7 +2278,7 @@
 
 		vspd2: vsp@fea30000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea30000 0 0x8000>;
+			reg = <0 0xfea30000 0 0x5000>;
 			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 621>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index d740c79752d5..a584dfc78339 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1490,7 +1490,7 @@
 
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea20000 0 0x8000>;
+			reg = <0 0xfea20000 0 0x5000>;
 			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 623>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
@@ -1509,7 +1509,7 @@
 
 		vspd1: vsp@fea28000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea28000 0 0x8000>;
+			reg = <0 0xfea28000 0 0x5000>;
 			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 622>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 98a2317a16c4..89dc4e343b7c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -776,7 +776,7 @@
 
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea20000 0 0x8000>;
+			reg = <0 0xfea20000 0 0x5000>;
 			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 623>;
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index eb23c85c561b..a63bebbfd238 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -714,7 +714,7 @@
 
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea20000 0 0x8000>;
+			reg = <0 0xfea20000 0 0x5000>;
 			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 623>;
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
@@ -724,7 +724,7 @@
 
 		vspd1: vsp@fea28000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea28000 0 0x8000>;
+			reg = <0 0xfea28000 0 0x5000>;
 			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 622>;
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
-- 
Regards,

Laurent Pinchart
