Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:57397 "EHLO
	michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933294AbcFJNBQ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 09:01:16 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 10/19] ARM: dts: koelsch: Name spi pfc subnodes after device names
Date: Fri, 10 Jun 2016 15:00:56 +0200
Message-Id: <1465563665-2231-11-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
References: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Name the Pin Function Controller subnodes for QSPI and MSIOF0 after
their device names, instead of after the spi interface aliases.

This avoids conflicts when enabling support for more spi interfaces
later, either here or in a DT overlay.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 73e5ecf036e1b968..f8a7d090fd017deb 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -372,12 +372,12 @@
 		function = "sdhi2";
 	};
 
-	qspi_pins: spi0 {
+	qspi_pins: qspi {
 		groups = "qspi_ctrl", "qspi_data4";
 		function = "qspi";
 	};
 
-	msiof0_pins: spi1 {
+	msiof0_pins: msiof0 {
 		groups = "msiof0_clk", "msiof0_sync", "msiof0_rx",
 				 "msiof0_tx";
 		function = "msiof0";
-- 
1.9.1
