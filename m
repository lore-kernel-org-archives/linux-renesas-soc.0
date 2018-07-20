Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:49958 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731701AbeGTNRA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 09:17:00 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: rcar: Correct SATA device sizes to 2 MiB
Date: Fri, 20 Jul 2018 14:28:57 +0200
Message-Id: <20180720122857.30235-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Update the SATA device nodes on R-Car H1, H2, and M2-W to use a 2 MiB
I/O space, as specified in Rev.1.0 of the R-Car H1 and R-Car Gen2
hardware user manuals.

See also commit e9f0089b2d8a3d45 ("arm64: dts: r8a7795: Correct SATA
device size to 2MiB").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on Koelsch.
---
 arch/arm/boot/dts/r8a7779.dtsi | 2 +-
 arch/arm/boot/dts/r8a7790.dtsi | 4 ++--
 arch/arm/boot/dts/r8a7791.dtsi | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 6b997bc016ee8a9e..03919714645ae56d 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -344,7 +344,7 @@
 
 	sata: sata@fc600000 {
 		compatible = "renesas,sata-r8a7779", "renesas,rcar-sata";
-		reg = <0xfc600000 0x2000>;
+		reg = <0xfc600000 0x200000>;
 		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7779_CLK_SATA>;
 		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 0925bdca438feeda..52a757f47bf08f57 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1559,7 +1559,7 @@
 		sata0: sata@ee300000 {
 			compatible = "renesas,sata-r8a7790",
 				     "renesas,rcar-gen2-sata";
-			reg = <0 0xee300000 0 0x2000>;
+			reg = <0 0xee300000 0 0x200000>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 815>;
 			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
@@ -1570,7 +1570,7 @@
 		sata1: sata@ee500000 {
 			compatible = "renesas,sata-r8a7790",
 				     "renesas,rcar-gen2-sata";
-			reg = <0 0xee500000 0 0x2000>;
+			reg = <0 0xee500000 0 0x200000>;
 			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 814>;
 			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 976a472e699c3b58..246667c3e92c204a 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1544,7 +1544,7 @@
 		sata0: sata@ee300000 {
 			compatible = "renesas,sata-r8a7791",
 				     "renesas,rcar-gen2-sata";
-			reg = <0 0xee300000 0 0x2000>;
+			reg = <0 0xee300000 0 0x200000>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 815>;
 			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
@@ -1555,7 +1555,7 @@
 		sata1: sata@ee500000 {
 			compatible = "renesas,sata-r8a7791",
 				     "renesas,rcar-gen2-sata";
-			reg = <0 0xee500000 0 0x2000>;
+			reg = <0 0xee500000 0 0x200000>;
 			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 814>;
 			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
-- 
2.17.1
