Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:57392 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751384AbcEIHPn (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 03:15:43 -0400
Received: from vsmta13.fe.internet.bosch.com (unknown [10.4.98.53])
	by imta24.fe.bosch.de (Postfix) with ESMTP id ECFDCD8021B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2016 09:15:41 +0200 (CEST)
Received: from SI-HUB1001.de.bosch.com (vsgw22.fe.internet.bosch.com [10.4.98.11])
	by vsmta13.fe.internet.bosch.com (Postfix) with ESMTP id AD33D2E40479
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2016 09:15:41 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 04/10] arm: renesas: r8a7791: Obtain MD pin value using boot-mode-reg
Date: Mon, 9 May 2016 09:13:55 +0200
Message-ID: <1462778041-19595-5-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Simon Horman <horms+renesas@verge.net.au>

Use new boot mode reg infrastructure to obtain the mode pin
value when initialising SMP for r8a7791 SoC.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/smp-r8a7791.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/smp-r8a7791.c b/arch/arm/mach-shmobile/smp-r8a7791.c
index 2d6417a..df784d6 100644
--- a/arch/arm/mach-shmobile/smp-r8a7791.c
+++ b/arch/arm/mach-shmobile/smp-r8a7791.c
@@ -20,6 +20,8 @@
 
 #include <asm/smp_plat.h>
 
+#include <misc/boot-mode-reg.h>
+
 #include "common.h"
 #include "platsmp-apmu.h"
 #include "r8a7791.h"
@@ -45,8 +47,17 @@ static void __init r8a7791_smp_prepare_cpus(unsigned int max_cpus)
 static int r8a7791_smp_boot_secondary(unsigned int cpu,
 				      struct task_struct *idle)
 {
+	int err;
+	u32 mode;
+
+	err = boot_mode_reg_get(&mode);
+	if (err) {
+		pr_warn("Unable retrieve boot mode register\n");
+		return err;
+	}
+
 	/* Error out when hardware debug mode is enabled */
-	if (rcar_gen2_read_mode_pins() & BIT(21)) {
+	if (mode & BIT(21)) {
 		pr_warn("Unable to boot CPU%u when MD21 is set\n", cpu);
 		return -ENOTSUPP;
 	}
-- 
2.8.0
