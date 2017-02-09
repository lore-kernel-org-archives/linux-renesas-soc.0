Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:64280 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751235AbdBITNQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2017 14:13:16 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] ARM: shmobile: r7s72100: add restart handler
Date: Thu,  9 Feb 2017 14:12:59 -0500
Message-Id: <20170209191259.29774-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a simple restart handler which enables the watchdog timer with the
device reset option enabled. This is the only way SW can cause a reset on
this SoC.

If someone has a board that needs more specific operations to be done
first, they can override this function in another file.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/mach-shmobile/setup-r7s72100.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/mach-shmobile/setup-r7s72100.c b/arch/arm/mach-shmobile/setup-r7s72100.c
index d46639f..cc6237e 100644
--- a/arch/arm/mach-shmobile/setup-r7s72100.c
+++ b/arch/arm/mach-shmobile/setup-r7s72100.c
@@ -15,11 +15,40 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/io.h>
 
 #include <asm/mach/arch.h>
 
 #include "common.h"
 
+/*
+ * This function is declared weak so if you need to do some board specific stuff
+ * before the reset occurs, you can override this function.
+ *
+ * CAUTION: A reboot command doesn't 'sync' before this function
+ * is called. See function reboot() in kernel/reboot.c
+ */
+extern void __attribute__ ((weak)) r7s72100_restart(enum reboot_mode mode,
+						    const char *cmd)
+{
+#define WTCSR 0
+#define WTCNT 2
+#define WRCSR 4
+	void *base = ioremap(0xFCFE0000, 0x10);
+
+	/* Dummy read (must read WRCSR:WOVF at least once before clearing) */
+	readw(base + WRCSR);
+
+	writew(0xA500, base + WRCSR);	/* Clear WOVF */
+	writew(0x5A5F, base + WRCSR);	/* Reset Enable */
+	writew(0x5A00, base + WTCNT);	/* Counter to 00 */
+	writew(0xA578, base + WTCSR);	/* Start timer */
+
+	/* Wait for WDT overflow */
+	while (1)
+		;
+}
+
 static const char *const r7s72100_boards_compat_dt[] __initconst = {
 	"renesas,r7s72100",
 	NULL,
@@ -29,4 +58,5 @@ DT_MACHINE_START(R7S72100_DT, "Generic R7S72100 (Flattened Device Tree)")
 	.init_early	= shmobile_init_delay,
 	.init_late	= shmobile_init_late,
 	.dt_compat	= r7s72100_boards_compat_dt,
+	.restart	= r7s72100_restart,
 MACHINE_END
-- 
2.10.1
