Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:54644 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752301AbcHLQso (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 12 Aug 2016 12:48:44 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC] ARM: shmobile: allow non-SMP builds again
Date: Fri, 12 Aug 2016 18:48:40 +0200
Message-Id: <1471020520-3077-1-git-send-email-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

platform_can_secondary_boot() is only available for SMP, so guard the smp_init
function with some ifdeffery to allow building without SMP.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This is the easiest solution, but I wonder if it is the proper one? It might
make sense to modify the Makefile so platsmp.o is in smp-y and not cpu-y? I may
be missing here something, though.

I needed !SMP for debugging purposes, obviously.

 arch/arm/mach-shmobile/platsmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-shmobile/platsmp.c b/arch/arm/mach-shmobile/platsmp.c
index 02e21bceb0856b..d286e3ff6f6a5a 100644
--- a/arch/arm/mach-shmobile/platsmp.c
+++ b/arch/arm/mach-shmobile/platsmp.c
@@ -37,6 +37,7 @@ bool shmobile_smp_cpu_can_disable(unsigned int cpu)
 }
 #endif
 
+#ifdef CONFIG_SMP
 bool __init shmobile_smp_init_fallback_ops(void)
 {
 	/* fallback on PSCI/smp_ops if no other DT based method is detected */
@@ -45,3 +46,4 @@ bool __init shmobile_smp_init_fallback_ops(void)
 
 	return platform_can_secondary_boot() ? true : false;
 }
+#endif
-- 
2.8.1
