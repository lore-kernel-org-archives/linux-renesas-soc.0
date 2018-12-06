Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbeLFV7k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:40 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 5/9] soc: renesas: r8a77980-sysc: Correct A3VIP[012] power domain hierarchy
Date: Thu,  6 Dec 2018 13:58:53 -0800
Message-Id: <160bfa7c724b348a90a12dd9694f351927a15b8e.1544131943.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544131943.git.horms+renesas@verge.net.au>
References: <cover.1544131943.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
renamed the A3VIP power domain on R-Car V3H to A3VIP0, and clarified the
power domain hierarchy for the A3VIP[012] power domains.

As the definition for the A3VIP0 domain is not yet used from DT, it can
just be renamed.

Fixes: 7755b40d07a8dba7 ("dt-bindings: power: add R8A77980 SYSC power domain definitions")
Fixes: 41d6d8bd8ae94ca9 ("soc: renesas: rcar-sysc: add R8A77980 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/r8a77980-sysc.c       | 6 +++---
 include/dt-bindings/power/r8a77980-sysc.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/renesas/r8a77980-sysc.c b/drivers/soc/renesas/r8a77980-sysc.c
index dbb2621ce4e3..a8dbe55e8ba8 100644
--- a/drivers/soc/renesas/r8a77980-sysc.c
+++ b/drivers/soc/renesas/r8a77980-sysc.c
@@ -41,9 +41,9 @@ static const struct rcar_sysc_area r8a77980_areas[] __initconst = {
 	{ "a2dp0",	0x400, 11, R8A77980_PD_A2DP0,	R8A77980_PD_A3IR },
 	{ "a2dp1",	0x400, 12, R8A77980_PD_A2DP1,	R8A77980_PD_A3IR },
 	{ "a2cn",	0x400, 13, R8A77980_PD_A2CN,	R8A77980_PD_A3IR },
-	{ "a3vip",	0x2c0, 0, R8A77980_PD_A3VIP,	R8A77980_PD_ALWAYS_ON },
-	{ "a3vip1",	0x300, 0, R8A77980_PD_A3VIP1,	R8A77980_PD_A3VIP },
-	{ "a3vip2",	0x280, 0, R8A77980_PD_A3VIP2,	R8A77980_PD_A3VIP },
+	{ "a3vip0",	0x2c0, 0, R8A77980_PD_A3VIP0,	R8A77980_PD_ALWAYS_ON },
+	{ "a3vip1",	0x300, 0, R8A77980_PD_A3VIP1,	R8A77980_PD_ALWAYS_ON },
+	{ "a3vip2",	0x280, 0, R8A77980_PD_A3VIP2,	R8A77980_PD_ALWAYS_ON },
 };
 
 const struct rcar_sysc_info r8a77980_sysc_info __initconst = {
diff --git a/include/dt-bindings/power/r8a77980-sysc.h b/include/dt-bindings/power/r8a77980-sysc.h
index 7bebe7e8dbdb..e12c8587b87e 100644
--- a/include/dt-bindings/power/r8a77980-sysc.h
+++ b/include/dt-bindings/power/r8a77980-sysc.h
@@ -22,7 +22,7 @@
 #define R8A77980_PD_CA53_CPU2		7
 #define R8A77980_PD_CA53_CPU3		8
 #define R8A77980_PD_A2CN		10
-#define R8A77980_PD_A3VIP		11
+#define R8A77980_PD_A3VIP0		11
 #define R8A77980_PD_A2IR5		12
 #define R8A77980_PD_CR7			13
 #define R8A77980_PD_A2IR4		15
-- 
2.11.0
