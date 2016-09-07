Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57254 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933974AbcIGHub (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 03:50:31 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 05/26] ARM: dts: r8a7791: Remove obsolete vsp1 properties
Date: Wed,  7 Sep 2016 09:49:52 +0200
Message-Id: <17d9af9e069f2982f578c65e987df309d1736eb5.1473234371.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1473234371.git.horms+renesas@verge.net.au>
References: <cover.1473234371.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

As of commit 5aa2eb3c86d4fd16 ("[media] v4l: vsp1: Configure device
based on IP version"), the DT properties to identify the exact VSP
device instance features are no longer used. Hence remove them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7791.dtsi | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 8f0086bbd96b..162b55c665a3 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -983,12 +983,6 @@
 		interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7791_CLK_VSP1_S>;
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
-
-		renesas,has-lut;
-		renesas,has-sru;
-		renesas,#rpf = <5>;
-		renesas,#uds = <3>;
-		renesas,#wpf = <4>;
 	};
 
 	vsp1@fe930000 {
@@ -997,12 +991,6 @@
 		interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7791_CLK_VSP1_DU0>;
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
-
-		renesas,has-lif;
-		renesas,has-lut;
-		renesas,#rpf = <4>;
-		renesas,#uds = <1>;
-		renesas,#wpf = <4>;
 	};
 
 	vsp1@fe938000 {
@@ -1011,12 +999,6 @@
 		interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7791_CLK_VSP1_DU1>;
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
-
-		renesas,has-lif;
-		renesas,has-lut;
-		renesas,#rpf = <4>;
-		renesas,#uds = <1>;
-		renesas,#wpf = <4>;
 	};
 
 	du: display@feb00000 {
-- 
2.7.0.rc3.207.g0ac5344
