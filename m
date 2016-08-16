Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:44596 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753301AbcHPO4g (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 10:56:36 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: dts: r8a7790: Remove obsolete vsp1 properties
Date: Tue, 16 Aug 2016 16:56:31 +0200
Message-Id: <1471359392-12584-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1471359392-12584-1-git-send-email-geert+renesas@glider.be>
References: <1471359392-12584-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

As of commit 5aa2eb3c86d4fd16 ("[media] v4l: vsp1: Configure device
based on IP version"), the DT properties to identify the exact VSP
device instance features are no longer used. Hence remove them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790.dtsi | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index d18558f211022826..351fcc2f87df6b28 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -944,11 +944,6 @@
 		interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7790_CLK_VSP1_R>;
 		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-
-		renesas,has-sru;
-		renesas,#rpf = <5>;
-		renesas,#uds = <1>;
-		renesas,#wpf = <4>;
 	};
 
 	vsp1@fe928000 {
@@ -957,12 +952,6 @@
 		interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7790_CLK_VSP1_S>;
 		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-
-		renesas,has-lut;
-		renesas,has-sru;
-		renesas,#rpf = <5>;
-		renesas,#uds = <3>;
-		renesas,#wpf = <4>;
 	};
 
 	vsp1@fe930000 {
@@ -971,12 +960,6 @@
 		interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7790_CLK_VSP1_DU0>;
 		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-
-		renesas,has-lif;
-		renesas,has-lut;
-		renesas,#rpf = <4>;
-		renesas,#uds = <1>;
-		renesas,#wpf = <4>;
 	};
 
 	vsp1@fe938000 {
@@ -985,12 +968,6 @@
 		interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7790_CLK_VSP1_DU1>;
 		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-
-		renesas,has-lif;
-		renesas,has-lut;
-		renesas,#rpf = <4>;
-		renesas,#uds = <1>;
-		renesas,#wpf = <4>;
 	};
 
 	du: display@feb00000 {
-- 
1.9.1
