Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:50874 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753717AbeE3PZT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 May 2018 11:25:19 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/6] ARM: shmobile: r8a7779: Stop powering down secondary CPUs during early boot
Date: Wed, 30 May 2018 17:25:12 +0200
Message-Id: <1527693916-11215-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1527693916-11215-1-git-send-email-geert+renesas@glider.be>
References: <1527693916-11215-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

At .smp_prepare_cpus() time, CPUs 1-3 are still powered down:
  - The bootloader doesn't enable CPUs 1-3,
  - Non-boot CPUs are disabled by kexec before starting the new kernel.

Hence there is no need to try to power them down again, as it will fail
silently with -EIO anyway.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/smp-r8a7779.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/mach-shmobile/smp-r8a7779.c b/arch/arm/mach-shmobile/smp-r8a7779.c
index c6951ee245889b8f..ff1e6fc0b861c4fc 100644
--- a/arch/arm/mach-shmobile/smp-r8a7779.c
+++ b/arch/arm/mach-shmobile/smp-r8a7779.c
@@ -97,11 +97,6 @@ static void __init r8a7779_smp_prepare_cpus(unsigned int max_cpus)
 	shmobile_smp_scu_prepare_cpus(R8A7779_SCU_BASE, max_cpus);
 
 	r8a7779_pm_init();
-
-	/* power off secondary CPUs */
-	r8a7779_platform_cpu_kill(1);
-	r8a7779_platform_cpu_kill(2);
-	r8a7779_platform_cpu_kill(3);
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
-- 
2.7.4
