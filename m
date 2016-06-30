Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36294 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752164AbcF3OQz (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 10:16:55 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 09/41] ARM: dts: koelsch: Name serial port pfc subnodes after device names
Date: Thu, 30 Jun 2016 16:15:29 +0200
Message-Id: <b71b8346e2a4f007721d0e0373240bda9e939a7b.1467294011.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1467294011.git.horms+renesas@verge.net.au>
References: <cover.1467294011.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Name the Pin Function Controller subnodes for SCIF0 and SCIF1 after
their device names, instead of after the serial port aliases.

This avoids conflicts when enabling support for more serial ports later,
either here or in a DT overlay.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 20fbc8c36a78..73e5ecf036e1 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -332,12 +332,12 @@
 		function = "du";
 	};
 
-	scif0_pins: serial0 {
+	scif0_pins: scif0 {
 		groups = "scif0_data_d";
 		function = "scif0";
 	};
 
-	scif1_pins: serial1 {
+	scif1_pins: scif1 {
 		groups = "scif1_data_d";
 		function = "scif1";
 	};
-- 
2.7.0.rc3.207.g0ac5344
