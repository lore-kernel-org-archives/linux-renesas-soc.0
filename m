Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from leibniz.telenet-ops.be ([195.130.137.77]:47834 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754894AbcHVOp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 10:45:56 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by leibniz.telenet-ops.be (Postfix) with ESMTP id 3sHxFV6hZzzMqmX6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2016 16:45:34 +0200 (CEST)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 4/4] ARM: shmobile: r8a7791: Allow booting secondary CPU cores in debug mode
Date: Mon, 22 Aug 2016 16:44:29 +0200
Message-Id: <1471877069-4157-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1471877069-4157-1-git-send-email-geert+renesas@glider.be>
References: <1471877069-4157-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Now debug resource reset is handled properly, allow booting secondary
CPU cores when hardware debug mode is enabled (MD21=1, SW8-4=OFF on
koelsch) on legacy r8a7791.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
