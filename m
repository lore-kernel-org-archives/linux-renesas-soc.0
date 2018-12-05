Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:54424 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728000AbeLEPjv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 10:39:51 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] soc: renesas: rcar-sysc: Remove rcar_sysc_power_{down,up}() helpers
Date: Wed,  5 Dec 2018 16:39:43 +0100
Message-Id: <20181205153945.13767-3-geert+renesas@glider.be>
In-Reply-To: <20181205153945.13767-1-geert+renesas@glider.be>
References: <20181205153945.13767-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Until commit 7e8a50df26f4e700 ("soc: renesas: rcar-sysc: Drop legacy
handling"), the rcar_sysc_power_{down,up}() helpers were public, as they
were called by the legacy (pre-DT) CPU power management code on R-Car H1
and R-Car Gen2 before.

As they are just one-line wrappers around rcar_sysc_power(), it makes
sense to just remove them.

This also avoids a bool/helper/bool conversion in rcar_sysc_power_cpu(),
where a bool is checked to call one of two helper functions, which
just call rcar_sysc_power() with hardcoded boolean values again.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/rcar-sysc.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index af53363eda0374ce..73fae6a9728df9ae 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -146,16 +146,6 @@ static int rcar_sysc_power(const struct rcar_sysc_ch *sysc_ch, bool on)
 	return ret;
 }
 
-static int rcar_sysc_power_down(const struct rcar_sysc_ch *sysc_ch)
-{
-	return rcar_sysc_power(sysc_ch, false);
-}
-
-static int rcar_sysc_power_up(const struct rcar_sysc_ch *sysc_ch)
-{
-	return rcar_sysc_power(sysc_ch, true);
-}
-
 static bool rcar_sysc_power_is_off(const struct rcar_sysc_ch *sysc_ch)
 {
 	unsigned int st;
@@ -184,7 +174,7 @@ static int rcar_sysc_pd_power_off(struct generic_pm_domain *genpd)
 	struct rcar_sysc_pd *pd = to_rcar_pd(genpd);
 
 	pr_debug("%s: %s\n", __func__, genpd->name);
-	return rcar_sysc_power_down(&pd->ch);
+	return rcar_sysc_power(&pd->ch, false);
 }
 
 static int rcar_sysc_pd_power_on(struct generic_pm_domain *genpd)
@@ -192,7 +182,7 @@ static int rcar_sysc_pd_power_on(struct generic_pm_domain *genpd)
 	struct rcar_sysc_pd *pd = to_rcar_pd(genpd);
 
 	pr_debug("%s: %s\n", __func__, genpd->name);
-	return rcar_sysc_power_up(&pd->ch);
+	return rcar_sysc_power(&pd->ch, true);
 }
 
 static bool has_cpg_mstp;
@@ -252,7 +242,7 @@ static int __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
 		goto finalize;
 	}
 
-	rcar_sysc_power_up(&pd->ch);
+	rcar_sysc_power(&pd->ch, true);
 
 finalize:
 	error = pm_genpd_init(genpd, gov, false);
@@ -478,8 +468,7 @@ static int rcar_sysc_power_cpu(unsigned int idx, bool on)
 		if (!(pd->flags & PD_CPU) || pd->ch.chan_bit != idx)
 			continue;
 
-		return on ? rcar_sysc_power_up(&pd->ch)
-			  : rcar_sysc_power_down(&pd->ch);
+		return rcar_sysc_power(&pd->ch, on);
 	}
 
 	return -ENOENT;
-- 
2.17.1
