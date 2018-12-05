Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:46380 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727679AbeLEPjv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 10:39:51 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] soc: renesas: rcar-sysc: Merge PM Domain registration and linking
Date: Wed,  5 Dec 2018 16:39:44 +0100
Message-Id: <20181205153945.13767-4-geert+renesas@glider.be>
In-Reply-To: <20181205153945.13767-1-geert+renesas@glider.be>
References: <20181205153945.13767-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Commit 977d5ba4507dfe5b ("soc: renesas: rcar-sysc: Make PM domain
initialization more robust") split PM Domain registration and the
linking of children to their parents, to accommodate PM Domain tables
that list child domains before their parents.

However, this failed to realize that parent power domains must be
powered up before their children anyway, and that this thus must be
reflected by the order in the PM Domain tables.

Revert the split, as it did not help anyway.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/rcar-sysc.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 73fae6a9728df9ae..123e553510e826f5 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -381,9 +381,6 @@ static int __init rcar_sysc_pd_init(void)
 	pr_debug("%pOF: syscier = 0x%08x\n", np, syscier);
 	iowrite32(syscier, base + SYSCIER);
 
-	/*
-	 * First, create all PM domains
-	 */
 	for (i = 0; i < info->num_areas; i++) {
 		const struct rcar_sysc_area *area = &info->areas[i];
 		struct rcar_sysc_pd *pd;
@@ -411,22 +408,17 @@ static int __init rcar_sysc_pd_init(void)
 			goto out_put;
 
 		domains->domains[area->isr_bit] = &pd->genpd;
-	}
 
-	/*
-	 * Second, link all PM domains to their parents
-	 */
-	for (i = 0; i < info->num_areas; i++) {
-		const struct rcar_sysc_area *area = &info->areas[i];
-
-		if (!area->name || area->parent < 0)
+		if (area->parent < 0)
 			continue;
 
 		error = pm_genpd_add_subdomain(domains->domains[area->parent],
-					       domains->domains[area->isr_bit]);
-		if (error)
+					       &pd->genpd);
+		if (error) {
 			pr_warn("Failed to add PM subdomain %s to parent %u\n",
 				area->name, area->parent);
+			goto out_put;
+		}
 	}
 
 	error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
-- 
2.17.1
