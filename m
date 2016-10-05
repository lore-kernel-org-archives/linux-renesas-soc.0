Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52617 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751126AbcJEK2T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Oct 2016 06:28:19 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH] ARM: shmobile: Remove unneeded check in SMP initialization
Date: Wed,  5 Oct 2016 13:28:11 +0300
Message-Id: <1475663291-4502-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The SMP initialization function is only called if CONFIG_SMP is defined.
Remove the duplicate check.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/mach-shmobile/platsmp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/mach-shmobile/platsmp.c b/arch/arm/mach-shmobile/platsmp.c
index 02e21bceb085..48595a397220 100644
--- a/arch/arm/mach-shmobile/platsmp.c
+++ b/arch/arm/mach-shmobile/platsmp.c
@@ -39,9 +39,5 @@ bool shmobile_smp_cpu_can_disable(unsigned int cpu)
 
 bool __init shmobile_smp_init_fallback_ops(void)
 {
-	/* fallback on PSCI/smp_ops if no other DT based method is detected */
-	if (!IS_ENABLED(CONFIG_SMP))
-		return false;
-
 	return platform_can_secondary_boot() ? true : false;
 }
-- 
Regards,

Laurent Pinchart
