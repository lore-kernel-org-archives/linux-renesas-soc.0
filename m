Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56528 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752998AbcFHBBE (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 21:01:04 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] ARM: shmobile: pm-rmobile: Postpone call to pm_genpd_init()
Date: Wed,  8 Jun 2016 10:00:19 +0900
Message-Id: <85d9bf152bdaa7e98a05cc460aa6880efdf0b433.1465347025.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1465347025.git.horms+renesas@verge.net.au>
References: <cover.1465347025.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

All local setup of the generic_pm_domain structure should have been
completed before calling pm_genpd_init().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/pm-rmobile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/pm-rmobile.c b/arch/arm/mach-shmobile/pm-rmobile.c
index c0b05e9e6442..45a195501b78 100644
--- a/arch/arm/mach-shmobile/pm-rmobile.c
+++ b/arch/arm/mach-shmobile/pm-rmobile.c
@@ -131,13 +131,13 @@ static void rmobile_init_pm_domain(struct rmobile_pm_domain *rmobile_pd)
 	struct dev_power_governor *gov = rmobile_pd->gov;
 
 	genpd->flags = GENPD_FLAG_PM_CLK;
-	pm_genpd_init(genpd, gov ? : &simple_qos_governor, false);
 	genpd->dev_ops.active_wakeup	= rmobile_pd_active_wakeup;
 	genpd->power_off		= rmobile_pd_power_down;
 	genpd->power_on			= rmobile_pd_power_up;
 	genpd->attach_dev		= cpg_mstp_attach_dev;
 	genpd->detach_dev		= cpg_mstp_detach_dev;
 	__rmobile_pd_power_up(rmobile_pd, false);
+	pm_genpd_init(genpd, gov ? : &simple_qos_governor, false);
 }
 
 static int rmobile_pd_suspend_busy(void)
-- 
2.1.4
