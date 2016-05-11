Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:12984 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751271AbcEKFbY (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 01:31:24 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
	by imta24.fe.bosch.de (Postfix) with ESMTP id 462C0D80220
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:23 +0200 (CEST)
Received: from FE-HUB1001.de.bosch.com (vsgw22.fe.internet.bosch.com [10.4.98.11])
	by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id E3BA2A406B4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:22 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH v2 04/10] arm: renesas: r8a7791: Obtain MD pin value using boot-mode-reg
Date: Wed, 11 May 2016 07:29:32 +0200
Message-ID: <1462944578-1220-5-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Simon Horman <horms+renesas@verge.net.au>

Use new boot mode reg infrastructure to obtain the mode pin
value when initialising SMP for r8a7791 SoC.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
 arch/arm/mach-shmobile/smp-r8a7791.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/smp-r8a7791.c b/arch/arm/mach-shmobile/smp-r8a7791.c
index 2d6417a..00d794d 100644
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
+		pr_warn("Unable to retrieve boot mode register\n");
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
