Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:38820 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732281AbeGaRhF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 13:37:05 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: r8a7779: Remove unused includes
Date: Tue, 31 Jul 2018 17:56:02 +0200
Message-Id: <20180731155602.5497-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Presumable unused since commit c99cd90d98a98aa1 ("ARM: shmobile:
r8a7779: Remove legacy SoC code").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/setup-r8a7779.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-r8a7779.c b/arch/arm/mach-shmobile/setup-r8a7779.c
index d589326099e01f6d..b13ec9088ce5354c 100644
--- a/arch/arm/mach-shmobile/setup-r8a7779.c
+++ b/arch/arm/mach-shmobile/setup-r8a7779.c
@@ -7,9 +7,7 @@
  * Copyright (C) 2013  Cogent Embedded, Inc.
  */
 #include <linux/init.h>
-#include <linux/irq.h>
 #include <linux/irqchip.h>
-#include <linux/irqchip/arm-gic.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
-- 
2.17.1
