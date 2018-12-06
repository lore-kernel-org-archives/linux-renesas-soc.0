Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbeLFV7e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:34 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/9] soc: renesas: r8a77970-sysc: Correct names of A2DP/A2CN power domains
Date: Thu,  6 Dec 2018 13:58:51 -0800
Message-Id: <b5eb730e031acaba2d25e8f522ac5966a70885ae.1544131943.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544131943.git.horms+renesas@verge.net.au>
References: <cover.1544131943.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
renamed the A2IR2 and A2IR3 power domains on R-Car V3M to A2DP resp.
A2CN.

As these definitions are not yet used from DT, they can just be renamed.

While at it, fix the indentation of the A3IR definition.

Fixes: 833bdb47c826a1a6 ("dt-bindings: power: add R8A77970 SYSC power domain definitions")
Fixes: bab9b2a74fe9da96 ("soc: renesas: rcar-sysc: add R8A77970 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/r8a77970-sysc.c       | 4 ++--
 include/dt-bindings/power/r8a77970-sysc.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/renesas/r8a77970-sysc.c b/drivers/soc/renesas/r8a77970-sysc.c
index 2c6d76490ca0..280c48b80f24 100644
--- a/drivers/soc/renesas/r8a77970-sysc.c
+++ b/drivers/soc/renesas/r8a77970-sysc.c
@@ -23,8 +23,8 @@ static const struct rcar_sysc_area r8a77970_areas[] __initconst = {
 	{ "a3ir",	0x180, 0, R8A77970_PD_A3IR,	R8A77970_PD_ALWAYS_ON },
 	{ "a2ir0",	0x400, 0, R8A77970_PD_A2IR0,	R8A77970_PD_A3IR },
 	{ "a2ir1",	0x400, 1, R8A77970_PD_A2IR1,	R8A77970_PD_A3IR },
-	{ "a2ir2",	0x400, 2, R8A77970_PD_A2IR2,	R8A77970_PD_A3IR },
-	{ "a2ir3",	0x400, 3, R8A77970_PD_A2IR3,	R8A77970_PD_A3IR },
+	{ "a2dp",	0x400, 2, R8A77970_PD_A2DP,	R8A77970_PD_A3IR },
+	{ "a2cn",	0x400, 3, R8A77970_PD_A2CN,	R8A77970_PD_A3IR },
 	{ "a2sc0",	0x400, 4, R8A77970_PD_A2SC0,	R8A77970_PD_A3IR },
 	{ "a2sc1",	0x400, 5, R8A77970_PD_A2SC1,	R8A77970_PD_A3IR },
 };
diff --git a/include/dt-bindings/power/r8a77970-sysc.h b/include/dt-bindings/power/r8a77970-sysc.h
index 5c1ef1398b70..85cc5f23cf9f 100644
--- a/include/dt-bindings/power/r8a77970-sysc.h
+++ b/include/dt-bindings/power/r8a77970-sysc.h
@@ -18,10 +18,10 @@
 #define R8A77970_PD_CA53_CPU1		 6
 #define R8A77970_PD_CA53_SCU		21
 #define R8A77970_PD_A2IR0		23
-#define R8A77970_PD_A3IR			24
+#define R8A77970_PD_A3IR		24
 #define R8A77970_PD_A2IR1		27
-#define R8A77970_PD_A2IR2		28
-#define R8A77970_PD_A2IR3		29
+#define R8A77970_PD_A2DP		28
+#define R8A77970_PD_A2CN		29
 #define R8A77970_PD_A2SC0		30
 #define R8A77970_PD_A2SC1		31
 
-- 
2.11.0
