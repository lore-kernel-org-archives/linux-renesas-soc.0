Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: shmobile: don't call platform_can_secondary_boot on UP
Date: Thu, 30 Jun 2016 14:25:19 +0200
Message-Id: <20160630122529.4031024-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

For rcar-gen2, we build the SMP files even for UP configurations,
and that just broke:

arch/arm/mach-shmobile/built-in.o: In function `shmobile_smp_init_fallback_ops':
pm-rcar-gen2.c:(.init.text+0x40c): undefined reference to `platform_can_secondary_boot'

This adds an compile-time check before the call to platform_can_secondary_boot,
turning the function into an empty stub for UP configurations.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: c21af444eace ("ARM: shmobile: smp: Add function to prioritize DT SMP")
---
 arch/arm/mach-shmobile/platsmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-shmobile/platsmp.c b/arch/arm/mach-shmobile/platsmp.c
index f3dba6f356e2..02e21bceb085 100644
--- a/arch/arm/mach-shmobile/platsmp.c
+++ b/arch/arm/mach-shmobile/platsmp.c
@@ -40,5 +40,8 @@ bool shmobile_smp_cpu_can_disable(unsigned int cpu)
 bool __init shmobile_smp_init_fallback_ops(void)
 {
 	/* fallback on PSCI/smp_ops if no other DT based method is detected */
+	if (!IS_ENABLED(CONFIG_SMP))
+		return false;
+
 	return platform_can_secondary_boot() ? true : false;
 }
-- 
2.9.0
