Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:51056 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388012AbeKOVc0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 16:32:26 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: OMAP2+: timer: Remove obsolete inclusion of <asm/smp_twd.h>
Date: Thu, 15 Nov 2018 10:58:58 +0100
Message-Id: <20181115095858.17530-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

As of commit d1dabab2841d546f ("ARM: OMAP2+: Clean up
omap4_local_timer_init"), this header file is no longer used.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-omap2/timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-omap2/timer.c b/arch/arm/mach-omap2/timer.c
index 98ed5ac073bc1fca..07bea84c5d6e4f2a 100644
--- a/arch/arm/mach-omap2/timer.c
+++ b/arch/arm/mach-omap2/timer.c
@@ -44,7 +44,6 @@
 #include <linux/sched_clock.h>
 
 #include <asm/mach/time.h>
-#include <asm/smp_twd.h>
 
 #include "omap_hwmod.h"
 #include "omap_device.h"
-- 
2.17.1
