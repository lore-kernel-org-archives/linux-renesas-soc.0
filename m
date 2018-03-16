Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753986AbeCPOzH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:55:07 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 01/14] soc: renesas: rcar-sysc: Mark rcar_sysc_matches[] __initconst
Date: Fri, 16 Mar 2018 15:53:23 +0100
Message-Id: <707aa45d2612778e2f3b6c5e1950ed9fa48974aa.1521211738.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521211738.git.horms+renesas@verge.net.au>
References: <cover.1521211738.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

rcar_sysc_matches[] is used only by rcar_sysc_pd_init(), which is
__init.  Hence mark rcar_sysc_matches[] __initconst.

This frees another 1764 bytes (arm32/shmobile_defconfig) or 1000 bytes
(arm64/renesas_defconfig) of memory after kernel init.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/rcar-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 52c25a5e2646..636872bc2416 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -254,7 +254,7 @@ static void __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
 	pm_genpd_init(genpd, gov, false);
 }
 
-static const struct of_device_id rcar_sysc_matches[] = {
+static const struct of_device_id rcar_sysc_matches[] __initconst = {
 #ifdef CONFIG_SYSC_R8A7743
 	{ .compatible = "renesas,r8a7743-sysc", .data = &r8a7743_sysc_info },
 #endif
-- 
2.11.0
