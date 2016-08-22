Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from newton.telenet-ops.be ([195.130.132.45]:36688 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755243AbcHVOp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 10:45:56 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by newton.telenet-ops.be (Postfix) with ESMTP id 3sHxFY4V5qzMrWLn
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2016 16:45:37 +0200 (CEST)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 3/4] ARM: shmobile: apmu: Allow booting secondary CPU cores in debug mode
Date: Mon, 22 Aug 2016 16:44:28 +0200
Message-Id: <1471877069-4157-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1471877069-4157-1-git-send-email-geert+renesas@glider.be>
References: <1471877069-4157-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Now debug resource reset is handled properly, allow booting secondary
CPU cores when hardware debug mode is enabled (MD21=1) on SoCs using the
"renesas,apmu" enable method.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
