Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:54626 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752586AbcHLQpZ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 12 Aug 2016 12:45:25 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] ARM: shmobile: r8a7791: only use smp_init when SMP is selected
Date: Fri, 12 Aug 2016 18:45:10 +0200
Message-Id: <1471020310-3028-2-git-send-email-wsa+renesas@sang-engineering.com>
In-Reply-To: <1471020310-3028-1-git-send-email-wsa+renesas@sang-engineering.com>
References: <1471020310-3028-1-git-send-email-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We use the helper function which populates the smp_init pointer only in
case of SMP.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/mach-shmobile/setup-r8a7791.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/setup-r8a7791.c b/arch/arm/mach-shmobile/setup-r8a7791.c
index 110e8b588e563f..26e2d181a1904d 100644
--- a/arch/arm/mach-shmobile/setup-r8a7791.c
+++ b/arch/arm/mach-shmobile/setup-r8a7791.c
@@ -29,7 +29,7 @@ static const char *const r8a7791_boards_compat_dt[] __initconst = {
 };
 
 DT_MACHINE_START(R8A7791_DT, "Generic R8A7791 (Flattened Device Tree)")
-	.smp_init	= shmobile_smp_init_fallback_ops,
+	.smp_init	= smp_init_ops(shmobile_smp_init_fallback_ops),
 	.smp		= smp_ops(r8a7791_smp_ops),
 	.init_early	= shmobile_init_delay,
 	.init_time	= rcar_gen2_timer_init,
-- 
2.8.1
