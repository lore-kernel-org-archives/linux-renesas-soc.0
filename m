Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbeLFV7i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:38 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 4/9] soc: renesas: r8a77980-sysc: Correct names of A2DP[01] power domains
Date: Thu,  6 Dec 2018 13:58:52 -0800
Message-Id: <97473bc85b22ac610b1810b6a9a4669a6cb0b7b0.1544131943.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544131943.git.horms+renesas@verge.net.au>
References: <cover.1544131943.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
renamed the A2PD0 and A2DP0 power domains on R-Car V3H to A2DP0 resp.
A2DP1.

As these definitions are not yet used from DT, they can just be renamed.

Fixes: 7755b40d07a8dba7 ("dt-bindings: power: add R8A77980 SYSC power domain definitions")
Fixes: 41d6d8bd8ae94ca9 ("soc: renesas: rcar-sysc: add R8A77980 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/r8a77980-sysc.c       | 4 ++--
 include/dt-bindings/power/r8a77980-sysc.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/renesas/r8a77980-sysc.c b/drivers/soc/renesas/r8a77980-sysc.c
index 9265fb525ef3..dbb2621ce4e3 100644
--- a/drivers/soc/renesas/r8a77980-sysc.c
+++ b/drivers/soc/renesas/r8a77980-sysc.c
@@ -38,8 +38,8 @@ static const struct rcar_sysc_area r8a77980_areas[] __initconst = {
 	{ "a2sc2",	0x400, 8, R8A77980_PD_A2SC2,	R8A77980_PD_A3IR },
 	{ "a2sc3",	0x400, 9, R8A77980_PD_A2SC3,	R8A77980_PD_A3IR },
 	{ "a2sc4",	0x400, 10, R8A77980_PD_A2SC4,	R8A77980_PD_A3IR },
-	{ "a2pd0",	0x400, 11, R8A77980_PD_A2PD0,	R8A77980_PD_A3IR },
-	{ "a2pd1",	0x400, 12, R8A77980_PD_A2PD1,	R8A77980_PD_A3IR },
+	{ "a2dp0",	0x400, 11, R8A77980_PD_A2DP0,	R8A77980_PD_A3IR },
+	{ "a2dp1",	0x400, 12, R8A77980_PD_A2DP1,	R8A77980_PD_A3IR },
 	{ "a2cn",	0x400, 13, R8A77980_PD_A2CN,	R8A77980_PD_A3IR },
 	{ "a3vip",	0x2c0, 0, R8A77980_PD_A3VIP,	R8A77980_PD_ALWAYS_ON },
 	{ "a3vip1",	0x300, 0, R8A77980_PD_A3VIP1,	R8A77980_PD_A3VIP },
diff --git a/include/dt-bindings/power/r8a77980-sysc.h b/include/dt-bindings/power/r8a77980-sysc.h
index 2c90c1237725..7bebe7e8dbdb 100644
--- a/include/dt-bindings/power/r8a77980-sysc.h
+++ b/include/dt-bindings/power/r8a77980-sysc.h
@@ -15,8 +15,8 @@
 #define R8A77980_PD_A2SC2		0
 #define R8A77980_PD_A2SC3		1
 #define R8A77980_PD_A2SC4		2
-#define R8A77980_PD_A2PD0		3
-#define R8A77980_PD_A2PD1		4
+#define R8A77980_PD_A2DP0		3
+#define R8A77980_PD_A2DP1		4
 #define R8A77980_PD_CA53_CPU0		5
 #define R8A77980_PD_CA53_CPU1		6
 #define R8A77980_PD_CA53_CPU2		7
-- 
2.11.0
