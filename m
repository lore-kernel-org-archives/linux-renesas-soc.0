Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:59675 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757712AbcEDI1w (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 4 May 2016 04:27:52 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Kevin Hilman <khilman@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: pm-rmobile: Postpone call to pm_genpd_init()
Date: Wed,  4 May 2016 10:27:46 +0200
Message-Id: <1462350466-20466-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

All local setup of the generic_pm_domain structure should have been
completed before calling pm_genpd_init().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/pm-rmobile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/pm-rmobile.c b/arch/arm/mach-shmobile/pm-rmobile.c
index ecc92bad3500c1c1..175bd3d91ebcbcb4 100644
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
1.9.1
