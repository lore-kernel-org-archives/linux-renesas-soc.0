Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60436 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752615AbcD0XIS (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 19:08:18 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/5] ARM: dts: r8a7790: Don't disable referenced optional clocks
Date: Thu, 28 Apr 2016 09:08:10 +1000
Message-Id: <03adc1811cefae9494deb2002c7ab44f31d782d7.1461798352.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1461798352.git.horms+renesas@verge.net.au>
References: <cover.1461798352.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

clk_get() on a disabled clock node will return -EPROBE_DEFER, which can
cause drivers to be deferred forever if such clocks are referenced in
their devices' clocks properties.

Update the various disabled external clock nodes to default to a
frequency of 0, but don't disable them, to prevent this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7790.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 776a2aed81d2..935064fe7b13 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1032,8 +1032,7 @@
 		pcie_bus_clk: pcie_bus {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-			clock-frequency = <100000000>;
-			status = "disabled";
+			clock-frequency = <0>;
 		};
 
 		/*
@@ -1062,7 +1061,6 @@
 			#clock-cells = <0>;
 			/* This value must be overridden by the board. */
 			clock-frequency = <0>;
-			status = "disabled";
 		};
 
 		/* External USB clock - can be overridden by the board */
@@ -1078,7 +1076,6 @@
 			#clock-cells = <0>;
 			/* This value must be overridden by the board. */
 			clock-frequency = <0>;
-			status = "disabled";
 		};
 
 		/* Special CPG clocks */
-- 
2.7.0.rc3.207.g0ac5344
