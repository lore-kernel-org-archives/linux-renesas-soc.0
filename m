Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:32772 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750951AbcLEKjo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 05:39:44 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/5] ARM: shmobile: r8a7791: Allow booting secondary CPU cores in debug mode
Date: Mon,  5 Dec 2016 11:39:40 +0100
Message-Id: <1480934381-32126-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1480934381-32126-1-git-send-email-geert+renesas@glider.be>
References: <1480934381-32126-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Now debug resource reset is handled properly, allow booting secondary
CPU cores when hardware debug mode is enabled (MD21=1, SW8-4=OFF on
koelsch) on legacy r8a7791.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 arch/arm/mach-shmobile/smp-r8a7791.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/arch/arm/mach-shmobile/smp-r8a7791.c b/arch/arm/mach-shmobile/smp-r8a7791.c
index 2d6417af73b5b722..2948c22cfc53026c 100644
--- a/arch/arm/mach-shmobile/smp-r8a7791.c
+++ b/arch/arm/mach-shmobile/smp-r8a7791.c
@@ -42,21 +42,9 @@ static void __init r8a7791_smp_prepare_cpus(unsigned int max_cpus)
 	rcar_gen2_pm_init();
 }
 
-static int r8a7791_smp_boot_secondary(unsigned int cpu,
-				      struct task_struct *idle)
-{
-	/* Error out when hardware debug mode is enabled */
-	if (rcar_gen2_read_mode_pins() & BIT(21)) {
-		pr_warn("Unable to boot CPU%u when MD21 is set\n", cpu);
-		return -ENOTSUPP;
-	}
-
-	return shmobile_smp_apmu_boot_secondary(cpu, idle);
-}
-
 const struct smp_operations r8a7791_smp_ops __initconst = {
 	.smp_prepare_cpus	= r8a7791_smp_prepare_cpus,
-	.smp_boot_secondary	= r8a7791_smp_boot_secondary,
+	.smp_boot_secondary	= shmobile_smp_apmu_boot_secondary,
 #ifdef CONFIG_HOTPLUG_CPU
 	.cpu_can_disable	= shmobile_smp_cpu_can_disable,
 	.cpu_die		= shmobile_smp_apmu_cpu_die,
-- 
1.9.1
