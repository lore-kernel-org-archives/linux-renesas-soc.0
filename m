Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from newton.telenet-ops.be ([195.130.132.45]:37898 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751966AbdBIKT4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2017 05:19:56 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 3vJvFt27nTzMxhr2
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Feb 2017 11:19:46 +0100 (CET)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: shmobile: Remove ARCH_SHMOBILE_MULTI
Date: Thu,  9 Feb 2017 11:18:49 +0100
Message-Id: <1486635529-6636-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1486635529-6636-1-git-send-email-geert+renesas@glider.be>
References: <1486635529-6636-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The migration from ARCH_SHMOBILE_MULTI to ARCH_RENESAS started by commit
9b5ba0df4ea4 ("ARM: shmobile: Introduce ARCH_RENESAS") has been
completed, so the ARCH_SHMOBILE_MULTI symbol can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index 2bb4b09f079e2e64..ce2aee1481dfb98e 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -1,9 +1,6 @@
 config ARCH_SHMOBILE
 	bool
 
-config ARCH_SHMOBILE_MULTI
-	bool
-
 config PM_RMOBILE
 	bool
 	select PM
@@ -34,7 +31,6 @@ menuconfig ARCH_RENESAS
 	depends on ARCH_MULTI_V7 && MMU
 	select ARCH_DMA_ADDR_T_64BIT if ARM_LPAE
 	select ARCH_SHMOBILE
-	select ARCH_SHMOBILE_MULTI
 	select ARM_GIC
 	select GPIOLIB
 	select HAVE_ARM_SCU if SMP
-- 
1.9.1
