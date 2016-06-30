Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36559 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752302AbcF3OR6 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 10:17:58 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Magnus Damm <damm+renesas@opensource.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 8/8] ARM: shmobile: r8a7791: Prioritize DT APMU support
Date: Thu, 30 Jun 2016 16:16:24 +0200
Message-Id: <f89a51700d7ae0ef58956a8c8f0e2c68767bcdae.1467293089.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1467293089.git.horms+renesas@verge.net.au>
References: <cover.1467293089.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Adjust the r8a7791 SoC support code to not configure any non-DT SMP code
in case the DT-based enable-method has been installed already.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/setup-r8a7791.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-shmobile/setup-r8a7791.c b/arch/arm/mach-shmobile/setup-r8a7791.c
index 3b8dbaf07777..110e8b588e56 100644
--- a/arch/arm/mach-shmobile/setup-r8a7791.c
+++ b/arch/arm/mach-shmobile/setup-r8a7791.c
@@ -29,6 +29,7 @@ static const char *const r8a7791_boards_compat_dt[] __initconst = {
 };
 
 DT_MACHINE_START(R8A7791_DT, "Generic R8A7791 (Flattened Device Tree)")
+	.smp_init	= shmobile_smp_init_fallback_ops,
 	.smp		= smp_ops(r8a7791_smp_ops),
 	.init_early	= shmobile_init_delay,
 	.init_time	= rcar_gen2_timer_init,
-- 
2.7.0.rc3.207.g0ac5344
