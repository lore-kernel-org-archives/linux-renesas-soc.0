Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:55506 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750849AbcLEKjo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 05:39:44 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/5] ARM: shmobile: apmu: Allow booting secondary CPU cores in debug mode
Date: Mon,  5 Dec 2016 11:39:39 +0100
Message-Id: <1480934381-32126-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1480934381-32126-1-git-send-email-geert+renesas@glider.be>
References: <1480934381-32126-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Now debug resource reset is handled properly, allow booting secondary
CPU cores when hardware debug mode is enabled (MD21=1) on SoCs using the
"renesas,apmu" enable method.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Hiep Cao Minh <cm-hiep@jinso.co.jp>
---
v2:
  - Add Tested-by.
---
 arch/arm/mach-shmobile/platsmp-apmu.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/arch/arm/mach-shmobile/platsmp-apmu.c b/arch/arm/mach-shmobile/platsmp-apmu.c
index 7e4ca6788be521dc..e19266844e16126b 100644
--- a/arch/arm/mach-shmobile/platsmp-apmu.c
+++ b/arch/arm/mach-shmobile/platsmp-apmu.c
@@ -216,21 +216,9 @@ static void __init shmobile_smp_apmu_prepare_cpus_dt(unsigned int max_cpus)
 	rcar_gen2_pm_init();
 }
 
-static int shmobile_smp_apmu_boot_secondary_md21(unsigned int cpu,
-						 struct task_struct *idle)
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
 static struct smp_operations apmu_smp_ops __initdata = {
 	.smp_prepare_cpus	= shmobile_smp_apmu_prepare_cpus_dt,
-	.smp_boot_secondary	= shmobile_smp_apmu_boot_secondary_md21,
+	.smp_boot_secondary	= shmobile_smp_apmu_boot_secondary,
 #ifdef CONFIG_HOTPLUG_CPU
 	.cpu_can_disable	= shmobile_smp_cpu_can_disable,
 	.cpu_die		= shmobile_smp_apmu_cpu_die,
-- 
1.9.1
