Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:38972 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752201AbdGDRiB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jul 2017 13:38:01 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/2] ARM: shmobile: rcar-gen2: Separate arch timer init and parent handling
Date: Tue,  4 Jul 2017 19:37:55 +0200
Message-Id: <1499189876-4822-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1499189876-4822-1-git-send-email-geert+renesas@glider.be>
References: <1499189876-4822-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The check for R-Car E2 (which was later extended to R-Car V2H), served
two purposes:
  1. Use the correct parent clock for the arch timer,
  2. Initialize the arch timer.

However, the second part shouldn't be done on V2H, as it only applies to
Cortex-A7 CPU cores, while V2H has a dual Cortex-A15.

Hence split off the arch timer initialization, and make it run on
Cortex-A7 only.

While at it, add some documentation to the inline asm.

Fixes: 2477a356dd245bbb ("ARM: shmobile: rcar-gen2: Correct arch timer frequency on R-Car V2H")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 52d466b759730d74..caa866d406e50795 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -26,6 +26,7 @@
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
 #include <asm/mach/arch.h>
+#include <asm/cputype.h>
 #include "common.h"
 #include "rcar-gen2.h"
 
@@ -58,27 +59,31 @@ void __init rcar_gen2_timer_init(void)
 	void __iomem *base;
 	u32 freq;
 
-	if (of_machine_is_compatible("renesas,r8a7792") ||
-	    of_machine_is_compatible("renesas,r8a7794")) {
-		freq = 260000000 / 8;	/* ZS / 8 */
-		/* CNTVOFF has to be initialized either from non-secure
+	if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A7) {
+		/*
+		 * CNTVOFF has to be initialized either from non-secure
 		 * Hypervisor mode or secure Monitor mode with SCR.NS==1.
 		 * If TrustZone is enabled then it should be handled by the
 		 * secure code.
 		 */
 		asm volatile(
 		"	cps	0x16\n"
-		"	mrc	p15, 0, r1, c1, c1, 0\n"
+		"	mrc	p15, 0, r1, c1, c1, 0\n" /* Get Secure Config */
 		"	orr	r0, r1, #1\n"
-		"	mcr	p15, 0, r0, c1, c1, 0\n"
+		"	mcr	p15, 0, r0, c1, c1, 0\n" /* Set Non Secure bit */
 		"	isb\n"
 		"	mov	r0, #0\n"
-		"	mcrr	p15, 4, r0, r0, c14\n"
+		"	mcrr	p15, 4, r0, r0, c14\n" /* CNTVOFF = 0 */
 		"	isb\n"
-		"	mcr	p15, 0, r1, c1, c1, 0\n"
+		"	mcr	p15, 0, r1, c1, c1, 0\n" /* Set Secure bit */
 		"	isb\n"
 		"	cps	0x13\n"
 			: : : "r0", "r1");
+	}
+
+	if (of_machine_is_compatible("renesas,r8a7792") ||
+	    of_machine_is_compatible("renesas,r8a7794")) {
+		freq = 260000000 / 8;	/* ZS / 8 */
 	} else {
 		/* At Linux boot time the r8a7790 arch timer comes up
 		 * with the counter disabled. Moreover, it may also report
-- 
2.7.4
