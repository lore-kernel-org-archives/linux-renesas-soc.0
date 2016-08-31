Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:38529 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759598AbcHaJcB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Aug 2016 05:32:01 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: r8a7795: Add SoC-specific compatible property to audio-dmac nodes
Date: Wed, 31 Aug 2016 11:31:55 +0200
Message-Id: <1472635915-26856-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The audio-dmac nodes used the generic compatible property only.
Add the SoC-specific one, to make it future proof.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 5d4978cf6cdbe215..1fe5533cf5093306 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -333,7 +333,8 @@
 		};
 
 		audma0: dma-controller@ec700000 {
-			compatible = "renesas,rcar-dmac";
+			compatible = "renesas,dmac-r8a7795",
+				     "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
 			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH
 				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
@@ -373,7 +374,8 @@
 		};
 
 		audma1: dma-controller@ec720000 {
-			compatible = "renesas,rcar-dmac";
+			compatible = "renesas,dmac-r8a7795",
+				     "renesas,rcar-dmac";
 			reg = <0 0xec720000 0 0x10000>;
 			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH
 				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
-- 
1.9.1
