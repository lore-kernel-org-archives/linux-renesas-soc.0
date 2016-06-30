Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36294 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752335AbcF3OQu (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 10:16:50 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 04/41] ARM: dts: bockw: Name serial port pfc subnode after device name
Date: Thu, 30 Jun 2016 16:15:24 +0200
Message-Id: <c32149c7fd9d3716c38954bc3a99fff90a74abf7.1467294011.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1467294011.git.horms+renesas@verge.net.au>
References: <cover.1467294011.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Name the Pin Function Controller subnode for SCIF0 after its device
name, instead of after the serial port alias.

This avoids conflicts when enabling support for more serial ports later,
either here or in a DT overlay.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7778-bockw.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7778-bockw.dts b/arch/arm/boot/dts/r8a7778-bockw.dts
index 0a0bd3b6bb40..211d239d9041 100644
--- a/arch/arm/boot/dts/r8a7778-bockw.dts
+++ b/arch/arm/boot/dts/r8a7778-bockw.dts
@@ -129,7 +129,7 @@
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
-	scif0_pins: serial0 {
+	scif0_pins: scif0 {
 		groups = "scif0_data_a", "scif0_ctrl";
 		function = "scif0";
 	};
-- 
2.7.0.rc3.207.g0ac5344
