Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36294 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932165AbcF3ORl (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 10:17:41 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/5] soc: renesas: rcar-sysc: Make rcar_sysc_init() init the PM domains
Date: Thu, 30 Jun 2016 16:16:10 +0200
Message-Id: <b1e52287a29cf0673e1a60210d55edccc756e44a.1467292648.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1467292648.git.horms+renesas@verge.net.au>
References: <cover.1467292648.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Let rcar_sysc_init() trigger initialization of the SYSC PM domains from
DT if called before the early_initcall.
On failure, it falls back to mapping the passed register block, as
before.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/rcar-sysc.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 59a8152681a5..68d6856c9d3c 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -164,15 +164,6 @@ static bool rcar_sysc_power_is_off(const struct rcar_sysc_ch *sysc_ch)
 	return false;
 }
 
-void __iomem *rcar_sysc_init(phys_addr_t base)
-{
-	rcar_sysc_base = ioremap_nocache(base, PAGE_SIZE);
-	if (!rcar_sysc_base)
-		panic("unable to ioremap R-Car SYSC hardware block\n");
-
-	return rcar_sysc_base;
-}
-
 struct rcar_sysc_pd {
 	struct generic_pm_domain genpd;
 	struct rcar_sysc_ch ch;
@@ -328,6 +319,9 @@ static int __init rcar_sysc_pd_init(void)
 	unsigned int i;
 	int error;
 
+	if (rcar_sysc_base)
+		return 0;
+
 	np = of_find_matching_node_and_match(NULL, rcar_sysc_matches, &match);
 	if (!np)
 		return -ENODEV;
@@ -405,3 +399,11 @@ out_put:
 	return error;
 }
 early_initcall(rcar_sysc_pd_init);
+
+void __iomem * __init rcar_sysc_init(phys_addr_t base)
+{
+	if (rcar_sysc_pd_init())
+		rcar_sysc_base = ioremap_nocache(base, PAGE_SIZE);
+
+	return rcar_sysc_base;
+}
-- 
2.7.0.rc3.207.g0ac5344
