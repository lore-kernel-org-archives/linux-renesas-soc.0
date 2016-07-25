Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56131 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752687AbcGYCaD (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 24 Jul 2016 22:30:03 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] drivers: sh: Stop using the legacy clock domain on ARM
Date: Mon, 25 Jul 2016 11:29:38 +0900
Message-Id: <4c6d7e228968bdc238ae7213d919f34b7838fe59.1469413328.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1469413328.git.horms+renesas@verge.net.au>
References: <cover.1469413328.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1469413328.git.horms+renesas@verge.net.au>
References: <cover.1469413328.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Since commits 71d076ceb245f0d9 ("ARM: shmobile: Enable PM and
PM_GENERIC_DOMAINS for SoCs with PM Domains") and 2ee98234b88174f2
("arm64: renesas: Enable PM and PM_GENERIC_DOMAINS for SoCs with PM
Domains"), CONFIG_PM and CONFIG_PM_GENERIC_DOMAINS are enabled
unconditionally for Renesas ARM-based SoCs. Hence the legacy clock
domain is no longer used on these SoCs.

Remove the related support code, and stop entering drivers/sh/ on ARM.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/Makefile        | 1 -
 drivers/sh/pm_runtime.c | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index 0b6f3d60193d..a7187b999c5e 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -128,7 +128,6 @@ obj-$(CONFIG_SGI_SN)		+= sn/
 obj-y				+= firmware/
 obj-$(CONFIG_CRYPTO)		+= crypto/
 obj-$(CONFIG_SUPERH)		+= sh/
-obj-$(CONFIG_ARCH_SHMOBILE)	+= sh/
 ifndef CONFIG_ARCH_USES_GETTIMEOFFSET
 obj-y				+= clocksource/
 endif
diff --git a/drivers/sh/pm_runtime.c b/drivers/sh/pm_runtime.c
index a9bac3bf20de..c887ecdaf19b 100644
--- a/drivers/sh/pm_runtime.c
+++ b/drivers/sh/pm_runtime.c
@@ -34,15 +34,6 @@ static struct pm_clk_notifier_block platform_bus_notifier = {
 
 static int __init sh_pm_runtime_init(void)
 {
-	if (IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_ARCH_SHMOBILE)) {
-		if (!of_find_compatible_node(NULL, NULL,
-					     "renesas,cpg-mstp-clocks"))
-			return 0;
-		if (IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS_OF) &&
-		    of_find_node_with_property(NULL, "#power-domain-cells"))
-			return 0;
-	}
-
 	pm_clk_add_notifier(&platform_bus_type, &platform_bus_notifier);
 	return 0;
 }
-- 
2.7.0.rc3.207.g0ac5344
