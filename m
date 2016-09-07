Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57033 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756483AbcIGHlr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 03:41:47 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/3] ARM: debug-ll: Add support for r8a7992
Date: Wed,  7 Sep 2016 09:41:37 +0200
Message-Id: <aedc53a9590b82860cde67e5460a171dadf362bb.1473233986.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1473233986.git.horms+renesas@verge.net.au>
References: <cover.1473233986.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Enable low-level debugging support for R-Car V2H (r8a7792).
V2H uses SCIF0 for the debug console, like most other R-Car Gen2 SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/Kconfig.debug | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index a9693b6987a6..88440f63c31e 100644
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
2.7.0.rc3.207.g0ac5344
