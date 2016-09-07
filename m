Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57033 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756483AbcIGHlq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 03:41:46 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/3] ARM: shmobile: r8a7790: only use smp_init when SMP is selected
Date: Wed,  7 Sep 2016 09:41:38 +0200
Message-Id: <274607942b789f3a26a11f68464f1f0c15995e87.1473233986.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1473233986.git.horms+renesas@verge.net.au>
References: <cover.1473233986.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

We use the helper function which populates the smp_init pointer only in
case of SMP.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/setup-r8a7790.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/setup-r8a7790.c b/arch/arm/mach-shmobile/setup-r8a7790.c
index 3506327e0bed..78d3e859bd64 100644
--- a/arch/arm/mach-shmobile/setup-r8a7790.c
+++ b/arch/arm/mach-shmobile/setup-r8a7790.c
@@ -28,7 +28,7 @@ static const char * const r8a7790_boards_compat_dt[] __initconst = {
 };
 
 DT_MACHINE_START(R8A7790_DT, "Generic R8A7790 (Flattened Device Tree)")
-	.smp_init	= shmobile_smp_init_fallback_ops,
+	.smp_init	= smp_init_ops(shmobile_smp_init_fallback_ops),
 	.smp		= smp_ops(r8a7790_smp_ops),
 	.init_early	= shmobile_init_delay,
 	.init_time	= rcar_gen2_timer_init,
-- 
2.7.0.rc3.207.g0ac5344
