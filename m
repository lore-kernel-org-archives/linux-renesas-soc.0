Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753476AbeCPOxz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:53:55 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 08/52] ARM: dts: r8a7790: consistently use single space after =
Date: Fri, 16 Mar 2018 15:52:27 +0100
Message-Id: <41b3568dc4f11e555aecf37fff5a08f398f97a03.1521208546.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521208546.git.horms+renesas@verge.net.au>
References: <cover.1521208546.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Consistently use a single space after a =.

This patch removes instances where a tab or multiple spaces are used
instead.  It also avoids running over 80 columns in width in one of the
lines where whitespace is updated.

This patch should not introduce any functional change.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790.dtsi | 75 +++++++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 13926fc7abfa..b4306f7c1bbb 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -291,9 +291,9 @@
 	};
 
 	thermal: thermal@e61f0000 {
-		compatible =	"renesas,thermal-r8a7790",
-				"renesas,rcar-gen2-thermal",
-				"renesas,rcar-thermal";
+		compatible = "renesas,thermal-r8a7790",
+			     "renesas,rcar-gen2-thermal",
+			     "renesas,rcar-thermal";
 		reg = <0 0xe61f0000 0 0x10>, <0 0xe61f0100 0 0x38>;
 		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 522>;
@@ -423,20 +423,20 @@
 	audma0: dma-controller@ec700000 {
 		compatible = "renesas,dmac-r8a7790", "renesas,rcar-dmac";
 		reg = <0 0xec700000 0 0x10000>;
-		interrupts =	<GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "error",
 				"ch0", "ch1", "ch2", "ch3",
 				"ch4", "ch5", "ch6", "ch7",
@@ -453,20 +453,20 @@
 	audma1: dma-controller@ec720000 {
 		compatible = "renesas,dmac-r8a7790", "renesas,rcar-dmac";
 		reg = <0 0xec720000 0 0x10000>;
-		interrupts =	<GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
-				 GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "error",
 				"ch0", "ch1", "ch2", "ch3",
 				"ch4", "ch5", "ch6", "ch7",
@@ -1437,12 +1437,13 @@
 		 * Single DAI : #sound-dai-cells = <0>;         <&rcar_sound>;
 		 * Multi  DAI : #sound-dai-cells = <1>;         <&rcar_sound N>;
 		 */
-		compatible =  "renesas,rcar_sound-r8a7790", "renesas,rcar_sound-gen2";
-		reg =	<0 0xec500000 0 0x1000>, /* SCU */
-			<0 0xec5a0000 0 0x100>,  /* ADG */
-			<0 0xec540000 0 0x1000>, /* SSIU */
-			<0 0xec541000 0 0x280>,  /* SSI */
-			<0 0xec740000 0 0x200>;  /* Audio DMAC peri peri*/
+		compatible = "renesas,rcar_sound-r8a7790",
+			     "renesas,rcar_sound-gen2";
+		reg = <0 0xec500000 0 0x1000>, /* SCU */
+		      <0 0xec5a0000 0 0x100>,  /* ADG */
+		      <0 0xec540000 0 0x1000>, /* SSIU */
+		      <0 0xec541000 0 0x280>,  /* SSI */
+		      <0 0xec740000 0 0x200>;  /* Audio DMAC peri peri*/
 		reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
 
 		clocks = <&cpg CPG_MOD 1005>,
-- 
2.11.0
