Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34830 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932088AbeAQQT5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 11:19:57 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 09/16] ARM: dts: r8a7793: consistently use single space after =
Date: Wed, 17 Jan 2018 17:17:10 +0100
Message-Id: <20180117161717.14589-10-horms+renesas@verge.net.au>
In-Reply-To: <20180117161717.14589-1-horms+renesas@verge.net.au>
References: <20180117161717.14589-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Consistently use a single space after a =.

This patch removes instances where a tab is used instead.  It also avoids
running over 80 columns in width in one of the lines where whitespace is
updated.

This patch should not introduce any functional change.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v2
* New patch
---
 arch/arm/boot/dts/r8a7793.dtsi | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index e95f4fb44dc4..ea4bc06c8e8a 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -228,9 +228,9 @@
 	};
 
 	thermal: thermal@e61f0000 {
-		compatible =	"renesas,thermal-r8a7793",
-				"renesas,rcar-gen2-thermal",
-				"renesas,rcar-thermal";
+		compatible = "renesas,thermal-r8a7793",
+			     "renesas,rcar-gen2-thermal",
+			     "renesas,rcar-thermal";
 		reg = <0 0xe61f0000 0 0x10>, <0 0xe61f0100 0 0x38>;
 		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 522>;
@@ -1174,12 +1174,13 @@
 		 * Single DAI : #sound-dai-cells = <0>;         <&rcar_sound>;
 		 * Multi  DAI : #sound-dai-cells = <1>;         <&rcar_sound N>;
 		 */
-		compatible =  "renesas,rcar_sound-r8a7793", "renesas,rcar_sound-gen2";
-		reg =	<0 0xec500000 0 0x1000>, /* SCU */
-			<0 0xec5a0000 0 0x100>,  /* ADG */
-			<0 0xec540000 0 0x1000>, /* SSIU */
-			<0 0xec541000 0 0x280>,  /* SSI */
-			<0 0xec740000 0 0x200>;  /* Audio DMAC peri peri*/
+		compatible = "renesas,rcar_sound-r8a7793",
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
