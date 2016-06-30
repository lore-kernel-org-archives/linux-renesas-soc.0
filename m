Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36294 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752335AbcF3OQo (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 10:16:44 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 07/41] ARM: dts: lager: Name spi pfc subnodes after device names
Date: Thu, 30 Jun 2016 16:15:27 +0200
Message-Id: <85c5e4c4296bc35686334efc4eddf563ba687127.1467294011.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1467294011.git.horms+renesas@verge.net.au>
References: <cover.1467294011.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Name the Pin Function Controller subnodes for QSPI and MSIOF1 after
their device names, instead of after the spi interface aliases.

This avoids conflicts when enabling support for more spi interfaces
later, either here or in a DT overlay.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index c6803977b427..09b633f5ad07 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -371,12 +371,12 @@
 		function = "mmc1";
 	};
 
-	qspi_pins: spi0 {
+	qspi_pins: qspi {
 		groups = "qspi_ctrl", "qspi_data4";
 		function = "qspi";
 	};
 
-	msiof1_pins: spi2 {
+	msiof1_pins: msiof1 {
 		groups = "msiof1_clk", "msiof1_sync", "msiof1_rx",
 				 "msiof1_tx";
 		function = "msiof1";
-- 
2.7.0.rc3.207.g0ac5344
