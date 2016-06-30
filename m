Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36294 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932123AbcF3ORk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 10:17:40 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 5/5] soc: renesas: rcar-sysc: Improve SYSC interrupt config in legacy wrapper
Date: Thu, 30 Jun 2016 16:16:12 +0200
Message-Id: <ced42730d19dd140a76f86c3761f646b83a35d09.1467292648.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1467292648.git.horms+renesas@verge.net.au>
References: <cover.1467292648.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Align SYSC interrupt configuration in the legacy wrapper with the DT
version:
  - Mask SYSC interrupt sources before enabling them (doesn't matter
    much as they're disabled at the GIC level anyway),
  - Make sure not to clear reserved SYSCIMR bits that were set before.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/rcar-sysc.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 22f0d646225c..65c8e1eb90c0 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -402,12 +402,25 @@ early_initcall(rcar_sysc_pd_init);
 
 void __init rcar_sysc_init(phys_addr_t base, u32 syscier)
 {
+	u32 syscimr;
+
 	if (!rcar_sysc_pd_init())
 		return;
 
 	rcar_sysc_base = ioremap_nocache(base, PAGE_SIZE);
 
-	/* enable all interrupt sources, but do not use interrupt handler */
+	/*
+	 * Mask all interrupt sources to prevent the CPU from receiving them.
+	 * Make sure not to clear reserved bits that were set before.
+	 */
+	syscimr = ioread32(rcar_sysc_base + SYSCIMR);
+	syscimr |= syscier;
+	pr_debug("%s: syscimr = 0x%08x\n", __func__, syscimr);
+	iowrite32(syscimr, rcar_sysc_base + SYSCIMR);
+
+	/*
+	 * SYSC needs all interrupt sources enabled to control power.
+	 */
+	pr_debug("%s: syscier = 0x%08x\n", __func__, syscier);
 	iowrite32(syscier, rcar_sysc_base + SYSCIER);
-	iowrite32(0, rcar_sysc_base + SYSCIMR);
 }
-- 
2.7.0.rc3.207.g0ac5344
