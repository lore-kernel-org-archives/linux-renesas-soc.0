Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:49289 "EHLO
	michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752985AbcHPNm6 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 09:42:58 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: Simon Horman <horms@verge.net.au>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: debug-ll: Add support for r8a7992
Date: Tue, 16 Aug 2016 15:42:20 +0200
Message-Id: <1471354940-18696-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable low-level debugging support for R-Car V2H (r8a7792).
V2H uses SCIF0 for the debug console, like most other R-Car Gen2 SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/Kconfig.debug | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index a9693b6987a6e41c..88440f63c31e434b 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -861,12 +861,12 @@ choice
 		  via SCIF2 on Renesas R-Car H1 (R8A7779).
 
 	config DEBUG_RCAR_GEN2_SCIF0
-		bool "Kernel low-level debugging messages via SCIF0 on R8A7790/R8A7791/R8A7793"
-		depends on ARCH_R8A7790 || ARCH_R8A7791 || ARCH_R8A7793
+		bool "Kernel low-level debugging messages via SCIF0 on R8A7790/R8A7791/R8A7792/R8A7793"
+		depends on ARCH_R8A7790 || ARCH_R8A7791 || ARCH_R8A7792 || ARCH_R8A7793
 		help
 		  Say Y here if you want kernel low-level debugging support
-		  via SCIF0 on Renesas R-Car H2 (R8A7790), M2-W (R8A7791), or
-		  M2-N (R8A7793).
+		  via SCIF0 on Renesas R-Car H2 (R8A7790), M2-W (R8A7791), V2H
+		  (R8A7792), or M2-N (R8A7793).
 
 	config DEBUG_RCAR_GEN2_SCIF2
 		bool "Kernel low-level debugging messages via SCIF2 on R8A7794"
-- 
1.9.1
