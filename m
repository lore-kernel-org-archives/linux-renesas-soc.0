Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbeLFV7g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:36 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/9] soc: renesas: r8a77970-sysc: Remove non-existent CR7 power domain
Date: Thu,  6 Dec 2018 13:58:50 -0800
Message-Id: <da3e1c57caf93ed379f14686e877f806111abe7c.1544131943.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544131943.git.horms+renesas@verge.net.au>
References: <cover.1544131943.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
removed the CR7 power domain on R-Car V3M, as this SoC does not have an
ARM Cortex-R7 Realtime Core.

As this definition was never used from DT, it can just be removed.

Fixes: 833bdb47c826a1a6 ("dt-bindings: power: add R8A77970 SYSC power domain definitions")
Fixes: bab9b2a74fe9da96 ("soc: renesas: rcar-sysc: add R8A77970 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/r8a77970-sysc.c       | 1 -
 include/dt-bindings/power/r8a77970-sysc.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/soc/renesas/r8a77970-sysc.c b/drivers/soc/renesas/r8a77970-sysc.c
index 35b30d6a8958..2c6d76490ca0 100644
--- a/drivers/soc/renesas/r8a77970-sysc.c
+++ b/drivers/soc/renesas/r8a77970-sysc.c
@@ -20,7 +20,6 @@ static const struct rcar_sysc_area r8a77970_areas[] __initconst = {
 	  PD_CPU_NOCR },
 	{ "ca53-cpu1",	0x200, 1, R8A77970_PD_CA53_CPU1, R8A77970_PD_CA53_SCU,
 	  PD_CPU_NOCR },
-	{ "cr7",	0x240, 0, R8A77970_PD_CR7,	R8A77970_PD_ALWAYS_ON },
 	{ "a3ir",	0x180, 0, R8A77970_PD_A3IR,	R8A77970_PD_ALWAYS_ON },
 	{ "a2ir0",	0x400, 0, R8A77970_PD_A2IR0,	R8A77970_PD_A3IR },
 	{ "a2ir1",	0x400, 1, R8A77970_PD_A2IR1,	R8A77970_PD_A3IR },
diff --git a/include/dt-bindings/power/r8a77970-sysc.h b/include/dt-bindings/power/r8a77970-sysc.h
index bf54779d1625..5c1ef1398b70 100644
--- a/include/dt-bindings/power/r8a77970-sysc.h
+++ b/include/dt-bindings/power/r8a77970-sysc.h
@@ -16,7 +16,6 @@
 
 #define R8A77970_PD_CA53_CPU0		 5
 #define R8A77970_PD_CA53_CPU1		 6
-#define R8A77970_PD_CR7			13
 #define R8A77970_PD_CA53_SCU		21
 #define R8A77970_PD_A2IR0		23
 #define R8A77970_PD_A3IR			24
-- 
2.11.0
