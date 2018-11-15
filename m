Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:47002 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387687AbeKOVcX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 16:32:23 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: sh73a0: Remove obsolete inclusion of <asm/smp_twd.h>
Date: Thu, 15 Nov 2018 10:57:31 +0100
Message-Id: <20181115095731.17362-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

As of commit 9a9863987bf7307f ("ARM: shmobile: Remove legacy SoC code
for SH-Mobile AG5"), this header file is no longer used.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/smp-sh73a0.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/smp-sh73a0.c b/arch/arm/mach-shmobile/smp-sh73a0.c
index 9bc543faba96af6e..0403aa8629ddc10a 100644
--- a/arch/arm/mach-shmobile/smp-sh73a0.c
+++ b/arch/arm/mach-shmobile/smp-sh73a0.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 
 #include <asm/smp_plat.h>
-#include <asm/smp_twd.h>
 
 #include "common.h"
 #include "sh73a0.h"
-- 
2.17.1
