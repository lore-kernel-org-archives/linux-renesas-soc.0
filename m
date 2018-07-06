Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:46595 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932542AbeGFPQF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 11:16:05 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: shmobile: r8a7779: hide unused r8a7779_platform_cpu_kill
Date: Fri,  6 Jul 2018 17:15:19 +0200
Message-Id: <20180706151528.3759312-1-arnd@arndb.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

After the cleanup in r8a7779_smp_prepare_cpus(), the only remaining caller of
r8a7779_platform_cpu_kill() is in an ifdef, which leads to a build warning
without CONFIG_HOTPLUG_CPU:

arch/arm/mach-shmobile/smp-r8a7779.c:26:12: error: 'r8a7779_platform_cpu_kill' defined but not used [-Werror=unused-function]

This moves the function inside of that #ifdef to avoid the warning.

Fixes: 62f55ce683e3 ("ARM: shmobile: r8a7779: Stop powering down secondary CPUs during early boot")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-shmobile/smp-r8a7779.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-shmobile/smp-r8a7779.c b/arch/arm/mach-shmobile/smp-r8a7779.c
index b7fe1f489b08..0ed73b650c14 100644
--- a/arch/arm/mach-shmobile/smp-r8a7779.c
+++ b/arch/arm/mach-shmobile/smp-r8a7779.c
@@ -23,17 +23,6 @@
 #define AVECR IOMEM(0xfe700040)
 #define R8A7779_SCU_BASE 0xf0000000
 
-static int r8a7779_platform_cpu_kill(unsigned int cpu)
-{
-	int ret = -EIO;
-
-	cpu = cpu_logical_map(cpu);
-	if (cpu)
-		ret = rcar_sysc_power_down_cpu(cpu);
-
-	return ret ? ret : 1;
-}
-
 static int r8a7779_boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
 	int ret = -EIO;
@@ -55,6 +44,17 @@ static void __init r8a7779_smp_prepare_cpus(unsigned int max_cpus)
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
+static int r8a7779_platform_cpu_kill(unsigned int cpu)
+{
+	int ret = -EIO;
+
+	cpu = cpu_logical_map(cpu);
+	if (cpu)
+		ret = rcar_sysc_power_down_cpu(cpu);
+
+	return ret ? ret : 1;
+}
+
 static int r8a7779_cpu_kill(unsigned int cpu)
 {
 	if (shmobile_smp_scu_cpu_kill(cpu))
-- 
2.9.0
