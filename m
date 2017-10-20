Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752735AbdJTK3v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Oct 2017 06:29:51 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 05/42] ARM: dts: r8a7792: Use generic node name for VSP1 nodes
Date: Fri, 20 Oct 2017 12:28:32 +0200
Message-Id: <2ea2e06cdac491cf254ce6221371a6993e7a46fb.1508493785.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1508493785.git.horms+renesas@verge.net.au>
References: <cover.1508493785.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Use the preferred generic node name instead of the specific name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index c332f77ebb6b..549eafe8ff12 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -794,7 +794,7 @@
 			status = "disabled";
 		};
 
-		vsp1@fe928000 {
+		vsp@fe928000 {
 			compatible = "renesas,vsp1";
 			reg = <0 0xfe928000 0 0x8000>;
 			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
@@ -803,7 +803,7 @@
 			resets = <&cpg 131>;
 		};
 
-		vsp1@fe930000 {
+		vsp@fe930000 {
 			compatible = "renesas,vsp1";
 			reg = <0 0xfe930000 0 0x8000>;
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
@@ -812,7 +812,7 @@
 			resets = <&cpg 128>;
 		};
 
-		vsp1@fe938000 {
+		vsp@fe938000 {
 			compatible = "renesas,vsp1";
 			reg = <0 0xfe938000 0 0x8000>;
 			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.11.0
